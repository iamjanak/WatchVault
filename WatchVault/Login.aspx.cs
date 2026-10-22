
using Google.Apis.Auth;
using Microsoft.SqlServer.Server;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Threading.Tasks;

namespace WatchVault
{
    public partial class Login : System.Web.UI.Page
    {
        protected string GoogleClientId
        {
            get
            {
                return ConfigurationManager.AppSettings["GoogleClientId"]
                       ?? string.Empty;
            }
        }

        protected bool GoogleEnabled
        {
            get
            {
                string id = GoogleClientId;
                return !string.IsNullOrWhiteSpace(id)
                    && id.EndsWith(
                        ".apps.googleusercontent.com",
                        StringComparison.OrdinalIgnoreCase);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            pnlGoogle.Visible = GoogleEnabled;

            if (!IsPostBack && Session["UserId"] != null)
            {
                Response.Redirect("Default.aspx", false);
                Context.ApplicationInstance.CompleteRequest();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text;

            if (string.IsNullOrWhiteSpace(email) ||
                string.IsNullOrEmpty(password))
            {
                ShowMessage("Please enter your email and password.");
                return;
            }

            ConnectionStringSettings setting =
                ConfigurationManager.ConnectionStrings["WatchVaultDB"];

            if (setting == null)
            {
                ShowMessage("The account database is not configured.");
                return;
            }

            try
            {
                using (SqlConnection con =
                    new SqlConnection(setting.ConnectionString))
                using (SqlCommand cmd = new SqlCommand(
                    @"SELECT UserId, FullName, Email,
                             PasswordHash, PasswordSalt, Role
                      FROM Users
                      WHERE Email = @Email", con))
                {
                    cmd.Parameters.Add(
                        "@Email", SqlDbType.NVarChar, 254).Value = email;

                    con.Open();

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (!reader.Read())
                        {
                            ShowMessage("Invalid email or password.");
                            return;
                        }

                        int userId = Convert.ToInt32(reader["UserId"]);
                        string fullName = Convert.ToString(reader["FullName"]);
                        string storedHash =
                            Convert.ToString(reader["PasswordHash"]);
                        string storedSalt =
                            Convert.ToString(reader["PasswordSalt"]);
                        string role = Convert.ToString(reader["Role"]);

                        if (!VerifyPassword(
                            password, storedSalt, storedHash))
                        {
                            ShowMessage("Invalid email or password.");
                            return;
                        }

                        StartSession(userId, fullName, email, role);
                    }
                }
            }
            catch (SqlException)
            {
                ShowMessage("Unable to access the account database.");
            }
            catch (Exception)
            {
                ShowMessage("Unable to sign in right now. Please try again.");
            }
        }

        protected void btnGoogle_Click(object sender, EventArgs e)
        {
            string idToken = hfGoogleToken.Value;
            hfGoogleToken.Value = string.Empty;

            if (!GoogleEnabled || string.IsNullOrWhiteSpace(idToken))
            {
                ShowMessage("Google sign-in is not available right now.");
                return;
            }

            try
            {
                var settings =
                    new GoogleJsonWebSignature.ValidationSettings
                    {
                        Audience = new[] { GoogleClientId }
                    };

                GoogleJsonWebSignature.Payload payload =
                    Task.Run(() =>
                        GoogleJsonWebSignature.ValidateAsync(
                            idToken, settings))
                    .GetAwaiter()
                    .GetResult();

                if (payload == null ||
                    !payload.EmailVerified ||
                    string.IsNullOrWhiteSpace(payload.Email))
                {
                    ShowMessage("Your Google email address is not verified.");
                    return;
                }

                string email = payload.Email.Trim();
                string name = string.IsNullOrWhiteSpace(payload.Name)
                    ? email
                    : payload.Name.Trim();

                ConnectionStringSettings setting =
                    ConfigurationManager.ConnectionStrings["WatchVaultDB"];

                if (setting == null)
                {
                    ShowMessage("The account database is not configured.");
                    return;
                }

                int userId;
                string fullName;
                string role;

                using (SqlConnection con =
                    new SqlConnection(setting.ConnectionString))
                {
                    con.Open();

                    using (SqlCommand find = new SqlCommand(
                        @"SELECT UserId, FullName, Role
                          FROM Users
                          WHERE Email = @Email", con))
                    {
                        find.Parameters.Add(
                            "@Email", SqlDbType.NVarChar, 254).Value = email;

                        using (SqlDataReader reader = find.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                userId = Convert.ToInt32(reader["UserId"]);
                                fullName =
                                    Convert.ToString(reader["FullName"]);
                                role = Convert.ToString(reader["Role"]);
                            }
                            else
                            {
                                userId = 0;
                                fullName = null;
                                role = null;
                            }
                        }
                    }

                    if (userId == 0)
                    {
                        // Create a customer account for a new Google user.
                        using (SqlCommand add = new SqlCommand(
                            @"INSERT INTO Users
                                (FullName, Email, PasswordHash, PasswordSalt, Role)
                              OUTPUT INSERTED.UserId
                              VALUES (@FullName, @Email, '', '', 'Customer')",
                            con))
                        {
                            add.Parameters.Add(
                                "@FullName", SqlDbType.NVarChar, 100).Value =
                                name.Length > 100 ? name.Substring(0, 100) : name;

                            add.Parameters.Add(
                                "@Email", SqlDbType.NVarChar, 254).Value = email;

                            userId = Convert.ToInt32(add.ExecuteScalar());
                            fullName = name;
                            role = "Customer";
                        }
                    }
                }

                StartSession(userId, fullName, email, role);
            }
            catch (InvalidJwtException)
            {
                ShowMessage(
                    "Google sign-in could not be verified. Please try again.");
            }
            catch (SqlException)
            {
                ShowMessage("Unable to access the account database.");
            }
            catch (Exception)
            {
                ShowMessage(
                    "Unable to sign in with Google right now. Please try again.");
            }
        }

        private void StartSession(
            int userId, string fullName, string email, string role)
        {
            Session["UserId"] = userId;          // from your Users table
            Session["UserName"] = fullName;      // or first name / username
            Response.Redirect("Default.aspx");
            Session["FullName"] = fullName;
            Session["Email"] = email;
            Session["Role"] = role;

            Response.Redirect("Default.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }

        private bool VerifyPassword(
            string password, string saltHex, string hashHex)
        {
            try
            {
                if (string.IsNullOrWhiteSpace(saltHex) ||
                    string.IsNullOrWhiteSpace(hashHex))
                    return false;

                byte[] salt = HexToBytes(saltHex);
                byte[] expectedHash = HexToBytes(hashHex);

                using (var deriveBytes = new Rfc2898DeriveBytes(
                    password, salt, 100000, HashAlgorithmName.SHA256))
                {
                    byte[] actualHash =
                        deriveBytes.GetBytes(expectedHash.Length);

                    return FixedTimeEquals(actualHash, expectedHash);
                }
            }
            catch (FormatException) { return false; }
            catch (ArgumentException) { return false; }
        }

        private static byte[] HexToBytes(string hex)
        {
            if (string.IsNullOrEmpty(hex) || hex.Length % 2 != 0)
                throw new FormatException("Invalid hexadecimal value.");

            byte[] bytes = new byte[hex.Length / 2];

            for (int i = 0; i < bytes.Length; i++)
            {
                bytes[i] = Convert.ToByte(hex.Substring(i * 2, 2), 16);
            }

            return bytes;
        }

        private static bool FixedTimeEquals(byte[] a, byte[] b)
        {
            if (a == null || b == null || a.Length != b.Length)
                return false;

            int difference = 0;

            for (int i = 0; i < a.Length; i++)
                difference |= a[i] ^ b[i];

            return difference == 0;
        }

        private void ShowMessage(string message)
        {
            lblMessage.Text = Server.HtmlEncode(message);
            lblMessage.CssClass = "message alert alert-danger";
        }
    }
}
