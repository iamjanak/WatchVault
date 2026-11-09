
<%@ Page Title="Home| WatchVault" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WatchVault._Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>WatchVault | Luxury Timepieces & Horology</title>
    <meta name="description" content="Discover exquisite timepieces at WatchVault." />

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Manrope:wght@300;400;500;600;700;800&display=swap"
          rel="stylesheet" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <link href="Content/Site.css" rel="stylesheet" />

    <style>
        :root {
            --ink: #0B1F3A;
            --ink-secondary: #15365B;
            --brass: #4F8FCB;
            --brass-light: #93C5FD;
            --brass-dark: #2F6FA8;
            --surface: #F3F6FA;
            --surface-card: #FFFFFF;
            --border-color: #DCE5EF;
            --text-main: #1E293B;
            --text-muted: #64748B;
            --transition-smooth: all .3s cubic-bezier(.4,0,.2,1);
        }

        html {
            scroll-behavior: smooth;
            scroll-padding-top: 90px;
        }

        body {
            margin: 0;
            color: var(--text-main);
            font-family: 'Manrope', sans-serif;
            background: #fff;
            overflow-x: hidden;
        }

        h1, h2, h3, h4, .serif {
            font-family: "Instrument Serif", Georgia, serif;
            font-weight: 400;
            letter-spacing: .02em;
        }

        :focus-visible {
            outline: 2px solid var(--brass);
            outline-offset: 2px;
        }

        /* HEADER */

        .wv-header {
            position: sticky;
            top: 0;
            z-index: 1030;
            background: rgba(255,255,255,.94);
            backdrop-filter: blur(12px);
            padding: .75rem 0;
            border-bottom: 1px solid var(--border-color);
            box-shadow: 0 4px 20px rgba(11,31,58,.04);
        }

        .wv-brand {
            display: flex;
            align-items: center;
            gap: .75rem;
            color: var(--ink);
            font-family: "Instrument Serif", Georgia, serif;
            font-size: 2.1rem;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            text-decoration: none;
        }

        .wv-brand:hover {
            color: var(--brass-dark);
        }

        .wv-brand svg {
            width: 32px;
            height: 44px;
            color: var(--brass);
            flex: none;
        }

        .wv-nav .nav-link {
            color: var(--text-main);
            font-size: .95rem;
            font-weight: 500;
            padding: .5rem .9rem;
        }

        .wv-nav .nav-link:hover {
            color: var(--brass-dark);
        }

        .wv-nav .dropdown-menu {
            border: 1px solid var(--border-color);
            border-radius: 12px;
            box-shadow: 0 15px 35px rgba(11,31,58,.08);
            padding: .5rem;
        }

        .wv-nav .dropdown-item {
            border-radius: 8px;
            font-size: .9rem;
            padding: .5rem .85rem;
            color: var(--text-main);
        }

        .wv-nav .dropdown-item:hover {
            background: var(--surface);
            color: var(--brass-dark);
        }

        .wv-search-bar {
            display: flex;
            align-items: center;
            width: 240px;
            background: var(--surface);
            border: 1px solid var(--border-color);
            border-radius: 30px;
            padding: .2rem .4rem .2rem .9rem;
        }

        .wv-search-bar input {
            flex: 1;
            min-width: 0;
            border: 0;
            outline: none;
            font-size: .88rem;
            background: transparent;
        }

        .wv-search-bar button {
            border: 0;
            background: var(--ink);
            color: white;
            width: 32px;
            height: 32px;
            border-radius: 50%;
            display: grid;
            place-items: center;
            cursor: pointer;
        }

        .wv-search-bar svg,
        .wv-bag svg {
            width: 18px;
            height: 18px;
        }

        .wv-bag {
            position: relative;
            color: var(--text-main);
            padding: .4rem;
            display: grid;
            place-items: center;
            border-radius: 50%;
            background: var(--surface);
        }

        .wv-bag:hover {
            background: var(--brass);
            color: white;
        }

        .wv-login {
            color: var(--text-main);
            font-size: .9rem;
            font-weight: 600;
            text-decoration: none;
            padding: .5rem 1rem;
            border-radius: 30px;
            border: 1px solid var(--border-color);
        }

        .wv-login:hover {
            border-color: var(--brass);
            color: var(--brass-dark);
            background: var(--surface);
        }

        .wv-toggler {
            border: 1px solid var(--border-color);
            border-radius: 8px;
        }

        /* HERO */

        .hero {
            position: relative;
            background: radial-gradient(circle at 75% 30%, #16283F 0%, var(--ink) 70%);
            color: white;
            padding: 7rem 0 6rem;
            overflow: hidden;
        }

        .hero::before {
            content: '';
            position: absolute;
            inset: 0;
            background: radial-gradient(circle at 20% 80%, rgba(79,143,203,.08), transparent 50%);
            pointer-events: none;
        }

        .hero h1 {
            font-size: clamp(3rem, 6.5vw, 5.5rem);
            line-height: .98;
            margin-bottom: 1.5rem;
        }

        .hero h1 em {
            color: var(--brass-light);
            font-style: italic;
        }

        .hero .lead {
            color: #94A3B8;
            max-width: 33rem;
            line-height: 1.7;
            font-size: 1.1rem;
            font-weight: 300;
        }

        .hero-search-box {
            display: flex;
            gap: .5rem;
            max-width: 36rem;
            background: rgba(255,255,255,.07);
            border: 1px solid rgba(255,255,255,.15);
            border-radius: 16px;
            padding: .5rem;
        }

        .hero-search-box input {
            min-width: 0;
            flex: 1;
            border: 0;
            background: transparent;
            padding: .75rem 1rem;
            color: white;
            outline: none;
        }

        .hero-search-box input::placeholder {
            color: #94A3B8;
        }

        .btn {
            border-radius: 12px;
            font-weight: 600;
            padding: .75rem 1.75rem;
            transition: var(--transition-smooth);
        }

        .btn-brass {
            background: var(--brass);
            border: 1px solid var(--brass);
            color: var(--ink);
        }

        .btn-brass:hover {
            background: var(--brass-light);
            color: var(--ink);
            transform: translateY(-2px);
        }

        .btn-outline-light-custom {
            color: white;
            border: 1px solid rgba(255,255,255,.25);
            background: transparent;
        }

        .btn-outline-light-custom:hover {
            background: rgba(255,255,255,.1);
            color: white;
        }

        /* HERO WATCH IMAGE */

        .dial-container {
            max-width: 400px;
            margin: auto;
            position: relative;
            text-align: center;
        }

        .home-watch-container {
            padding: 1rem;
        }

        .home-watch-image {
            display: block;
            width: 250%;
            height: 400px;
            max-width: 100%;
            object-fit: contain;
            object-position: center;
            margin: 0 auto;

            filter: drop-shadow(0 30px 40px rgba(0,0,0,.5));

            transition: transform .4s ease;
        }

        .home-watch-image:hover {
            transform: scale(1.04);
        }

        .clock-badge {
            background: rgba(11,31,58,.7);
            border: 1px solid rgba(79,143,203,.3);
            color: #CBD5E1;
            text-align: center;
            font-size: .8rem;
            letter-spacing: 2px;
            padding: .6rem 1rem;
            border-radius: 30px;
            margin-top: 1.2rem;
        }

        .clock-badge span {
            color: var(--brass-light);
            font-weight: 700;
        }

        /* ASSURANCE */

        .assure {
            background: var(--surface);
            border-top: 1px solid var(--border-color);
            border-bottom: 1px solid var(--border-color);
            padding: 1.5rem 0;
        }

        .assure-item {
            display: flex;
            gap: 1rem;
            align-items: center;
            padding: .75rem 1rem;
        }

        .assure-item svg {
            width: 32px;
            height: 32px;
            color: var(--brass-dark);
            flex: none;
        }

        .assure-item strong {
            display: block;
            font-size: .95rem;
            color: var(--ink);
        }

        .assure-item span {
            color: var(--text-muted);
            font-size: .83rem;
        }

        /* SECTIONS */

        .section {
            padding: 6rem 0;
        }

        .section-head {
            max-width: 44rem;
            margin-bottom: 3rem;
        }

        .section-head h2 {
            font-size: clamp(2.3rem, 4.5vw, 3.5rem);
            line-height: 1.1;
            color: var(--ink);
            margin-bottom: .75rem;
        }

        .section-head p {
            color: var(--text-muted);
            line-height: 1.7;
            font-size: 1.05rem;
        }

        /* CATEGORIES */

        .category-card {
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            min-height: 180px;
            padding: 1.5rem;
            color: var(--ink);
            text-decoration: none;
            background: white;
            border: 1px solid var(--border-color);
            border-radius: 16px;
            transition: var(--transition-smooth);
        }

        .category-card:hover {
            border-color: var(--brass);
            transform: translateY(-4px);
            box-shadow: 0 15px 30px rgba(11,31,58,.06);
            color: var(--ink);
        }

        .category-card svg {
            width: 36px;
            height: 36px;
            color: var(--brass);
        }

        .category-card h3 {
            font-size: 1.6rem;
            margin: .8rem 0 .2rem;
        }

        .category-card small {
            color: var(--text-muted);
        }

        /* PRODUCT CARDS */

        .product-card {
            display: flex;
            flex-direction: column;
            height: 100%;
            background: var(--surface-card);
            border: 1px solid var(--border-color);
            border-radius: 18px;
            overflow: hidden;
            transition: var(--transition-smooth);
        }

        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 20px 40px rgba(11,31,58,.08);
            border-color: #CBD5E1;
        }

        /* PRODUCT IMAGE FRAME */

        .product-art {
            position: relative;
            display: grid;
            place-items: center;
            height: 280px;
            min-height: 280px;
            background: var(--surface);
            padding: 1.2rem;
            overflow: hidden;
        }

        .product-art img,
        .product-art img.watch-image {
            width: 70% !important;
            height: 100% !important;
            max-width: 100% !important;
            max-height: 100% !important;
            object-fit: contain !important;
            object-position: center;
            display: block;
            transform: scale(1.35);
            transition: transform .4s ease;
        }

        .product-card:hover .product-art img {
            transform: scale(1.45);
        }

        .product-tag {
            position: absolute;
            top: 1rem;
            left: 1rem;
            z-index: 2;
            background: var(--ink);
            color: white;
            padding: .3rem .75rem;
            border-radius: 30px;
            font-size: .72rem;
            font-weight: 700;
            letter-spacing: .5px;
            text-transform: uppercase;
        }

        .product-body {
            padding: 1.5rem;
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        .brand-name {
            color: var(--brass-dark);
            font-size: .8rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .product-body h3 {
            font-size: 1.6rem;
            margin: .2rem 0 .75rem;
            color: var(--ink);
        }

        .spec-list {
            list-style: none;
            padding: 0;
            margin: 0 0 1.2rem;
            color: var(--text-muted);
            font-size: .85rem;
        }

        .spec-list li {
            padding: .2rem 0;
        }

        .product-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: .5rem;
            margin-top: auto;
            padding-top: 1rem;
            border-top: 1px solid var(--border-color);
        }

        .price {
            font-size: 1.15rem;
            font-weight: 800;
            color: var(--ink);
        }

        /* DARK SECTION */

        .dark-section {
            background: var(--ink);
            color: white;
        }

        .dark-section .section-head h2 {
            color: white;
        }

        .dark-section .section-head p {
            color: #94A3B8;
        }

        .feature-item {
            background: rgba(255,255,255,.03);
            border: 1px solid rgba(255,255,255,.08);
            border-radius: 16px;
            padding: 2rem;
            height: 100%;
            transition: var(--transition-smooth);
        }

        .feature-item:hover {
            border-color: var(--brass);
            background: rgba(255,255,255,.06);
            transform: translateY(-3px);
        }

        .feature-icon {
            width: 48px;
            height: 48px;
            background: rgba(79,143,203,.1);
            color: var(--brass-light);
            border-radius: 12px;
            display: grid;
            place-items: center;
            margin-bottom: 1.25rem;
        }

        .feature-item h3 {
            font-size: 1.6rem;
            margin-bottom: .75rem;
            color: white;
        }

        .feature-item p {
            color: #94A3B8;
            line-height: 1.7;
            font-size: .95rem;
            margin: 0;
        }

        /* COMPARISON */

        .compare-table-wrapper {
            background: white;
            border: 1px solid var(--border-color);
            border-radius: 16px;
            overflow-x: auto;
            box-shadow: 0 10px 30px rgba(10,17,24,.03);
        }

        .compare-table {
            width: 100%;
            border-collapse: collapse;
            font-size: .92rem;
            margin: 0;
        }

        .compare-table th,
        .compare-table td {
            padding: 1.1rem 1.2rem;
            border-bottom: 1px solid var(--border-color);
            text-align: left;
            white-space: nowrap;
        }

        .compare-table thead th {
            background: var(--surface);
            font-family: "Instrument Serif", Georgia, serif;
            font-size: 1.35rem;
            color: var(--ink);
        }

        .compare-table tbody th {
            color: var(--text-muted);
            font-weight: 600;
            font-size: .85rem;
            background: #FAFAFB;
        }

        /* JOURNEY */

        .steps {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 1.5rem;
            list-style: none;
            padding: 0;
            margin: 0;
            counter-reset: step;
        }

        .steps li {
            counter-increment: step;
            background: var(--surface);
            border: 1px solid var(--border-color);
            border-radius: 16px;
            padding: 2rem;
            transition: var(--transition-smooth);
        }

        .steps li:hover {
            border-color: var(--brass);
            background: white;
            transform: translateY(-3px);
        }

        .steps li::before {
            content: counter(step, decimal-leading-zero);
            display: block;
            color: var(--brass-dark);
            font-family: "Instrument Serif", Georgia, serif;
            font-size: 2.8rem;
            margin-bottom: .5rem;
        }

        .steps h3 {
            font-size: 1.5rem;
            color: var(--ink);
        }

        .steps p {
            color: var(--text-muted);
            font-size: .92rem;
            line-height: 1.6;
        }

        /* WARRANTY */

        .warranty-panel {
            background: linear-gradient(135deg, var(--surface), white);
            border: 1px solid var(--border-color);
            border-radius: 24px;
            padding: 3rem;
            box-shadow: 0 15px 35px rgba(10,17,24,.03);
        }

        .warranty-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .warranty-list li {
            padding: .6rem 0;
            display: flex;
            align-items: center;
            font-weight: 500;
        }

        .warranty-list li::before {
            content: "✓";
            display: inline-grid;
            place-items: center;
            width: 24px;
            height: 24px;
            background: rgba(79,143,203,.15);
            color: var(--brass-dark);
            border-radius: 50%;
            margin-right: .85rem;
            flex: none;
        }

        /* FAQ */

        .accordion-item {
            border: 1px solid var(--border-color) !important;
            border-radius: 12px !important;
            overflow: hidden;
            margin-bottom: 1rem;
        }

        .accordion-button {
            font-weight: 600;
            color: var(--ink);
            padding: 1.25rem 1.5rem;
            font-size: 1.05rem;
            background: white;
            box-shadow: none !important;
        }

        .accordion-button:not(.collapsed) {
            background: var(--surface);
            color: var(--brass-dark);
        }

        .accordion-body {
            padding: 1.25rem 1.5rem 1.5rem;
            color: var(--text-muted);
            line-height: 1.7;
        }

        /* FOOTER */

        footer {
            background: var(--ink);
            color: #94A3B8;
            padding: 4rem 0 2rem;
            font-size: .92rem;
        }

        footer h4 {
            color: white;
            font-size: 1.1rem;
            margin-bottom: 1.25rem;
        }

        footer a {
            display: block;
            color: #94A3B8;
            text-decoration: none;
            padding: .35rem 0;
        }

        footer a:hover {
            color: var(--brass-light);
        }

        .legal {
            border-top: 1px solid rgba(255,255,255,.08);
            margin-top: 3rem;
            padding-top: 1.5rem;
            font-size: .85rem;
        }

        /* RESPONSIVE */

        @media(max-width:991px) {

            .hero {
                padding: 4.5rem 0;
                text-align: center;
            }

            .hero .lead {
                margin-left: auto;
                margin-right: auto;
            }

            .hero-search-box {
                margin-left: auto;
                margin-right: auto;
            }

            .dial-container {
                max-width: 350px;
                margin-top: 2.5rem;
            }

            .home-watch-image {
                height: 320px;
            }

            .steps {
                grid-template-columns: repeat(2, 1fr);
            }

            .wv-search-bar {
                width: 100%;
                margin-top: .5rem;
            }
        }

        @media(max-width:575px) {

            .section {
                padding: 4rem 0;
            }

            .steps {
                grid-template-columns: 1fr;
            }

            .warranty-panel {
                padding: 1.5rem;
            }

            .product-art {
                height: 260px;
                min-height: 260px;
            }

                .product-art img,
                .product-art img.watch-image {
                    transform: scale(1.25);
                }

            .product-card:hover .product-art img {
                transform: scale(1.35);
            }

            .home-watch-image {
                height: 280px;
            }

            .product-footer {
                flex-wrap: wrap;
            }
        }
        /* Dropdown menu */
        .dropdown-menu {
            padding: 0;
            margin: 0;
            background-color: #fff;
            border: 1px solid #e5e7eb;
        }

            /* Dropdown menu links */
            .dropdown-menu a {
                display: block;
                color: #172b4d !important;
                text-decoration: none !important;
                padding: 10px 14px;
                font-size: 14px;
                line-height: 1.4;
            }

                /* Hover effect */
                .dropdown-menu a:hover {
                    color: #365fce !important;
                    background-color: #f8f9fa;
                    text-decoration: none !important;
                }

                /* Visited links */
                .dropdown-menu a:visited {
                    color: #172b4d !important;
                }
    </style>
</head>

<body>

<form id="form1" runat="server">

    <!-- HEADER -->
    <nav class="wv-header navbar navbar-expand-lg" aria-label="Main navigation">

        <div class="container">

            <a class="wv-brand" href="Default.aspx">

                <svg viewBox="0 0 30 42" fill="none"
                     stroke="currentColor" stroke-width="1.5">

                    <path d="M10 1h10l1.5 8h-13zM8.5 33h13L20 41H10z" />
                    <circle cx="15" cy="21" r="11" />
                    <path d="M15 14v7l4 3" />

                </svg>

                WatchVault

            </a>

            <button class="navbar-toggler wv-toggler"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#mainNav"
                    aria-controls="mainNav"
                    aria-expanded="false"
                    aria-label="Toggle navigation">

                <span class="navbar-toggler-icon"></span>

            </button>

            <div class="collapse navbar-collapse" id="mainNav">

                <ul class="navbar-nav wv-nav mx-auto align-items-lg-center">

                    <li class="nav-item">
                        <a class="nav-link active" href="Default.aspx">Home</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="About.aspx">About Us</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link"
                           href="<%= ResolveUrl("~/Products/NewArrivals.aspx") %>">
                            New Arrivals
                        </a>
                    </li>

                    <li class="nav-item dropdown">

                        <a class="nav-link dropdown-toggle"
                           href="Products.aspx"
                           role="button"
                           data-bs-toggle="dropdown">
                            Watches
                        </a>

                        <ul class="dropdown-menu">

                            <li>
                                <a href="<%= ResolveUrl("~/Products/Watches.aspx") %>">Watches
                                </a>
                            </li>

                            <li>
                                <a href="<%= ResolveUrl("~/Products/ForMen.aspx") %>"> For Men
                                </a>
                            </li>
                            <li>
                                <a href="<%= ResolveUrl("~/Products/ForWomen.aspx") %>">For Women
                              </a>
                            </li>

                            <li>
                                <a href="<%= ResolveUrl("~/Products/ForSports.aspx") %>">Sports
                          </a>
                            </li>
                                                        
                        </ul>

                    </li>

                    

                    </li>

                    <li>
                        <a class="dropdown-item" href="/Products/ServiceCenter.aspx">Service Center
                        </a>
                    </li>

                </ul>

                <div class="d-flex align-items-center gap-3 flex-wrap">

                    <div class="wv-search-bar" role="search">

                        <input type="search"
                               id="headerSearch"
                               maxlength="80"
                               placeholder="Search timepieces..."
                               aria-label="Search watches" />

                        <button type="button"
                                id="headerSearchBtn"
                                aria-label="Search">

                            <svg viewBox="0 0 24 24"
                                 fill="none"
                                 stroke="currentColor"
                                 stroke-width="2.5">

                                <circle cx="11" cy="11" r="7" />
                                <path d="M20 20l-4-4" />

                            </svg>

                        </button>

                    </div>

                    <a class="wv-bag"
                        href="<%= ResolveUrl("~/Products/Cart.aspx") %>"
                        aria-label="Shopping bag">

                        <svg viewBox="0 0 24 24"
                             fill="none"
                             stroke="currentColor"
                             stroke-width="2">

                            <path d="M5 8h14l-1 12H6L5 8z" />
                            <path d="M9 8V6a3 3 0 0 1 6 0v2" />

                        </svg>

                    </a>

                    <asp:PlaceHolder ID="phGuest" runat="server">

                        <a class="wv-login" href="Login.aspx">
                            Sign In
                        </a>

                    </asp:PlaceHolder>

                    <asp:PlaceHolder ID="phUser" runat="server" Visible="false">

                        <div class="dropdown">

                            <a class="wv-login dropdown-toggle"
                               href="#"
                               role="button"
                               data-bs-toggle="dropdown">

                                Hi,
                                <asp:Literal ID="litUserName" runat="server" />

                            </a>

                            <ul class="dropdown-menu dropdown-menu-end">

                                <li>
                                    <a class="dropdown-item"
                                        href="<%= ResolveUrl("~/Products/Profile.aspx") %>">
                                        <i class="fa-regular fa-user me-2"></i>
                                        My Profile
                                    </a>
                                </li>

                                <li>
                                    <a class="dropdown-item"
                                        href="<%= ResolveUrl("~/Orders.aspx") %>">
                                        <i class="fa-solid fa-box me-2"></i>
                                        My Orders
                                    </a>
                                </li>

                                <li>
                                    <a class="dropdown-item"
                                        href="<%= ResolveUrl("~/Wishlist.aspx") %>">
                                        <i class="fa-regular fa-heart me-2"></i>
                                        Wishlist
                                    </a>
                                </li>

                                <li>
                                    <hr class="dropdown-divider" />
                                </li>
                                <li>

                                    <asp:LinkButton ID="btnLogout"
                                                    runat="server"
                                                    CssClass="dropdown-item text-danger"
                                                    CausesValidation="false"
                                                    OnClick="btnLogout_Click">

                                        Log Out

                                    </asp:LinkButton>

                                </li>

                            </ul>

                        </div>

                    </asp:PlaceHolder>

                </div>

            </div>

        </div>

    </nav>

    <main>

        <!-- HERO -->
        <header class="hero">

            <div class="container">

                <div class="row align-items-center g-5">

                    <div class="col-lg-7">

                        <span class="text-uppercase fw-bold mb-3 d-inline-block"
                              style="letter-spacing:4px;color:var(--brass-light);font-size:.85rem;">

                            Exquisite Horology & Precision

                        </span>

                        <h1>
                            Time is precious.<br />
                            Wear it <em>well.</em>
                        </h1>

                        <p class="lead mt-3 mb-4">

                            Explore masterpieces crafted for every milestone.
                            Compare meticulous technical details, verify authentic
                            specifications, and select a watch tailored to your identity.

                        </p>

                        <div class="hero-search-box mb-4" role="search">

                            <input type="search"
                                   id="searchBox"
                                   maxlength="80"
                                   placeholder="Search by brand, model or movement..."
                                   aria-label="Search watches" />

                            <button type="button"
                                    class="btn btn-brass"
                                    id="searchButton">

                                Explore

                            </button>

                        </div>

                        <div class="d-flex flex-wrap gap-3">

                            <a href="#featured" class="btn btn-brass btn-lg">
                                Featured Timepieces
                            </a>

                            <a href="Products.aspx"
                               class="btn btn-outline-light-custom btn-lg">

                                Browse Catalog

                            </a>

                        </div>

                    </div>

                    <!-- UPDATED HERO WATCH IMAGE -->
                    <div class="col-lg-5">

                        <div class="dial-container home-watch-container">

                            <img src="<%= ResolveUrl("~/Images/home-watch.png") %>"
                                 alt="Luxury WatchVault Timepiece"
                                 class="home-watch-image"
                                 loading="eager"
                                 onerror="this.onerror=null;this.alt='Watch image not found. Check Images/home-watch.png';" />

                            <div class="clock-badge">

                                LIVE LOCAL TIME •
                                <span id="digitalTime">Loading...</span>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </header>

        <!-- ASSURANCE BAR -->
        <section class="assure" aria-label="Store highlights">

            <div class="container">

                <div class="row g-3">

                    <div class="col-6 col-lg-3">

                        <div class="assure-item">

                            <div>
                                <strong>Verified Warranty</strong>
                                <span>Manufacturer warranty information.</span>
                            </div>

                        </div>

                    </div>

                    <div class="col-6 col-lg-3">

                        <div class="assure-item">

                            <div>
                                <strong>Side-by-Side Specs</strong>
                                <span>Detailed watch comparison.</span>
                            </div>

                        </div>

                    </div>

                    <div class="col-6 col-lg-3">

                        <div class="assure-item">

                            <div>
                                <strong>Secure Tracking</strong>
                                <span>Order tracking updates.</span>
                            </div>

                        </div>

                    </div>

                    <div class="col-6 col-lg-3">

                        <div class="assure-item">

                            <div>
                                <strong>Responsive Design</strong>
                                <span>Desktop and mobile support.</span>
                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <!-- CATEGORIES -->
        <section class="section" id="categories">

            <div class="container">

                <div class="section-head">

                    <h2>Browse by Style</h2>

                    <p>
                        Curated categories designed to match your taste,
                        environment and movement preference.
                    </p>

                </div>

                <div class="row g-4">

                    <div class="col-6 col-md-4 col-lg">

                        <a class="category-card" href="Products.aspx?category=Dress">

                            <div>
                                <h3>Dress</h3>
                                <small>Formal Elegance</small>
                            </div>

                        </a>

                    </div>

                    <div class="col-6 col-md-4 col-lg">

                        <a class="category-card" href="Products.aspx?category=Sport">

                            <div>
                                <h3>Sport</h3>
                                <small>Active & Durable</small>
                            </div>

                        </a>

                    </div>

                    <div class="col-6 col-md-4 col-lg">

                        <a class="category-card" href="Products.aspx?category=Dive">

                            <div>
                                <h3>Dive</h3>
                                <small>High Pressure Ready</small>
                            </div>

                        </a>

                    </div>

                    <div class="col-6 col-md-4 col-lg">

                        <a class="category-card" href="Products.aspx?category=Chronograph">

                            <div>
                                <h3>Chronograph</h3>
                                <small>Precision Timing</small>
                            </div>

                        </a>

                    </div>

                    <div class="col-6 col-md-4 col-lg">

                        <a class="category-card" href="Products.aspx?category=Smart">

                            <div>
                                <h3>Smart</h3>
                                <small>Modern Connectivity</small>
                            </div>

                        </a>

                    </div>

                </div>

            </div>

        </section>

        <!-- FEATURED COLLECTION -->
        <section class="section pt-0" id="featured">

            <div class="container">

                <div class="d-flex flex-wrap justify-content-between align-items-end gap-3 mb-4">

                    <div class="section-head mb-0">

                        <h2>Featured Collection</h2>

                        <p class="mb-0">
                            Discover exceptional timepieces selected for style,
                            craftsmanship and precision.
                        </p>

                    </div>

                    <a class="btn btn-outline-dark px-4 py-2"
                       href="Products.aspx"
                       style="border-radius:12px;font-weight:600;">

                        View All Timepieces

                    </a>

                </div>

                <div class="row g-4" id="productGrid">

                    <!-- BAUME & MERCIER -->
                    <div class="col-md-6 col-lg-4">

                        <div class="product-card">

                            <div class="product-art">

                                <span class="product-tag">Featured</span>

                                <img src="<%= ResolveUrl("~/Images/BAUME & MERCIER -Riviera 10846.png") %>"
                                     alt="Baume & Mercier Riviera 10846"
                                     loading="lazy"
                                     onerror="this.onerror=null;this.alt='Baume & Mercier image not found';" />

                            </div>

                            <div class="product-body">

                                <span class="brand-name">BAUME & MERCIER</span>

                                <h3>Riviera 10846</h3>

                                <ul class="spec-list">
                                    <li>• Movement: Automatic</li>
                                    <li>• Case: Stainless Steel</li>
                                    <li>• Design: Twelve-Sided Bezel</li>
                                </ul>

                                <div class="product-footer">

                                    <span class="price">NPR 12,400</span>

                                    <a href="Products.aspx?id=2"
                                       class="btn btn-sm btn-outline-dark">

                                        View Details

                                    </a>

                                </div>

                            </div>

                        </div>

                    </div>

                    <!-- CITIZEN -->
                    <div class="col-md-6 col-lg-4">

                        <div class="product-card">

                            <div class="product-art">

                                <span class="product-tag">Popular</span>

                                <img src="<%= ResolveUrl("~/Images/Citizen-Tsuyosa-NJ0150-81X.png") %>"
                                     alt="Citizen Tsuyosa NJ0150-81X"
                                     loading="lazy"
                                     onerror="this.onerror=null;this.alt='Citizen image not found';" />

                            </div>

                            <div class="product-body">

                                <span class="brand-name">CITIZEN</span>

                                <h3>Tsuyosa NJ0150-81X</h3>

                                <ul class="spec-list">
                                    <li>• Movement: Automatic</li>
                                    <li>• Case: Stainless Steel</li>
                                    <li>• Dial: Emerald Green</li>
                                    <li>• Design: Integrated Bracelet</li>
                                </ul>

                                <div class="product-footer">

                                    <span class="price">NPR 15,500</span>

                                    <a href="Products.aspx"
                                       class="btn btn-sm btn-outline-dark">

                                        View Details

                                    </a>

                                </div>

                            </div>

                        </div>

                    </div>

                    <!-- ORIENT -->
                    <div class="col-md-6 col-lg-4">

                        <div class="product-card">

                            <div class="product-art">

                                <span class="product-tag">Classic</span>

                                <img src="<%= ResolveUrl("~/Images/Orient-Bambino-Version-7.png") %>"
                                     alt="Orient Bambino Version 7"
                                     loading="lazy"
                                     onerror="this.onerror=null;this.alt='Orient image not found';" />

                            </div>

                            <div class="product-body">

                                <span class="brand-name">ORIENT</span>

                                <h3>Bambino Version 7</h3>

                                <ul class="spec-list">
                                    <li>• Movement: Automatic</li>
                                    <li>• Case: Stainless Steel</li>
                                    <li>• Dial: Cream White</li>
                                    <li>• Design: Classic Dress Watch</li>
                                </ul>

                                <div class="product-footer">

                                    <span class="price">NPR 13,500</span>

                                    <a href="Products.aspx"
                                       class="btn btn-sm btn-outline-dark">

                                        View Details

                                    </a>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <!-- WHY WATCHVAULT -->
        <section class="section dark-section" id="why">

            <div class="container">

                <div class="section-head">

                    <h2>Designed for the Informed Collector</h2>

                    <p>
                        We provide detailed specifications so you can shop
                        with clarity and confidence.
                    </p>

                </div>

                <div class="row g-4">

                    <div class="col-md-6 col-lg-3">

                        <div class="feature-item">

                            <div class="feature-icon">⌕</div>

                            <h3>Precision Filters</h3>

                            <p>
                                Filter watches by movement, case diameter,
                                water resistance and materials.
                            </p>

                        </div>

                    </div>

                    <div class="col-md-6 col-lg-3">

                        <div class="feature-item">

                            <div class="feature-icon">⇄</div>

                            <h3>Side-by-Side</h3>

                            <p>
                                Compare multiple watch specifications
                                to find your ideal timepiece.
                            </p>

                        </div>

                    </div>

                    <div class="col-md-6 col-lg-3">

                        <div class="feature-item">

                            <div class="feature-icon">♡</div>

                            <h3>Saved Wishlist</h3>

                            <p>
                                Save your favourite timepieces
                                to your personal wishlist.
                            </p>

                        </div>

                    </div>

                    <div class="col-md-6 col-lg-3">

                        <div class="feature-item">

                            <div class="feature-icon">★</div>

                            <h3>Verified Feedback</h3>

                            <p>
                                Explore feedback and reviews
                                from watch enthusiasts.
                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <!-- COMPARISON -->
        <section class="section" id="compare">

            <div class="container">

                <div class="row g-5 align-items-center">

                    <div class="col-lg-5">

                        <div class="section-head mb-4">

                            <h2>Compare Before You Choose</h2>

                            <p>
                                Analyze differences in build, sizing and
                                capability using our comparison feature.
                            </p>

                        </div>

                        <a href="Compare.aspx" class="btn btn-brass">
                            Open Full Comparison Hub
                        </a>

                    </div>

                    <div class="col-lg-7">

                        <div class="compare-table-wrapper">

                            <table class="compare-table">

                                <thead>
                                    <tr>
                                        <th>Specification</th>
                                        <th>Meridian 40</th>
                                        <th>Tide Diver</th>
                                        <th>Pilot Field</th>
                                    </tr>
                                </thead>

                                <tbody>

                                    <tr>
                                        <th>Movement</th>
                                        <td>Automatic</td>
                                        <td>Automatic</td>
                                        <td>Quartz</td>
                                    </tr>

                                    <tr>
                                        <th>Strap</th>
                                        <td>Leather</td>
                                        <td>Steel</td>
                                        <td>Canvas</td>
                                    </tr>

                                    <tr>
                                        <th>Case Size</th>
                                        <td>40 mm</td>
                                        <td>42 mm</td>
                                        <td>41 mm</td>
                                    </tr>

                                    <tr>
                                        <th>Water Resistance</th>
                                        <td>50 m</td>
                                        <td>300 m</td>
                                        <td>100 m</td>
                                    </tr>

                                    <tr>
                                        <th>Warranty</th>
                                        <td>2 Years</td>
                                        <td>3 Years</td>
                                        <td>2 Years</td>
                                    </tr>

                                    <tr>
                                        <th>Price</th>
                                        <td>NPR 8,900</td>
                                        <td>NPR 12,400</td>
                                        <td>NPR 4,200</td>
                                    </tr>

                                </tbody>

                            </table>

                        </div>

                        <p class="small text-muted mt-2">
                            Sample benchmark metrics. Database-connected
                            products can display live specifications.
                        </p>

                    </div>

                </div>

            </div>

        </section>

        <!-- CUSTOMER JOURNEY -->
        <section class="section pt-0" id="how">

            <div class="container">

                <div class="section-head">

                    <h2>From Browse to Acquisition</h2>

                    <p>
                        A streamlined shopping experience for every customer.
                    </p>

                </div>

                <ol class="steps">

                    <li>
                        <h3>Explore</h3>
                        <p>Browse curated collections or search by category.</p>
                    </li>

                    <li>
                        <h3>Compare</h3>
                        <p>Review technical specifications side by side.</p>
                    </li>

                    <li>
                        <h3>Acquire</h3>
                        <p>Add your preferred timepiece to your shopping bag.</p>
                    </li>

                    <li>
                        <h3>Track</h3>
                        <p>Monitor delivery updates through your profile.</p>
                    </li>

                </ol>

            </div>

        </section>

        <!-- WARRANTY -->
        <section class="section pt-0" id="warranty">

            <div class="container">

                <div class="warranty-panel">

                    <div class="row g-4 align-items-center">

                        <div class="col-lg-6">

                            <h2 class="serif display-6 mb-3">
                                Total Transparency on Every Timepiece
                            </h2>

                            <p class="text-secondary mb-0">
                                Every listing includes information about
                                warranty, crystal types, movement calibers
                                and water resistance.
                            </p>

                        </div>

                        <div class="col-lg-6">

                            <ul class="warranty-list">

                                <li>Warranty information for listed watches</li>
                                <li>Detailed technical specifications</li>
                                <li>Customer order history integration</li>
                                <li>Responsive desktop and mobile layout</li>

                            </ul>

                        </div>

                    </div>

                </div>

            </div>

        </section>

        <!-- FAQ -->
        <section class="section pt-0" id="faq">

            <div class="container">

                <div class="row g-5">

                    <div class="col-lg-4">

                        <div class="section-head">

                            <h2>Frequently Asked Questions</h2>

                            <p>
                                Everything you need to know about purchasing
                                and servicing through WatchVault.
                            </p>

                        </div>

                    </div>

                    <div class="col-lg-8">

                        <div class="accordion" id="faqAccordion">

                            <div class="accordion-item">

                                <h3 class="accordion-header">

                                    <button class="accordion-button"
                                            type="button"
                                            data-bs-toggle="collapse"
                                            data-bs-target="#faq1">

                                        Can I browse watches without registering?

                                    </button>

                                </h3>

                                <div id="faq1"
                                     class="accordion-collapse collapse show"
                                     data-bs-parent="#faqAccordion">

                                    <div class="accordion-body">

                                        Yes. Visitors can browse the public
                                        catalogue and specifications without
                                        an account. Registration is required
                                        for account-based features.

                                    </div>

                                </div>

                            </div>

                            <div class="accordion-item">

                                <h3 class="accordion-header">

                                    <button class="accordion-button collapsed"
                                            type="button"
                                            data-bs-toggle="collapse"
                                            data-bs-target="#faq2">

                                        Where can I find warranty information?

                                    </button>

                                </h3>

                                <div id="faq2"
                                     class="accordion-collapse collapse"
                                     data-bs-parent="#faqAccordion">

                                    <div class="accordion-body">

                                        Warranty information is provided
                                        on the relevant watch details page.

                                    </div>

                                </div>

                            </div>

                            <div class="accordion-item">

                                <h3 class="accordion-header">

                                    <button class="accordion-button collapsed"
                                            type="button"
                                            data-bs-toggle="collapse"
                                            data-bs-target="#faq3">

                                        How do I access professional maintenance?

                                    </button>

                                </h3>

                                <div id="faq3"
                                     class="accordion-collapse collapse"
                                     data-bs-parent="#faqAccordion">

                                    <div class="accordion-body">

                                        Visit our Service Center page to
                                        submit service inquiries and
                                        maintenance requests.

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </section>

    </main>

    <!-- FOOTER -->
    <footer>

        <div class="container">

            <div class="row g-4">

                <div class="col-lg-4">

                    <a class="wv-brand text-white mb-3 d-inline-block"
                       href="Default.aspx">

                        WatchVault

                    </a>

                    <p class="text-secondary small">

                        Your destination for precise horology,
                        detailed technical comparisons and
                        quality timepieces.

                    </p>

                </div>

                <div class="col-6 col-lg-2">

                    <h4>Catalog</h4>

                    <a href="Products.aspx?category=Dress">Dress Watches</a>
                    <a href="Products.aspx?category=Sport">Sport Watches</a>
                    <a href="Products.aspx?category=Dive">Dive Watches</a>
                    <a href="Products.aspx?category=Chronograph">Chronograph</a>

                </div>

                <div class="col-6 col-lg-2">

                    <h4>Lifestyle</h4>

                    <a href="Products.aspx?category=WallClocks">Wall Clocks</a>
                    <a href="Products.aspx?category=TableClocks">Table Clocks</a>
                    <a href="Products.aspx?category=Accessories">Accessories</a>

                </div>

                <div class="col-lg-4">

                    <h4>Client Support</h4>

                    <a href="ServiceCenter.aspx">Service Center & Repairs</a>
                    <a href="About.aspx">About Our Curations</a>
                    <a href="Contact.aspx">Contact Specialists</a>

                </div>

            </div>

            <div class="legal d-flex flex-wrap justify-content-between align-items-center gap-3">

                <div>
                    &copy; 2026 WatchVault Inc. All rights reserved.
                </div>

                <div class="d-flex gap-4">

                    <a href="Privacy.aspx">Privacy Policy</a>
                    <a href="Terms.aspx">Terms of Service</a>

                </div>

            </div>

        </div>

    </footer>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>


<script>

// ==========================================
// WATCHVAULT LIVE ANALOGUE CLOCK
// ==========================================

function updateClock() {

    const now = new Date();

    const hours = now.getHours();
    const minutes = now.getMinutes();
    const seconds = now.getSeconds();
    const milliseconds = now.getMilliseconds();

    // Calculate smooth hand rotations
    const hourRotation =
        (hours % 12) * 30 +
        minutes * 0.5 +
        seconds / 120;

    const minuteRotation =
        minutes * 6 +
        seconds * 0.1 +
        milliseconds * 0.0001;

    const secondRotation =
        seconds * 6 +
        milliseconds * 0.006;

    // Update hour hand
    const hourHand = document.getElementById("hourHand");

    if (hourHand) {
        hourHand.setAttribute(
            "transform",
            `rotate(${hourRotation} 200 200)`
        );
    }

    // Update minute hand
    const minuteHand = document.getElementById("minuteHand");

    if (minuteHand) {
        minuteHand.setAttribute(
            "transform",
            `rotate(${minuteRotation} 200 200)`
        );
    }

    // Update second hand
    const secondHand = document.getElementById("secondHand");

    if (secondHand) {
        secondHand.setAttribute(
            "transform",
            `rotate(${secondRotation} 200 200)`
        );
    }

    // Update digital time
    const digitalTime = document.getElementById("digitalTime");

    if (digitalTime) {
        digitalTime.textContent = now.toLocaleTimeString("en-NP", {
            hour: "2-digit",
            minute: "2-digit",
            second: "2-digit",
            hour12: true
        });
    }
}

// ==========================================
// GENERATE CLOCK TICKS
// ==========================================

const ticksContainer = document.getElementById("clockTicks");

if (ticksContainer && ticksContainer.children.length === 0) {

    for (let i = 0; i < 12; i++) {

        const angle = i * 30;
        const isMajor = i % 3 === 0;

        const line = document.createElementNS(
            "http://www.w3.org/2000/svg",
            "line"
        );

        line.setAttribute("x1", "200");
        line.setAttribute("y1", "80");
        line.setAttribute("x2", "200");
        line.setAttribute("y2", isMajor ? "95" : "90");

        line.setAttribute(
            "stroke",
            isMajor ? "#0B1F3A" : "#64748B"
        );

        line.setAttribute(
            "stroke-width",
            isMajor ? "3" : "1.5"
        );

        line.setAttribute("stroke-linecap", "round");

        line.setAttribute(
            "transform",
            `rotate(${angle} 200 200)`
        );

        ticksContainer.appendChild(line);
    }
}

// Start clock and update smoothly
updateClock();

setInterval(updateClock, 16);


// ==========================================
// SEARCH FUNCTIONALITY
// ==========================================

function performSearch() {

    const heroSearch = document.getElementById('searchBox');
    const headerSearch = document.getElementById('headerSearch');

    const searchTerm = (
        (heroSearch && heroSearch.value.trim()) ||
        (headerSearch && headerSearch.value.trim())
    );

    if (searchTerm) {

        window.location.href =
            'Products.aspx?search=' + encodeURIComponent(searchTerm);

    } else {

        window.location.href = 'Products.aspx';

    }
}

// Search buttons
const searchButton = document.getElementById('searchButton');
const headerSearchButton = document.getElementById('headerSearchBtn');

if (searchButton) {
    searchButton.addEventListener('click', performSearch);
}

if (headerSearchButton) {
    headerSearchButton.addEventListener('click', performSearch);
}

// Hero search Enter key
const searchBox = document.getElementById('searchBox');

if (searchBox) {
    searchBox.addEventListener('keydown', function (event) {

        if (event.key === 'Enter') {
            event.preventDefault();
            performSearch();
        }

    });
}

// Header search Enter key
const headerSearch = document.getElementById('headerSearch');

if (headerSearch) {
    headerSearch.addEventListener('keydown', function (event) {

        if (event.key === 'Enter') {
            event.preventDefault();
            performSearch();
        }

    });
}

</script>


</body>
</html>
