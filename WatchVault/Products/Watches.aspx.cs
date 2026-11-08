
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WatchVault.Products
{
    public partial class Watches : Page
    {
        // DATABASE CONNECTION
        private string ConnectionString
        {
            get
            {
                return ConfigurationManager
                    .ConnectionStrings["WatchVaultDB"]
                    .ConnectionString;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFilterOptions();
                BindProducts();
            }
        }

        // LOAD BRAND AND CATEGORY FILTER OPTIONS
        private void BindFilterOptions()
        {
            ddlBrand.Items.Clear();
            ddlCategory.Items.Clear();

            ddlBrand.Items.Add(
                new ListItem("All Brands", ""));

            ddlCategory.Items.Add(
                new ListItem("All Categories", ""));

            const string brandQuery = @"
                SELECT DISTINCT Brand
                FROM dbo.Products
                WHERE IsActive = 1
                  AND Brand IS NOT NULL
                  AND LTRIM(RTRIM(Brand)) <> ''
                ORDER BY Brand";

            const string categoryQuery = @"
                SELECT DISTINCT Category
                FROM dbo.Products
                WHERE IsActive = 1
                  AND Category IS NOT NULL
                  AND LTRIM(RTRIM(Category)) <> ''
                ORDER BY Category";

            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            {
                connection.Open();

                using (SqlCommand command =
                    new SqlCommand(brandQuery, connection))
                using (SqlDataReader reader =
                    command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string brand =
                            Convert.ToString(reader["Brand"]);

                        ddlBrand.Items.Add(
                            new ListItem(brand, brand));
                    }
                }

                using (SqlCommand command =
                    new SqlCommand(categoryQuery, connection))
                using (SqlDataReader reader =
                    command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string category =
                            Convert.ToString(reader["Category"]);

                        ddlCategory.Items.Add(
                            new ListItem(category, category));
                    }
                }
            }
        }

        // LOAD AND FILTER PRODUCTS
        private void BindProducts()
        {
            lblFilterMessage.Text = "";

            decimal minPrice = 0;
            decimal maxPrice = 0;

            bool hasMinPrice =
                !string.IsNullOrWhiteSpace(txtMinPrice.Text);

            bool hasMaxPrice =
                !string.IsNullOrWhiteSpace(txtMaxPrice.Text);

            if (hasMinPrice &&
                !TryParsePrice(txtMinPrice.Text, out minPrice))
            {
                ShowFilterError("Please enter a valid minimum price.");
                return;
            }

            if (hasMaxPrice &&
                !TryParsePrice(txtMaxPrice.Text, out maxPrice))
            {
                ShowFilterError("Please enter a valid maximum price.");
                return;
            }

            if (hasMinPrice && hasMaxPrice &&
                minPrice > maxPrice)
            {
                ShowFilterError(
                    "Minimum price cannot be greater than maximum price.");
                return;
            }

            StringBuilder query = new StringBuilder();

            query.Append(@"
                SELECT
                    p.ProductId,
                    p.Name,
                    p.Brand,
                    p.Price,
                    p.Category,
                    ISNULL(p.StockQuantity, 0) AS StockQuantity,
                    COALESCE(
                        NULLIF(LTRIM(RTRIM(g.ImageUrl)), ''),
                        NULLIF(LTRIM(RTRIM(p.ImageUrl)), '')
                    ) AS CardImage

                FROM dbo.Products p

                OUTER APPLY
                (
                    SELECT TOP 1 pi.ImageUrl
                    FROM dbo.ProductImages pi
                    WHERE pi.ProductId = p.ProductId
                      AND pi.ImageUrl IS NOT NULL
                      AND LTRIM(RTRIM(pi.ImageUrl)) <> ''
                    ORDER BY pi.DisplayOrder, pi.ProductImageId
                ) g

                WHERE p.IsActive = 1
            ");

            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            using (SqlCommand command =
                new SqlCommand())
            {
                command.Connection = connection;

                // SEARCH BY WATCH NAME OR BRAND
                if (!string.IsNullOrWhiteSpace(txtSearch.Text))
                {
                    query.Append(@"
                        AND (
                            p.Name LIKE @Search
                            OR p.Brand LIKE @Search
                            OR p.Category LIKE @Search
                        )
                    ");

                    command.Parameters.Add(
                        "@Search", SqlDbType.NVarChar, 200)
                        .Value = "%" + txtSearch.Text.Trim() + "%";
                }

                // BRAND FILTER
                if (!string.IsNullOrWhiteSpace(ddlBrand.SelectedValue))
                {
                    query.Append(" AND p.Brand = @Brand ");

                    command.Parameters.Add(
                        "@Brand", SqlDbType.NVarChar, 100)
                        .Value = ddlBrand.SelectedValue;
                }

                // CATEGORY FILTER
                if (!string.IsNullOrWhiteSpace(ddlCategory.SelectedValue))
                {
                    query.Append(" AND p.Category = @Category ");

                    command.Parameters.Add(
                        "@Category", SqlDbType.NVarChar, 100)
                        .Value = ddlCategory.SelectedValue;
                }

                // MINIMUM PRICE
                if (hasMinPrice)
                {
                    query.Append(" AND p.Price >= @MinPrice ");

                    command.Parameters.Add(
                        "@MinPrice", SqlDbType.Decimal)
                        .Value = minPrice;

                    command.Parameters["@MinPrice"].Precision = 18;
                    command.Parameters["@MinPrice"].Scale = 2;
                }

                // MAXIMUM PRICE
                if (hasMaxPrice)
                {
                    query.Append(" AND p.Price <= @MaxPrice ");

                    command.Parameters.Add(
                        "@MaxPrice", SqlDbType.Decimal)
                        .Value = maxPrice;

                    command.Parameters["@MaxPrice"].Precision = 18;
                    command.Parameters["@MaxPrice"].Scale = 2;
                }

                // STOCK AVAILABILITY
                if (ddlAvailability.SelectedValue == "InStock")
                {
                    query.Append(
                        " AND ISNULL(p.StockQuantity, 0) > 0 ");
                }
                else if (ddlAvailability.SelectedValue == "OutOfStock")
                {
                    query.Append(
                        " AND ISNULL(p.StockQuantity, 0) <= 0 ");
                }

                // SORTING
                string sortOrder;

                switch (ddlSort.SelectedValue)
                {
                    case "price-low-high":
                        sortOrder = "p.Price ASC, p.Name ASC";
                        break;

                    case "price-high-low":
                        sortOrder = "p.Price DESC, p.Name ASC";
                        break;

                    case "name-az":
                        sortOrder = "p.Name ASC";
                        break;

                    case "in-stock-first":
                        sortOrder = @"
                            CASE
                                WHEN ISNULL(p.StockQuantity, 0) > 0
                                THEN 0 ELSE 1
                            END,
                            p.Name ASC";
                        break;

                    default:
                        sortOrder = "p.ProductId ASC";
                        break;
                }

                query.Append(" ORDER BY " + sortOrder);

                command.CommandText = query.ToString();

                DataTable products = new DataTable();

                using (SqlDataAdapter adapter =
                    new SqlDataAdapter(command))
                {
                    adapter.Fill(products);
                }

                // RESOLVE PRODUCT IMAGE PATHS
                products.Columns.Add(
                    "ResolvedImageUrl", typeof(string));

                foreach (DataRow row in products.Rows)
                {
                    string imagePath =
                        row["CardImage"] == DBNull.Value
                        ? ""
                        : Convert.ToString(row["CardImage"]);

                    row["ResolvedImageUrl"] =
                        GetImageUrl(imagePath);
                }

                // BIND PRODUCTS TO REPEATER
                rptWatches.DataSource = products;
                rptWatches.DataBind();

                // RESULT COUNT
                litResultCount.Text =
                    "<span class='result-count'><strong>" +
                    products.Rows.Count +
                    "</strong> watch(es) found</span>";

                // SHOW OR HIDE EMPTY MESSAGE
                pnlProducts.Visible = products.Rows.Count > 0;
                pnlNoProducts.Visible = products.Rows.Count == 0;
            }
        }

        // VALIDATE PRICE INPUT
        private bool TryParsePrice(string value, out decimal price)
        {
            return decimal.TryParse(
                       value,
                       NumberStyles.Number,
                       CultureInfo.CurrentCulture,
                       out price)
                   ||
                   decimal.TryParse(
                       value,
                       NumberStyles.Number,
                       CultureInfo.InvariantCulture,
                       out price);
        }

        // DISPLAY FILTER ERROR
        private void ShowFilterError(string message)
        {
            lblFilterMessage.Text =
                Server.HtmlEncode(message);

            // Keep the existing results visible.
        }

        // APPLY FILTERS BUTTON
        protected void btnApplyFilters_Click(
            object sender, EventArgs e)
        {
            BindProducts();
        }

        // CLEAR FILTERS BUTTON
        protected void btnClearFilters_Click(
            object sender, EventArgs e)
        {
            txtSearch.Text = "";
            txtMinPrice.Text = "";
            txtMaxPrice.Text = "";

            ddlBrand.SelectedIndex = 0;
            ddlCategory.SelectedIndex = 0;
            ddlAvailability.SelectedIndex = 0;
            ddlSort.SelectedValue = "featured";

            BindProducts();
        }

        // RESOLVE AND CHECK PRODUCT IMAGE
        private string GetImageUrl(string imageUrl)
        {
            if (string.IsNullOrWhiteSpace(imageUrl))
                return "";

            imageUrl = imageUrl.Trim().Replace("\\", "/");

            // SUPPORT HTTP AND HTTPS IMAGES
            Uri absoluteUri;

            if (Uri.TryCreate(
                imageUrl,
                UriKind.Absolute,
                out absoluteUri))
            {
                if (absoluteUri.Scheme == Uri.UriSchemeHttp ||
                    absoluteUri.Scheme == Uri.UriSchemeHttps)
                {
                    return imageUrl;
                }

                return "";
            }

            // CONVERT TO APPLICATION-RELATIVE PATH
            string appRelativeUrl;

            if (imageUrl.StartsWith("~/"))
            {
                appRelativeUrl = imageUrl;
            }
            else if (imageUrl.StartsWith("/"))
            {
                appRelativeUrl = "~" + imageUrl;
            }
            else
            {
                appRelativeUrl = "~/" + imageUrl.TrimStart('/');
            }

            try
            {
                string physicalPath =
                    Server.MapPath(appRelativeUrl);

                if (File.Exists(physicalPath))
                {
                    return ResolveUrl(appRelativeUrl);
                }
            }
            catch (HttpException)
            {
                return "";
            }
            catch (ArgumentException)
            {
                return "";
            }

            return "";
        }
    }
}
