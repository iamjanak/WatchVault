
<%@ Page Title="Product Details | WatchVault"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="ProductDetails.aspx.cs"
    Inherits="WatchVault.Products.ProductDetails1" %>

<%@ Register Src="~/Controls/Header.ascx"
    TagPrefix="wv" TagName="Header" %>

<%@ Register Src="~/Controls/Footer.ascx"
    TagPrefix="wv" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Product Details | WatchVault</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Cormorant+Garamond:wght@500;600;700&display=swap"
          rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Cormorant+Garamond:wght@400;500;600;700&display=swap"
      rel="stylesheet" />

    <link href="<%= ResolveUrl("~/Content/Site.css") %>"
          rel="stylesheet" 

    <div class="review-summary">
        <div class="review-score">
            <asp:Literal ID="Literal1" runat="server" />

            <span class="review-stars">
                <asp:Literal ID="Literal2" runat="server" />
            </span>

            <span>
                <asp:Literal ID="Literal3" runat="server" />
            </span>
        </div>
    </div>

    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <article class="review-card">
                <h3 class="review-title">
                    <%#: Eval("ReviewTitle") %>
                </h3>

                <span class="reviewer-name">
                    By <%#: Eval("ReviewerName") %>
                </span>

                <div class="individual-stars">
                    <%# new string('★', Convert.ToInt32(Eval("Rating"))) %><%# new string('☆', 5 - Convert.ToInt32(Eval("Rating"))) %>
                </div>

                <p class="review-text">
                    <%#: Eval("ReviewText") %>
                </p>
            </article>
        </ItemTemplate>
    </asp:Repeater>

    <asp:Panel ID="Panel1" runat="server" Visible="false">
        <p>No reviews have been submitted for this watch yet.</p>
    </asp:Panel>

