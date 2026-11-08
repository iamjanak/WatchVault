<%@ Page Title="All Watches | WatchVault"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="Watches.aspx.cs"
    Inherits="WatchVault.Products.Watches" %>

<%@ Register Src="~/Controls/Header.ascx"
    TagPrefix="wv" TagName="Header" %>

<%@ Register Src="~/Controls/Footer.ascx"
    TagPrefix="wv" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>All Watches | WatchVault</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com"
          crossorigin="anonymous" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Cormorant+Garamond:wght@400;500;600;700&display=swap"
          rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <link href="<%= ResolveUrl("~/Content/Site.css") %>"
          rel="stylesheet" />

    <style>
        :root {
            --navy: #101820;
            --navy-light: #1c2935;
            --gold: #d6ad65;
            --gold-light: #f0d8a8;
            --cream: #f7f5f0;
            --white: #ffffff;
            --text: #252b33;
            --muted: #737b84;
            --border: #e8e5df;
        }

        body {
            background: var(--cream);
            color: var(--text);
            font-family: 'Inter', sans-serif;
        }

        /* PAGE INTRO */

        .catalogue-intro {
            background: var(--navy);
            color: white;
            padding: 55px 0;
        }

        .catalogue-breadcrumb {
            color: var(--gold);
            font-size: 14px;
            margin-bottom: 15px;
        }

        .catalogue-breadcrumb a {
            color: var(--gold-light);
            text-decoration: none;
        }

        .catalogue-breadcrumb a:hover {
            text-decoration: underline;
        }

        .catalogue-intro h1 {
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: clamp(42px, 5vw, 65px);
            font-weight: 600;
            margin-bottom: 10px;
        }

        .catalogue-intro p {
            color: #d7dce1;
            max-width: 650px;
            line-height: 1.8;
            margin-bottom: 0;
        }

        /* MAIN LAYOUT */

        .catalogue-container {
            max-width: 1350px;
            margin: auto;
            padding: 45px 24px 80px;
        }

        .catalogue-layout {
            display: grid;
            grid-template-columns: 250px minmax(0, 1fr);
            gap: 30px;
            align-items: start;
        }

        /* LEFT FILTER SIDEBAR */

        .catalogue-sidebar {
            background: white;
            border: 1px solid var(--border);
            border-radius: 7px;
            padding: 25px;
            position: sticky;
            top: 20px;
        }

        .filter-heading {
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 31px;
            font-weight: 600;
            color: var(--navy);
            margin-bottom: 8px;
        }

        .filter-subtitle {
            color: var(--muted);
            font-size: 12px;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .filter-group {
            border-top: 1px solid var(--border);
            padding-top: 20px;
            margin-top: 20px;
        }

        .filter-label {
            display: block;
            color: var(--navy);
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1px;
            margin-bottom: 10px;
        }

        .filter-input {
            width: 100%;
            min-height: 46px;
            padding: 10px 12px;
            border: 1px solid var(--border);
            border-radius: 4px;
            background: white;
            color: var(--text);
            font-family: 'Inter', sans-serif;
            font-size: 13px;
        }

        .filter-input:focus {
            border-color: var(--gold);
            outline: none;
            box-shadow: 0 0 0 2px rgba(214, 173, 101, .12);
        }

        .price-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 8px;
        }

        .price-input {
            min-width: 0;
        }

        .filter-actions {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 25px;
        }

        .apply-button,
        .clear-button {
            width: 100%;
            min-height: 47px;
            padding: 12px;
            border-radius: 4px;
            font-family: 'Inter', sans-serif;
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 1px;
            cursor: pointer;
            transition: .2s ease;
        }

        .apply-button {
            background: var(--navy);
            border: 1px solid var(--navy);
            color: white;
        }

        .apply-button:hover {
            background: var(--navy-light);
        }

        .clear-button {
            background: white;
            border: 1px solid var(--gold);
            color: var(--navy);
        }

        .clear-button:hover {
            background: var(--cream);
        }

        .filter-message {
            display: block;
            margin-top: 15px;
            color: #b42318;
            font-size: 12px;
            line-height: 1.5;
        }

        /* PRODUCT SECTION */

        .catalogue-results {
            min-width: 0;
        }

        .catalogue-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            margin-bottom: 25px;
        }

        .catalogue-section-title {
            font-family: 'Cormorant Garamond', Georgia, serif;
            color: var(--navy);
            font-size: 34px;
            font-weight: 600;
            margin-bottom: 5px;
        }

        .result-count {
            color: var(--muted);
            font-size: 13px;
        }

        .result-count strong {
            color: var(--navy);
        }

        /* PRODUCT GRID */

        .watch-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 22px;
        }

        .watch-card {
            min-width: 0;
            overflow: hidden;
            background: white;
            border: 1px solid var(--border);
            border-radius: 7px;
            transition: transform .2s ease, box-shadow .2s ease;
        }

        .watch-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 25px rgba(16, 24, 32, .09);
        }

        .watch-image-link {
            display: flex;
            align-items: center;
            justify-content: center;
            height: 250px;
            padding: 20px;
            background: #fbfaf7;
            overflow: hidden;
            text-decoration: none;
        }

        .watch-image {
            width: 100%;
            height: 100%;
            object-fit: contain;
            object-position: center;
            transition: transform .25s ease;
        }

        .watch-card:hover .watch-image {
            transform: scale(1.04);
        }

        .no-image {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
            height: 100%;
            color: var(--muted);
            font-size: 12px;
            text-align: center;
        }

        .watch-information {
            padding: 18px;
        }

        .watch-brand {
            color: #9a7741;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1.8px;
            text-transform: uppercase;
            margin-bottom: 7px;
        }

        .watch-name {
            min-height: 48px;
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 24px;
            font-weight: 600;
            line-height: 1.2;
            margin-bottom: 8px;
        }

        .watch-name a {
            color: var(--navy);
            text-decoration: none;
        }

        .watch-name a:hover {
            color: #9a7741;
        }

        .watch-category {
            color: var(--muted);
            font-size: 11px;
            margin-bottom: 12px;
        }

        .watch-price {
            color: var(--navy);
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .watch-stock {
            display: inline-block;
            font-size: 10px;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .in-stock {
            color: #27804d;
        }

        .out-of-stock {
            color: #b42318;
        }

        .view-details-button {
            display: block;
            width: 100%;
            padding: 12px 10px;
            background: var(--navy);
            border: 1px solid var(--navy);
            border-radius: 4px;
            color: white;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1px;
            text-align: center;
            text-decoration: none;
            transition: .2s ease;
        }

        .view-details-button:hover {
            background: var(--navy-light);
            color: white;
        }

        /* EMPTY RESULTS */

        .no-products {
            background: white;
            border: 1px solid var(--border);
            border-radius: 7px;
            padding: 50px 20px;
            text-align: center;
        }

        .no-products h2 {
            color: var(--navy);
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 35px;
        }

        .no-products p {
            color: var(--muted);
            font-size: 13px;
        }

        /* TABLET */

        @media (max-width: 1100px) {
            .catalogue-layout {
                grid-template-columns: 230px minmax(0, 1fr);
                gap: 20px;
            }

            .catalogue-sidebar {
                padding: 20px;
            }

            .watch-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .watch-image-link {
                height: 250px;
            }
        }

        /* MOBILE */

        @media (max-width: 767px) {
            .catalogue-container {
                padding: 25px 15px 50px;
            }

            .catalogue-layout {
                grid-template-columns: 1fr;
            }

            .catalogue-sidebar {
                position: static;
            }

            .filter-heading {
                font-size: 29px;
            }

            .catalogue-toolbar {
                align-items: flex-start;
                flex-direction: column;
            }

            .watch-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 12px;
            }

            .watch-image-link {
                height: 190px;
                padding: 12px;
            }

            .watch-information {
                padding: 13px;
            }

            .watch-name {
                font-size: 21px;
                min-height: 42px;
            }

            .watch-price {
                font-size: 16px;
            }
        }

        @media (max-width: 450px) {
            .watch-grid {
                grid-template-columns: 1fr;
            }

            .watch-image-link {
                height: 280px;
            }

            .watch-information {
                padding: 18px;
            }

            .watch-name {
                font-size: 25px;
            }
        }
    </style>

</head>

<body>

<form id="form1" runat="server">

    <wv:Header ID="SiteHeader" runat="server" />

    <!-- PAGE INTRO -->

    <section class="catalogue-intro">
        <div class="container">

            <div class="catalogue-breadcrumb">
                <a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a>
                &nbsp; / &nbsp; All Watches
            </div>

            <h1>All Watches</h1>

            <p>
                Explore the WatchVault collection and discover
                the perfect timepiece for your style and lifestyle.
            </p>

        </div>
    </section>

    <!-- MAIN CATALOGUE -->

    <main class="catalogue-container">

        <div class="catalogue-layout">

            <!-- LEFT FILTER SIDEBAR -->

            <aside class="catalogue-sidebar">

                <h2 class="filter-heading">Filter Watches</h2>

                <p class="filter-subtitle">
                    Refine your search and find your perfect watch.
                </p>

                <!-- SEARCH -->

                <div class="filter-group">

                    <label class="filter-label" for="txtSearch">
                        SEARCH
                    </label>

                    <asp:TextBox ID="txtSearch"
                        runat="server"
                        CssClass="filter-input"
                        placeholder="Watch name or brand..." />

                </div>

                <!-- BRAND -->

                <div class="filter-group">

                    <label class="filter-label" for="ddlBrand">
                        BRAND
                    </label>

                    <asp:DropDownList ID="ddlBrand"
                        runat="server"
                        CssClass="filter-input" />

                </div>

                <!-- CATEGORY -->

                <div class="filter-group">

                    <label class="filter-label" for="ddlCategory">
                        CATEGORY
                    </label>

                    <asp:DropDownList ID="ddlCategory"
                        runat="server"
                        CssClass="filter-input" />

                </div>

                <!-- PRICE -->

                <div class="filter-group">

                    <label class="filter-label">
                        PRICE RANGE (NPR)
                    </label>

                    <div class="price-row">

                        <asp:TextBox ID="txtMinPrice"
                            runat="server"
                            CssClass="filter-input price-input"
                            TextMode="Number"
                            placeholder="Min price" />

                        <asp:TextBox ID="txtMaxPrice"
                            runat="server"
                            CssClass="filter-input price-input"
                            TextMode="Number"
                            placeholder="Max price" />

                    </div>

                </div>

                <!-- AVAILABILITY -->

                <div class="filter-group">

                    <label class="filter-label" for="ddlAvailability">
                        AVAILABILITY
                    </label>

                    <asp:DropDownList ID="ddlAvailability"
                        runat="server"
                        CssClass="filter-input">

                        <asp:ListItem Text="All Watches" Value="" />
                        <asp:ListItem Text="In Stock" Value="InStock" />
                        <asp:ListItem Text="Out of Stock" Value="OutOfStock" />

                    </asp:DropDownList>

                </div>

                <!-- SORT -->

                <div class="filter-group">

                    <label class="filter-label" for="ddlSort">
                        SORT BY
                    </label>

                    <asp:DropDownList ID="ddlSort"
                        runat="server"
                        CssClass="filter-input">

                        <asp:ListItem Text="Featured" Value="featured" />
                        <asp:ListItem Text="Price: Low to High" Value="price-low-high" />
                        <asp:ListItem Text="Price: High to Low" Value="price-high-low" />
                        <asp:ListItem Text="Name: A to Z" Value="name-az" />
                        <asp:ListItem Text="In Stock First" Value="in-stock-first" />

                    </asp:DropDownList>

                </div>

                <!-- BUTTONS -->

                <div class="filter-actions">

                    <asp:Button ID="btnApplyFilters"
                        runat="server"
                        Text="APPLY FILTERS"
                        CssClass="apply-button"
                        OnClick="btnApplyFilters_Click" />

                    <asp:Button ID="btnClearFilters"
                        runat="server"
                        Text="CLEAR FILTERS"
                        CssClass="clear-button"
                        CausesValidation="false"
                        OnClick="btnClearFilters_Click" />

                </div>

                <!-- FILTER VALIDATION MESSAGE -->

                <asp:Label ID="lblFilterMessage"
                    runat="server"
                    CssClass="filter-message" />

            </aside>

            <!-- RIGHT PRODUCT AREA -->

            <section class="catalogue-results">

                <div class="catalogue-toolbar">

                    <div>
                        <h2 class="catalogue-section-title">
                            Our Collection
                        </h2>

                        <asp:Literal ID="litResultCount"
                            runat="server" />
                    </div>

                </div>

                <!-- PRODUCT GRID -->

                <asp:Panel ID="pnlProducts"
                    runat="server">

                    <div class="watch-grid">

                        <asp:Repeater ID="rptWatches"
                            runat="server">

                            <ItemTemplate>

                                <article class="watch-card">

                                    <!-- PRODUCT IMAGE -->

                                    <a class="watch-image-link"
                                       href='<%# ResolveUrl("~/Products/ProductDetails.aspx?id=" + Eval("ProductId")) %>'>

                                        <asp:Image ID="imgWatch"
                                            runat="server"
                                            CssClass="watch-image"
                                            ImageUrl='<%# Eval("ResolvedImageUrl") %>'
                                            AlternateText='<%# Eval("Name") %>'
                                            Visible='<%# !String.IsNullOrWhiteSpace(Convert.ToString(Eval("ResolvedImageUrl"))) %>' />

                                        <asp:Panel ID="pnlNoImage"
                                            runat="server"
                                            CssClass="no-image"
                                            Visible='<%# String.IsNullOrWhiteSpace(Convert.ToString(Eval("ResolvedImageUrl"))) %>'>

                                            Image currently unavailable

                                        </asp:Panel>

                                    </a>

                                    <!-- PRODUCT INFORMATION -->

                                    <div class="watch-information">

                                        <div class="watch-brand">
                                            <%#: Eval("Brand") %>
                                        </div>

                                        <h3 class="watch-name">

                                            <a href='<%# ResolveUrl("~/Products/ProductDetails.aspx?id=" + Eval("ProductId")) %>'>

                                                <%#: Eval("Name") %>

                                            </a>

                                        </h3>

                                        <div class="watch-category">
                                            Category: <%#: Eval("Category") %>
                                        </div>

                                        <div class="watch-price">
                                            NPR <%#: Eval("Price", "{0:N0}") %>
                                        </div>

                                        <asp:Label ID="lblStock"
                                            runat="server"
                                            Text='<%# Convert.ToInt32(Eval("StockQuantity")) > 0 ? "In Stock" : "Out of Stock" %>'
                                            CssClass='<%# Convert.ToInt32(Eval("StockQuantity")) > 0 ? "watch-stock in-stock" : "watch-stock out-of-stock" %>' />

                                        <a class="view-details-button"
                                           href='<%# ResolveUrl("~/Products/ProductDetails.aspx?id=" + Eval("ProductId")) %>'>

                                            VIEW DETAILS

                                        </a>

                                    </div>

                                </article>

                            </ItemTemplate>

                        </asp:Repeater>

                    </div>

                </asp:Panel>

                <!-- NO PRODUCTS MESSAGE -->

                <asp:Panel ID="pnlNoProducts"
                    runat="server"
                    CssClass="no-products"
                    Visible="false">

                    <h2>No Watches Found</h2>

                    <p>
                        No watches match your current search or filters.
                        Try changing your filters to see more products.
                    </p>

                </asp:Panel>

            </section>

        </div>

    </main>

    <wv:Footer ID="SiteFooter" runat="server" />

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
``