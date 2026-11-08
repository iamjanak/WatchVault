using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

namespace WatchVault.Products
{
    public partial class ForSports : Page
    {
        private List<WatchProduct> GetSportsProducts()
        {
            return new List<WatchProduct>
            {
                new WatchProduct
                {
                    ProductId = 201,
                    Brand = "Casio",
                    Name = "Casio G-Shock GA-2100",
                    Description = "Durable sports watch with a modern octagonal design.",
                    Price = 18000,
                    ImageUrl = "~/Images/Products/casio-gshock-ga2100.jpg"
                },

                new WatchProduct
                {
                    ProductId = 202,
                    Brand = "Seiko",
                    Name = "Seiko Prospex Diver",
                    Description = "A robust diver-style watch for adventure.",
                    Price = 85000,
                    ImageUrl = "~/Images/Products/seiko-prospex-diver.jpg"
                },

                new WatchProduct
                {
                    ProductId = 203,
                    Brand = "Citizen",
                    Name = "Citizen Promaster",
                    Description = "Performance-focused watch for outdoor activities.",
                    Price = 62000,
                    ImageUrl = "~/Images/citizen-promaster.jpg"
                },

                new WatchProduct
                {
                    ProductId = 204,
                    Brand = "Timex",
                    Name = "Timex Ironman",
                    Description = "A practical sports watch for training and fitness.",
                    Price = 16000,
                    ImageUrl = "~/Images/Products/timex-ironman.jpg"
                },

                new WatchProduct
                {
                    ProductId = 205,
                    Brand = "Casio",
                    Name = "Casio Edifice Chronograph",
                    Description = "Sporty chronograph styling with a bold design.",
                    Price = 28000,
                    ImageUrl = "~/Images/Products/casio-edifice-chronograph.jpg"
                },

                new WatchProduct
                {
                    ProductId = 206,
                    Brand = "Seiko",
                    Name = "Seiko 5 Sports",
                    Description = "Versatile automatic watch for active lifestyles.",
                    Price = 45000,
                    ImageUrl = "~/Images/seiko-5-sports.jpg"
                },

                new WatchProduct
                {
                    ProductId = 207,
                    Brand = "Citizen",
                    Name = "Citizen Eco-Drive Sport",
                    Description = "Sporty styling with light-powered Eco-Drive technology.",
                    Price = 42000,
                    ImageUrl = "~/Images/Products/citizen-eco-drive-sport.jpg"
                },

                new WatchProduct
                {
                    ProductId = 208,
                    Brand = "Casio",
                    Name = "Casio G-Shock DW-5600",
                    Description = "Classic rugged digital watch for sports and outdoor use.",
                    Price = 15000,
                    ImageUrl = "~/Images/Products/casio-gshock-dw5600.jpg"
                },

                new WatchProduct
                {
                    ProductId = 209,
                    Brand = "Timex",
                    Name = "Timex Expedition Scout",
                    Description = "Outdoor-inspired watch for everyday adventures.",
                    Price = 15000,
                    ImageUrl = "~/Images/Products/timex-expedition-scout.jpg"
                },

                new WatchProduct
                {
                    ProductId = 210,
                    Brand = "Fossil",
                    Name = "Fossil Sport",
                    Description = "Contemporary sporty design for daily wear.",
                    Price = 25000,
                    ImageUrl = "~/Images/Products/fossil-sport.jpg"
                },

                new WatchProduct
                {
                    ProductId = 211,
                    Brand = "Roamer",
                    Name = "Roamer Rockshell",
                    Description = "Sport-inspired watch with a sturdy appearance.",
                    Price = 58000,
                    ImageUrl = "~/Images/Products/roamer-rockshell.jpg"
                },

                new WatchProduct
                {
                    ProductId = 212,
                    Brand = "Seiko",
                    Name = "Seiko 5 Field Sports",
                    Description = "Field-style watch suited to outdoor activities.",
                    Price = 38000,
                    ImageUrl = "~/Images/Products/seiko-5-field-sports.jpg"
                }
            };
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindSportsProducts();
            }
        }

        private void BindSportsProducts()
        {
            List<WatchProduct> products = GetSportsProducts();

            // Price filters
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

            litResultCount.Text =
                "<span class='text-muted'>" +
                products.Count +
                " sports watch(es) found</span>";

            pnlNoProducts.Visible = products.Count == 0;

            rptSports.DataSource = products;
            rptSports.DataBind();
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            BindSportsProducts();
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

            BindSportsProducts();
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSportsProducts();
        }
    }
}
