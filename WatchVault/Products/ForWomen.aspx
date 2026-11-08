
<%@ Page Title="Women's Watches | WatchVault"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="ForWomen.aspx.cs"
    Inherits="WatchVault.Products.ForWomen" %>

<%@ Register Src="~/Controls/Header.ascx"
    TagPrefix="wv" TagName="Header" %>

<%@ Register Src="~/Controls/Footer.ascx"
    TagPrefix="wv" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Women's Watches | WatchVault</title>

    <!-- Same fonts used throughout WatchVault -->
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Inter:wght@400;500;600;700&display=swap"
        rel="stylesheet" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <!-- Shared stylesheet -->
    <link href="<%= ResolveUrl("~/Content/Site.css") %>"
        rel="stylesheet" />

    <style>

        /* =========================================
           WATCHVAULT WOMEN'S COLLECTION
           Shared Brand Design
           ========================================= */

        .women-page {
            --navy: #101820;
            --navy-light: #1c2935;
            --gold: #d6ad65;
            --gold-light: #f0d8a8;
            --cream: #f7f5f0;
            --white: #ffffff;
            --text: #252b33;
            --muted: #737b84;
            --border: #e8e5df;

            background: var(--cream);
            min-height: 100vh;
            color: var(--text);
            font-family: 'Inter', sans-serif;
        }

        .women-page *,
        .women-page *::before,
        .women-page *::after {
            box-sizing: border-box;
        }

        .women-page h1,
        .women-page h2,
        .women-page h3 {
            font-family: 'Cormorant Garamond', serif;
        }

        /* =========================================
           PAGE HERO
           Centre aligned breadcrumb and heading
           ========================================= */

        .women-intro {
            background: var(--navy);
            color: var(--white);
            min-height: 280px;
            padding: 55px 20px;

            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .women-intro-content {
            width: 100%;
            max-width: 850px;
            margin: 0 auto;

            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .women-breadcrumb {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-wrap: wrap;
            gap: 9px;

            font-family: 'Inter', sans-serif;
            font-size: 12px;
            letter-spacing: 1px;
            color: var(--gold-light);
            margin-bottom: 18px;
        }

        .women-breadcrumb a {
            color: var(--gold-light);
            text-decoration: none;
            transition: color .2s ease;
        }

        .women-breadcrumb a:hover {
            color: var(--gold);
        }

        .women-breadcrumb .breadcrumb-separator {
            color: var(--gold);
        }

        .women-breadcrumb .current-page {
            color: #d2d6da;
        }

        .women-intro h1 {
            font-family: 'Cormorant Garamond', serif;
            font-size: clamp(40px, 5vw, 60px);
            font-weight: 500;
            line-height: 1.1;
            margin: 0 0 14px;
            color: var(--white);
        }

        .women-intro p {
            color: #d2d6da;
            max-width: 650px;
            font-family: 'Inter', sans-serif;
            font-size: 14px;
            line-height: 1.8;
            margin: 0 auto;
        }

        /* =========================================
           MAIN CATALOG LAYOUT
           ========================================= */

        .women-layout {
            display: grid;
            grid-template-columns: 250px minmax(0, 1fr);
            gap: 30px;
            align-items: start;

            max-width: 1500px;
            margin: 0 auto;
            padding: 40px 28px 70px;
        }

        /* =========================================
           FILTER SIDEBAR
           ========================================= */

        .women-filter-panel {
            background: var(--white);
            border: 1px solid var(--border);
            padding: 24px;
            border-radius: 0;
            height: fit-content;
            width: 100%;
        }

        .women-filter-panel .filter-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 27px;
            font-weight: 600;
            color: var(--navy);
            margin: 0 0 20px;
        }

        .women-filter-section {
            border-top: 1px solid var(--border);
            padding: 18px 0;
        }

        .women-filter-section h4 {
            font-family: 'Inter', sans-serif;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1.2px;
            text-transform: uppercase;
            color: var(--navy);
            margin: 0 0 13px;
        }

        /* Search, dropdowns and inputs */

        .women-filter-panel .catalog-input {
            width: 100%;
            min-width: 0;
            border: 1px solid var(--border);
            border-radius: 0;
            padding: 10px;
            font-family: 'Inter', sans-serif;
            font-size: 12px;
            color: var(--text);
            background: var(--white);
            box-shadow: none;
        }

        .women-filter-panel .catalog-input:focus {
            border-color: var(--gold);
            box-shadow: 0 0 0 2px rgba(214, 173, 101, .15);
        }

        /* Price */

        .women-price-inputs {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 8px;
        }

        /* Brand */

        .women-brand-option {
            display: block;
            margin-bottom: 10px;
            font-size: 13px;
            color: var(--text);
            cursor: pointer;
        }

        .women-brand-option input {
            margin-right: 8px;
            accent-color: var(--gold);
        }

        /* Filter buttons */

        .women-filter-buttons {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 10px;
        }

        .women-filter-panel .btn-apply {
            background: var(--navy);
            color: var(--white);
            border: 1px solid var(--navy);
            width: 100%;
            padding: 11px;
            border-radius: 0;

            font-family: 'Inter', sans-serif;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: .2s ease;
        }

        .women-filter-panel .btn-apply:hover {
            background: var(--gold);
            color: var(--navy);
            border-color: var(--gold);
        }

        .women-filter-panel .btn-reset {
            width: 100%;
            border: 1px solid var(--gold);
            color: var(--navy);
            background: var(--white);
            padding: 10px;
            border-radius: 0;

            font-family: 'Inter', sans-serif;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: .2s ease;
        }

        .women-filter-panel .btn-reset:hover {
            background: var(--gold-light);
            color: var(--navy);
        }

        /* =========================================
           PRODUCT TOOLBAR
           ========================================= */

        .women-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-bottom: 22px;
            flex-wrap: wrap;
        }

        .women-toolbar h2 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 29px;
            font-weight: 600;
            color: var(--navy);
            margin: 0 0 5px;
        }

        .women-result-count {
            color: var(--muted);
            font-size: 13px;
        }

        .women-sort-control {
            display: flex;
            align-items: center;
            gap: 10px;
            font-family: 'Inter', sans-serif;
            font-size: 12px;
            color: var(--muted);
        }

        .women-sort-control select {
            border: 1px solid var(--border);
            background: var(--white);
            padding: 10px 12px;
            font-family: 'Inter', sans-serif;
            font-size: 12px;
            color: var(--text);
            border-radius: 0;
            outline: none;
        }

        .women-sort-control select:focus {
            border-color: var(--gold);
        }

        /* =========================================
           PRODUCT GRID
           ========================================= */

        .women-product-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 22px;
        }

        .women-product-card {
            background: var(--white);
            border: 1px solid var(--border);
            border-radius: 0;
            overflow: hidden;
            min-width: 0;
            transition: transform .25s ease, box-shadow .25s ease;
        }

        .women-product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 25px rgba(16, 24, 32, .09);
        }

        /* Product image */

        .women-product-image {
            position: relative;
            height: 260px;
            background: #f1f0ec;

            display: flex;
            align-items: center;
            justify-content: center;

            padding: 15px;
            overflow: hidden;
        }

        .women-product-image img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            transition: transform .3s ease;
        }

        .women-product-card:hover .women-product-image img {
            transform: scale(1.04);
        }

        /* Product information */

        .women-product-info {
            padding: 18px 17px 20px;
        }

        .women-product-tag {
            display: inline-block;
            background: var(--gold-light);
            color: var(--navy);
            padding: 5px 9px;
            font-size: 9px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 11px;
        }

        .women-product-brand {
            color: var(--gold);
            text-transform: uppercase;
            letter-spacing: 1.5px;
            font-size: 10px;
            font-weight: 700;
            margin-bottom: 7px;
        }

        .women-product-info h3 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 23px;
            font-weight: 600;
            line-height: 1.2;
            color: var(--navy);
            margin-bottom: 8px;
        }

        .women-product-info p {
            color: var(--muted);
            font-family: 'Inter', sans-serif;
            font-size: 11px;
            line-height: 1.6;
            min-height: 36px;
            margin-bottom: 12px;
        }

        .women-product-price {
            font-weight: 700;
            font-size: 14px;
            color: var(--navy);
            margin-top: 12px;
        }

        /* =========================================
           EMPTY STATE
           ========================================= */

        .women-empty {
            background: var(--white);
            border: 1px solid var(--border);
            padding: 45px 20px;
            text-align: center;
            border-radius: 0;
            margin-bottom: 20px;
        }

        .women-empty h3 {
            font-family: 'Cormorant Garamond', serif;
            font-size: 30px;
            color: var(--navy);
            margin-bottom: 10px;
        }

        .women-empty p {
            color: var(--muted);
            font-size: 13px;
            margin: 0;
        }

        /* =========================================
           RESPONSIVE DESIGN
           ========================================= */

        @media (max-width: 1200px) {
            .women-product-grid {
                grid-template-columns: repeat(3, minmax(0, 1fr));
                gap: 16px;
            }
        }

        @media (max-width: 991px) {
            .women-layout {
                grid-template-columns: 220px minmax(0, 1fr);
                gap: 20px;
                padding: 30px 20px 55px;
            }

            .women-product-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }
        }

        @media (max-width: 700px) {
            .women-layout {
                grid-template-columns: 1fr;
            }

            .women-filter-panel {
                padding: 20px;
            }

            .women-intro {
                min-height: 250px;
                padding: 40px 16px;
            }

            .women-product-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 13px;
            }

            .women-product-image {
                height: 220px;
            }

            .women-product-info {
                padding: 14px 11px 16px;
            }

            .women-product-info h3 {
                font-size: 20px;
            }
        }

        @media (max-width: 400px) {
            .women-product-grid {
                grid-template-columns: 1fr;
            }

            .women-product-image {
                height: 270px;
            }

            .women-toolbar {
                align-items: flex-start;
                flex-direction: column;
            }
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <!-- Shared Header -->
        <wv:Header ID="SiteHeader" runat="server" />

        <main class="women-page">

            <!-- =====================================
                 CENTRED PAGE HERO
                 ===================================== -->

            <section class="women-intro">

                <div class="women-intro-content">

                    <!-- Breadcrumb -->
                    <nav class="women-breadcrumb"
                        aria-label="breadcrumb">

                        <a href="<%= ResolveUrl("~/Default.aspx") %>">
                            Home
                        </a>

                        <span class="breadcrumb-separator">/</span>

                        <span class="current-page">
                            Women's Watches
                        </span>

                    </nav>

                    <!-- Heading -->
                    <h1>Women's Watches</h1>

                    <!-- Description -->
                    <p>
                        Discover elegant, modern and timeless watches
                        selected for every style and occasion.
                    </p>

                </div>

            </section>

            <!-- =====================================
                 WOMEN'S PRODUCT CATALOG
                 ===================================== -->

            <section class="women-layout">

                <!-- =================================
                     FILTER SIDEBAR
                     ================================= -->

                <aside class="women-filter-panel">

                    <h2 class="filter-title">
                        Filter Watches
                    </h2>

                    <!-- Search -->

                    <div class="women-filter-section">

                        <h4>Search</h4>

                        <asp:TextBox
                            ID="txtSearch"
                            runat="server"
                            CssClass="form-control catalog-input"
                            placeholder="Search by name or brand..." />

                    </div>

                    <!-- Brand -->

                    <div class="women-filter-section">

                        <h4>Brand</h4>

                        <label class="women-brand-option">
                            <asp:CheckBox ID="chkCasio" runat="server" />
                            Casio
                        </label>

                        <label class="women-brand-option">
                            <asp:CheckBox ID="chkSeiko" runat="server" />
                            Seiko
                        </label>

                        <label class="women-brand-option">
                            <asp:CheckBox ID="chkCitizen" runat="server" />
                            Citizen
                        </label>

                        <label class="women-brand-option">
                            <asp:CheckBox ID="chkFossil" runat="server" />
                            Fossil
                        </label>

                        <label class="women-brand-option">
                            <asp:CheckBox ID="chkTimex" runat="server" />
                            Timex
                        </label>

                        <label class="women-brand-option">
                            <asp:CheckBox ID="chkRoamer" runat="server" />
                            Roamer
                        </label>

                    </div>

                    <!-- Category -->

                    <div class="women-filter-section">

                        <h4>Category</h4>

                        <asp:DropDownList
                            ID="ddlCategory"
                            runat="server"
                            CssClass="form-select catalog-input">

                            <asp:ListItem
                                Text="All Categories"
                                Value="all" />

                            <asp:ListItem
                                Text="Analog / Quartz"
                                Value="quartz" />

                            <asp:ListItem
                                Text="Automatic"
                                Value="automatic" />

                            <asp:ListItem
                                Text="Digital"
                                Value="digital" />

                            <asp:ListItem
                                Text="Chronograph"
                                Value="chronograph" />

                            <asp:ListItem
                                Text="Diver"
                                Value="diver" />

                            <asp:ListItem
                                Text="Field"
                                Value="field" />

                            <asp:ListItem
                                Text="Sports"
                                Value="sports" />

                        </asp:DropDownList>

                    </div>

                    <!-- Price -->

                    <div class="women-filter-section">

                        <h4>Price Range (NPR)</h4>

                        <div class="women-price-inputs">

                            <asp:TextBox
                                ID="txtMinPrice"
                                runat="server"
                                CssClass="form-control catalog-input"
                                placeholder="Min"
                                TextMode="Number" />

                            <asp:TextBox
                                ID="txtMaxPrice"
                                runat="server"
                                CssClass="form-control catalog-input"
                                placeholder="Max"
                                TextMode="Number" />

                        </div>

                    </div>

                    <!-- Availability -->

                    <div class="women-filter-section">

                        <h4>Availability</h4>

                        <asp:DropDownList
                            ID="ddlAvailability"
                            runat="server"
                            CssClass="form-select catalog-input">

                            <asp:ListItem
                                Text="All Watches"
                                Value="all" />

                            <asp:ListItem
                                Text="In Stock"
                                Value="in-stock" />

                            <asp:ListItem
                                Text="Out of Stock"
                                Value="out-of-stock" />

                        </asp:DropDownList>

                    </div>

                    <!-- Buttons -->

                    <div class="women-filter-buttons">

                        <asp:Button
                            ID="btnApplyFilters"
                            runat="server"
                            Text="Apply Filters"
                            CssClass="btn btn-apply"
                            OnClick="btnApplyFilters_Click" />

                        <asp:Button
                            ID="btnResetFilters"
                            runat="server"
                            Text="Clear Filters"
                            CssClass="btn btn-reset"
                            OnClick="btnResetFilters_Click"
                            CausesValidation="false" />

                    </div>

                </aside>

                <!-- =================================
                     PRODUCT SECTION
                     ================================= -->

                <section class="women-products-area">

                    <!-- Toolbar -->

                    <div class="women-toolbar">

                        <div>

                            <h2>Women's Collection</h2>

                            <div class="women-result-count">

                                <asp:Literal
                                    ID="litResultCount"
                                    runat="server" />

                            </div>

                        </div>

                        <!-- Sorting -->

                        <div class="women-sort-control">

                            <label for="ddlSort">
                                Sort by:
                            </label>

                            <asp:DropDownList
                                ID="ddlSort"
                                runat="server"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">

                                <asp:ListItem
                                    Text="Featured"
                                    Value="featured" />

                                <asp:ListItem
                                    Text="Price: Low to High"
                                    Value="price-low" />

                                <asp:ListItem
                                    Text="Price: High to Low"
                                    Value="price-high" />

                                <asp:ListItem
                                    Text="Name: A to Z"
                                    Value="name" />

                            </asp:DropDownList>

                        </div>

                    </div>

                    <!-- Empty State -->

                    <asp:Panel
                        ID="pnlNoProducts"
                        runat="server"
                        Visible="false"
                        CssClass="women-empty">

                        <h3>No watches found</h3>

                        <p>
                            Try changing your search, category,
                            price range or selected brands.
                        </p>

                    </asp:Panel>

                    <!-- Product Grid -->

                    <div class="women-product-grid">

                        <asp:Repeater
                            ID="rptWomen"
                            runat="server">

                            <ItemTemplate>

                                <article class="women-product-card">

                                    <!-- Product Image -->

                                    <div class="women-product-image">

                                        <img
                                            src='<%# ResolveUrl(Convert.ToString(Eval("ImageUrl"))) %>'
                                            alt='<%# Eval("Name") %>'
                                            loading="lazy" />

                                    </div>

                                    <!-- Product Details -->

                                    <div class="women-product-info">

                                        <span class="women-product-tag">
                                            Women's Collection
                                        </span>

                                        <div class="women-product-brand">
                                            <%# Eval("Brand") %>
                                        </div>

                                        <h3>
                                            <%# Eval("Name") %>
                                        </h3>

                                        <p>
                                            <%# Eval("Description") %>
                                        </p>

                                        <div class="women-product-price">
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

        <!-- Shared Footer -->
        <wv:Footer ID="SiteFooter" runat="server" />

    </form>

    <!-- Bootstrap JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
