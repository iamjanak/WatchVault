
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
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

        private List<WatchProduct> GetProducts()
        {
            return new List<WatchProduct>
            {
                new WatchProduct
                {
                    ProductId = 1,
                    Name = "Casio F-91W",
                    Brand = "Casio",
                    Price = 1800,
                    ImageUrl = "~/Images/casio-f91w.jpg",
                    Description = "Affordable, lightweight digital watch."
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
                    Description = "Casual watch with a clean, readable dial."
                },
                new WatchProduct
                {
                    ProductId = 6,
                    Name = "Casio MQ-24",
                    Brand = "Casio",
                    Price = 7500,
                    ImageUrl = "~/Images/casio-mq24.jpg",
                    Description = "Simple, affordable analog wristwatch."
                },
                new WatchProduct
                {
                    ProductId = 7,
                    Name = "Roamer Classic",
                    Brand = "Roamer",
                    Price = 18000,
                    ImageUrl = "~/Images/roamer-classic.jpg",
                    Description = "Timeless styling with a refined appearance."
                },
                new WatchProduct
                {
                    ProductId = 8,
                    Name = "Seiko Presage",
                    Brand = "Seiko",
                    Price = 68000,
                    ImageUrl = "~/Images/seiko-presage.jpg",
                    Description = "Premium dress watch with an elegant dial."
                },
                new WatchProduct
                {
                    ProductId = 9,
                    Name = "Citizen Promaster",
                    Brand = "Citizen",
                    Price = 62000,
                    ImageUrl = "~/Images/citizen-promaster.jpg",
                    Description = "Sport-inspired watch with a bold appearance."
                }
            };
        }

        private void BindProducts()
        {
            List<WatchProduct> products = GetProducts();

            // Apply filters only after the user clicks Apply Filters.
            if (ViewState["FiltersApplied"] != null &&
                Convert.ToBoolean(ViewState["FiltersApplied"]))
            {
                products = ApplyFilters(products);
            }

            // Sorting
            string sortOption = ddlSort.SelectedValue;

            switch (sortOption)
            {
                case "price-low":
                    products = products.OrderBy(p => p.Price).ToList();
                    break;

                case "price-high":
                    products = products.OrderByDescending(p => p.Price).ToList();
                    break;

                case "name":
                    products = products.OrderBy(p => p.Name).ToList();
                    break;

                case "newest":
                default:
                    products = products.OrderByDescending(p => p.ProductId).ToList();
                    break;
            }

            // Check whether each image physically exists.
            foreach (WatchProduct product in products)
            {
                string physicalPath = Server.MapPath(product.ImageUrl);

                product.ImageExists = System.IO.File.Exists(physicalPath);
            }

            rptProducts.DataSource = products;
            rptProducts.DataBind();

            litResultCount.Text = products.Count.ToString();

            pnlNoProducts.Visible = products.Count == 0;
        }

        private List<WatchProduct> ApplyFilters(List<WatchProduct> products)
        {
            decimal minPrice;

            if (decimal.TryParse(txtMinPrice.Text, out minPrice))
            {
                products = products
                    .Where(p => p.Price >= minPrice)
                    .ToList();
            }

            decimal maxPrice;

            if (decimal.TryParse(txtMaxPrice.Text, out maxPrice))
            {
                products = products
                    .Where(p => p.Price <= maxPrice)
                    .ToList();
            }

            List<string> selectedBrands = new List<string>();

            if (chkRoamer.Checked) selectedBrands.Add("Roamer");
            if (chkSeiko.Checked) selectedBrands.Add("Seiko");
            if (chkCitizen.Checked) selectedBrands.Add("Citizen");
            if (chkCasio.Checked) selectedBrands.Add("Casio");
            if (chkFossil.Checked) selectedBrands.Add("Fossil");
            if (chkTimex.Checked) selectedBrands.Add("Timex");

            if (selectedBrands.Count > 0)
            {
                products = products
                    .Where(p => selectedBrands.Contains(p.Brand))
                    .ToList();
            }

            return products;
        }

        protected void btnApplyFilters_Click(object sender, EventArgs e)
        {
            ViewState["FiltersApplied"] = true;
            BindProducts();
        }

        protected void btnResetFilters_Click(object sender, EventArgs e)
        {
            txtMinPrice.Text = "0";
            txtMaxPrice.Text = "200000";

            chkRoamer.Checked = false;
            chkSeiko.Checked = false;
            chkCitizen.Checked = false;
            chkCasio.Checked = false;
            chkFossil.Checked = false;
            chkTimex.Checked = false;

            ddlSort.SelectedValue = "newest";

            ViewState["FiltersApplied"] = false;

            BindProducts();
        }

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindProducts();
        }
    }

    public class WatchProduct
    {
        public int ProductId { get; set; }

        public string Name { get; set; }

        public string Brand { get; set; }

        public decimal Price { get; set; }

        public string ImageUrl { get; set; }

        public string Description { get; set; }

        public bool ImageExists { get; set; }
    }
}
