using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace WatchVault.Products
{
    public partial class ForWomen : Page
    {
        private List<WatchProduct> GetWomenProducts()
        {
            return new List<WatchProduct>
            {
                new WatchProduct
                {
                    ProductId = 101,
                    Brand = "Casio",
                    Name = "Casio LTP-V007",
                    Description = "Classic and elegant women's quartz watch.",
                    Price = 6500,
                    ImageUrl = "~/Images/Products/casio-ltp-v007.jpg"
                },

                new WatchProduct
                {
                    ProductId = 102,
                    Brand = "Seiko",
                    Name = "Seiko Women's Quartz",
                    Description = "A refined everyday watch with timeless styling.",
                    Price = 32000,
                    ImageUrl = "~/Images/Products/seiko-womens-quartz.jpg"
                },

                new WatchProduct
                {
                    ProductId = 103,
                    Brand = "Citizen",
                    Name = "Citizen Eco-Drive Silhouette",
                    Description = "Elegant design with Citizen Eco-Drive technology.",
                    Price = 38000,
                    ImageUrl = "~/Images/Products/citizen-silhouette.jpg"
                },

                new WatchProduct
                {
                    ProductId = 104,
                    Brand = "Fossil",
                    Name = "Fossil Jacqueline",
                    Description = "A stylish watch for everyday elegance.",
                    Price = 22000,
                    ImageUrl = "~/Images/Products/fossil-jacqueline.jpg"
                },

                new WatchProduct
                {
                    ProductId = 105,
                    Brand = "Timex",
                    Name = "Timex Women's Weekender",
                    Description = "Casual styling for everyday wear.",
                    Price = 14000,
                    ImageUrl = "~/Images/Products/timex-womens-weekender.jpg"
                },

                new WatchProduct
                {
                    ProductId = 106,
                    Brand = "Roamer",
                    Name = "Roamer Saphira",
                    Description = "A sophisticated watch with a polished finish.",
                    Price = 42000,
                    ImageUrl = "~/Images/Products/roamer-saphira.jpg"
                },

                new WatchProduct
                {
                    ProductId = 107,
                    Brand = "Casio",
                    Name = "Casio Sheen",
                    Description = "Modern styling with a refined appearance.",
                    Price = 16000,
                    ImageUrl = "~/Images/Products/casio-sheen.jpg"
                },

                new WatchProduct
                {
                    ProductId = 108,
                    Brand = "Seiko",
                    Name = "Seiko Classic Ladies",
                    Description = "A classic ladies' watch for daily use.",
                    Price = 35000,
                    ImageUrl = "~/Images/Products/seiko-classic-ladies.jpg"
                },

                new WatchProduct
                {
                    ProductId = 109,
                    Brand = "Citizen",
                    Name = "Citizen Quartz Ladies",
                    Description = "A versatile watch with a clean dial design.",
                    Price = 26000,
                    ImageUrl = "~/Images/Products/citizen-quartz-ladies.jpg"
                },

                new WatchProduct
                {
                    ProductId = 110,
                    Brand = "Fossil",
                    Name = "Fossil Carlie",
                    Description = "A fashionable watch with a contemporary design.",
                    Price = 24000,
                    ImageUrl = "~/Images/Products/fossil-carlie.jpg"
                },

                new WatchProduct
                {
                    ProductId = 111,
                    Brand = "Timex",
                    Name = "Timex Easy Reader Women's",
                    Description = "Easy-to-read dial with comfortable styling.",
                    Price = 12000,
                    ImageUrl = "~/Images/Products/timex-easy-reader-womens.jpg"
                },

                new WatchProduct
                {
                    ProductId = 112,
                    Brand = "Roamer",
                    Name = "Roamer Classic Ladies",
                    Description = "Classic styling with an elegant finish.",
                    Price = 39000,
                    ImageUrl = "~/Images/Products/roamer-classic-ladies.jpg"
                }
            };
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindWomenProducts();
            }
        }

        private void BindWomenProducts()
        {
            List<WatchProduct> products = GetWomenProducts();

            // Price filter
            decimal minPrice;
            decimal maxPrice;

            if (decimal.TryParse(txtMinPrice.Text, out minPrice))
            {
                products = products
                    .Where(p => p.Price >= minPrice)
                    .ToList();
            }

            if (decimal.TryParse(txtMaxPrice.Text, out maxPrice))
            {
                products = products
                    .Where(p => p.Price <= maxPrice)
                    .ToList();
            }

            // Brand filters
            List<string> selectedBrands = new List<string>();

            if (chkCasio.Checked)
                selectedBrands.Add("Casio");

            if (chkSeiko.Checked)
                selectedBrands.Add("Seiko");

            if (chkCitizen.Checked)
                selectedBrands.Add("Citizen");

            if (chkFossil.Checked)
                selectedBrands.Add("Fossil");

            if (chkTimex.Checked)
                selectedBrands.Add("Timex");

            if (chkRoamer.Checked)
                selectedBrands.Add("Roamer");

            if (selectedBrands.Count > 0)
            {
                products = products
                    .Where(p => selectedBrands.Contains(p.Brand))
                    .ToList();
            }

            // Sorting
            switch (ddlSort.SelectedValue)
            {
                case "price-low":
                    products = products
                        .OrderBy(p => p.Price)
                        .ToList();
                    break;

                case "price-high":
                    products = products
                        .OrderByDescending(p => p.Price)
                        .ToList();
                    break;

                case "name":
                    products = products
                        .OrderBy(p => p.Name)
                        .ToList();
                    break;

                default:
                    products = products
                        .OrderBy(p => p.ProductId)
                        .ToList();
                    break;
            }

            // Show the result count
            litResultCount.Text =
                "<span class='text-muted'>" +
                products.Count +
                " women's watch(es) found</span>";

            // Show empty message if no products match
            pnlNoProducts.Visible = products.Count == 0;

            // Bind products
            rptWomen.DataSource = products;
            rptWomen.DataBind();
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            BindWomenProducts();
        }

        protected void btnResetFilters_Click(object sender, EventArgs e)
        {
            txtMinPrice.Text = "";
            txtMaxPrice.Text = "";

            chkCasio.Checked = false;
            chkSeiko.Checked = false;
            chkCitizen.Checked = false;
            chkFossil.Checked = false;
            chkTimex.Checked = false;
            chkRoamer.Checked = false;

            ddlSort.SelectedValue = "featured";

            BindWomenProducts();
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindWomenProducts();
        }
    }
}