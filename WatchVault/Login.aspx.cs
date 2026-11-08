
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Web.Security;
using System.Web.UI;
using Google.Apis.Auth;

namespace WatchVault
{
    public partial class Login : Page
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

        protected string GoogleClientId
        {
            get
            {
                return ConfigurationManager.AppSettings["GoogleClientId"] ?? "";
            }
        }

        protected bool GoogleEnabled
        {
            get
            {
                return !string.IsNullOrWhiteSpace(GoogleClientId) &&
                       GoogleClientId.EndsWith(
                           ".apps.googleusercontent.com",
                           StringComparison.OrdinalIgnoreCase);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            pnlGoogle.Visible = GoogleEnabled;

            if (!IsPostBack && Session["UserId"] != null)
            {
                RedirectByRole(Convert.ToString(Session["Role"]));
            }
        }

        // NORMAL LOGIN
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            if (!Page.IsValid)
                return;

            string email = txtEmail.Text.Trim().ToLowerInvariant();
            string password = txtPassword.Text;

            try
            {
                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    string sql = @"
                        SELECT UserID, FullName, Email,
                               PasswordHash, PasswordSalt, Role
                        FROM dbo.Users
                        WHERE Email = @Email AND IsActive = 1";

                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 150)
                            .Value = email;

                        con.Open();

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                string hash = Convert.ToString(reader["PasswordHash"]);
                                string salt = Convert.ToString(reader["PasswordSalt"]);

                                if (VerifyPassword(password, salt, hash))
                                {
                                    int id = Convert.ToInt32(reader["UserID"]);
                                    string name = Convert.ToString(reader["FullName"]);
                                    string userEmail = Convert.ToString(reader["Email"]);
                                    string role = Convert.ToString(reader["Role"]);

                                    reader.Close();

                                    LoginUser(id, name, userEmail, role);
                                    return;
                                }
                            }
                        }
                    }
                }

                lblMessage.Text = "Invalid email or password.";
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.TraceError(
                    "Login error: " + ex);

                lblMessage.Text = "Unable to log in. Please try again.";
            }
        }

        // PASSWORD VERIFICATION
        private bool VerifyPassword(string password, string saltText, string hashText)
        {
            try
            {
                byte[] salt;
                byte[] expectedHash;

                if (saltText.Length == 24 && hashText.Length == 44)
                {
                    salt = Convert.FromBase64String(saltText);
                    expectedHash = Convert.FromBase64String(hashText);
                }
                else if (saltText.Length == 32 && hashText.Length == 64)
                {
                    salt = HexToBytes(saltText);
                    expectedHash = HexToBytes(hashText);
                }
                else
                {
                    return false;
                }

                if (salt.Length != 16 || expectedHash.Length != 32)
                    return false;

                return CheckHash(password, salt, expectedHash, true) ||
                       CheckHash(password, salt, expectedHash, false);
            }
            catch
            {
                return false;
            }
        }

        private bool CheckHash(
            string password,
            byte[] salt,
            byte[] expectedHash,
            bool sha256)
        {
            byte[] actualHash;

            if (sha256)
            {
                using (var pbkdf2 = new Rfc2898DeriveBytes(
                    password, salt, 100000, HashAlgorithmName.SHA256))
                {
                    actualHash = pbkdf2.GetBytes(32);
                }
            }
            else
            {
                using (var pbkdf2 = new Rfc2898DeriveBytes(
                    password, salt, 100000))
                {
                    actualHash = pbkdf2.GetBytes(32);
                }
            }

            int difference = 0;

            for (int i = 0; i < 32; i++)
                difference |= actualHash[i] ^ expectedHash[i];

            return difference == 0;
        }

        private byte[] HexToBytes(string hex)
        {
            byte[] bytes = new byte[hex.Length / 2];

            for (int i = 0; i < bytes.Length; i++)
                bytes[i] = Convert.ToByte(hex.Substring(i * 2, 2), 16);

            return bytes;
        }

        // GOOGLE LOGIN
        protected void btnGoogle_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            if (!GoogleEnabled)
            {
                lblMessage.Text = "Google login is not configured.";
                return;
            }

            try
            {
                string token = hfGoogleToken.Value;

                if (string.IsNullOrWhiteSpace(token))
                {
                    lblMessage.Text = "Please complete Google sign-in.";
                    return;
                }

                var payload = GoogleJsonWebSignature.ValidateAsync(
                    token,
                    new GoogleJsonWebSignature.ValidationSettings
                    {
                        Audience = new[] { GoogleClientId }
                    }).GetAwaiter().GetResult();

                if (string.IsNullOrWhiteSpace(payload.Email) ||
                    payload.EmailVerified != true)
                {
                    lblMessage.Text = "Google email verification failed.";
                    return;
                }

                using (SqlConnection con = new SqlConnection(ConnectionString))
                {
                    con.Open();

                    string sql = @"
                        SELECT UserID, FullName, Email, Role
                        FROM dbo.Users
                        WHERE Email = @Email AND IsActive = 1";

                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 150)
                            .Value = payload.Email;

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                int id = Convert.ToInt32(reader["UserID"]);
                                string name = Convert.ToString(reader["FullName"]);
                                string email = Convert.ToString(reader["Email"]);
                                string role = Convert.ToString(reader["Role"]);

                                reader.Close();

                                LoginUser(id, name, email, role);
                                return;
                            }
                        }
                    }

                    string insert = @"
                        INSERT INTO dbo.Users
                        (FullName, Email, PasswordHash, PasswordSalt,
                         Role, CreatedAt, IsActive)
                        OUTPUT INSERTED.UserID
                        VALUES (@Name, @Email, '', '', 'Customer', GETDATE(), 1)";

                    using (SqlCommand cmd = new SqlCommand(insert, con))
                    {
                        string name = string.IsNullOrWhiteSpace(payload.Name)
                            ? payload.Email
                            : payload.Name;

                        cmd.Parameters.Add("@Name", SqlDbType.NVarChar, 100)
                            .Value = name;

                        cmd.Parameters.Add("@Email", SqlDbType.NVarChar, 150)
                            .Value = payload.Email;

                        int id = Convert.ToInt32(cmd.ExecuteScalar());

                        LoginUser(id, name, payload.Email, "Customer");
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Trace.TraceError(
                    "Google login error: " + ex);

                lblMessage.Text = "Google sign-in failed. Please try again.";
            }
        }

        // LOGIN SESSION
        private void LoginUser(int id, string name, string email, string role)
        {
            Session.Clear();

            Session["UserId"] = id;
            Session["UserName"] = name;
            Session["FullName"] = name;
            Session["Email"] = email;
            Session["Role"] = role;

            FormsAuthentication.SetAuthCookie(email, false);

            RedirectByRole(role);
        }

        // REDIRECT USER - UPDATED
        private void RedirectByRole(string role)
        {
            string url;

            if (string.Equals(
                role, "Admin",
                StringComparison.OrdinalIgnoreCase))
            {
                url = ResolveUrl("~/Admin/Dashboard.aspx");
            }
            else
            {
                string returnUrl = Request.QueryString["ReturnUrl"];

                // Validate local return URL
                bool isLocalUrl =
                    !string.IsNullOrWhiteSpace(returnUrl) &&
                    returnUrl.StartsWith("/") &&
                    !returnUrl.StartsWith("//") &&
                    !returnUrl.StartsWith("/\\");

                if (isLocalUrl)
                {
                    url = returnUrl.StartsWith("~/")
                        ? ResolveUrl(returnUrl)
                        : returnUrl;
                }
                else
                {
                    url = ResolveUrl("~/Default.aspx");
                }
            }

            Response.Redirect(url, false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
