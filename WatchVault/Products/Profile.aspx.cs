using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web;
using System.Web.UI;

namespace WatchVault.Products
{
    public partial class Profile : Page
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
    Server.UrlEncode("~/Products/Profile.aspx"));
                return;
            }

            if (!IsPostBack)
            {
                LoadProfile();
            }
        }

        private void LoadProfile()
        {
            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            {
                string query = @"
                    SELECT
                        FullName,
                        Email,
                        CreatedAt,
                        IsActive
                    FROM Users
                    WHERE UserID = @UserID;";

                using (SqlCommand command =
                    new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@UserID", SqlDbType.Int)
                        .Value = UserID;

                    connection.Open();

                    using (SqlDataReader reader =
                        command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            txtFullName.Text =
                                Convert.ToString(reader["FullName"]);

                            txtEmail.Text =
                                Convert.ToString(reader["Email"]);

                            if (reader["CreatedAt"] != DBNull.Value)
                            {
                                DateTime createdAt =
                                    Convert.ToDateTime(reader["CreatedAt"]);

                                lblCreatedAt.Text =
                                    createdAt.ToString("dd MMMM yyyy");
                            }
                            else
                            {
                                lblCreatedAt.Text = "Not available";
                            }

                            bool isActive =
                                reader["IsActive"] != DBNull.Value &&
                                Convert.ToBoolean(reader["IsActive"]);

                            lblAccountStatus.Text =
                                isActive ? "Active" : "Inactive";
                        }
                        else
                        {
                            ShowMessage(
                                "Your account could not be found. " +
                                "Please sign in again.");
                        }
                    }
                }
            }
        }

        protected void btnSaveProfile_Click(object sender, EventArgs e)
        {
            if (UserID == 0)
            {
                Response.Redirect("~/Login.aspx");
                return;
            }

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();

            if (string.IsNullOrWhiteSpace(fullName))
            {
                ShowMessage("Please enter your full name.");
                return;
            }

            if (fullName.Length > 100)
            {
                ShowMessage(
                    "Your full name cannot exceed 100 characters.");
                return;
            }

            if (string.IsNullOrWhiteSpace(email))
            {
                ShowMessage("Please enter your email address.");
                return;
            }

            if (email.Length > 254)
            {
                ShowMessage(
                    "Your email address is too long.");
                return;
            }

            if (!IsValidEmail(email))
            {
                ShowMessage(
                    "Please enter a valid email address.");
                return;
            }

            using (SqlConnection connection =
                new SqlConnection(ConnectionString))
            {
                connection.Open();

                // Check whether another account uses this email.
                string emailCheckQuery = @"
                    SELECT COUNT(*)
                    FROM Users
                    WHERE Email = @Email
                      AND UserID <> @UserID;";

                using (SqlCommand emailCommand =
                    new SqlCommand(emailCheckQuery, connection))
                {
                    emailCommand.Parameters.Add(
                        "@Email", SqlDbType.NVarChar, 254).Value = email;

                    emailCommand.Parameters.Add(
                        "@UserID", SqlDbType.Int).Value = UserID;

                    int existingEmail =
                        Convert.ToInt32(emailCommand.ExecuteScalar());

                    if (existingEmail > 0)
                    {
                        ShowMessage(
                            "This email address is already registered " +
                            "to another account.");
                        return;
                    }
                }

                // Update current user's profile.
                string updateQuery = @"
                    UPDATE Users
                    SET FullName = @FullName,
                        Email = @Email
                    WHERE UserID = @UserID
                      AND IsActive = 1;";

                using (SqlCommand updateCommand =
                    new SqlCommand(updateQuery, connection))
                {
                    updateCommand.Parameters.Add(
                        "@FullName", SqlDbType.NVarChar, 100)
                        .Value = fullName;

                    updateCommand.Parameters.Add(
                        "@Email", SqlDbType.NVarChar, 254)
                        .Value = email;

                    updateCommand.Parameters.Add(
                        "@UserID", SqlDbType.Int)
                        .Value = UserID;

                    int rowsAffected =
                        updateCommand.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        ShowMessage(
                            "Your profile has been updated successfully.");

                        LoadProfile();
                    }
                    else
                    {
                        ShowMessage(
                            "Your profile could not be updated. " +
                            "Please check your account status.");
                    }
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            LoadProfile();

            lblMessage.Text = "";
            lblMessage.Visible = false;
        }

        private bool IsValidEmail(string email)
        {
            try
            {
                MailAddress mailAddress = new MailAddress(email);

                return mailAddress.Address.Equals(
                    email,
                    StringComparison.OrdinalIgnoreCase);
            }
            catch
            {
                return false;
            }
        }

        private void ShowMessage(string message)
        {
            lblMessage.Text = HttpUtility.HtmlEncode(message);
            lblMessage.Visible = true;
        }
    }
}