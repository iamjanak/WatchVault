
using System;
using System.Web.UI;

namespace WatchVault
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool isLoggedIn = Session["UserID"] != null;

            phGuest.Visible = !isLoggedIn;
            phUser.Visible = isLoggedIn;

            if (isLoggedIn)
            {
                litUserName.Text = Server.HtmlEncode(
                    Convert.ToString(
                        Session["UserName"] ?? "Customer"
                    )
                );
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
