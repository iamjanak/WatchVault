
<%@ Page Title="Men's Watches | WatchVault"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="ForMen.aspx.cs"
    Inherits="WatchVault.Products.ForMen" %>

<%@ Register Src="~/Controls/Header.ascx"
    TagPrefix="wv" TagName="Header" %>

<%@ Register Src="~/Controls/Footer.ascx"
    TagPrefix="wv" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Men's Watches | WatchVault</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@400;500;600;700&family=Inter:wght@400;500;600;700&display=swap"
        rel="stylesheet" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <!-- Shared WatchVault CSS -->
    <link href="<%= ResolveUrl("~/Content/Site.css") %>"
        rel="stylesheet" />

    <style>

        /* =========================================
           WATCHVAULT MEN'S COLLECTION
           ========================================= */

        .men-page {
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
            color: var(--text);
            font-family: 'Inter', sans-serif;
            min-height: 100vh;
        }

        .men-page *,
        .men-page *::before,
        .men-page *::after {
            box-sizing: border-box;
        }

        .men-page h1,
        .men-page h2,
        .men-page h3,
        .men-page .product-name {
            font-family: 'Cormorant Garamond', serif;
        }

        /* =========================================
           PAGE INTRODUCTION
           ========================================= */

        .men-page .page-intro {
            background: var(--navy);
            color: var(--white);
            padding: 52px 20px;
            text-align: center;
        }

        .men-page .breadcrumb {
            justify-content: center;
            margin-bottom: 15px;
            font-size: 12px;
            letter-spacing: 1px;
        }

        .men-page .breadcrumb a {
            color: var(--gold-light);
            text-decoration: none;
        }

        .men-page .breadcrumb-item.active {
            color: #c5cbd0;
        }

        .men-page .breadcrumb-item + .breadcrumb-item::before {
            color: var(--gold);
        }

        .men-page .page-intro h1 {
            font-size: clamp(38px, 5vw, 58px);
            font-weight: 500;
            margin: 0 0 12px;
        }

        .men-page .page-intro p {
            color: #d2d6da;
            font-size: 14px;
            margin: 0;
        }

        /* =========================================
           MAIN SHOP LAYOUT
           ========================================= */

        .men-page .shop-container {
            max-width: 1500px;
            margin: 0 auto;
            padding: 40px 28px 70px;
        }

        .men-page .shop-layout {
            display: grid;
            grid-template-columns: 250px minmax(0, 1fr);
            gap: 30px;
            align-items: start;
        }

        /* =========================================
           FILTER SIDEBAR
           ========================================= */

        .men-page .filter-panel {
            background: var(--white);
            border: 1px solid var(--border);
            padding: 24px;
            width: 100%;
            height: fit-content;
        }

        .men-page .filter-title {
            font-family: 'Cormorant Garamond', serif;
            font-size: 27px;
            font-weight: 600;
            margin-bottom: 20px;
            color: var(--navy);
        }

        .men-page .filter-section {
            border-top: 1px solid var(--border);
            padding: 18px 0;
        }

        .men-page .filter-section h3 {
            font-family: 'Inter', sans-serif;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1.2px;
            text-transform: uppercase;
            margin-bottom: 13px;
            color: var(--navy);
        }

        /* Search, dropdowns and price inputs */

        .men-page .catalog-input {
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

        .men-page .catalog-input:focus {
            border-color: var(--gold);
            box-shadow: 0 0 0 2px rgba(214, 173, 101, 0.15);
        }

        .men-page .price-inputs {
            display: grid;
            grid-template-columns: repeat(2, minmax(0, 1fr));
            gap: 8px;
        }

        /* Brand checkboxes */

        .men-page .brand-option {
            display: block;
            margin-bottom: 10px;
            font-size: 13px;
            color: var(--text);
            cursor: pointer;
        }

        .men-page .brand-option input {
            margin-right: 8px;
            accent-color: var(--gold);
        }

        /* Filter buttons */

        .men-page .filter-buttons {
            display: flex;
            flex-direction: column;
            gap: 10px;
            margin-top: 10px;
        }

        .men-page .btn-filter {
            background: var(--navy);
            border: 1px solid var(--navy);
            color: var(--white);
            padding: 11px 15px;
            font-size: 12px;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
            border-radius: 0;
            transition: 0.2s ease;
        }

        .men-page .btn-filter:hover {
            background: var(--gold);
            border-color: var(--gold);
            color: var(--navy);
        }

        .men-page .btn-reset {
            background: var(--white);
            border: 1px solid var(--gold);
            color: var(--text);
            padding: 10px 15px;
            font-size: 12px;
            font-weight: 600;
            letter-spacing: 1px;
            text-transform: uppercase;
            border-radius: 0;
        }

        .men-page .btn-reset:hover {
            background: var(--gold-light);
            border-color: var(--gold);
            color: var(--navy);
        }

        /* =========================================
           PRODUCT TOOLBAR
           ========================================= */

        .men-page .shop-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            margin-bottom: 22px;
            flex-wrap: wrap;
        }

        .men-page .result-count {
            color: var(--muted);
            font-size: 13px;
        }

        .men-page .sort-control {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 12px;
            color: var(--muted);
        }

        .men-page .sort-control select {
            border: 1px solid var(--border);
            background: var(--white);
            padding: 10px 12px;
            font-family: 'Inter', sans-serif;
            font-size: 12px;
            color: var(--text);
            border-radius: 0;
        }

        .men-page .sort-control select:focus {
            outline: none;
            border-color: var(--gold);
        }

        /* =========================================
           PRODUCT GRID
           ========================================= */

        .men-page .product-grid {
            display: grid;
            grid-template-columns: repeat(4, minmax(0, 1fr));
            gap: 22px;
        }

        .men-page .product-card {
            background: var(--white);
            border: 1px solid var(--border);
            min-width: 0;
            transition: transform 0.25s ease, box-shadow 0.25s ease;
        }

        .men-page .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 10px 25px rgba(16, 24, 32, 0.08);
        }

        .men-page .product-image-wrap {
            position: relative;
            background: #f1f0ec;
            aspect-ratio: 1 / 1;
            overflow: hidden;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .men-page .product-image {
            width: 100%;
            height: 100%;
            object-fit: contain;
            padding: 12px;
            transition: transform 0.3s ease;
        }

        .men-page .product-card:hover .product-image {
            transform: scale(1.04);
        }

        .men-page .new-badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: var(--gold);
            color: var(--navy);
            padding: 5px 9px;
            font-size: 9px;
            font-weight: 700;
            letter-spacing: 1px;
            text-transform: uppercase;
            z-index: 2;
        }

        .men-page .image-placeholder {
            width: 100%;
            height: 100%;
            min-height: 180px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            padding: 15px;
            color: var(--muted);
            font-size: 12px;
            background: #f1f0ec;
        }

        .men-page .image-placeholder strong {
            display: block;
            font-family: 'Cormorant Garamond', serif;
            font-size: 22px;
            color: var(--navy);
            margin-bottom: 5px;
        }

        .men-page .product-info {
            padding: 17px 15px 20px;
        }

        .men-page .product-brand {
            color: var(--gold);
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin-bottom: 7px;
        }

        .men-page .product-name {
            color: var(--navy);
            font-size: 23px;
            font-weight: 600;
            line-height: 1.15;
            margin: 0 0 8px;
        }

        .men-page .product-description {
            font-size: 11px;
            line-height: 1.6;
            color: var(--muted);
            min-height: 36px;
            margin-bottom: 12px;
        }

        .men-page .product-price {
            font-size: 14px;
            font-weight: 700;
            color: var(--navy);
            margin: 0;
        }

        /* =========================================
           EMPTY STATE
           ========================================= */

        .men-page .empty-message {
            background: var(--white);
            border: 1px solid var(--border);
            padding: 45px 20px;
            text-align: center;
            color: var(--muted);
        }

        .men-page .empty-message h2 {
            color: var(--navy);
            font-size: 30px;
            margin-bottom: 10px;
        }

        /* =========================================
           RESPONSIVE DESIGN
           ========================================= */

        @media (max-width: 1200px) {
            .men-page .product-grid {
                grid-template-columns: repeat(3, minmax(0, 1fr));
            }
        }

        @media (max-width: 950px) {
            .men-page .shop-layout {
                grid-template-columns: 220px minmax(0, 1fr);
                gap: 20px;
            }

            .men-page .shop-container {
                padding: 30px 20px 55px;
            }

            .men-page .product-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 15px;
            }
        }

        @media (max-width: 600px) {
            .men-page .shop-layout {
                grid-template-columns: 1fr;
            }

            .men-page .filter-panel {
                padding: 18px;
            }

            .men-page .page-intro {
                padding: 38px 15px;
            }

            .men-page .shop-container {
                padding: 22px 14px 45px;
            }

            .men-page .product-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 12px;
            }

            .men-page .product-info {
                padding: 13px 10px 15px;
            }

            .men-page .product-name {
                font-size: 20px;
            }

            .men-page .product-description {
                font-size: 10px;
            }
        }

        @media (max-width: 360px) {
            .men-page .product-grid {
                grid-template-columns: 1fr;
            }
        }

    </style>
