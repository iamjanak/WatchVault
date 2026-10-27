<%@ Page Title="Home | WatchVault" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WatchVault._Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>WatchVault | Luxury Timepieces & Horology</title>
    <meta name="description" content="Discover exquisite timepieces, certified warranties, and precise craftsmanship at WatchVault." />

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Manrope:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    <!-- Bootstrap 5.3.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
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
            --transition-smooth: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }

        html {
            scroll-behavior: smooth;
            scroll-padding-top: 90px;
        }

        body {
            margin: 0;
            color: var(--text-main);
            font-family: 'Manrope', sans-serif;
            background-color: #FFFFFF;
            overflow-x: hidden;
        }

        h1, h2, h3, h4, .serif {
            font-family: "Instrument Serif", Georgia, serif;
            font-weight: 400;
            letter-spacing: 0.02em;
        }

        :focus-visible {
            outline: 2px solid var(--brass);
            outline-offset: 2px;
        }

        /* ===== Luxury Glassmorphism Header ===== */
        .wv-header {
            position: sticky;
            top: 0;
            z-index: 1030;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(12px);
            -webkit-backdrop-filter: blur(12px);
            padding: 0.75rem 0;
            border-bottom: 1px solid var(--border-color);
            box-shadow: 0 4px 20px rgba(11, 31, 58, 0.04);
            transition: var(--transition-smooth);
        }

        .wv-brand {
            display: flex;
            align-items: center;
            gap: 0.75rem;
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
            font-size: 0.95rem;
            font-weight: 500;
            padding: 0.5rem 0.9rem;
            transition: color 0.2s ease;
        }

            .wv-nav .nav-link:hover,
            .wv-nav .nav-link:focus {
                color: var(--brass-dark);
            }

        .wv-nav .dropdown-menu {
            border: 1px solid var(--border-color);
            border-radius: 12px;
            box-shadow: 0 15px 35px rgba(11, 31, 58, 0.08);
            padding: 0.5rem;
            animation: dropdownFade 0.2s ease forwards;
        }

        @keyframes dropdownFade {
            from {
                opacity: 0;
                transform: translateY(8px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .wv-nav .dropdown-item {
            border-radius: 8px;
            font-size: 0.9rem;
            padding: 0.5rem 0.85rem;
            font-weight: 500;
            color: var(--text-main);
        }

            .wv-nav .dropdown-item:hover {
                background: var(--surface);
                color: var(--brass-dark);
            }

        .wv-search-bar {
            display: flex;
            align-items: center;
            width: 260px;
            background: var(--surface);
            border: 1px solid var(--border-color);
            border-radius: 30px;
            padding: 0.2rem 0.4rem 0.2rem 0.9rem;
            transition: var(--transition-smooth);
        }

            .wv-search-bar:focus-within {
                border-color: var(--brass);
                box-shadow: 0 0 0 3px rgba(79, 143, 203, 0.15);
                background: #fff;
                width: 300px;
            }

            .wv-search-bar input {
                flex: 1;
                min-width: 0;
                border: 0;
                outline: none;
                font-size: 0.88rem;
                background: transparent;
                color: var(--text-main);
            }

            .wv-search-bar button {
                border: 0;
                background: var(--ink);
                color: #fff;
                width: 32px;
                height: 32px;
                border-radius: 50%;
                display: grid;
                place-items: center;
                cursor: pointer;
                transition: background 0.2s;
            }

                .wv-search-bar button:hover {
                    background: var(--brass-dark);
                }

            .wv-search-bar svg, .wv-bag svg {
                width: 18px;
                height: 18px;
            }

        .wv-bag {
            position: relative;
            color: var(--text-main);
            padding: 0.4rem;
            display: grid;
            place-items: center;
            border-radius: 50%;
            background: var(--surface);
            transition: var(--transition-smooth);
        }

            .wv-bag:hover {
                background: var(--brass);
                color: #fff;
            }

        .wv-login {
            color: var(--text-main);
            font-size: 0.9rem;
            font-weight: 600;
            text-decoration: none;
            padding: 0.5rem 1rem;
            border-radius: 30px;
            border: 1px solid var(--border-color);
            transition: var(--transition-smooth);
        }

            .wv-login:hover {
                border-color: var(--brass);
                color: var(--brass-dark);
                background: var(--surface);
            }

        .wv-toggler {
            border: 1px solid var(--border-color);
            border-radius: 8px;
            padding: 0.4rem 0.6rem;
        }

        /* ===== Cinematic Hero Section ===== */
        .hero {
            position: relative;
            background: radial-gradient(circle at 75% 30%, #16283F 0%, var(--ink) 70%);
            color: #fff;
            padding: 7rem 0 6rem;
            overflow: hidden;
        }

            .hero::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: radial-gradient(circle at 20% 80%, rgba(79, 143, 203, 0.08) 0%, transparent 50%);
                pointer-events: none;
            }

            .hero h1 {
                font-size: clamp(3rem, 6.5vw, 5.5rem);
                line-height: 0.98;
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
            gap: 0.5rem;
            max-width: 36rem;
            background: rgba(255, 255, 255, 0.07);
            border: 1px solid rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 16px;
            padding: 0.5rem;
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }

            .hero-search-box input {
                min-width: 0;
                flex: 1;
                border: 0;
                background: transparent;
                padding: 0.75rem 1rem;
                color: #fff;
                font-size: 0.95rem;
                outline: none;
            }

                .hero-search-box input::placeholder {
                    color: #94A3B8;
                }

            .hero-search-box:focus-within {
                border-color: var(--brass);
                box-shadow: 0 0 0 3px rgba(79, 143, 203, 0.2);
            }

        /* Buttons */
        .btn {
            border-radius: 12px;
            font-weight: 600;
            padding: 0.75rem 1.75rem;
            transition: var(--transition-smooth);
        }

        .btn-brass {
            background: var(--brass);
            border: 1px solid var(--brass);
            color: #0B1F3A;
        }

            .btn-brass:hover {
                background: var(--brass-light);
                border-color: var(--brass-light);
                color: #0B1F3A;
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(79, 143, 203, 0.3);
            }

        .btn-outline-light-custom {
            color: #fff;
            border: 1px solid rgba(255,255,255,0.25);
            background: transparent;
        }

            .btn-outline-light-custom:hover {
                background: rgba(255,255,255,0.1);
                color: #fff;
                border-color: #fff;
            }

        /* Watch Dial Component */
        .dial-container {
            max-width: 400px;
            margin: auto;
            position: relative;
        }

            .dial-container svg {
                display: block;
                width: 100%;
                height: auto;
                filter: drop-shadow(0 30px 40px rgba(0,0,0,0.5));
            }

        .clock-badge {
            background: rgba(11, 31, 58, 0.7);
            border: 1px solid rgba(79, 143, 203, 0.3);
            backdrop-filter: blur(8px);
            color: #CBD5E1;
            text-align: center;
            font-size: 0.8rem;
            letter-spacing: 2px;
            padding: 0.6rem 1rem;
            border-radius: 30px;
            margin-top: 1.2rem;
            text-transform: uppercase;
        }

            .clock-badge span {
                color: var(--brass-light);
                font-weight: 700;
            }

        /* ===== Assure / Perks Bar ===== */
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
            padding: 0.75rem 1rem;
        }

            .assure-item svg {
                width: 32px;
                height: 32px;
                color: var(--brass-dark);
                flex: none;
            }

            .assure-item strong {
                display: block;
                font-size: 0.95rem;
                color: var(--ink);
            }

            .assure-item span {
                color: var(--text-muted);
                font-size: 0.83rem;
            }

        /* ===== Sections & Cards ===== */
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
                margin-bottom: 0.75rem;
            }

            .section-head p {
                color: var(--text-muted);
                line-height: 1.7;
                font-size: 1.05rem;
            }

        /* Category Grid Cards */
        .category-card {
            position: relative;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            min-height: 180px;
            padding: 1.5rem;
            color: var(--ink);
            text-decoration: none;
            background: #fff;
            border: 1px solid var(--border-color);
            border-radius: 16px;
            overflow: hidden;
            transition: var(--transition-smooth);
        }

            .category-card::after {
                content: '';
                position: absolute;
                inset: 0;
                background: linear-gradient(135deg, rgba(79,143,203,0.05), transparent);
                opacity: 0;
                transition: opacity 0.3s;
            }

            .category-card:hover {
                border-color: var(--brass);
                transform: translateY(-4px);
                box-shadow: 0 15px 30px rgba(11, 31, 58, 0.06);
                color: var(--ink);
            }

                .category-card:hover::after {
                    opacity: 1;
                }

            .category-card svg {
                width: 36px;
                height: 36px;
                color: var(--brass);
                transition: transform 0.3s;
            }

            .category-card:hover svg {
                transform: scale(1.1);
            }

            .category-card h3 {
                font-size: 1.6rem;
                margin: 0.8rem 0 0.2rem;
            }

            .category-card small {
                color: var(--text-muted);
                font-weight: 500;
            }

        /* Product Cards */
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
                box-shadow: 0 20px 40px rgba(11, 31, 58, 0.08);
                border-color: #cbd5e1;
            }

        .product-art {
            position: relative;
            display: grid;
            place-items: center;
            min-height: 240px;
            background: var(--surface);
            padding: 1.5rem;
        }

            .product-art svg {
                width: 130px;
                height: 200px;
                transition: transform 0.4s ease;
            }

        .product-card:hover .product-art svg {
            transform: scale(1.05);
        }

        .product-tag {
            position: absolute;
            top: 1rem;
            left: 1rem;
            background: var(--ink);
            color: #fff;
            padding: 0.3rem 0.75rem;
            border-radius: 30px;
            font-size: 0.72rem;
            font-weight: 700;
            letter-spacing: 0.5px;
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
            font-size: 0.8rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .product-body h3 {
            font-size: 1.6rem;
            margin: 0.2rem 0 0.75rem;
            color: var(--ink);
        }

        .spec-list {
            list-style: none;
            padding: 0;
            margin: 0 0 1.2rem;
            color: var(--text-muted);
            font-size: 0.85rem;
        }

            .spec-list li {
                padding: 0.2rem 0;
                display: flex;
                align-items: center;
                gap: 0.4rem;
            }

        .product-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 0.5rem;
            margin-top: auto;
            padding-top: 1rem;
            border-top: 1px solid var(--border-color);
        }

        .price {
            font-size: 1.15rem;
            font-weight: 800;
            color: var(--ink);
        }

        /* Dark Section (Why Choose Us) */
        .dark-section {
            background: var(--ink);
            color: #fff;
        }

            .dark-section .section-head h2 {
                color: #fff;
            }

            .dark-section .section-head p {
                color: #94A3B8;
            }

        .feature-item {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 16px;
            padding: 2rem;
            height: 100%;
            transition: var(--transition-smooth);
        }

            .feature-item:hover {
                border-color: var(--brass);
                background: rgba(255, 255, 255, 0.06);
                transform: translateY(-3px);
            }

        .feature-icon {
            width: 48px;
            height: 48px;
            background: rgba(79, 143, 203, 0.1);
            color: var(--brass-light);
            border-radius: 12px;
            display: grid;
            place-items: center;
            margin-bottom: 1.25rem;
        }

        .feature-item h3 {
            font-size: 1.6rem;
            margin-bottom: 0.75rem;
            color: #fff;
        }

        .feature-item p {
            color: #94A3B8;
            line-height: 1.7;
            font-size: 0.95rem;
            margin: 0;
        }

        /* Comparison Preview Table */
        .compare-table-wrapper {
            background: #fff;
            border: 1px solid var(--border-color);
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(10,17,24,0.03);
        }

        .compare-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.92rem;
            margin: 0;
        }

            .compare-table th, .compare-table td {
                padding: 1.1rem 1.2rem;
                border-bottom: 1px solid var(--border-color);
                text-align: left;
            }

            .compare-table thead th {
                background: var(--surface);
                font-family: "Instrument Serif", Georgia, serif;
                font-size: 1.35rem;
                font-weight: 400;
                color: var(--ink);
                border-bottom: 2px solid var(--border-color);
            }

            .compare-table tbody th {
                color: var(--text-muted);
                font-weight: 600;
                font-size: 0.85rem;
                text-transform: uppercase;
                letter-spacing: 0.5px;
                background: #FAFAFB;
            }

        /* Journey Steps */
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
                position: relative;
                transition: var(--transition-smooth);
            }

                .steps li:hover {
                    border-color: var(--brass);
                    background: #fff;
                    box-shadow: 0 10px 25px rgba(10,17,24,0.04);
                    transform: translateY(-3px);
                }

                .steps li::before {
                    content: counter(step, decimal-leading-zero);
                    display: block;
                    color: var(--brass-dark);
                    font-family: "Instrument Serif", Georgia, serif;
                    font-size: 2.8rem;
                    line-height: 1;
                    margin-bottom: 0.5rem;
                }

            .steps h3 {
                font-size: 1.5rem;
                margin-bottom: 0.5rem;
                color: var(--ink);
            }

            .steps p {
                color: var(--text-muted);
                font-size: 0.92rem;
                margin: 0;
                line-height: 1.6;
            }

        /* Warranty Panel */
        .warranty-panel {
            background: linear-gradient(135deg, var(--surface) 0%, #FFFFFF 100%);
            border: 1px solid var(--border-color);
            border-radius: 24px;
            padding: 3rem;
            box-shadow: 0 15px 35px rgba(10,17,24,0.03);
        }

        .warranty-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

            .warranty-list li {
                padding: 0.6rem 0;
                display: flex;
                align-items: center;
                font-weight: 500;
                color: var(--text-main);
            }

                .warranty-list li::before {
                    content: "✓";
                    display: inline-grid;
                    place-items: center;
                    width: 24px;
                    height: 24px;
                    background: rgba(79, 143, 203, 0.15);
                    color: var(--brass-dark);
                    font-weight: 800;
                    border-radius: 50%;
                    margin-right: 0.85rem;
                    font-size: 0.8rem;
                    flex: none;
                }

        /* FAQ Section */
        .accordion-item {
            border: 1px solid var(--border-color) !important;
            border-radius: 12px !important;
            overflow: hidden;
            margin-bottom: 1rem;
            background: #fff;
        }

        .accordion-button {
            font-weight: 600;
            color: var(--ink);
            padding: 1.25rem 1.5rem;
            font-size: 1.05rem;
            background: #fff;
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

        /* Footer */
        footer {
            background: var(--ink);
            color: #94A3B8;
            padding: 4rem 0 2rem;
            font-size: 0.92rem;
            border-top: 1px solid rgba(255,255,255,0.05);
        }

            footer h4 {
                color: #fff;
                font-size: 1.1rem;
                font-weight: 700;
                margin-bottom: 1.25rem;
            }

            footer a {
                display: block;
                color: #94A3B8;
                text-decoration: none;
                padding: 0.35rem 0;
                transition: color 0.2s;
            }

                footer a:hover {
                    color: var(--brass-light);
                }

        .legal {
            border-top: 1px solid rgba(255, 255, 255, 0.08);
            margin-top: 3rem;
            padding-top: 1.5rem;
            font-size: 0.85rem;
            color: #64748B;
        }

        /* Responsive Design */
        @media(max-width: 991px) {
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
                max-width: 320px;
                margin-top: 2.5rem;
            }

            .steps {
                grid-template-columns: repeat(2, 1fr);
            }

            .wv-search-bar {
                width: 100%;
                margin-top: 0.5rem;
            }
        }

        @media(max-width: 575px) {
            .section {
                padding: 4rem 0;
            }

            .steps {
                grid-template-columns: 1fr;
            }

            .warranty-panel {
                padding: 1.5rem;
            }
        }
        .wv-nav .nav-link {
    color: var(--text-main);
    font-size: 0.95rem;
    font-weight: 500;
    padding: 0.5rem 0.9rem;
    transition: color 0.2s ease;
}


    </style>
</head>
<body>

    <!-- SVG Asset Definitions -->
    <svg width="0" height="0" style="position: absolute" aria-hidden="true">
        <symbol id="watch-symbol" viewBox="0 0 120 190">
            <rect x="40" y="0" width="40" height="55" rx="6" fill="var(--strap, #16222F)" />
            <rect x="40" y="135" width="40" height="55" rx="6" fill="var(--strap, #16222F)" />
            <circle cx="60" cy="95" r="44" fill="#4F8FCB" />
            <circle cx="60" cy="95" r="39" fill="var(--face, #0B1F3A)" />
            <path d="M60 95 V68 M60 95 L76 103" stroke="var(--hand, #FFFFFF)" stroke-width="2.5" stroke-linecap="round" />
            <circle cx="60" cy="95" r="3" fill="#4F8FCB" />
        </symbol>
    </svg>

    <form id="form1" runat="server">

        <!-- Header Navigation -->
        <nav class="wv-header navbar navbar-expand-lg" aria-label="Main navigation">
            <div class="container">
                <a class="wv-brand" href="Default.aspx" aria-label="WatchVault home">
                    <svg viewBox="0 0 30 42" fill="none" stroke="currentColor" stroke-width="1.5" aria-hidden="true">
                        <path d="M10 1h10l1.5 8h-13zM8.5 33h13L20 41H10z" />
                        <circle cx="15" cy="21" r="11" />
                        <path d="M15 14v7l4 3" />
                    </svg>
                    WatchVault
        </a>

                <button class="navbar-toggler wv-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="mainNav">
                    <ul class="navbar-nav wv-nav mx-auto align-items-lg-center">
                        <li class="nav-item"><a class="nav-link active" href="Default.aspx">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="About.aspx">About Us</a></li>
                        
<li class="nav-item">
    <a class="nav-link" href="<%= ResolveUrl("~/Products/NewArrivals.aspx") %>">
        New Arrivals
    </a>
</li>

                            </a>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="Products.aspx" role="button" data-bs-toggle="dropdown" aria-expanded="false">Watches</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="Products.aspx?category=Smart">For Mens</a></li>
                                <li><a class="dropdown-item" href="Products.aspx?category=Smart">For Women</a></li>
                                <li><a class="dropdown-item" href="Products.aspx">All Watches</a></li>
                                <li><a class="dropdown-item" href="Products.aspx?category=Dress">Dress</a></li>
                                <li><a class="dropdown-item" href="Products.aspx?category=Sport">Sport</a></li>
                                <li><a class="dropdown-item" href="Products.aspx?category=Dive">Dive</a></li>
                                <li><a class="dropdown-item" href="Products.aspx?category=Chronograph">Chronograph</a></li>
                                <li><a class="dropdown-item" href="Products.aspx?category=Smart">Smart</a></li>
                            </ul>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Lifestyle</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="Products.aspx?category=WallClocks">Wall Clocks</a></li>
                                <li><a class="dropdown-item" href="Products.aspx?category=TableClocks">Table Clocks</a></li>
                                <li><a class="dropdown-item" href="Products.aspx?category=Accessories">Accessories</a></li>
                            </ul>
                        </li>

                        <li class="nav-item"><a class="nav-link" href="ServiceCenter.aspx">Service Center</a></li>
                    </ul>

                    <div class="d-flex align-items-center gap-3 flex-wrap">
                        <div class="wv-search-bar" role="search">
                            <input type="search" id="headerSearch" maxlength="80" placeholder="Search timepieces..." aria-label="Search watches" />
                            <button type="button" id="headerSearchBtn" aria-label="Search">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round">
                                    <circle cx="11" cy="11" r="7" />
                                    <path d="M20 20l-4-4" />
                                </svg>
                            </button>
                        </div>
                        <a class="wv-bag" href="Cart.aspx" aria-label="Shopping bag">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linejoin="round" stroke-linecap="round">
                                <path d="M5 8h14l-1 12H6L5 8z" />
                                <path d="M9 8V6a3 3 0 0 1 6 0v2" />
                            </svg>
                        </a>

                        <asp:PlaceHolder ID="phGuest" runat="server">
                            <a class="wv-login" href="Login.aspx">Sign In</a>
                        </asp:PlaceHolder>

                        <asp:PlaceHolder ID="phUser" runat="server" Visible="false">
                            <div class="dropdown">
                                <a class="wv-login dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Hi, <span class="wv-user">
                                    <asp:Literal ID="litUserName" runat="server" /></span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li><a class="dropdown-item" href="Orders.aspx">My Orders</a></li>
                                    <li><a class="dropdown-item" href="Wishlist.aspx">Wishlist</a></li>
                                    <li>
                                        <hr class="dropdown-divider" />
                                    </li>
                                    <li>
                                        <asp:LinkButton ID="btnLogout" runat="server" CssClass="dropdown-item text-danger"
                                            CausesValidation="false" OnClick="btnLogout_Click">Log Out</asp:LinkButton>
                                    </li>
                                </ul>
                            </div>
                        </asp:PlaceHolder>
                    </div>
                </div>
            </div>
        </nav>

        <main>
            <!-- Cinematic Hero Section -->
            <header class="hero">
                <div class="container">
                    <div class="row align-items-center g-5">
                        <div class="col-lg-7">
                            <span class="text-uppercase fw-bold mb-3 d-inline-block" style="letter-spacing: 4px; color: var(--brass-light); font-size: 0.85rem;">Exquisite Horology & Precision</span>
                            <h1>Time is precious.<br />
                                Wear it <em>well.</em></h1>
                            <p class="lead mt-3 mb-4">Explore masterpieces crafted for every milestone. Compare meticulous technical details, verify authentic specifications, and select a watch tailored to your identity.</p>

                            <div class="hero-search-box mb-4" role="search">
                                <input type="search" id="searchBox" maxlength="80" placeholder="Search by brand, model or movement caliber..." aria-label="Search watches" />
                                <button type="button" class="btn btn-brass" id="searchButton">Explore</button>
                            </div>

                            <div class="d-flex flex-wrap gap-3">
                                <a href="#featured" class="btn btn-brass btn-lg">Featured Timepieces</a>
                                <a href="Products.aspx" class="btn btn-outline-light-custom btn-lg">Browse Catalog</a>
                            </div>
                        </div>

                        <div class="col-lg-5">
                            <div class="dial-container">
                                <svg viewBox="0 0 400 400" role="img" aria-label="Analogue watch showing current local time">
                                    <rect x="150" y="0" width="100" height="70" rx="12" fill="#15365B" />
                                    <rect x="150" y="330" width="100" height="70" rx="12" fill="#15365B" />
                                    <circle cx="200" cy="200" r="150" fill="#4F8FCB" />
                                    <circle cx="200" cy="200" r="142" fill="#0B1F3A" />
                                    <circle cx="200" cy="200" r="132" fill="#F3F6FA" />
                                    <g id="clockTicks"></g>
                                    <text x="200" y="145" text-anchor="middle" font-family="Instrument Serif, Georgia, serif" font-size="28" fill="#0B1F3A" letter-spacing="1">WatchVault</text>
                                    <text x="200" y="263" text-anchor="middle" font-family="Manrope, Arial, sans-serif" font-size="11" fill="#64748B" font-weight="700" letter-spacing="3">AUTOMATIC</text>
                                    <g id="hourHand">
                                        <rect x="195" y="125" width="10" height="80" rx="4" fill="#0B1F3A" />
                                    </g>
                                    <g id="minuteHand">
                                        <rect x="197.5" y="90" width="5" height="115" rx="2.5" fill="#0B1F3A" />
                                    </g>
                                    <g id="secondHand">
                                        <rect x="199" y="75" width="2" height="130" fill="#4F8FCB" />
                                    </g>
                                    <circle cx="200" cy="200" r="8" fill="#4F8FCB" />
                                    <circle cx="200" cy="200" r="3" fill="#0B1F3A" />
                                </svg>
                                <div class="clock-badge">LIVE LOCAL TIME &bull; <span id="digitalTime">Loading…</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Value Assurance Highlights Bar -->
            <section class="assure" aria-label="Store highlights">
                <div class="container">
                    <div class="row g-3">
                        <div class="col-6 col-lg-3">
                            <div class="assure-item">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                                    <path d="M12 3l8 3v6c0 5-3.5 8-8 9-4.5-1-8-4-8-9V6l8-3z" />
                                    <path d="M8.5 12l2.5 2.5 4.5-5" />
                                </svg>
                                <div><strong>Verified Warranty</strong><span>Official manufacturer assurance.</span></div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-3">
                            <div class="assure-item">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                                    <path d="M4 7h12M13 4l3 3-3 3M20 17H8M11 14l-3 3 3 3" />
                                </svg>
                                <div><strong>Side-by-Side Specs</strong><span>Detailed caliber comparison.</span></div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-3">
                            <div class="assure-item">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                                    <path d="M3 7h11v9H3zM14 10h4l3 3v3h-7z" />
                                    <circle cx="7" cy="18" r="1.6" />
                                    <circle cx="17" cy="18" r="1.6" />
                                </svg>
                                <div><strong>Secure Tracking</strong><span>Seamless order updates.</span></div>
                            </div>
                        </div>
                        <div class="col-6 col-lg-3">
                            <div class="assure-item">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
                                    <rect x="3" y="6" width="18" height="13" rx="2" />
                                    <path d="M3 10h18M7 15h4" />
                                </svg>
                                <div><strong>Responsive Luxury</strong><span>Optimized for all viewports.</span></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Categories Section -->
            <section class="section" id="categories">
                <div class="container">
                    <div class="section-head">
                        <h2>Browse by Style</h2>
                        <p>Curated categories designed to match your specific taste, environment, and movement preference.</p>
                    </div>
                    <div class="row g-4">
                        <div class="col-6 col-md-4 col-lg">
                            <a class="category-card" href="Products.aspx?category=Dress">
                                <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="1.6">
                                    <circle cx="16" cy="16" r="9" />
                                    <path d="M16 11v5l3 2M12 3h8M12 29h8" />
                                </svg>
                                <div>
                                    <h3>Dress</h3>
                                    <small>Formal Elegance</small>
                                </div>
                            </a>
                        </div>
                        <div class="col-6 col-md-4 col-lg">
                            <a class="category-card" href="Products.aspx?category=Sport">
                                <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="1.6">
                                    <circle cx="16" cy="16" r="9" />
                                    <path d="M16 11v5l3 2M12 3h8M12 29h8" />
                                </svg>
                                <div>
                                    <h3>Sport</h3>
                                    <small>Active & Durable</small>
                                </div>
                            </a>
                        </div>
                        <div class="col-6 col-md-4 col-lg">
                            <a class="category-card" href="Products.aspx?category=Dive">
                                <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="1.6">
                                    <circle cx="16" cy="16" r="9" />
                                    <path d="M16 11v5l3 2M12 3h8M12 29h8" />
                                </svg>
                                <div>
                                    <h3>Dive</h3>
                                    <small>High Pressure Ready</small>
                                </div>
                            </a>
                        </div>
                        <div class="col-6 col-md-4 col-lg">
                            <a class="category-card" href="Products.aspx?category=Chronograph">
                                <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="1.6">
                                    <circle cx="16" cy="16" r="9" />
                                    <path d="M16 11v5l3 2M12 3h8M12 29h8" />
                                </svg>
                                <div>
                                    <h3>Chronograph</h3>
                                    <small>Precision Timing</small>
                                </div>
                            </a>
                        </div>
                        <div class="col-6 col-md-4 col-lg">
                            <a class="category-card" href="Products.aspx?category=Smart">
                                <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="1.6">
                                    <rect x="9" y="5" width="14" height="22" rx="4" />
                                    <path d="M13 9h6M13 23h6" />
                                </svg>
                                <div>
                                    <h3>Smart</h3>
                                    <small>Modern Connectivity</small>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Featured Collection Section -->
            <section class="section pt-0" id="featured">
                <div class="container">
                    <div class="d-flex flex-wrap justify-content-between align-items-end gap-3 mb-4">
                        <div class="section-head mb-0">
                            <h2>Featured Collection</h2>
                            <p class="mb-0">Handpicked selections showcasing premier build quality.</p>
                        </div>
                        <a class="btn btn-outline-dark px-4 py-2" href="Products.aspx" style="border-radius: 12px; font-weight: 600;">View All Timepieces</a>
                    </div>
                    <div class="row g-4" id="productGrid">
                        <div class="col-12 text-center py-5">
                            <p class="text-secondary">Loading featured collection…</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Why Choose WatchVault (Dark Section) -->
            <section class="section dark-section" id="why">
                <div class="container">
                    <div class="section-head">
                        <h2>Designed for the Informed Collector</h2>
                        <p>We provide deep, technical granularity so you can shop with absolute clarity and confidence.</p>
                    </div>
                    <div class="row g-4">
                        <div class="col-md-6 col-lg-3">
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M22 3H2l8 9.46V19l4 2v-8.54L22 3z" />
                                    </svg>
                                </div>
                                <h3>Precision Filters</h3>
                                <p>Filter seamlessly by caliber movement, case diameter, water resistance thresholds, and premium materials.</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M16 3h5v5M4 20L21 3M21 16v5h-5M15 15l6 6M4 4l5 5" />
                                    </svg>
                                </div>
                                <h3>Side-by-Side</h3>
                                <p>Evaluate multiple watch specifications simultaneously to find the precise balance of features you desire.</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z" />
                                    </svg>
                                </div>
                                <h3>Saved Wishlist</h3>
                                <p>Save desired timepieces to your personal portfolio and track price or stock updates effortlessly.</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-3">
                            <div class="feature-item">
                                <div class="feature-icon">
                                    <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                                        <path d="M12 2l3.09 6.26L22 9.27l-5 4.87 1.18 6.88L12 17.77l-6.18 3.25L7 14.14 2 9.27l6.91-1.01L12 2z" />
                                    </svg>
                                </div>
                                <h3>Verified Feedback</h3>
                                <p>Read transparent feedback and performance reviews from real collectors and horology enthusiasts.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Comparison Preview Section -->
            <section class="section" id="compare">
                <div class="container">
                    <div class="row g-5 align-items-center">
                        <div class="col-lg-5">
                            <div class="section-head mb-4">
                                <h2>Compare Before You Choose</h2>
                                <p>Analyze differences in build, sizing, and capability instantly using our dynamic comparison matrix.</p>
                            </div>
                            <a href="Compare.aspx" class="btn btn-brass">Open Full Comparison Hub</a>
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
                            <p class="small text-muted mt-2">Sample benchmark metrics. Database connected variants will display live pricing.</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Journey Steps -->
            <section class="section pt-0" id="how">
                <div class="container">
                    <div class="section-head">
                        <h2>From Browse to Acquisition</h2>
                        <p>A streamlined, frictionless experience built for discerning buyers.</p>
                    </div>
                    <ol class="steps">
                        <li>
                            <h3>Explore</h3>
                            <p>Browse curated portfolios or search directly by category.</p>
                        </li>
                        <li>
                            <h3>Compare</h3>
                            <p>Review technical specifications side by side.</p>
                        </li>
                        <li>
                            <h3>Acquire</h3>
                            <p>Secure your timepiece via our streamlined bag & checkout.</p>
                        </li>
                        <li>
                            <h3>Track</h3>
                            <p>Monitor your delivery status directly through your profile.</p>
                        </li>
                    </ol>
                </div>
            </section>

            <!-- Warranty Information Panel -->
            <section class="section pt-0" id="warranty">
                <div class="container">
                    <div class="warranty-panel">
                        <div class="row g-4 align-items-center">
                            <div class="col-lg-6">
                                <h2 class="serif display-6 mb-3">Total Transparency on Every Timepiece</h2>
                                <p class="text-secondary mb-0">Every listing includes full disclosure on warranty length, crystal types, movement calibers, and water resistance testing parameters.</p>
                            </div>
                            <div class="col-lg-6">
                                <ul class="warranty-list">
                                    <li>Verified official warranty certificate mapping</li>
                                    <li>Precise technical parameter listings</li>
                                    <li>Secure client profile order history integration</li>
                                    <li>Fully responsive adaptive desktop & mobile layout</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- FAQ Section -->
            <section class="section pt-0" id="faq">
                <div class="container">
                    <div class="row g-5">
                        <div class="col-lg-4">
                            <div class="section-head">
                                <h2>Frequently Asked Questions</h2>
                                <p>Everything you need to know about purchasing and servicing through WatchVault.</p>
                            </div>
                        </div>
                        <div class="col-lg-8">
                            <div class="accordion" id="faqAccordion">
                                <div class="accordion-item">
                                    <h3 class="accordion-header">
                                        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1" aria-expanded="true" aria-controls="faq1">Can I browse timepieces without registering?</button>
                                    </h3>
                                    <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                                        <div class="accordion-body">Yes. Visitors have complete access to the public catalogue, specifications, and comparison tools without an account. Registration is only required for saving wishlists and completing orders.</div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h3 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2" aria-expanded="false" aria-controls="faq2">Where can I find specific warranty paperwork?</button>
                                    </h3>
                                    <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                        <div class="accordion-body">Each watch details page clearly states the designated manufacturer warranty period alongside water-resistance ratings and movement origins.</div>
                                    </div>
                                </div>
                                <div class="accordion-item">
                                    <h3 class="accordion-header">
                                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3" aria-expanded="false" aria-controls="faq3">How do I access professional maintenance?</button>
                                    </h3>
                                    <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                        <div class="accordion-body">You can visit our dedicated Service Center page to submit service inquiries, book maintenance appointments, or check repair status updates.</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <!-- Footer -->
        <footer>
            <div class="container">
                <div class="row g-4">
                    <div class="col-lg-4">
                        <a class="wv-brand text-white mb-3 d-inline-block" href="Default.aspx">WatchVault</a>
                        <p class="text-secondary small">Your definitive destination for precise horology, detailed technical comparisons, and verified timepieces.</p>
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
                        <a href="ServiceCenter.aspx">Service Center &amp; Repairs</a>
                        <a href="About.aspx">About Our Curations</a>
                        <a href="Contact.aspx">Contact Specialists</a>
                    </div>
                </div>
                <div class="legal d-flex flex-wrap justify-content-between align-items-center gap-3">
                    <div>&copy; 2026 WatchVault Inc. All rights reserved.</div>
                    <div class="d-flex gap-4">
                        <a href="Privacy.aspx">Privacy Policy</a>
                        <a href="Terms.aspx">Terms of Service</a>
                    </div>
                </div>
            </div>
        </footer>

    </form>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
// Live Clock Engine
function updateClock() {
    const now = new Date();
    const hours = now.getHours();
    const minutes = now.getMinutes();
    const seconds = now.getSeconds();
    const milliseconds = now.getMilliseconds();

    const hrDeg = (hours % 12) * 30 + minutes * 0.5;
    const minDeg = minutes * 6 + seconds * 0.1;
    const secDeg = seconds * 6 + milliseconds * 0.006;

    const hourHand = document.getElementById('hourHand');
    const minuteHand = document.getElementById('minuteHand');
    const secondHand = document.getElementById('secondHand');

    if (hourHand) hourHand.style.transform = `rotate(${hrDeg}deg)`;
    if (hourHand) hourHand.style.transformOrigin = '200px 200px';

    if (minuteHand) minuteHand.style.transform = `rotate(${minDeg}deg)`;
    if (minuteHand) minuteHand.style.transformOrigin = '200px 200px';

    if (secondHand) secondHand.style.transform = `rotate(${secDeg}deg)`;
    if (secondHand) secondHand.style.transformOrigin = '200px 200px';

    const timeString = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit', second: '2-digit' });
    const digitalTimeEl = document.getElementById('digitalTime');
    if (digitalTimeEl) digitalTimeEl.innerText = timeString;
}

// Generate Clock Ticks dynamically
const ticksContainer = document.getElementById('clockTicks');
if (ticksContainer) {
    for (let i = 0; i < 12; i++) {
        const angle = i * 30;
        const isMajor = i % 3 === 0;
        const length = isMajor ? 12 : 6;
        const width = isMajor ? 3 : 1.5;
        const strokeColor = isMajor ? '#0B1F3A' : '#64748B';

        const line = document.createElementNS('http://www.w3.org/2000/svg', 'line');
        line.setAttribute('x1', '200');
        line.setAttribute('y1', isMajor ? '72' : '75');
        line.setAttribute('x2', '200');
        line.setAttribute('y2', (72 + length).toString());
        line.setAttribute('stroke', strokeColor);
        line.setAttribute('stroke-width', width.toString());
        line.setAttribute('stroke-linecap', 'round');
        line.setAttribute('transform', `rotate(${angle} 200 200)`);
        ticksContainer.appendChild(line);
    }
}

setInterval(updateClock, 50);
updateClock();

// Sample Loader Simulation for Product Grid
window.addEventListener('DOMContentLoaded', () => {
    const grid = document.getElementById('productGrid');
    if (grid) {
        // Simulated rich mock items if the backend doesn't inject them immediately
        setTimeout(() => {
            grid.innerHTML = `
                    <div class="col-md-4">
                        <div class="product-card">
                            <div class="product-art">
                                <span class="product-tag">Bestseller</span>
                                <svg><use href="#watch-symbol" style="--strap:#16273F; --face:#0E1A2B; --hand:#FFFFFF;"/></svg>
                            </div>
                            <div class="product-body">
                                <span class="brand-name">Meridian</span>
                                <h3>Meridian 40 Automatic</h3>
                                <ul class="spec-list">
                                    <li>• Movement: Automatic Caliber</li>
                                    <li>• Case: 40mm Stainless Steel</li>
                                    <li>• Crystal: Sapphire Glass</li>
                                </ul>
                                <div class="product-footer">
                                    <span class="price">NPR 8,900</span>
                                    <a href="Products.aspx?id=1" class="btn btn-sm btn-outline-dark" style="border-radius:8px;">View Details</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
    <div class="product-card">
        <div class="product-art">
            <span class="product-tag">Bestseller</span>

            <img src="Images/BAUME & MERCIER -Riviera 10846.png"
                 alt="Meridian 40 Automatic Watch"
                 class="watch-image" />
        </div>


                            <div class="product-body">
                                <span class="brand-name">BAUME & MERCIER</span>
                                <h3>BAUME & MERCIER — Riviera 10846</h3>
                                <ul class="spec-list">
                                    <li>• Movement: Automatic</li>
    <li>• Case: Stainless Steel</li>
    <li>• Design: Twelve-Sided Bezel</li>
</ul>
<div class="product-footer">
    <span class="price">NPR 12,400</span>
                                    <a href="Products.aspx?id=2" class="btn btn-sm btn-outline-dark" style="border-radius:8px;">View Details</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="product-card">
                            <div class="product-art">
                                <span class="product-tag">Limited Edition</span>
                                <svg><use href="#watch-symbol" style="--strap:#332211; --face:#292524; --hand:#4F8FCB;"/></svg>
                            </div>
                            <div class="product-body">
                                <span class="brand-name">AeroField</span>
                                <h3>Pilot Field Chronograph</h3>
                                <ul class="spec-list">
                                    <li>• Movement: High-Precision Quartz</li>
                                    <li>• Strap: Genuine Calf Leather</li>
                                    <li>• Warranty: 2 Years Official</li>
                                </ul>
                                <div class="product-footer">
                                    <span class="price">NPR 4,200</span>
                                    <a href="Products.aspx?id=3" class="btn btn-sm btn-outline-dark" style="border-radius:8px;">View Details</a>
                                </div>
                            </div>LIVE LOCAL TIME • 
                        </div>
                    </div>
                `;
        }, 200);
    }
});
</script>
</body>
</html>
