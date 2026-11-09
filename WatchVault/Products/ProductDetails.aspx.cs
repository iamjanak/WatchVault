
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
        private string ConnectionString
        {
            get
            {
                return ConfigurationManager
                    .ConnectionStrings["WatchVaultDB"]
                    .ConnectionString;
            }
        }

        private int UserID
        {
            get
            {
                int userId;

                if (Session["UserID"] != null &&
                    int.TryParse(Session["UserID"].ToString(), out userId))
                {
                    return userId;
                }

                return 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProduct();
            }
        }

        // ==========================================
        // LOAD SELECTED PRODUCT
        // ==========================================

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

                    stock = Convert.ToInt32(reader["StockQuantity"]);

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

                // Load existing product information
                LoadProductImages(productId, primaryImage);
                LoadSpecifications(productId);

                // Quantity settings
                txtQuantity.Text = "1";
                txtQuantity.Attributes["min"] = "1";
                txtQuantity.Attributes["max"] =
                    Math.Max(stock, 1).ToString();
                txtQuantity.Attributes["step"] = "1";

                txtQuantity.Enabled = stock > 0;

                // Enable Add to Cart only when stock exists
                btnAddToCart.Enabled = stock > 0;

                btnAddToCart.ToolTip = stock > 0
                    ? "Add this watch to your shopping cart."
                    : "This watch is currently out of stock.";
            }
        }

        // ==========================================
        // ADD TO CART
        // ==========================================

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            // Check login
            if (UserID == 0)
            {
                string returnUrl = Request.RawUrl;

                Response.Redirect(
                    "~/Login.aspx?ReturnUrl=" +
                    Server.UrlEncode(returnUrl), false);

                Context.ApplicationInstance.CompleteRequest();
                return;
            }

            int productId;
            int quantity;

            // Validate product ID
            if (!int.TryParse(Request.QueryString["id"], out productId)
                || productId <= 0)
            {
                ShowNotFound();
                return;
            }

            // Validate quantity
            if (!int.TryParse(txtQuantity.Text, out quantity)
                || quantity < 1)
            {
                btnAddToCart.Enabled = true;
                ShowCartMessage("Please select a valid quantity.");
                return;
            }

            try
            {
                using (SqlConnection connection =
                    new SqlConnection(ConnectionString))
                {
                    connection.Open();

                    using (SqlTransaction transaction =
                        connection.BeginTransaction(
                            IsolationLevel.Serializable))
                    {
                        try
                        {
                            // Verify product and lock its stock record
                            int stock;

                            const string stockQuery = @"
                                SELECT StockQuantity
                                FROM dbo.Products WITH (UPDLOCK, HOLDLOCK)
                                WHERE ProductId = @ProductId
                                  AND IsActive = 1;";

                            using (SqlCommand stockCommand =
                                new SqlCommand(
                                    stockQuery, connection, transaction))
                            {
                                stockCommand.Parameters.Add(
                                    "@ProductId", SqlDbType.Int)
                                    .Value = productId;

                                object result = stockCommand.ExecuteScalar();

                                if (result == null || result == DBNull.Value)
                                {
                                    transaction.Rollback();
                                    ShowCartMessage(
                                        "This product is no longer available.");
                                    return;
                                }

                                stock = Convert.ToInt32(result);
                            }

                            if (stock <= 0)
                            {
                                transaction.Rollback();
                                ShowCartMessage(
                                    "Sorry, this watch is out of stock.");
                                return;
                            }

                            if (quantity > stock)
                            {
                                transaction.Rollback();
                                ShowCartMessage(
                                    "Only " + stock +
                                    " watches are available.");
                                return;
                            }

                            // Check whether this product is already
                            // in the customer's cart
                            int cartItemId = 0;
                            int existingQuantity = 0;

                            const string checkQuery = @"
                                SELECT CartItemId, Quantity
                                FROM dbo.CartItems WITH (UPDLOCK, HOLDLOCK)
                                WHERE UserID = @UserID
                                  AND ProductId = @ProductId;";

                            using (SqlCommand checkCommand =
                                new SqlCommand(
                                    checkQuery, connection, transaction))
                            {
                                checkCommand.Parameters.Add(
                                    "@UserID", SqlDbType.Int)
                                    .Value = UserID;

                                checkCommand.Parameters.Add(
                                    "@ProductId", SqlDbType.Int)
                                    .Value = productId;

                                using (SqlDataReader reader =
                                    checkCommand.ExecuteReader())
                                {
                                    if (reader.Read())
                                    {
                                        cartItemId = Convert.ToInt32(
                                            reader["CartItemId"]);

                                        existingQuantity = Convert.ToInt32(
                                            reader["Quantity"]);
                                    }
                                }
                            }

                            int finalQuantity =
                                existingQuantity + quantity;

                            if (finalQuantity > stock)
                            {
                                transaction.Rollback();

                                ShowCartMessage(
                                    "You already have " +
                                    existingQuantity +
                                    " in your cart. Only " +
                                    stock +
                                    " are available in total.");

                                return;
                            }

                            if (cartItemId > 0)
                            {
                                // Update existing cart item
                                const string updateQuery = @"
                                    UPDATE dbo.CartItems
                                    SET Quantity = @Quantity
                                    WHERE CartItemId = @CartItemId
                                      AND UserID = @UserID;";

                                using (SqlCommand updateCommand =
                                    new SqlCommand(
                                        updateQuery, connection, transaction))
                                {
                                    updateCommand.Parameters.Add(
                                        "@Quantity", SqlDbType.Int)
                                        .Value = finalQuantity;

                                    updateCommand.Parameters.Add(
                                        "@CartItemId", SqlDbType.Int)
                                        .Value = cartItemId;

                                    updateCommand.Parameters.Add(
                                        "@UserID", SqlDbType.Int)
                                        .Value = UserID;

                                    updateCommand.ExecuteNonQuery();
                                }
                            }
                            else
                            {
                                // Insert new cart item
                                const string insertQuery = @"
                                    INSERT INTO dbo.CartItems
                                        (UserID, ProductId, Quantity, AddedAt)
                                    VALUES
                                        (@UserID, @ProductId, @Quantity, GETDATE());";

                                using (SqlCommand insertCommand =
                                    new SqlCommand(
                                        insertQuery, connection, transaction))
                                {
                                    insertCommand.Parameters.Add(
                                        "@UserID", SqlDbType.Int)
                                        .Value = UserID;

                                    insertCommand.Parameters.Add(
                                        "@ProductId", SqlDbType.Int)
                                        .Value = productId;

                                    insertCommand.Parameters.Add(
                                        "@Quantity", SqlDbType.Int)
                                        .Value = quantity;

                                    insertCommand.ExecuteNonQuery();
                                }
                            }

                            transaction.Commit();
                        }
                        catch
                        {
                            transaction.Rollback();
                            throw;
                        }
                    }
                }

                // Product successfully added.
                // Redirect to the existing Cart page.
                // Product successfully added.
                // Redirect to cart and show a success notification.
                Response.Redirect("~/Products/Cart.aspx?added=1", false);
                Context.ApplicationInstance.CompleteRequest();
                return;
            }
            catch (Exception)
            {
                ShowCartMessage(
                    "Unable to add this watch to your cart. Please try again.");
            }
        }

        // ==========================================
        // CART MESSAGE
        // ==========================================

        private void ShowCartMessage(string message)
        {
            // Display a browser message without requiring
            // another server-side label control.
            string safeMessage =
                HttpUtility.JavaScriptStringEncode(message);

            ClientScript.RegisterStartupScript(
                GetType(),
                "CartMessage",
                "alert('" + safeMessage + "');",
                true);
        }

        // ==========================================
        // LOAD PRODUCT IMAGE GALLERY
        // ==========================================

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

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string imageUrl =
                            Convert.ToString(reader["ImageUrl"]);

                        if (string.IsNullOrWhiteSpace(imageUrl))
                            continue;

                        string resolvedUrl = GetImageUrl(imageUrl);

                        if (string.IsNullOrWhiteSpace(resolvedUrl))
                            continue;

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

            if (gallery.Rows.Count > 0)
            {
                imgProduct.ImageUrl =
                    Convert.ToString(gallery.Rows[0]["ResolvedUrl"]);

                imgProduct.AlternateText =
                    Convert.ToString(gallery.Rows[0]["AltText"]);

                imgProduct.Visible = true;

                rptGallery.DataSource = gallery;
                rptGallery.DataBind();

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

        // ==========================================
        // LOAD TECHNICAL SPECIFICATIONS
        // ==========================================

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

        // ==========================================
        // RESOLVE IMAGE URL
        // ==========================================

        private string GetImageUrl(string imageUrl)
        {
            if (string.IsNullOrWhiteSpace(imageUrl))
                return "";

            imageUrl = imageUrl.Trim().Replace("\\", "/");

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

        // ==========================================
        // PRODUCT NOT FOUND
        // ==========================================

        private void ShowNotFound()
        {
            pnlProduct.Visible = false;
            pnlNotFound.Visible = true;
        }
    }
}