</section>

    <style>
        :root {
            --navy: #101820;
            --gold: #d6ad65;
            --cream: #f7f5f0;
            --text: #252b33;
            --muted: #737b84;
            --border: #e8e5df;
        }

        body {
            background: #f8f7f3;
            color: #172333;
            font-family: 'Inter', sans-serif;
        }
        .details-container {
            max-width: 1250px;
            margin: auto;
            padding: 35px 24px 80px;
        }

        .breadcrumb {
            margin-bottom: 28px;
            color: var(--muted);
            font-size: 13px;
        }

        .breadcrumb a {
            color: inherit;
            text-decoration: none;
        }

        .breadcrumb a:hover,
        .back-link:hover {
            color: #9a7741;
        }

        .product-layout {
            display: grid;
            grid-template-columns: 1.08fr 0.92fr;
            gap: 55px;
            padding: 35px;
            background: white;
            border: 1px solid var(--border);
            border-radius: 8px;
        }

        /* Image gallery */

        .gallery-main {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 480px;
            padding: 25px;
            background: #fbfaf7;
            border-radius: 7px;
            overflow: hidden;
        }

        .main-watch-image {
            width: 100%;
            height: 450px;
            object-fit: contain;
            object-position: center;
            transition: opacity 0.2s ease;
        }

        .gallery-thumbnails {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 12px;
            margin-top: 15px;
        }

        .gallery-thumb {
            height: 105px;
            padding: 8px;
            background: #fbfaf7;
            border: 1px solid var(--border);
            border-radius: 5px;
            cursor: pointer;
            transition: 0.2s ease;
        }

        .gallery-thumb:hover,
        .gallery-thumb.active {
            border: 2px solid var(--gold);
            background: white;
        }

        .gallery-thumb img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .gallery-note {
            margin-top: 12px;
            color: var(--muted);
            font-size: 11px;
            text-align: center;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        /* Product information */

        .product-information {
            padding: 5px 0;
        }

        .product-brand {
            margin: 5px 0 10px;
            color: #9a7741;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        .product-name {
            margin: 0 0 17px;
            color: var(--navy);
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 45px;
            font-weight: 600;
            line-height: 1.1;
        }

        .product-price {
            margin-bottom: 10px;
            color: var(--navy);
            font-size: 28px;
            font-weight: 700;
        }

        .shipping-note {
            margin-bottom: 22px;
            color: var(--muted);
            font-size: 12px;
        }

        .description-heading {
            margin-top: 25px;
            margin-bottom: 9px;
            color: var(--navy);
            font-size: 14px;
            font-weight: 700;
        }

        .description {
            margin-bottom: 22px;
            color: var(--muted);
            font-size: 13px;
            line-height: 1.9;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            padding: 13px 0;
            border-top: 1px solid var(--border);
            font-size: 13px;
        }

        .detail-label {
            color: var(--muted);
        }

        .detail-value {
            color: var(--navy);
            font-weight: 600;
            text-align: right;
        }

        .stock {
            color: #27804d;
            font-weight: 700;
        }

        .out-of-stock {
            color: #b42318;
            font-weight: 700;
        }

        /* Quantity */

        .quantity-heading {
            margin-top: 25px;
            margin-bottom: 10px;
            color: var(--navy);
            font-size: 13px;
            font-weight: 700;
        }

        .quantity-control {
            display: flex;
            align-items: center;
            width: 155px;
            height: 45px;
            border: 1px solid var(--border);
            border-radius: 4px;
            overflow: hidden;
        }

        .quantity-control button {
            width: 45px;
            height: 100%;
            border: 0;
            background: #f7f5f0;
            color: var(--navy);
            font-size: 20px;
            cursor: pointer;
        }

        .quantity-control button:hover {
            background: #eee8dc;
        }

        .quantity-input {
            width: 65px;
            height: 100%;
            border: 0;
            outline: none;
            color: var(--navy);
            font-size: 15px;
            font-weight: 600;
            text-align: center;
        }

        .cart-button {
            display: block;
            width: 100%;
            margin-top: 22px;
            padding: 15px;
            background: var(--navy);
            border: 1px solid var(--navy);
            border-radius: 4px;
            color: white;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1.5px;
            cursor: not-allowed;
            opacity: 0.65;
        }

        .cart-note {
            margin-top: 8px;
            color: var(--muted);
            font-size: 11px;
        }

        /* Common section styles */

        .specifications-section,
        .reviews-section {
            margin-top: 35px;
            padding: 35px;
            background: white;
            border: 1px solid var(--border);
            border-radius: 8px;
        }

        .section-title {
            margin-bottom: 8px;
            color: var(--navy);
            font-family: 'Cormorant Garamond', Georgia, serif;
            font-size: 34px;
            font-weight: 600;
        }

        .section-subtitle {
            margin-bottom: 25px;
            color: var(--muted);
            font-size: 13px;
        }

        /* Specifications */

        .specifications-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            column-gap: 55px;
        }

        .specification-row {
            display: flex;
            justify-content: space-between;
            gap: 15px;
            padding: 16px 0;
            border-bottom: 1px solid var(--border);
            font-size: 13px;
        }

        .specification-name {
            color: var(--muted);
        }

        .specification-value {
            color: var(--navy);
            font-weight: 600;
            text-align: right;
        }

        .empty-specifications {
            color: var(--muted);
            font-size: 13px;
        }

        /* Customer reviews */

        .review-summary {
            padding: 20px;
            margin-bottom: 20px;
            background: #fbfaf7;
            border-radius: 6px;
        }

        .review-score {
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
            color: var(--navy);
            font-size: 14px;
            font-weight: 600;
        }

        .review-stars,
        .individual-stars {
            color: #c59642;
            letter-spacing: 2px;
        }

        .review-card {
            padding: 22px 0;
            border-bottom: 1px solid var(--border);
        }

        .review-card:last-child {
            border-bottom: none;
        }

        .review-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 15px;
        }

        .review-title {
            margin: 0 0 7px;
            color: var(--navy);
            font-size: 15px;
            font-weight: 700;
        }

        .reviewer-name,
        .review-date {
            color: var(--muted);
            font-size: 11px;
        }

        .individual-stars {
            margin-top: 12px;
            font-size: 15px;
        }

        .review-text {
            margin: 10px 0 0;
            color: var(--muted);
            font-size: 13px;
            line-height: 1.8;
        }

        .back-link {
            display: inline-block;
            margin-top: 22px;
            color: var(--navy);
            font-size: 13px;
            text-decoration: none;
        }

        .error-message {
            padding: 60px 20px;
            background: white;
            border-radius: 8px;
            text-align: center;
        }

        @media(max-width: 850px) {
            .product-layout {
                grid-template-columns: 1fr;
                gap: 30px;
                padding: 22px;
            }

            .gallery-main {
                min-height: 380px;
            }

            .main-watch-image {
                height: 360px;
            }
        }

        @media(max-width: 575px) {
            .details-container {
                padding: 22px 13px 50px;
            }

            .product-layout {
                padding: 15px;
            }

            .gallery-main {
                min-height: 290px;
                padding: 12px;
            }

            .main-watch-image {
                height: 275px;
            }

            .gallery-thumbnails {
                gap: 7px;
            }

            .gallery-thumb {
                height: 75px;
                padding: 4px;
            }

            .product-name {
                font-size: 35px;
            }

            .specifications-section,
            .reviews-section {
                padding: 20px 15px;
            }

            .specifications-grid {
                grid-template-columns: 1fr;
            }

            .review-top {
                flex-direction: column;
            }
        }

        /* Keep Customer Reviews typography consistent with WatchVault */

