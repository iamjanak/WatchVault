using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace WatchVault.Products
{
    public partial class ForMen : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMenProducts();
            }
        }

        // Apply filters
        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            BindMenProducts();
        }

        // Reset filters
        protected void btnResetFilters_Click(object sender, EventArgs e)
        {
            txtMinPrice.Text = "";
            txtMaxPrice.Text = "";

            chkRoamer.Checked = false;
            chkSeiko.Checked = false;
            chkCitizen.Checked = false;
            chkCasio.Checked = false;
            chkFossil.Checked = false;
            chkTimex.Checked = false;

            ddlSort.SelectedValue = "newest";

            BindMenProducts();
        }

        // Sorting
        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindMenProducts();
        }

        // Main product binding method
        private void BindMenProducts()
        {
            List<WatchProduct> products = GetMenProducts();

            // -----------------------------
            // PRICE FILTER
            // -----------------------------

            decimal minPrice;
            decimal maxPrice;

            bool hasMinPrice = decimal.TryParse(
                txtMinPrice.Text.Trim(),
                out minPrice);

            bool hasMaxPrice = decimal.TryParse(
                txtMaxPrice.Text.Trim(),
                out maxPrice);

            if (hasMinPrice)
            {
                products = products
                    .Where(p => p.Price >= minPrice)
                    .ToList();
            }

            if (hasMaxPrice)
            {
                products = products
                    .Where(p => p.Price <= maxPrice)
                    .ToList();
            }

            // -----------------------------
            // BRAND FILTER
            // -----------------------------

            List<string> selectedBrands = new List<string>();

            if (chkRoamer.Checked)
                selectedBrands.Add("Roamer");

            if (chkSeiko.Checked)
                selectedBrands.Add("Seiko");

            if (chkCitizen.Checked)
                selectedBrands.Add("Citizen");

            if (chkCasio.Checked)
                selectedBrands.Add("Casio");

            if (chkFossil.Checked)
                selectedBrands.Add("Fossil");

            if (chkTimex.Checked)
                selectedBrands.Add("Timex");

            // Only filter if at least one brand is selected
            if (selectedBrands.Count > 0)
            {
                products = products
                    .Where(p => selectedBrands.Contains(p.Brand))
                    .ToList();
            }

            // -----------------------------
            // SORTING
            // -----------------------------

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
                        .OrderByDescending(p => p.ProductId)
                        .ToList();

                    break;
            }

            // -----------------------------
            // CHECK PRODUCT IMAGES
            // -----------------------------

            foreach (WatchProduct product in products)
            {
                string imagePath = Server.MapPath(product.ImageUrl);

                product.ImageExists = File.Exists(imagePath);
            }

            // -----------------------------
            // BIND PRODUCTS
            // -----------------------------

            rptMen.DataSource = products;
            rptMen.DataBind();

            // Result count
            litResultCount.Text =
                products.Count + " watch(es) found";

            // Show/hide empty message
            pnlNoProducts.Visible = products.Count == 0;
        }

        // Men's watch collection
        private List<WatchProduct> GetMenProducts()
        {
            return new List<WatchProduct>
            {
                // =====================================
                // 5 PRODUCTS FROM NEW ARRIVALS
                // =====================================

                new WatchProduct
                {
                    ProductId = 1,
                    Name = "Casio F-91W",
                    Brand = "Casio",
                    Price = 1800,
                    ImageUrl = "~/Images/casio-f91w.jpg",
                    Description = "Affordable and lightweight digital watch."
                },

                new WatchProduct
                {
                    ProductId = 2,
                    Name = "Seiko 5 Sports",
                    Brand = "Seiko",
                    Price = 45000,
                    ImageUrl = "~/Images/seiko-5-sports.jpg",
                    Description = "Sporty automatic watch with a classic design."
                },

                new WatchProduct
                {
                    ProductId = 3,
                    Name = "Citizen Eco-Drive",
                    Brand = "Citizen",
                    Price = 32000,
                    ImageUrl = "~/Images/citizen-eco-drive.jpg",
                    Description = "Elegant watch with light-powered technology."
                },

                new WatchProduct
                {
                    ProductId = 4,
                    Name = "Fossil The Minimalist",
                    Brand = "Fossil",
                    Price = 18500,
                    ImageUrl = "~/Images/fossil-minimalist.jpg",
                    Description = "Minimalist design for everyday fashion."
                },

                new WatchProduct
                {
                    ProductId = 5,
                    Name = "Timex Weekender",
                    Brand = "Timex",
                    Price = 12000,
                    ImageUrl = "~/Images/timex-weekender.jpg",
                    Description = "Casual watch with a clean and readable dial."
                },

                // =====================================
                // 7 ADDITIONAL WATCH MODELS
                // =====================================

                new WatchProduct
                {
                    ProductId = 10,
                    Name = "Casio Edifice EFV-100",
                    Brand = "Casio",
                    Price = 18000,
                    ImageUrl = "~/Images/Products/casio-edifice-efv100.jpg",
                    Description = "Sport-inspired analog watch with a refined design."
                },

                new WatchProduct
                {
                    ProductId = 11,
                    Name = "Seiko 5 SNK809",
                    Brand = "Seiko",
                    Price = 28000,
                    ImageUrl = "~/Images/Products/seiko-snk809.jpg",
                    Description = "Classic automatic field watch with a military-inspired style."
                },

                new WatchProduct
                {
                    ProductId = 12,
                    Name = "Citizen Chandler",
                    Brand = "Citizen",
                    Price = 28000,
                    ImageUrl = "~/Images/Products/citizen-chandler.jpg",
                    Description = "Practical everyday watch with a clean field-watch design."
                },

                new WatchProduct
                {
                    ProductId = 13,
                    Name = "Fossil Grant Chronograph",
                    Brand = "Fossil",
                    Price = 24000,
                    ImageUrl = "~/Images/Products/fossil-grant-chronograph.jpg",
                    Description = "Classic chronograph styling with a sophisticated appearance."
                },

                new WatchProduct
                {
                    ProductId = 14,
                    Name = "Timex Expedition Scout",
                    Brand = "Timex",
                    Price = 15000,
                    ImageUrl = "~/Images/Products/timex-expedition-scout.jpg",
                    Description = "Outdoor-inspired watch designed for casual everyday wear."
                },

                new WatchProduct
                {
                    ProductId = 15,
                    Name = "Roamer Searock",
                    Brand = "Roamer",
                    Price = 65000,
                    ImageUrl = "~/Images/Products/roamer-searock.jpg",
                    Description = "Swiss-inspired watch with a classic and elegant appearance."
                },

                new WatchProduct
                {
                    ProductId = 16,
                    Name = "Casio G-Shock GA-2100",
                    Brand = "Casio",
                    Price = 18000,
                    ImageUrl = "~/Images/Products/casio-gshock-ga2100.jpg",
                    Description = "Durable sports watch with a distinctive octagonal design."
                }
            };
        }
    }
}