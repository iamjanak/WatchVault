
<%@ Page Title="Shopping Cart | WatchVault"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="Cart.aspx.cs"
    Inherits="WatchVault.Products.Cart" %>

<%@ Register Src="~/Controls/Header.ascx"
    TagPrefix="wv" TagName="Header" %>

<%@ Register Src="~/Controls/Footer.ascx"
    TagPrefix="wv" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Cormorant+Garamond:wght@500;600;700&display=swap"
          rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <link href="<%= ResolveUrl("~/Content/Site.css") %>" rel="stylesheet" />

    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
          rel="stylesheet" />

    <style>

        :root {
            --navy: #101820;
            --navy-light: #263746;
            --gold: #d6ad65;
            --gold-deep: #8a642c;
            --gold-light: #f0d8a8;
            --cream: #f7f5f0;
            --text: #252b33;
            --muted: #6b737c;
            --border: #e8e5df;
            --danger: #a33a32;
            --success: #1f6b45;
            --success-bg: #eef8f2;
            --danger-bg: #fdf1f0;

            --font-heading: 'Cormorant Garamond', Georgia, serif;
            --font-body: 'Inter', Arial, sans-serif;
        }

        html {
            scroll-behavior: smooth;
        }

        body,
        button,
        input,
        select,
        textarea {
            font-family: var(--font-body);
        }

        body {
            margin: 0;
            background: var(--cream);
            color: var(--text);
            font-size: 14px;
            line-height: 1.7;
        }

        /* ---------- Hero ---------- */

        .cart-hero {
            padding: 48px 24px 56px;
            background: radial-gradient(ellipse at top, var(--navy-light) 0%, var(--navy) 72%);
            color: white;
        }

        .cart-hero-inner {
            max-width: 1180px;
            margin: 0 auto;
        }

        .cart-breadcrumb {
            margin-bottom: 22px;
            color: #aeb6be;
            font-size: 12px;
        }

        .cart-breadcrumb a {
            color: inherit;
            text-decoration: none;
        }

        .cart-breadcrumb a:hover,
        .cart-breadcrumb a:focus-visible {
            color: var(--gold-light);
            text-decoration: underline;
        }

        .cart-breadcrumb .sep {
            margin: 0 8px;
            opacity: .5;
        }

        .cart-hero h1 {
            margin: 0 0 8px;
            color: white;
            font-family: var(--font-heading);
            font-size: clamp(38px, 5vw, 54px);
            font-weight: 500;
            line-height: 1.1;
        }

        .cart-hero p {
            max-width: 520px;
            margin: 0;
            color: #ccd2d8;
        }

        /* ---------- Page ---------- */

        .cart-page {
            min-height: 50vh;
            padding: 0 24px 80px;
        }

        .cart-container {
            max-width: 1180px;
            margin: -28px auto 0;
        }

        .panel {
            background: white;
            border: 1px solid var(--border);
            border-radius: 8px;
            box-shadow: 0 6px 24px rgba(16, 24, 32, .05);
        }

        /* ---------- Message ---------- */

        .cart-message {
            display: block;
            margin-bottom: 20px;
            padding: 12px 16px;
            border: 1px solid var(--border);
            border-left: 4px solid var(--gold);
            border-radius: 6px;
            background: #fffdf8;
            color: var(--text);
            font-size: 13px;
            font-weight: 500;
        }

        .cart-message.success {
            border-left-color: var(--success);
            background: var(--success-bg);
            color: var(--success);
        }

        .cart-message.error {
            border-left-color: var(--danger);
            background: var(--danger-bg);
            color: var(--danger);
        }

        /* ---------- Layout ---------- */

        .cart-layout {
            display: grid;
            grid-template-columns: minmax(0, 1fr) 340px;
            gap: 24px;
            align-items: start;
        }

        .items-panel {
            padding: 8px 28px;
        }

        .items-head {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            padding: 20px 0 16px;
            border-bottom: 1px solid var(--border);
        }

        .items-head h2 {
            margin: 0;
            color: var(--navy);
            font-family: var(--font-heading);
            font-size: 30px;
            font-weight: 600;
        }

        .items-head-actions {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 18px;
        }

        .items-count {
            color: var(--muted);
            font-size: 13px;
            white-space: nowrap;
        }

        /* ---------- Continue Shopping ---------- */

        .continue-shopping-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 9px;
            padding: 11px 17px;
            border: 1px solid var(--gold);
            border-radius: 5px;
            background: var(--gold);
            color: var(--navy);
            font-size: 11px;
            font-weight: 700;
            letter-spacing: .8px;
            text-decoration: none;
            white-space: nowrap;
            transition: .2s ease;
        }

        .continue-shopping-btn:hover {
            border-color: var(--navy);
            background: var(--navy);
            color: var(--gold-light);
        }

        .continue-shopping-btn:focus-visible {
            outline: 3px solid rgba(214, 173, 101, .5);
            outline-offset: 3px;
        }

        /* ---------- Cart Item ---------- */

        .cart-item {
            display: grid;
            grid-template-columns: 112px minmax(0, 1fr) auto;
            gap: 8px 22px;
            align-items: center;
            padding: 22px 0;
            border-bottom: 1px solid #eeeae3;
        }

        .cart-item:last-child {
            border-bottom: none;
        }

        .cart-product-image {
            display: block;
            width: 112px;
            height: 112px;
            padding: 10px;
            object-fit: contain;
            background: #fbfaf7;
            border: 1px solid #eeeae3;
            border-radius: 8px;
        }

        .item-info {
            min-width: 0;
        }

        .product-brand {
            margin: 0 0 3px;
            color: #9a7741;
            font-size: 12px;
            font-weight: 600;
        }

        .product-name {
            margin: 0 0 4px;
            color: var(--navy);
            font-size: 15px;
            font-weight: 600;
            line-height: 1.4;
        }

        .unit-price {
            margin: 0;
            color: var(--muted);
            font-size: 12.5px;
        }

        .stock-note {
            display: inline-block;
            margin-top: 6px;
            color: var(--danger);
            font-size: 12px;
            font-weight: 500;
        }

        .stock-note:empty {
            display: none;
        }

        .item-controls {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 14px;
            flex-wrap: wrap;
        }

        /* ---------- Quantity ---------- */

        .qty {
            display: inline-flex;
            align-items: stretch;
            border: 1px solid #d6d4ce;
            border-radius: 6px;
            background: white;
            overflow: hidden;
        }

        .qty:focus-within {
            border-color: var(--gold);
            box-shadow: 0 0 0 3px rgba(214, 173, 101, .28);
        }

        .qty-step {
            width: 34px;
            border: 0;
            background: #fbfaf7;
            color: var(--navy);
            font-size: 16px;
            line-height: 1;
            cursor: pointer;
        }

        .qty-step:hover {
            background: #f1eee7;
        }

        .quantity-input {
            width: 52px;
            padding: 7px 4px;
            border: 0;
            border-left: 1px solid #eeeae3;
            border-right: 1px solid #eeeae3;
            border-radius: 0;
            background: white;
            color: var(--text);
            font-size: 14px;
            font-weight: 600;
            text-align: center;
            appearance: textfield;
            -moz-appearance: textfield;
        }

        .quantity-input::-webkit-outer-spin-button,
        .quantity-input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        .quantity-input:focus {
            outline: none;
            box-shadow: none;
        }

        .btn-update {
            padding: 7px 14px;
            border: 1px solid #d9d7d1;
            border-radius: 6px;
            background: white;
            color: var(--navy);
            font-size: 12.5px;
            font-weight: 600;
            transition: .15s ease;
        }

        .btn-update:hover {
            border-color: var(--gold);
            background: #fbfaf7;
        }

        .btn-update.is-pending {
            border-color: var(--gold);
            background: var(--gold-light);
        }

        .btn-remove {
            padding: 7px 4px;
            border: 0;
            background: transparent;
            color: var(--danger);
            font-size: 12.5px;
            font-weight: 600;
            text-decoration: underline;
            text-underline-offset: 3px;
        }

        .btn-remove:hover {
            color: #842b25;
        }

        .item-total {
            align-self: start;
            color: var(--navy);
            font-size: 16px;
            font-weight: 700;
            white-space: nowrap;
            text-align: right;
        }

        .item-total small {
            display: block;
            color: var(--muted);
            font-size: 11.5px;
            font-weight: 500;
        }

        /* ---------- Summary ---------- */

        .summary-panel {
            position: sticky;
            top: 16px;
            padding: 26px;
        }

        .summary-panel h2 {
            margin: 0 0 16px;
            padding-bottom: 14px;
            border-bottom: 1px solid var(--border);
            color: var(--navy);
            font-family: var(--font-heading);
            font-size: 28px;
            font-weight: 600;
        }

        .summary-row {
            display: flex;
            justify-content: space-between;
            gap: 12px;
            padding: 7px 0;
            font-size: 13.5px;
        }

        .summary-row .label {
            color: var(--muted);
        }

        .summary-row .value {
            color: var(--navy);
            font-weight: 600;
        }

        .summary-total {
            display: flex;
            align-items: baseline;
            justify-content: space-between;
            margin-top: 10px;
            padding-top: 16px;
            border-top: 1px solid var(--border);
        }

        .summary-total .label {
            color: var(--navy);
            font-size: 14px;
            font-weight: 600;
        }

        .cart-total-value {
            color: var(--gold-deep);
            font-size: 22px;
            font-weight: 700;
        }

        .cart-note {
            margin: 8px 0 20px;
            color: var(--muted);
            font-size: 12px;
        }

        .btn-watchvault {
            display: block;
            width: 100%;
            padding: 14px 24px;
            border: 1px solid var(--navy);
            border-radius: 6px;
            background: var(--navy);
            color: white;
            font-size: 14px;
            font-weight: 600;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            transition: .15s ease;
        }

        .btn-watchvault:hover {
            border-color: var(--navy-light);
            background: var(--navy-light);
            color: var(--gold-light);
        }

        .btn-watchvault.is-busy {
            opacity: .7;
            cursor: progress;
        }

        .assurance {
            margin: 20px 0 0;
            padding: 16px 0 0;
            border-top: 1px solid var(--border);
            list-style: none;
            color: var(--muted);
            font-size: 12.5px;
        }

        .assurance li {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 4px 0;
        }

        .assurance i {
            width: 16px;
            color: #9a7741;
            text-align: center;
        }

        /* ---------- Empty Cart ---------- */

        .empty-cart {
            padding: 64px 25px;
            text-align: center;
        }

        .empty-cart-icon {
            display: flex;
            width: 76px;
            height: 76px;
            align-items: center;
            justify-content: center;
            margin: 0 auto 22px;
            border-radius: 50%;
            background: #fbfaf7;
            border: 1px solid var(--border);
            color: #9a7741;
            font-size: 27px;
        }

        .empty-cart h3 {
            margin: 0 0 10px;
            color: var(--navy);
            font-family: var(--font-heading);
            font-size: 30px;
            font-weight: 600;
        }

        .empty-cart p {
            margin: 0 auto 26px;
            color: var(--muted);
        }

        .empty-cart .btn-watchvault {
            display: inline-block;
            width: auto;
        }

        /* ---------- Success Notification ---------- */

        .cart-success-toast {
            position: fixed;
            top: 105px;
            right: 25px;
            z-index: 9999;
            display: flex;
            align-items: center;
            gap: 13px;
            max-width: 390px;
            padding: 17px 22px;
            border: 1px solid #c6dfce;
            border-left: 5px solid var(--success);
            border-radius: 7px;
            background: white;
            box-shadow: 0 8px 30px rgba(16, 24, 32, .15);
            color: var(--text);
            animation: toastSlideIn .35s ease;
        }

        .cart-success-toast i {
            color: var(--success);
            font-size: 22px;
        }

        .cart-success-toast strong {
            display: block;
            color: var(--success);
            font-size: 13px;
        }

        .cart-success-toast span {
            display: block;
            color: var(--muted);
            font-size: 12px;
        }

        @keyframes toastSlideIn {
            from {
                opacity: 0;
                transform: translateX(25px);
            }

            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        /* ---------- Focus ---------- */

        .btn-watchvault:focus-visible,
        .btn-update:focus-visible,
        .btn-remove:focus-visible,
        .qty-step:focus-visible {
            outline: 3px solid rgba(214, 173, 101, .6);
            outline-offset: 2px;
        }

        /* ---------- Responsive ---------- */

        @media (max-width: 960px) {

            .cart-layout {
                grid-template-columns: 1fr;
            }

            .summary-panel {
                position: static;
            }
        }

        @media (max-width: 600px) {

            .cart-hero {
                padding: 36px 16px 50px;
            }

            .cart-page {
                padding: 0 16px 50px;
            }

            .items-panel {
                padding: 4px 16px;
            }

            .items-head {
                align-items: flex-start;
                flex-direction: column;
                gap: 12px;
            }

            .items-head-actions {
                width: 100%;
                justify-content: space-between;
                flex-wrap: wrap;
                gap: 10px;
            }

            .continue-shopping-btn {
                padding: 10px 12px;
                font-size: 10px;
            }

            .cart-item {
                grid-template-columns: 84px minmax(0, 1fr);
            }

            .cart-product-image {
                width: 84px;
                height: 84px;
                padding: 6px;
            }

            .item-total {
                grid-column: 1 / -1;
                display: flex;
                align-items: baseline;
                justify-content: space-between;
                padding-top: 10px;
                border-top: 1px dashed #eeeae3;
                text-align: left;
            }

            .cart-success-toast {
                top: 85px;
                right: 12px;
                left: 12px;
                max-width: none;
            }
        }

        @media (prefers-reduced-motion: reduce) {

            html {
                scroll-behavior: auto;
            }

            *,
            *::before,
            *::after {
                transition: none !important;
                animation: none !important;
            }
        }

    </style>

</head>

<body>

    <form id="form1" runat="server">

        <!-- Shared Header -->
        <wv:Header ID="Header1" runat="server" />

        <!-- Hero -->
        <section class="cart-hero">

            <div class="cart-hero-inner">

                <nav class="cart-breadcrumb" aria-label="Breadcrumb">

                    <a href="<%= ResolveUrl("~/Default.aspx") %>">
                        Home
                    </a>

                    <span class="sep" aria-hidden="true">/</span>

                    <span aria-current="page">
                        Shopping cart
                    </span>

                </nav>

                <h1>Your shopping cart</h1>

                <p>
                    Review your watches and quantities, then continue to checkout.
                </p>

            </div>

        </section>

        <main class="cart-page">

            <div class="cart-container">

                <!-- Message -->
                <asp:Label ID="lblMessage"
                    runat="server"
                    CssClass="cart-message"
                    role="status"
                    aria-live="polite"
                    Visible="false" />

                <!-- Empty Cart -->
                <asp:Panel ID="pnlEmptyCart"
                    runat="server"
                    Visible="false"
                    CssClass="panel empty-cart">

                    <div class="empty-cart-icon" aria-hidden="true">
                        <i class="fa-solid fa-bag-shopping"></i>
                    </div>

                    <h3>Your cart is empty</h3>

                    <p>
                        Browse our latest arrivals and add a watch to get started.
                    </p>

                    <a href="<%= ResolveUrl("~/Products/NewArrivals.aspx") %>"
                       class="btn-watchvault">

                        Browse new arrivals

                    </a>

                </asp:Panel>

                <!-- Cart Items -->
                <asp:Panel ID="pnlCart"
                    runat="server"
                    Visible="false">

                    <div class="cart-layout">

                        <!-- Items -->
                        <section class="panel items-panel"
                                 aria-labelledby="itemsHeading">

                            <div class="items-head">

                                <h2 id="itemsHeading">
                                    Selected watches
                                </h2>

                                <div class="items-head-actions">

                                    <span class="items-count"
                                          id="itemsCount"></span>

                                    <a href="<%= ResolveUrl("~/Products/NewArrivals.aspx") %>"
                                       class="continue-shopping-btn">

                                        <i class="fa-solid fa-arrow-left"
                                           aria-hidden="true"></i>

                                        CONTINUE SHOPPING

                                    </a>

                                </div>

                            </div>

                            <asp:Repeater ID="rptCart"
                                runat="server"
                                OnItemCommand="rptCart_ItemCommand">

                                <ItemTemplate>

                                    <article class="cart-item">

                                        <img src='<%# ResolveUrl(Convert.ToString(Eval("ImageUrl"))) %>'
                                             alt='<%# Eval("Name") %>'
                                             class="cart-product-image"
                                             loading="lazy" />

                                        <div class="item-info">

                                            <p class="product-brand">
                                                <%# Eval("Brand") %>
                                            </p>

                                            <h3 class="product-name">
                                                <%# Eval("Name") %>
                                            </h3>

                                            <p class="unit-price">
                                                Rs. <%# Eval("Price", "{0:N2}") %> each
                                            </p>

                                            <span class="stock-note">
                                                <%# Convert.ToInt32(Eval("StockQuantity")) <= 5 ? "Only " + Eval("StockQuantity") + " left in stock" : "" %>
                                            </span>

                                            <div class="item-controls">

                                                <div class="qty">

                                                    <button type="button"
                                                            class="qty-step"
                                                            data-step="-1"
                                                            aria-label="Decrease quantity">
                                                        &minus;
                                                    </button>

                                                    <asp:TextBox ID="txtQuantity"
                                                        runat="server"
                                                        Text='<%# Eval("Quantity") %>'
                                                        TextMode="Number"
                                                        min="1"
                                                        max='<%# Eval("StockQuantity") %>'
                                                        aria-label="Quantity"
                                                        CssClass="quantity-input" />

                                                    <button type="button"
                                                            class="qty-step"
                                                            data-step="1"
                                                            aria-label="Increase quantity">
                                                        +
                                                    </button>

                                                </div>

                                                <asp:HiddenField ID="hfCartItemId"
                                                    runat="server"
                                                    Value='<%# Eval("CartItemId") %>' />

                                                <asp:Button ID="btnUpdate"
                                                    runat="server"
                                                    Text="Update"
                                                    CommandName="UpdateItem"
                                                    CssClass="btn-update" />

                                                <asp:Button ID="btnRemove"
                                                    runat="server"
                                                    Text="Remove"
                                                    CommandName="RemoveItem"
                                                    OnClientClick="return confirm('Remove this watch from your cart?');"
                                                    CssClass="btn-remove" />

                                            </div>

                                        </div>

                                        <div class="item-total">

                                            <small>Subtotal</small>

                                            Rs. <%# Eval("Subtotal", "{0:N2}") %>

                                        </div>

                                    </article>

                                </ItemTemplate>

                            </asp:Repeater>

                        </section>

                        <!-- Order Summary -->
                        <aside class="panel summary-panel"
                               aria-labelledby="summaryHeading">

                            <h2 id="summaryHeading">
                                Order summary
                            </h2>

                            <div class="summary-row">

                                <span class="label">
                                    Shipping
                                </span>

                                <span class="value">
                                    Calculated at checkout
                                </span>

                            </div>

                            <div class="summary-total">

                                <span class="label">
                                    Cart total
                                </span>

                                <asp:Label ID="lblTotal"
                                    runat="server"
                                    CssClass="cart-total-value" />

                            </div>

                            <p class="cart-note">
                                Final charges are confirmed on the next step.
                            </p>

                            <asp:Button ID="btnCheckout"
                                runat="server"
                                Text="Proceed to checkout"
                                CssClass="btn-watchvault"
                                OnClick="btnCheckout_Click" />

                            <ul class="assurance">

                                <li>
                                    <i class="fa-solid fa-lock"
                                       aria-hidden="true"></i>
                                    Secure checkout
                                </li>

                                <li>
                                    <i class="fa-solid fa-certificate"
                                       aria-hidden="true"></i>
                                    Genuine timepieces
                                </li>

                            </ul>

                        </aside>

                    </div>

                </asp:Panel>

            </div>

        </main>

        <!-- Shared Footer -->
        <wv:Footer ID="Footer1" runat="server" />

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <script>

        (function () {

            // ========================================
            // ITEM COUNT
            // ========================================

            var items = document.querySelectorAll('.cart-item');
            var count = document.getElementById('itemsCount');

            if (count && items.length) {

                count.textContent =
                    items.length +
                    (items.length === 1 ? ' item' : ' items');

            }

            // ========================================
            // QUANTITY STEPPERS
            // ========================================

            document.querySelectorAll('.cart-item').forEach(function (row) {

                var input = row.querySelector('.quantity-input');
                var update = row.querySelector('.btn-update');

                if (!input) return;

                var original = input.value;

                function clamp() {

                    var min = parseInt(input.getAttribute('min'), 10) || 1;
                    var max = parseInt(input.getAttribute('max'), 10) || 999;

                    var value = parseInt(input.value, 10);

                    if (isNaN(value) || value < min) value = min;
                    if (value > max) value = max;

                    input.value = value;

                }

                function markPending() {

                    if (update) {

                        update.classList.toggle(
                            'is-pending',
                            input.value !== original
                        );

                    }

                }

                row.querySelectorAll('.qty-step').forEach(function (btn) {

                    btn.addEventListener('click', function () {

                        input.value =
                            (parseInt(input.value, 10) || 1) +
                            parseInt(btn.dataset.step, 10);

                        clamp();
                        markPending();

                    });

                });

                input.addEventListener('change', function () {
                    clamp();
                    markPending();
                });

                input.addEventListener('input', markPending);

            });

            // ========================================
            // CART MESSAGE COLOURS
            // ========================================

            var msg = document.getElementById(
                '<%= lblMessage.ClientID %>'
            );

            if (msg) {

                if (/success|updated|removed|added/i.test(msg.textContent)) {

                    msg.classList.add('success');

                }
                else if (/error|fail|invalid|not enough|out of stock|unable|could not/i.test(msg.textContent)) {

                    msg.classList.add('error');

                }

            }

            // ========================================
            // ADD TO CART SUCCESS NOTIFICATION
            // ========================================

            var urlParams = new URLSearchParams(
                window.location.search
            );

            if (urlParams.get('added') === '1') {

                var toast = document.createElement('div');

                toast.className = 'cart-success-toast';

                toast.setAttribute('role', 'status');
                toast.setAttribute('aria-live', 'polite');

                toast.innerHTML =
                    '<i class="fa-solid fa-circle-check"></i>' +
                    '<div>' +
                        '<strong>Successfully added to cart!</strong>' +
                        '<span>Your watch is now in your shopping cart.</span>' +
                    '</div>';

                document.body.appendChild(toast);

                // Automatically hide notification
                setTimeout(function () {

                    toast.style.transition = 'opacity .4s ease';
                    toast.style.opacity = '0';

                    setTimeout(function () {

                        toast.remove();

                    }, 400);

                }, 3500);

                // Remove query parameter without reloading
                window.history.replaceState(
                    {},
                    document.title,
                    window.location.pathname
                );

            }

            // ========================================
            // PREVENT DOUBLE CHECKOUT CLICKS
            // ========================================

            var checkout = document.getElementById(
                '<%= btnCheckout.ClientID %>'
            );

    if (checkout) {

        var busy = false;

        checkout.addEventListener('click', function (e) {

            if (busy) {

                e.preventDefault();
                return;

            }

            busy = true;

            checkout.classList.add('is-busy');

        });

    }

})();

</script>

</body>
</html>
