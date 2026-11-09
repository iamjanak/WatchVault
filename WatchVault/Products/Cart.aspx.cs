using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WatchVault.Products
{
    public partial class Cart : Page
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
                if (Session["UserID"] == null)
                    return 0;

                int userId;

                if (int.TryParse(Session["UserID"].ToString(), out userId))
                    return userId;

                return 0;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (UserID == 0)
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=" +
                    Server.UrlEncode("~/Products/Cart.aspx"));
                return;
            }

            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        private void LoadCart()
        {
            DataTable cartTable = new DataTable();

            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            {
                string query = @"
                    SELECT
                        CI.CartItemId,
                        CI.ProductId,
                        CI.Quantity,
                        P.Name,
                        P.Brand,
                        P.Price,
                        P.ImageUrl,
                        P.StockQuantity,
                        (P.Price * CI.Quantity) AS Subtotal
                    FROM CartItems CI
                    INNER JOIN Products P
                        ON CI.ProductId = P.ProductId
                    WHERE CI.UserID = @UserID
                        AND P.IsActive = 1
                    ORDER BY CI.AddedAt DESC;";

                using (SqlCommand command =
                    new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@UserID", SqlDbType.Int)
                        .Value = UserID;

                    using (SqlDataAdapter adapter =
                        new SqlDataAdapter(command))
                    {
                        adapter.Fill(cartTable);
                    }
                }
            }

            rptCart.DataSource = cartTable;
            rptCart.DataBind();

            if (cartTable.Rows.Count == 0)
            {
                pnlEmptyCart.Visible = true;
                pnlCart.Visible = false;
                lblTotal.Text = "Rs. 0.00";
                return;
            }

            pnlEmptyCart.Visible = false;
            pnlCart.Visible = true;

            decimal total = 0;

            foreach (DataRow row in cartTable.Rows)
            {
                total += Convert.ToDecimal(row["Subtotal"]);
            }

            lblTotal.Text = "Rs. " + total.ToString("N2");
        }

        protected void rptCart_ItemCommand(
            object source,
            RepeaterCommandEventArgs e)
        {
            if (UserID == 0)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            HiddenField hfCartItemId =
                e.Item.FindControl("hfCartItemId") as HiddenField;

            if (hfCartItemId == null)
                return;

            int cartItemId;

            if (!int.TryParse(hfCartItemId.Value, out cartItemId))
                return;

            if (e.CommandName == "RemoveItem")
            {
                RemoveCartItem(cartItemId);
            }
            else if (e.CommandName == "UpdateItem")
            {
                TextBox txtQuantity =
                    e.Item.FindControl("txtQuantity") as TextBox;

                int quantity;

                if (txtQuantity == null ||
                    !int.TryParse(txtQuantity.Text, out quantity) ||
                    quantity < 1)
                {
                    ShowMessage("Please enter a valid quantity.");
                    return;
                }

                UpdateCartItem(cartItemId, quantity);
            }

            LoadCart();
        }

        private void RemoveCartItem(int cartItemId)
        {
            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            {
                string query = @"
                    DELETE FROM CartItems
                    WHERE CartItemId = @CartItemId
                      AND UserID = @UserID;";

                using (SqlCommand command =
                    new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@CartItemId", SqlDbType.Int)
                        .Value = cartItemId;

                    command.Parameters.Add("@UserID", SqlDbType.Int)
                        .Value = UserID;

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }

            ShowMessage("Item removed from your cart.");
        }

        private void UpdateCartItem(int cartItemId, int quantity)
        {
            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            {
                string query = @"
                    UPDATE CI
                    SET CI.Quantity = @Quantity
                    FROM CartItems CI
                    INNER JOIN Products P
                        ON CI.ProductId = P.ProductId
                    WHERE CI.CartItemId = @CartItemId
                      AND CI.UserID = @UserID
                      AND P.IsActive = 1
                      AND P.StockQuantity >= @Quantity;";

                using (SqlCommand command =
                    new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@Quantity", SqlDbType.Int)
                        .Value = quantity;

                    command.Parameters.Add("@CartItemId", SqlDbType.Int)
                        .Value = cartItemId;

                    command.Parameters.Add("@UserID", SqlDbType.Int)
                        .Value = UserID;

                    connection.Open();

                    int rowsAffected = command.ExecuteNonQuery();

                    if (rowsAffected == 0)
                    {
                        ShowMessage(
                            "The requested quantity is unavailable. " +
                            "Please check the available stock.");
                    }
                    else
                    {
                        ShowMessage("Cart quantity updated.");
                    }
                }
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            ShowMessage(
                "Your cart is ready. Checkout will be connected " +
                "after we complete the cart and order system.");
        }

        private void ShowMessage(string message)
        {
            lblMessage.Text = message;
            lblMessage.Visible = true;
        }
    }
}