</head>

<body>

    <form id="form1" runat="server">

        <!-- Shared Header -->
        <wv:Header ID="SiteHeader" runat="server" />

        <main class="men-page">

            <!-- =====================================
                 PAGE HEADING
                 ===================================== -->

            <section class="page-intro">

                <nav aria-label="breadcrumb">

                    <ol class="breadcrumb">

                        <li class="breadcrumb-item">
                            <a href="<%= ResolveUrl("~/Default.aspx") %>">
                                Home
                            </a>
                        </li>

                        <li class="breadcrumb-item">
                            <a href="<%= ResolveUrl("~/Products/Watches.aspx") %>">
                                Watches
                            </a>
                        </li>

                        <li class="breadcrumb-item active"
                            aria-current="page">
                            Men's Watches
                        </li>

                    </ol>

                </nav>

                <h1>Men's Watches</h1>

                <p>
                    Discover timeless designs, precision movements and
                    watches for every occasion.
                </p>

            </section>

            <!-- =====================================
                 SHOP CONTENT
                 ===================================== -->

            <div class="shop-container">

                <div class="shop-layout">

                    <!-- =================================
                         FILTER SIDEBAR
                         ================================= -->

                    <aside class="filter-panel">

                        <h2 class="filter-title">
                            Filter Watches
                        </h2>

                        <!-- Search -->

                        <div class="filter-section">

                            <h3>Search</h3>

                            <asp:TextBox
                                ID="txtSearch"
                                runat="server"
                                CssClass="form-control catalog-input"
                                placeholder="Search by name or brand..." />

                        </div>

                        <!-- Brand -->

                        <div class="filter-section">

                            <h3>Brand</h3>

                            <label class="brand-option">
                                <asp:CheckBox ID="chkCasio" runat="server" />
                                Casio
                            </label>

                            <label class="brand-option">
                                <asp:CheckBox ID="chkSeiko" runat="server" />
                                Seiko
                            </label>

                            <label class="brand-option">
                                <asp:CheckBox ID="chkCitizen" runat="server" />
                                Citizen
                            </label>

                            <label class="brand-option">
                                <asp:CheckBox ID="chkFossil" runat="server" />
                                Fossil
                            </label>

                            <label class="brand-option">
                                <asp:CheckBox ID="chkTimex" runat="server" />
                                Timex
                            </label>

                            <label class="brand-option">
                                <asp:CheckBox ID="chkRoamer" runat="server" />
                                Roamer
                            </label>

                        </div>

                        <!-- Category -->

                        <div class="filter-section">

                            <h3>Category</h3>

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

                        <div class="filter-section">

                            <h3>Price Range (NPR)</h3>

                            <div class="price-inputs">

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

                        <div class="filter-section">

                            <h3>Availability</h3>

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

                        <!-- Filter Buttons -->

                        <div class="filter-buttons">

                            <asp:Button
                                ID="btnApplyFilters"
                                runat="server"
                                Text="Apply Filters"
                                CssClass="btn-filter"
                                OnClick="btnApplyFilters_Click" />

                            <asp:Button
                                ID="btnResetFilters"
                                runat="server"
                                Text="Clear Filters"
                                CssClass="btn-reset"
                                OnClick="btnResetFilters_Click"
                                CausesValidation="false" />

                        </div>

                    </aside>

                    <!-- =================================
                         PRODUCT SECTION
                         ================================= -->

                    <section class="products-area">

                        <!-- Toolbar -->

                        <div class="shop-toolbar">

                            <div class="result-count">

                                <asp:Literal
                                    ID="litResultCount"
                                    runat="server" />

                            </div>

                            <div class="sort-control">

                                <label for="ddlSort">
                                    Sort by:
                                </label>

                                <asp:DropDownList
                                    ID="ddlSort"
                                    runat="server"
                                    AutoPostBack="true"
                                    OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">

                                    <asp:ListItem
                                        Text="Newest"
                                        Value="newest" />

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

                        <!-- Product Grid -->

                        <div class="product-grid">

                            <asp:Repeater
                                ID="rptMen"
                                runat="server">

                                <ItemTemplate>

                                    <article class="product-card">

                                        <div class="product-image-wrap">

                                            <span class="new-badge">
                                                Men's Collection
                                            </span>

                                            <!-- Product Image -->

                                            <asp:Image
                                                ID="imgProduct"
                                                runat="server"
                                                CssClass="product-image"
                                                ImageUrl='<%# ResolveUrl(Convert.ToString(Eval("ImageUrl"))) %>'
                                                AlternateText='<%# Convert.ToString(Eval("Name")) %>'
                                                Visible='<%# Convert.ToBoolean(Eval("ImageExists")) %>' />

                                            <!-- Image Placeholder -->

                                            <asp:Panel
                                                ID="pnlImagePlaceholder"
                                                runat="server"
                                                CssClass="image-placeholder"
                                                Visible='<%# !Convert.ToBoolean(Eval("ImageExists")) %>'>

                                                <div>

                                                    <strong>
                                                        <%# Eval("Brand") %>
                                                    </strong>

                                                    Image will be added

                                                </div>

                                            </asp:Panel>

                                        </div>

                                        <!-- Product Information -->

                                        <div class="product-info">

                                            <div class="product-brand">
                                                <%# Eval("Brand") %>
                                            </div>

                                            <h2 class="product-name">
                                                <%# Eval("Name") %>
                                            </h2>

                                            <p class="product-description">
                                                <%# Eval("Description") %>
                                            </p>

                                            <p class="product-price">
                                                NPR <%# String.Format("{0:N0}", Eval("Price")) %>
                                            </p>

                                        </div>

                                    </article>

                                </ItemTemplate>

                            </asp:Repeater>

                        </div>

                        <!-- Empty State -->

                        <asp:Panel
                            ID="pnlNoProducts"
                            runat="server"
                            CssClass="empty-message"
                            Visible="false">

                            <h2>No watches found</h2>

                            <p>
                                Try changing your search, category,
                                price range or selected brands.
                            </p>

                        </asp:Panel>

                    </section>

                </div>

            </div>

        </main>

        <!-- Shared Footer -->

        <wv:Footer ID="SiteFooter" runat="server" />

    </form>

    <!-- Bootstrap JavaScript -->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