.reviews-section,
.reviews-section * {
    font-family: 'Inter', sans-serif;
}

.reviews-section .section-title,
.reviews-section .review-title {
    font-family: 'Cormorant Garamond', serif;
}

.reviews-section .average-rating {
    font-family: 'Cormorant Garamond', serif;
}

.reviews-section .reviewer-name,
.reviews-section .review-date,
.reviews-section .review-text,
.reviews-section .review-stars,
.reviews-section .individual-stars {
    font-family: 'Inter', sans-serif;
}



/* =================================
   WATCHVAULT CONSISTENT TYPOGRAPHY
================================= */

/* Main product details */
.product-container,
.product-container p,
.product-container span,
.product-container label,
.product-container button,
.product-container input,
.product-meta,
.product-description,
.product-brand,
.quantity-area {
    font-family: 'Inter', sans-serif;
}

/* Elegant headings */
.product-name,
.section-title,
.review-title,
.average-rating {
    font-family: 'Cormorant Garamond', serif;
    font-weight: 600;
}

/* Product name */
.product-name {
    font-size: 38px;
}

/* Product price */
.product-price {
    font-family: 'Inter', sans-serif;
    font-weight: 700;
}

/* Technical specifications */
.specification-row,
.specification-name,
.specification-value {
    font-family: 'Inter', sans-serif;
}

/* Customer reviews */
.reviews-section,
.reviews-section * {
    font-family: 'Inter', sans-serif;
}

.reviews-section .section-title,
.reviews-section .review-title,
.reviews-section .average-rating {
    font-family: 'Cormorant Garamond', serif;
}

.review-text,
.reviewer-name,
.review-date {
    font-family: 'Inter', sans-serif;
}
    </style>
</head>

<body>

