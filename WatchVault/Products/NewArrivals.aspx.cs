using System;
using System.Collections.Generic;
using System.Web.UI;

namespace WatchVault.Products
{
    public partial class NewArrivals : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProducts();
            }
        }

        private void BindProducts()
        {
            List<WatchProduct> products = new List<WatchProduct>
            {
                new WatchProduct
                {
                    Name = "Roamer Classic",
                    Brand = "Roamer",
                    Price = 18000m,
                    ImageUrl = "~/Images/roamer-classic.jpg",
                    Description = "A timeless classic watch combining elegant design with everyday comfort."
                },
                new WatchProduct
                {
                    Name = "Seiko Presage",
                    Brand = "Seiko",
                    Price = 45000m,
                    ImageUrl = "~/Images/roamer-classic.jpg",
                    Description = "A sophisticated dress watch featuring refined styling for formal occasions."
                },
                new WatchProduct
                {
                    Name = "Citizen Eco-Drive",
                    Brand = "Citizen",
                    Price = 32000m,
                    ImageUrl = "~/Images/roamer-classic.jpg",
                    Description = "A versatile watch designed for everyday use with Citizen's light-powered technology."
                },
                new WatchProduct
                {
                    Name = "Casio G-Shock",
                    Brand = "Casio",
                    Price = 15000m,
                    ImageUrl = "~/Images/roamer-classic.jpg",
                    Description = "A sporty, rugged watch designed for active lifestyles and everyday durability."
                }
            };

            rptProducts.DataSource = products;
            rptProducts.DataBind();
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            BindProducts();
        }

        protected void btnResetFilters_Click(object sender, EventArgs e)
        {
            BindProducts();
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts();
        }

        public class WatchProduct
        {
             public int ProductId { get; set; }
                public string Name { get; set; }
                public string Brand { get; set; }
                public decimal Price { get; set; }
                public string ImageUrl { get; set; }
                public string Description { get; set; }
            
        }
    }
}
