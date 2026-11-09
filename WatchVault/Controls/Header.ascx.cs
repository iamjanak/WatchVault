
using System;
using System.Web.UI;

namespace WatchVault.Controls
{
    public partial class Header : UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int userId;

            bool isLoggedIn =
                Session["UserID"] != null &&
                int.TryParse(
                    Convert.ToString(Session["UserID"]),
                    out userId
                ) &&
                userId > 0;

            phGuest.Visible = !isLoggedIn;
            phUser.Visible = isLoggedIn;

            if (isLoggedIn)
            {
                string userName =
                    Convert.ToString(Session["UserName"]);

                if (string.IsNullOrWhiteSpace(userName))
                {
                    userName = "Customer";
                }

                litUserName.Text =
                    Server.HtmlEncode(userName);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();

            Response.Redirect(
                ResolveUrl("~/Login.aspx"),
                false
            );

            Context.ApplicationInstance.CompleteRequest();
        }
    }
}
