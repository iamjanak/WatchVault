
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text.RegularExpressions;

namespace WatchVault
{
    public partial class Register : System.Web.UI.Page
    {
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            lblMessage.ForeColor = System.Drawing.Color.Red;

            if (string.IsNullOrWhiteSpace(fullName) ||
                string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrEmpty(password) ||
                string.IsNullOrEmpty(confirmPassword))
            {
                ShowMessage("Please complete all fields.");
                return;
            }

            if (fullName.Length > 100 || email.Length > 254)
            {
                ShowMessage("One or more fields exceed the allowed length.");
                return;
            }

            if (!Regex.IsMatch(email,
                @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                ShowMessage("Please enter a valid email address.");
                return;
            }

            if (password.Length < 8)
            {
                ShowMessage("Your password must be at least 8 characters.");
                return;
            }

            if (password != confirmPassword)
            {
                ShowMessage("The passwords do not match.");
                return;
            }

            // Generate a random salt and a PBKDF2-SHA256 password hash.
            byte[] saltBytes = new byte[16];

            using (RandomNumberGenerator rng =
                RandomNumberGenerator.Create())
            {
                rng.GetBytes(saltBytes);
            }

            string passwordSalt = BytesToHex(saltBytes);
            string passwordHash = CreatePasswordHash(password, saltBytes);

            ConnectionStringSettings setting =
                ConfigurationManager.ConnectionStrings["WatchVaultDB"];

            if (setting == null)
            {
                ShowMessage("Database configuration is missing.");
                return;
            }

            string sql = @"
                INSERT INTO dbo.Users
                    (FullName, Email, PasswordHash, PasswordSalt, Role)
                VALUES
                    (@FullName, @Email, @PasswordHash, @PasswordSalt, @Role);";

            try
            {
                using (SqlConnection con =
                    new SqlConnection(setting.ConnectionString))
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    cmd.Parameters.AddWithValue("@FullName", fullName);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@PasswordHash", passwordHash);
                    cmd.Parameters.AddWithValue("@PasswordSalt", passwordSalt);
                    cmd.Parameters.AddWithValue("@Role", "Customer");

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text =
                    "Registration successful! You can now log in.";

                txtFullName.Text = "";
                txtEmail.Text = "";
                txtPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
            catch (SqlException ex)
            {
                // Unique constraint or duplicate index violation.
                if (ex.Number == 2601 || ex.Number == 2627)
                {
                    ShowMessage(
                        "An account with this email may already exist.");
                }
                else
                {
                    // Log the detailed exception privately during development.
                    System.Diagnostics.Trace.TraceError(
                        "WatchVault registration SQL error: " + ex);

                    ShowMessage(
                        "Registration could not be completed. " +
                        "Check the database connection and table structure.");
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.TraceError(
                    "WatchVault registration error: " + ex);

                ShowMessage("Registration failed. Please try again.");
            }
        }

        private static string CreatePasswordHash(
            string password, byte[] saltBytes)
        {
            using (var pbkdf2 = new Rfc2898DeriveBytes(
                password, saltBytes, 100000, HashAlgorithmName.SHA256))
            {
                return BytesToHex(pbkdf2.GetBytes(32));
            }
        }

        private static string BytesToHex(byte[] bytes)
        {
            return BitConverter.ToString(bytes).Replace("-", "");
        }

        private void ShowMessage(string message)
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = message;
        }
    }
}
