
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace WatchVault
{
    public partial class Register : Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            // Server-side validation
            if (!Page.IsValid)
            {
                return;
            }

            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim().ToLowerInvariant();
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            if (string.IsNullOrWhiteSpace(fullName) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrEmpty(password) ||
                string.IsNullOrEmpty(confirmPassword))
            {
                ShowMessage("Please complete all fields.");
                return;
            }

            if (fullName.Length > 100 || email.Length > 150)
            {
                ShowMessage("Name or email exceeds the allowed length.");
                return;
            }

            if (!Regex.IsMatch(
                email,
                @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                ShowMessage("Please enter a valid email address.");
                return;
            }

            if (password.Length < 8 || password.Length > 128)
            {
                ShowMessage(
                    "Password must contain 8 to 128 characters.");
                return;
            }

            if (password != confirmPassword)
            {
                ShowMessage("The passwords do not match.");
                return;
            }

            // Generate a cryptographically secure random salt.
            byte[] saltBytes = new byte[16];

            using (RandomNumberGenerator rng =
                RandomNumberGenerator.Create())
            {
                rng.GetBytes(saltBytes);
            }

            // IMPORTANT:
            // Use Base64 because Login.aspx.cs expects Base64.
            string passwordSalt =
                Convert.ToBase64String(saltBytes);

            string passwordHash =
                CreatePasswordHash(password, saltBytes);

            ConnectionStringSettings setting =
                ConfigurationManager.ConnectionStrings["WatchVaultDB"];

            if (setting == null ||
                string.IsNullOrWhiteSpace(setting.ConnectionString))
            {
                ShowMessage("Database configuration is missing.");
                return;
            }

            string sql = @"
                INSERT INTO dbo.Users
                (
                    FullName,
                    Email,
                    PasswordHash,
                    PasswordSalt,
                    Role
                )
                VALUES
                (
                    @FullName,
                    @Email,
                    @PasswordHash,
                    @PasswordSalt,
                    @Role
                );";

            try
            {
                using (SqlConnection con =
                    new SqlConnection(setting.ConnectionString))
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.Add(
                        "@FullName",
                        SqlDbType.NVarChar,
                        100
                    ).Value = fullName;

                    cmd.Parameters.Add(
                        "@Email",
                        SqlDbType.NVarChar,
                        150
                    ).Value = email;

                    cmd.Parameters.Add(
                        "@PasswordHash",
                        SqlDbType.NVarChar,
                        255
                    ).Value = passwordHash;

                    cmd.Parameters.Add(
                        "@PasswordSalt",
                        SqlDbType.NVarChar,
                        32
                    ).Value = passwordSalt;

                    cmd.Parameters.Add(
                        "@Role",
                        SqlDbType.NVarChar,
                        20
                    ).Value = "Customer";

                    con.Open();

                    cmd.ExecuteNonQuery();
                }

                // Registration successful.
                lblMessage.ForeColor =
                    System.Drawing.Color.Green;

                lblMessage.Text =
                    "Registration successful! You can now log in.";

                // Clear the registration fields.
                txtFullName.Text = "";
                txtEmail.Text = "";
                txtPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2601 || ex.Number == 2627)
                {
                    ShowMessage(
                        "An account with this email already exists.");
                }
                else
                {
                    System.Diagnostics.Trace.TraceError(
                        "Registration SQL error: " + ex);

                    ShowMessage(
                        "Registration could not be completed.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.TraceError(
                    "Registration error: " + ex);

                ShowMessage(
                    "Registration failed. Please try again.");
            }
        }

        // PBKDF2-SHA256 password hashing.
        // Must match the Login.aspx.cs verification settings.
        public static string CreatePasswordHash(
            string password,
            byte[] saltBytes)
        {
            using (var pbkdf2 = new Rfc2898DeriveBytes(
                password,
                saltBytes,
                100000,
                HashAlgorithmName.SHA256))
            {
                byte[] hashBytes = pbkdf2.GetBytes(32);

                return Convert.ToBase64String(hashBytes);
            }
        }

        // Display a safe message to the user.
        private void ShowMessage(string message)
        {
            lblMessage.ForeColor =
                System.Drawing.Color.Red;

            lblMessage.Text = Server.HtmlEncode(message);
        }
    }
}
