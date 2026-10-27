
<%@ Page Title="New Arrivals | WatchVault"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="NewArrivals.aspx.cs"
    Inherits="WatchVault.Products.NewArrivals" %>

<%@ Register Src="~/Controls/Header.ascx"
    TagPrefix="wv" TagName="Header" %>

<%@ Register Src="~/Controls/Footer.ascx"
    TagPrefix="wv" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>New Arrivals | WatchVault</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif&family=Manrope:wght@400;500;600;700;800&display=swap"
          rel="stylesheet" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <!-- Shared WatchVault styles -->
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

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: var(--cream);
            color: var(--text);
            font-family: 'Manrope', Arial, sans-serif;
        }

        .page-intro {
            padding: 54px 20px 43px;
            text-align: center;
            background: radial-gradient(
                ellipse at top, #263746 0%, var(--navy) 72%);
            color: white;
        }

        .eyebrow {
            margin: 0 0 12px;
            color: var(--gold);
            font-size: 11px;
            font-weight: 700;
            letter-spacing: 3px;
            text-transform: uppercase;
        }

        .page-intro h1 {
            margin: 0;
            font-family: 'Instrument Serif', serif;
            font-size: clamp(36px, 4vw, 52px);
            font-weight: 400;
        }

        .page-intro p {
            margin: 14px auto 0;
            max-width: 560px;
            color: #d1d5d9;
            font-size: 14px;
            line-height: 1.8;
        }

        .breadcrumb {
            max-width: 1280px;
            margin: 0 auto;
            padding: 22px 24px 0;
            color: var(--muted);
            font-size: 12px;
        }

        .breadcrumb a {
            color: inherit;
            text-decoration: none;
        }

        .breadcrumb a:hover {
            color: #8a642c;
        }

        .shop-layout {
            max-width: 1280px;
            margin: 0 auto;
            padding: 30px 24px 75px;
            display: grid;
            grid-template-columns: 240px minmax(0, 1fr);
            gap: 36px;
            align-items: start;
        }

        .filter-panel {
            background: white;
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 24px 20px;
        }

        .filter-heading {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 22px;
            padding-bottom: 17px;
            border-bottom: 1px solid var(--border);
        }

        .filter-heading h2 {
            margin: 0;
            font-size: 14px;
            letter-spacing: 1px;
        }

        .filter-heading span {
            color: #9a7741;
            font-size: 11px;
            font-weight: 700;
        }

        .filter-section {
            margin-bottom: 24px;
            padding-bottom: 23px;
            border-bottom: 1px solid var(--border);
        }

        .filter-section:last-of-type {
            border-bottom: none;
        }

        .filter-section h3 {
            margin: 0 0 15px;
            font-size: 14px;
        }

        .price-inputs {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 10px;
        }

        .field-label {
            display: block;
            margin-bottom: 7px;
            color: var(--muted);
            font-size: 12px;
        }

        .text-input,
        .sort-select {
            width: 100%;
            min-height: 42px;
            padding: 10px 11px;
            background: white;
            border: 1px solid #dddcd7;
            border-radius: 5px;
            color: var(--text);
            font: inherit;
            font-size: 13px;
        }

        .text-input:focus,
        .sort-select:focus {
            outline: 2px solid #ead7b2;
            border-color: var(--gold);
        }

        .check-line {
            display: flex;
            align-items: center;
            gap: 9px;
            margin: 12px 0;
            font-size: 13px;
            color: #505761;
        }

        .check-line input {
            accent-color: var(--navy);
            width: 15px;
            height: 15px;
        }

        .filter-button,
        .reset-button {
            display: block;
            width: 100%;
            min-height: 43px;
            margin-top: 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: .7px;
            transition: .2s ease;
        }

        .filter-button {
            background: var(--navy);
            color: white;
            border: 1px solid var(--navy);
        }

        .filter-button:hover {
            background: #273a49;
        }

        .reset-button {
            background: white;
            color: var(--text);
            border: 1px solid #d9d7d1;
        }

        .reset-button:hover {
            border-color: var(--gold);
        }

        .catalog-toolbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 18px;
            margin-bottom: 23px;
        }

        .result-count {
            color: #4f5660;
            font-size: 13px;
        }

        .result-count strong {
            color: var(--navy);
        }

        .sort-area {
            display: flex;
            align-items: center;
            gap: 10px;
            min-width: 215px;
        }

        .sort-area label {
            color: var(--muted);
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .product-grid {
            display: grid;
            grid-template-columns: repeat(3, minmax(0, 1fr));
            gap: 22px;
        }

        .product-card {
            min-width: 0;
            overflow: hidden;
            background: white;
            border: 1px solid var(--border);
            border-radius: 8px;
            transition: transform .22s ease, box-shadow .22s ease;
        }

        .product-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 28px rgba(16, 24, 32, .09);
        }

        .product-image-wrap {
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 240px;
            padding: 18px;
            background: #fbfaf7;
            overflow: hidden;
        }

        .product-image {
            width: 100%;
            height: 100%;
            object-fit: contain;
            transition: transform .3s ease;
        }

        .product-card:hover .product-image {
            transform: scale(1.045);
        }

        .new-badge {
            position: absolute;
            top: 13px;
            left: 13px;
            padding: 7px 10px;
            background: var(--navy);
            color: var(--gold-light);
            border-radius: 3px;
            font-size: 9px;
            font-weight: 700;
            letter-spacing: 1px;
        }

        .product-info {
            padding: 17px 16px 18px;
        }

        .product-brand {
            margin: 0 0 7px;
            color: #9a7741;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1.5px;
            text-transform: uppercase;
        }

        .product-name {
            min-height: 40px;
            margin: 0 0 10px;
            color: var(--navy);
            font-size: 14px;
            font-weight: 700;
            line-height: 1.45;
        }

        .product-description {
            min-height: 32px;
            margin: 0 0 12px;
            color: var(--muted);
            font-size: 11px;
            line-height: 1.6;
        }

        .product-price {
            margin-bottom: 15px;
            color: var(--navy);
            font-size: 17px;
            font-weight: 800;
        }

        .product-price small {
            margin-right: 4px;
            color: var(--muted);
            font-size: 10px;
            font-weight: 400;
        }

        .view-button {
            display: block;
            width: 100%;
            padding: 12px 8px;
            background: white;
            border: 1px solid var(--navy);
            border-radius: 4px;
            color: var(--navy);
            text-align: center;
            font-size: 10px;
            font-weight: 700;
            letter-spacing: 1px;
            text-decoration: none;
            transition: .2s ease;
        }

        .view-button:hover {
            background: var(--navy);
            color: var(--gold-light);
        }

        .empty-message {
            grid-column: 1 / -1;
            padding: 50px 20px;
            background: white;
            border: 1px solid var(--border);
            border-radius: 8px;
            text-align: center;
            color: var(--muted);
            line-height: 1.8;
        }

        @media (max-width: 1050px) {
            .shop-layout {
                grid-template-columns: 210px minmax(0, 1fr);
                gap: 22px;
            }

            .product-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
            }

            .product-image-wrap {
                height: 225px;
            }
        }

        @media (max-width: 700px) {
            .page-intro {
                padding: 40px 20px 35px;
            }

            .shop-layout {
                grid-template-columns: 1fr;
                padding: 22px 16px 45px;
                gap: 25px;
            }

            .filter-panel {
                padding: 20px;
            }

            .catalog-toolbar {
                align-items: flex-start;
                flex-direction: column;
            }

            .sort-area {
                width: 100%;
            }

            .sort-select {
                flex: 1;
            }

            .product-grid {
                grid-template-columns: repeat(2, minmax(0, 1fr));
                gap: 12px;
            }

            .product-image-wrap {
                height: 175px;
                padding: 10px;
            }

            .product-info {
                padding: 13px 11px;
            }

            .product-name {
                font-size: 12px;
                min-height: 36px;
            }

            .product-description {
                font-size: 10px;
            }

            .product-price {
                font-size: 14px;
            }

            .new-badge {
                top: 8px;
                left: 8px;
                padding: 6px 7px;
                font-size: 8px;
            }
        }

        @media (max-width: 360px) {
            .product-grid {
                grid-template-columns: 1fr;
            }

            .product-image-wrap {
                height: 240px;
            }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- Shared header: do not wrap it in top-strip or another header -->
    <wv:Header ID="SiteHeader" runat="server" />

    <section class="page-intro">
        <p class="eyebrow">The latest collection</p>
        <h1>New Arrivals</h1>
        <p>
            Discover the latest additions to WatchVault.
            Refined details, timeless design, and watches selected for your style.
        </p>
    </section>

    <div class="breadcrumb">
        <a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a>
        &nbsp; / &nbsp; <span>New Arrivals</span>
    </div>

    <main class="shop-layout">

        <aside class="filter-panel">
            <div class="filter-heading">
                <h2>REFINE YOUR SEARCH</h2>
                <span>FILTERS</span>
            </div>

            <div class="filter-section">
                <h3>Price Range (NPR)</h3>

                <div class="price-inputs">
                    <div>
                        <label class="field-label" for="txtMinPrice">From</label>
                        <asp:TextBox ID="txtMinPrice" runat="server"
                            CssClass="text-input" Text="0"
                            TextMode="Number" />
                    </div>

                    <div>
                        <label class="field-label" for="txtMaxPrice">To</label>
                        <asp:TextBox ID="txtMaxPrice" runat="server"
                            CssClass="text-input" Text="200000"
                            TextMode="Number" />
                    </div>
                </div>
            </div>

            <div class="filter-section">
                <h3>Brand</h3>

                <label class="check-line">
                    <asp:CheckBox ID="chkRoamer" runat="server" />
                    Roamer
                </label>

                <label class="check-line">
                    <asp:CheckBox ID="chkSeiko" runat="server" />
                    Seiko
                </label>

                <label class="check-line">
                    <asp:CheckBox ID="chkCitizen" runat="server" />
                    Citizen
                </label>

                <label class="check-line">
                    <asp:CheckBox ID="chkCasio" runat="server" />
                    Casio
                </label>
            </div>

            <asp:Button ID="btnApplyFilters" runat="server"
                Text="APPLY FILTERS"
                CssClass="filter-button"
                OnClick="btnApplyFilters_Click" />

            <asp:Button ID="btnResetFilters" runat="server"
                Text="RESET FILTERS"
                CssClass="reset-button"
                CausesValidation="false"
                OnClick="btnResetFilters_Click" />
        </aside>

        <section class="catalog">
            <div class="catalog-toolbar">
                <div class="result-count">
                    Showing <strong><asp:Literal ID="litResultCount" runat="server" /></strong>
                    watches
                </div>

                <div class="sort-area">
                    <label for="ddlSort">SORT BY</label>

                    <asp:DropDownList ID="ddlSort" runat="server"
                        CssClass="sort-select"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlSort_SelectedIndexChanged">
                        <asp:ListItem Value="newest">Newest</asp:ListItem>
                        <asp:ListItem Value="price-low">Price: Low to High</asp:ListItem>
                        <asp:ListItem Value="price-high">Price: High to Low</asp:ListItem>
                        <asp:ListItem Value="name">Name: A to Z</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="product-grid">
                <asp:Repeater ID="rptProducts" runat="server">
                    <ItemTemplate>
                        <article class="product-card">
                            <div class="product-image-wrap">
                                <span class="new-badge">NEW ARRIVAL</span>

                                <asp:Image ID="imgProduct" runat="server"
                                    CssClass="product-image"
                                    ImageUrl='<%# ResolveUrl(Convert.ToString(Eval("ImageUrl"))) %>'
                                    AlternateText='<%# Eval("Name") %>' />
                            </div>

                            <div class="product-info">
                                <p class="product-brand"><%# Eval("Brand") %></p>
                                <h2 class="product-name"><%# Eval("Name") %></h2>

                                <p class="product-description">
                                    <%# Eval("Description") %>
                                </p>

                                <div class="product-price">
                                    <small>NPR</small><%# String.Format("{0:N0}", Eval("Price")) %>
                                </div>

                                <a class="view-button"
                                   href='<%# ResolveUrl("~/Products/ProductDetails.aspx?id=" + Eval("ProductId")) %>'>
                                    VIEW DETAILS
                                </a>
                            </div>
                        </article>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:Panel ID="pnlNoProducts" runat="server"
                    CssClass="empty-message" Visible="false">
                    <strong>No watches match your filters.</strong>
                    <br />
                    Try a different price range or reset the filters to see all new arrivals.
                </asp:Panel>
            </div>
        </section>
    </main>

    <!-- Shared footer: replaces the old site-footer -->
    <wv:Footer ID="SiteFooter" runat="server" />

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
