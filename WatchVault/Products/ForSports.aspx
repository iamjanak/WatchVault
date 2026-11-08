
<%@ Page Title="Sports Watches | WatchVault"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="ForSports.aspx.cs"
    Inherits="WatchVault.Products.ForSports" %>

<%@ Register Src="~/Controls/Header.ascx"
    TagPrefix="wv" TagName="Header" %>

<%@ Register Src="~/Controls/Footer.ascx"
    TagPrefix="wv" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Sports Watches | WatchVault</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <link href="<%= ResolveUrl("~/Content/Site.css") %>"
          rel="stylesheet" />

    <style>
        .sports-page {
            background: var(--cream, #f7f5f0);
            min-height: 100vh;
            color: var(--text, #252b33);
        }

        /* Centered Hero Section */
        .sports-intro {
            background: var(--navy, #101820);
            color: white;
            min-height: 280px;
            padding: 55px 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
        }

        .sports-intro-content {
            width: 100%;
            max-width: 850px;
            margin: 0 auto;
        }

        .sports-intro h1 {
            font-family: 'Cormorant Garamond', serif;
            font-size: clamp(2.5rem, 5vw, 4rem);
            margin-bottom: 12px;
        }

        .sports-intro p {
            color: #d7dce1;
            max-width: 650px;
            margin: 0 auto;
            line-height: 1.8;
            font-size: 15px;
        }

        .sports-breadcrumb {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 9px;
            font-size: 14px;
            color: #d6ad65;
            margin-bottom: 15px;
        }

        .sports-breadcrumb a {
            color: #f0d8a8;
            text-decoration: none;
            transition: color .2s ease;
        }

        .sports-breadcrumb a:hover {
            color: white;
        }

        /* Main Catalog Layout */
        .sports-layout {
            display: grid;
            grid-template-columns: 250px minmax(0, 1fr);
            gap: 30px;
            padding: 45px 0;
        }

        /* Filter Panel */
        .sports-filter-panel {
            background: white;
            border: 1px solid #e8e5df;
            padding: 25px;
            border-radius: 8px;
            height: fit-content;
        }

        .sports-filter-panel h3 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 25px;
            margin-bottom: 20px;
        }

        .sports-filter-panel h4 {
            font-size: 14px;
            font-weight: 700;
            margin: 22px 0 12px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .sports-filter-panel .form-check {
            margin-bottom: 9px;
        }

        .sports-filter-panel .form-check-label {
            font-size: 14px;
        }

        .sports-filter-panel .form-control {
            font-size: 14px;
        }

        .sports-filter-panel .form-check-input:checked {
            background-color: #101820;
            border-color: #101820;
        }

        .sports-filter-panel .btn-apply {
            background: var(--navy, #101820);
            color: white;
            border: none;
            width: 100%;
            padding: 11px;
            margin-top: 18px;
            border-radius: 4px;
        }

        .sports-filter-panel .btn-apply:hover {
            background: #1c2935;
            color: white;
        }

        .sports-filter-panel .btn-reset {
            width: 100%;
            margin-top: 10px;
            border: 1px solid #d6ad65;
            color: #101820;
            background: white;
            padding: 10px;
            border-radius: 4px;
        }

        .sports-filter-panel .btn-reset:hover {
            background: #f0d8a8;
        }

        /* Product Toolbar */
        .sports-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-bottom: 25px;
            flex-wrap: wrap;
        }

        .sports-toolbar h2 {
            font-family: 'Cormorant Garamond', serif;
            color: #101820;
        }

        .sports-toolbar select {
            max-width: 220px;
        }

        /* Product Grid */
        .sports-product-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 22px;
        }

        .sports-product-card {
            background: white;
            border: 1px solid #e8e5df;
            border-radius: 8px;
            overflow: hidden;
            transition: transform .2s ease, box-shadow .2s ease;
        }

        .sports-product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 25px rgba(16, 24, 32, .09);
        }

        .sports-product-image {
            height: 260px;
            background: #f7f5f0;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .sports-product-image img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .sports-product-info {
            padding: 20px;
        }

        .sports-product-brand {
            color: #a17b3f;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            font-size: 11px;
            font-weight: 700;
            margin-bottom: 7px;
        }

        .sports-product-info h3 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 23px;
            margin-bottom: 8px;
        }

        .sports-product-info p {
            color: #737b84;
            font-size: 13px;
            min-height: 40px;
        }

        .sports-product-price {
            font-weight: 700;
            font-size: 17px;
            color: #101820;
            margin-top: 12px;
        }

        .sports-product-tag {
            display: inline-block;
            background: #f0d8a8;
            color: #101820;
            padding: 4px 9px;
            font-size: 10px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 10px;
        }

        /* Empty Results */
        .sports-empty {
            background: white;
            border: 1px solid #e8e5df;
            padding: 45px 20px;
            text-align: center;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        .sports-empty h3 {
            font-family: 'Cormorant Garamond', serif;
        }

        /* Responsive Layout */
        @media (max-width: 991px) {
            .sports-layout {
                grid-template-columns: 1fr;
            }

            .sports-product-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 575px) {
            .sports-intro {
                min-height: 260px;
                padding: 45px 15px;
            }

            .sports-intro h1 {
                font-size: 2.5rem;
            }

            .sports-product-grid {
                grid-template-columns: 1fr;
            }

            .sports-product-image {
                height: 280px;
            }

            .sports-toolbar {
                align-items: flex-start;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <wv:Header ID="SiteHeader" runat="server" />

        <main class="sports-page">

            <!-- Centered Page Hero -->
            <section class="sports-intro">
                <div class="sports-intro-content">

                    <div class="sports-breadcrumb">
                        <a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a>
                        <span>/</span>
                        <span>Sports Watches</span>
                    </div>

                    <h1>Sports Watches</h1>

                    <p>
                        Explore durable, performance-focused watches
                        designed for adventure, training and everyday activity.
                    </p>

                </div>
            </section>

            <!-- Catalog -->
            <section class="container sports-layout">

                <!-- Filters -->
                <aside class="sports-filter-panel">

                    <h3>Filter Watches</h3>

                    <h4>Price Range</h4>

                    <div class="row g-2">
                        <div class="col-6">
                            <asp:TextBox ID="txtMinPrice"
                                runat="server"
                                CssClass="form-control"
                                placeholder="Min price"
                                TextMode="Number" />
                        </div>

                        <div class="col-6">
                            <asp:TextBox ID="txtMaxPrice"
                                runat="server"
                                CssClass="form-control"
                                placeholder="Max price"
                                TextMode="Number" />
                        </div>
                    </div>

                    <h4>Brand</h4>

                    <div class="form-check">
                        <asp:CheckBox ID="chkCasio"
                            runat="server"
                            CssClass="form-check-input" />
                        <label class="form-check-label" for="<%= chkCasio.ClientID %>">
                            Casio
                        </label>
                    </div>

                    <div class="form-check">
                        <asp:CheckBox ID="chkSeiko"
                            runat="server"
                            CssClass="form-check-input" />
                        <label class="form-check-label" for="<%= chkSeiko.ClientID %>">
                            Seiko
                        </label>
                    </div>

                    <div class="form-check">
                        <asp:CheckBox ID="chkCitizen"
                            runat="server"
                            CssClass="form-check-input" />
                        <label class="form-check-label" for="<%= chkCitizen.ClientID %>">
                            Citizen
                        </label>
                    </div>

                    <div class="form-check">
                        <asp:CheckBox ID="chkFossil"
                            runat="server"
                            CssClass="form-check-input" />
                        <label class="form-check-label" for="<%= chkFossil.ClientID %>">
                            Fossil
                        </label>
                    </div>

                    <div class="form-check">
                        <asp:CheckBox ID="chkTimex"
                            runat="server"
                            CssClass="form-check-input" />
                        <label class="form-check-label" for="<%= chkTimex.ClientID %>">
                            Timex
                        </label>
                    </div>

                    <div class="form-check">
                        <asp:CheckBox ID="chkRoamer"
                            runat="server"
                            CssClass="form-check-input" />
                        <label class="form-check-label" for="<%= chkRoamer.ClientID %>">
                            Roamer
                        </label>
                    </div>

                    <asp:Button ID="btnApplyFilters"
                        runat="server"
                        Text="Apply Filters"
                        CssClass="btn btn-apply"
                        OnClick="btnApplyFilters_Click" />

                    <asp:Button ID="btnResetFilters"
                        runat="server"
                        Text="Reset Filters"
                        CssClass="btn btn-reset"
                        OnClick="btnResetFilters_Click" />

                </aside>

                <!-- Products -->
                <section>

                    <div class="sports-toolbar">

                        <div>
                            <h2 class="mb-1">Sports Collection</h2>

                            <asp:Literal ID="litResultCount"
                                runat="server" />
                        </div>

                        <div>
                            <label for="<%= ddlSort.ClientID %>" class="form-label">
                                Sort by
                            </label>

                            <asp:DropDownList ID="ddlSort"
                                runat="server"
                                CssClass="form-select"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">

                                <asp:ListItem Text="Featured" Value="featured" />
                                <asp:ListItem Text="Price: Low to High" Value="price-low" />
                                <asp:ListItem Text="Price: High to Low" Value="price-high" />
                                <asp:ListItem Text="Name: A to Z" Value="name" />

                            </asp:DropDownList>
                        </div>

                    </div>

                    <asp:Panel ID="pnlNoProducts"
                        runat="server"
                        Visible="false"
                        CssClass="sports-empty">

                        <h3>No watches found</h3>

                        <p>
                            Try changing your filters to see more watches.
                        </p>

                    </asp:Panel>

                    <div class="sports-product-grid">

                        <asp:Repeater ID="rptSports" runat="server">

                            <ItemTemplate>

                                <article class="sports-product-card">

                                    <div class="sports-product-image">

                                        <img src='<%# ResolveUrl(Convert.ToString(Eval("ImageUrl"))) %>'
                                             alt='<%# Eval("Name") %>'
                                             loading="lazy" />

                                    </div>

                                    <div class="sports-product-info">

                                        <span class="sports-product-tag">
                                            Sports Collection
                                        </span>

                                        <div class="sports-product-brand">
                                            <%# Eval("Brand") %>
                                        </div>

                                        <h3>
                                            <%# Eval("Name") %>
                                        </h3>

                                        <p>
                                            <%# Eval("Description") %>
                                        </p>

                                        <div class="sports-product-price">
                                            NPR <%# String.Format("{0:N0}", Eval("Price")) %>
                                        </div>

                                    </div>

                                </article>

                            </ItemTemplate>

                        </asp:Repeater>

                    </div>

                </section>

            </section>

        </main>

        <wv:Footer ID="SiteFooter" runat="server" />

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