<form id="form1" runat="server">

    <wv:Header ID="SiteHeader" runat="server" />

    <main class="details-container">

        <div class="breadcrumb">
            <a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a>
            &nbsp; / &nbsp;
            <a href="<%= ResolveUrl("~/Products/NewArrivals.aspx") %>">New Arrivals</a>
            &nbsp; / &nbsp;
            Product Details
        </div>

        <asp:Panel ID="pnlProduct" runat="server">

            <!-- MAIN PRODUCT DETAILS -->

            <section class="product-layout">

                <!-- PRODUCT IMAGE GALLERY -->

                <div class="product-gallery">

                    <div class="gallery-main">

                        <asp:Image ID="imgProduct"
                            runat="server"
                            ClientIDMode="Static"
                            CssClass="main-watch-image"
                            AlternateText="Watch product" />

                    </div>

                    <asp:Panel ID="pnlGalleryThumbnails"
                        runat="server"
                        CssClass="gallery-thumbnails">

                        <asp:Repeater ID="rptGallery" runat="server">

                            <ItemTemplate>

                                <button type="button"
                                    class="gallery-thumb"
                                    onclick="changeProductImage(this)"
                                    data-image='<%#: Eval("ResolvedUrl") %>'
                                    data-alt='<%#: Eval("AltText") %>'>

                                    <asp:Image ID="imgThumbnail"
                                        runat="server"
                                        ImageUrl='<%# Eval("ResolvedUrl") %>'
                                        AlternateText='<%# Eval("AltText") %>' />

                                </button>

                            </ItemTemplate>

                        </asp:Repeater>

                    </asp:Panel>

                    <div class="gallery-note">
                        Select an image to view different angles
                    </div>

                </div>

                <!-- PRODUCT INFORMATION -->

                <div class="product-information">

                    <p class="product-brand">
                        <asp:Literal ID="litBrand" runat="server" />
                    </p>

                    <h1 class="product-name">
                        <asp:Literal ID="litName" runat="server" />
                    </h1>

                    <div class="product-price">
                        NPR <asp:Literal ID="litPrice" runat="server" />
                    </div>

                    <p class="shipping-note">
                        Shipping is calculated at checkout.
                    </p>

                    <div class="detail-row">
                        <span class="detail-label">Category</span>
                        <span class="detail-value">
                            <asp:Literal ID="litCategory" runat="server" />
                        </span>
                    </div>

                    <div class="detail-row">
                        <span class="detail-label">Availability</span>
                        <span class="detail-value">
                            <asp:Literal ID="litStock" runat="server" />
                        </span>
                    </div>

                    <h3 class="description-heading">DESCRIPTION</h3>

                    <p class="description">
                        <asp:Literal ID="litDescription" runat="server" />
                    </p>

                    <!-- QUANTITY SELECTOR -->

                    <div class="quantity-heading">
                        SELECT QUANTITY
                    </div>

                    <div class="quantity-control">

                        <button type="button"
                            onclick="changeQuantity(-1)"
                            aria-label="Decrease quantity">
                            −
                        </button>

                        <asp:TextBox ID="txtQuantity"
                            runat="server"
                            ClientIDMode="Static"
                            Text="1"
                            TextMode="Number"
                            CssClass="quantity-input" />

                        <button type="button"
                            onclick="changeQuantity(1)"
                            aria-label="Increase quantity">
                            +
                        </button>

                    </div>

                    <asp:Button ID="btnAddToCart"
                        runat="server"
                        Text="ADD TO CART"
                        CssClass="cart-button"
                        Enabled="false"
                        ToolTip="Shopping cart integration will be connected in the next step." />

                    <p class="cart-note">
                        Shopping cart functionality will be connected after the product details.
                    </p>

                    <a href="<%= ResolveUrl("~/Products/NewArrivals.aspx") %>"
                       class="back-link">
                        &larr; Continue shopping
                    </a>

                </div>

            </section>

            <!-- TECHNICAL SPECIFICATIONS -->

            <section class="specifications-section">

                <h2 class="section-title">
                    Technical Specifications
                </h2>

                <p class="section-subtitle">
                    Detailed information about this timepiece.
                </p>

                <asp:Panel ID="pnlSpecifications"
                    runat="server">

                    <div class="specifications-grid">

                        <asp:Repeater ID="rptSpecifications"
                            runat="server">

                            <ItemTemplate>

                                <div class="specification-row">

                                    <span class="specification-name">
                                        <%#: Eval("SpecificationName") %>
                                    </span>

                                    <span class="specification-value">
                                        <%#: Eval("SpecificationValue") %>
                                    </span>

                                </div>

                            </ItemTemplate>

                        </asp:Repeater>

                    </div>

                </asp:Panel>

                <asp:Panel ID="pnlNoSpecifications"
                    runat="server"
                    Visible="false">

                    <p class="empty-specifications">
                        Specifications for this watch will be available soon.
                    </p>

                </asp:Panel>

            </section>

            <!-- CUSTOMER REVIEWS -->

            <section class="reviews-section">

                <h2 class="section-title">
                    Customer Reviews
                </h2>

                <p class="section-subtitle">
                    See what customers think about this timepiece.
                </p>

                <div class="review-summary">

                    <div class="review-score">

                        <asp:Literal ID="litAverageRating"
                            runat="server" />

                        <span class="review-stars">
                            <asp:Literal ID="litRatingStars"
                                runat="server" />
                        </span>

                        <span>
                            <asp:Literal ID="litReviewCount"
                                runat="server" />
                        </span>

                    </div>

                </div>

                <asp:Repeater ID="rptReviews" runat="server">

                    <ItemTemplate>

                        <article class="review-card">

                            <div class="review-top">

                                <div>

                                    <h3 class="review-title">
                                        <%#: Eval("ReviewTitle") %>
                                    </h3>

                                    <span class="reviewer-name">
                                        By <%#: Eval("ReviewerName") %>
                                    </span>

                                </div>

                                <span class="review-date">
                                    <%# Eval("CreatedAt", "{0:dd MMM yyyy}") %>
                                </span>

                            </div>

                            <div class="individual-stars">
                                <%# new string('★', Convert.ToInt32(Eval("Rating"))) %><%# new string('☆', 5 - Convert.ToInt32(Eval("Rating"))) %>
                            </div>

                            <p class="review-text">
                                <%#: Eval("ReviewText") %>
                            </p>

                        </article>

                    </ItemTemplate>

                </asp:Repeater>

                <asp:Panel ID="pnlNoReviews"
                    runat="server"
                    Visible="false">

                    <p class="empty-specifications">
                        No reviews have been submitted for this watch yet.
                    </p>

                </asp:Panel>

            </section>

        </asp:Panel>

        <!-- PRODUCT NOT FOUND -->

        <asp:Panel ID="pnlNotFound"
            runat="server"
            CssClass="error-message"
            Visible="false">

            <h2>Watch not found</h2>

            <p>The requested product could not be found.</p>

            <a href="<%= ResolveUrl("~/Products/NewArrivals.aspx") %>"
               class="back-link">
                Return to New Arrivals
            </a>

        </asp:Panel>

    </main>

    <wv:Footer ID="SiteFooter" runat="server" />

