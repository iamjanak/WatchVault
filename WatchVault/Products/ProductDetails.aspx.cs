
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;
using System.Web.UI;

namespace WatchVault.Products
{
    public partial class ProductDetails1 : Page
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
                LoadProduct();
            }
        }

        // LOAD SELECTED PRODUCT
        private void LoadProduct()
        {
            int productId;

            if (!int.TryParse(Request.QueryString["id"], out productId)
                || productId <= 0)
            {
                ShowNotFound();
                return;
            }

            const string query = @"
                SELECT ProductId, Name, Brand, Price,
                       ImageUrl, Description, StockQuantity, Category
                FROM dbo.Products
                WHERE ProductId = @ProductId
                  AND IsActive = 1";

            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            using (SqlCommand command =
                new SqlCommand(query, connection))
            {
                command.Parameters.Add("@ProductId", SqlDbType.Int)
                    .Value = productId;

                connection.Open();

                string primaryImage;
                int stock;

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (!reader.Read())
                    {
                        ShowNotFound();
                        return;
                    }

                    litName.Text = Server.HtmlEncode(
                        Convert.ToString(reader["Name"]));

                    litBrand.Text = Server.HtmlEncode(
                        Convert.ToString(reader["Brand"]));

                    litPrice.Text = Convert.ToDecimal(
                        reader["Price"]).ToString("N0");

                    string description =
                        reader["Description"] == DBNull.Value
                        ? "Detailed product information will be available soon."
                        : Convert.ToString(reader["Description"]);

                    litDescription.Text =
                        Server.HtmlEncode(description);

                    litCategory.Text =
                        reader["Category"] == DBNull.Value
                        ? "Watch"
                        : Server.HtmlEncode(
                            Convert.ToString(reader["Category"]));

                    stock = Convert.ToInt32(
                        reader["StockQuantity"]);

                    primaryImage =
                        reader["ImageUrl"] == DBNull.Value
                        ? ""
                        : Convert.ToString(reader["ImageUrl"]);

                    if (stock > 0)
                    {
                        litStock.Text =
                            "<span class='stock'>In Stock (" +
                            stock + " available)</span>";
                    }
                    else
                    {
                        litStock.Text =
                            "<span class='out-of-stock'>Out of Stock</span>";
                    }
                }

                // LOAD PRODUCT IMAGES
                LoadProductImages(productId, primaryImage);

                // LOAD PRODUCT SPECIFICATIONS
                LoadSpecifications(productId);

                // QUANTITY SETTINGS
                txtQuantity.Text = "1";

                txtQuantity.Attributes["min"] = "1";

                txtQuantity.Attributes["max"] =
                    Math.Max(stock, 1).ToString();

                txtQuantity.Attributes["step"] = "1";

                txtQuantity.Enabled = stock > 0;

                // CART INTEGRATION
                btnAddToCart.Enabled = false;
            }
        }

        // LOAD PRODUCT IMAGE GALLERY
        private void LoadProductImages(
            int productId,
            string primaryImage)
        {
            DataTable gallery = new DataTable();

            gallery.Columns.Add("ResolvedUrl", typeof(string));
            gallery.Columns.Add("AltText", typeof(string));

            const string query = @"
                SELECT ImageUrl, AltText
                FROM dbo.ProductImages
                WHERE ProductId = @ProductId
                ORDER BY DisplayOrder, ProductImageId";

            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            using (SqlCommand command =
                new SqlCommand(query, connection))
            {
                command.Parameters.Add("@ProductId", SqlDbType.Int)
                    .Value = productId;

                connection.Open();

                using (SqlDataReader reader =
                    command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string imageUrl =
                            Convert.ToString(reader["ImageUrl"]);

                        if (string.IsNullOrWhiteSpace(imageUrl))
                            continue;

                        string resolvedUrl = GetImageUrl(imageUrl);

                        // Skip invalid or missing local images.
                        if (string.IsNullOrWhiteSpace(resolvedUrl))
                            continue;

                        // Prevent duplicate images.
                        bool duplicate = false;

                        foreach (DataRow row in gallery.Rows)
                        {
                            if (string.Equals(
                                Convert.ToString(row["ResolvedUrl"]),
                                resolvedUrl,
                                StringComparison.OrdinalIgnoreCase))
                            {
                                duplicate = true;
                                break;
                            }
                        }

                        if (duplicate)
                            continue;

                        string altText =
                            reader["AltText"] == DBNull.Value
                            ? "Watch product image"
                            : Convert.ToString(reader["AltText"]);

                        gallery.Rows.Add(resolvedUrl, altText);
                    }
                }
            }

            // ADD MAIN PRODUCT IMAGE IF NOT ALREADY PRESENT.
            string mainUrl = GetImageUrl(primaryImage);

            if (!string.IsNullOrWhiteSpace(mainUrl))
            {
                bool alreadyExists = false;

                foreach (DataRow row in gallery.Rows)
                {
                    if (string.Equals(
                        Convert.ToString(row["ResolvedUrl"]),
                        mainUrl,
                        StringComparison.OrdinalIgnoreCase))
                    {
                        alreadyExists = true;
                        break;
                    }
                }

                if (!alreadyExists)
                {
                    DataRow newRow = gallery.NewRow();

                    newRow["ResolvedUrl"] = mainUrl;
                    newRow["AltText"] = "Main watch product image";

                    gallery.Rows.InsertAt(newRow, 0);
                }
            }

            // DISPLAY AVAILABLE IMAGES.
            if (gallery.Rows.Count > 0)
            {
                imgProduct.ImageUrl =
                    Convert.ToString(gallery.Rows[0]["ResolvedUrl"]);

                imgProduct.AlternateText =
                    Convert.ToString(gallery.Rows[0]["AltText"]);

                imgProduct.Visible = true;

                rptGallery.DataSource = gallery;
                rptGallery.DataBind();

                // Show thumbnails only when multiple images exist.
                pnlGalleryThumbnails.Visible =
                    gallery.Rows.Count > 1;
            }
            else
            {
                imgProduct.ImageUrl = "";
                imgProduct.AlternateText = "Watch image unavailable";
                imgProduct.Visible = false;

                pnlGalleryThumbnails.Visible = false;
            }
        }

        // LOAD TECHNICAL SPECIFICATIONS
        private void LoadSpecifications(int productId)
        {
            DataTable specifications = new DataTable();

            const string query = @"
                SELECT SpecificationName, SpecificationValue
                FROM dbo.ProductSpecifications
                WHERE ProductId = @ProductId
                ORDER BY DisplayOrder, SpecificationId";

            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            using (SqlCommand command =
                new SqlCommand(query, connection))
            {
                command.Parameters.Add("@ProductId", SqlDbType.Int)
                    .Value = productId;

                using (SqlDataAdapter adapter =
                    new SqlDataAdapter(command))
                {
                    adapter.Fill(specifications);
                }
            }

            rptSpecifications.DataSource = specifications;
            rptSpecifications.DataBind();

            pnlSpecifications.Visible =
                specifications.Rows.Count > 0;

            pnlNoSpecifications.Visible =
                specifications.Rows.Count == 0;
        }

        // RESOLVE AND VALIDATE IMAGE URL
        private string GetImageUrl(string imageUrl)
        {
            if (string.IsNullOrWhiteSpace(imageUrl))
                return "";

            imageUrl = imageUrl.Trim().Replace("\\", "/");

            // SUPPORT EXTERNAL HTTP/HTTPS IMAGES.
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

            // CONVERT TO APPLICATION-RELATIVE PATH.
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

                // CHECK WHETHER THE IMAGE EXISTS.
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

        // PRODUCT NOT FOUND
        private void ShowNotFound()
        {
            pnlProduct.Visible = false;
            pnlNotFound.Visible = true;
        }
    }
}