</form>

<script>
// Change the main image when a thumbnail is clicked.
function changeProductImage(button) {

    var mainImage = document.getElementById("imgProduct");

    if (!mainImage || !button) {
        return;
    }

    mainImage.src = button.getAttribute("data-image");
    mainImage.alt = button.getAttribute("data-alt") || "Watch product";

    var thumbnails = document.querySelectorAll(".gallery-thumb");

    thumbnails.forEach(function (thumbnail) {
        thumbnail.classList.remove("active");
    });

    button.classList.add("active");
}

// Increase or decrease the selected quantity.
function changeQuantity(amount) {

    var quantityInput = document.getElementById("txtQuantity");

    if (!quantityInput) {
        return;
    }

    var current = parseInt(quantityInput.value, 10);

    if (isNaN(current)) {
        current = 1;
    }

    var minimum = parseInt(quantityInput.min || "1", 10);
    var maximum = parseInt(quantityInput.max || "999", 10);

    var newQuantity = current + amount;

    if (newQuantity < minimum) {
        newQuantity = minimum;
    }

    if (newQuantity > maximum) {
        newQuantity = maximum;
    }

    quantityInput.value = newQuantity;
}

// Highlight the first thumbnail when the page loads.
document.addEventListener("DOMContentLoaded", function () {

    var firstThumbnail = document.querySelector(".gallery-thumb");

    if (firstThumbnail) {
        firstThumbnail.classList.add("active");
    }
});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
