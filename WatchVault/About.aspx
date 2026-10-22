
<%@ Page Title="About Us | WatchVault" Language="C#" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="WatchVault.About" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>About Us | WatchVault</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            color: #20252e;
            background: #ffffff;
            line-height: 1.7;
        }

        a {
            text-decoration: none;
        }

        /* Consistent WatchVault logo styling */
        .brand {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 25px;
            font-weight: 800;
            letter-spacing: 1px;
            color: #e5bd76;
            text-decoration: none;
            white-space: nowrap;
        }

        .navbar {
            min-height: 76px;
            padding: 18px 7%;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            background: #111827;
            color: #ffffff;
        }

        .nav-links {
            display: flex;
            align-items: center;
            flex-wrap: wrap;
            gap: 24px;
        }

        .nav-links a {
            color: #f9fafb;
            font-size: 14px;
            transition: color 0.2s;
        }

        .nav-links a:hover,
        .nav-links a.active {
            color: #e5bd76;
        }

        .hero {
            padding: 90px 20px;
            text-align: center;
            color: #ffffff;
            background: linear-gradient(135deg, #111827, #293449);
        }

        .eyebrow {
            color: #e5bd76;
            text-transform: uppercase;
            letter-spacing: 4px;
            font-size: 12px;
            font-weight: bold;
        }

        .hero h1 {
            margin: 15px 0;
            font-size: clamp(36px, 5vw, 58px);
            line-height: 1.15;
        }

        .hero p {
            max-width: 650px;
            margin: 0 auto;
            color: #d1d5db;
            font-size: 17px;
        }

        .container {
            max-width: 1120px;
            margin: auto;
            padding: 65px 24px;
        }

        .intro {
            display: grid;
            grid-template-columns: 1.1fr 1fr;
            gap: 48px;
            align-items: center;
        }

        .intro h2,
        .section-heading {
            font-size: 32px;
            line-height: 1.25;
            color: #111827;
        }

        .intro p {
            color: #5b6472;
        }

        .watch-art {
            min-height: 310px;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            border-radius: 12px;
            padding: 30px;
            background: radial-gradient(circle at center, #39465a, #111827 72%);
            color: #e5bd76;
        }

        .watch-symbol {
            font-size: 100px;
            line-height: 1.2;
        }

        .watch-art p {
            color: #f3e7d2;
            margin-bottom: 0;
        }

        .values-section {
            background: #f6f7f9;
        }

        .section-title {
            text-align: center;
            margin-bottom: 35px;
        }

        .section-title p {
            color: #697386;
        }

        .values {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 22px;
        }

        .value-card {
            padding: 30px 24px;
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 10px;
        }

        .value-icon {
            font-size: 30px;
        }

        .value-card h3 {
            margin: 12px 0 8px;
            color: #182033;
        }

        .value-card p {
            margin-bottom: 0;
            color: #697386;
            font-size: 15px;
        }

        .mission {
            text-align: center;
            max-width: 800px;
            margin: auto;
        }

        .mission p {
            color: #697386;
        }

        .shop-button {
            display: inline-block;
            margin-top: 18px;
            padding: 13px 27px;
            border-radius: 5px;
            background: #b68b48;
            color: #ffffff;
            font-weight: bold;
            transition: background 0.2s;
        }

        .shop-button:hover {
            background: #96703a;
        }

        .footer {
            padding: 28px 20px;
            text-align: center;
            color: #d1d5db;
            background: #111827;
            font-size: 13px;
        }

        @media (max-width: 700px) {
            .navbar {
                flex-direction: column;
            }

            .nav-links {
                justify-content: center;
                gap: 15px;
            }

            .hero {
                padding: 65px 20px;
            }

            .intro {
                grid-template-columns: 1fr;
                gap: 28px;
            }

            .values {
                grid-template-columns: 1fr;
            }

            .intro h2,
            .section-heading {
                font-size: 27px;
            }
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">

        <!-- Navigation -->
        <header class="navbar">

            <!-- Logo always returns to the public landing page -->
            <a class="brand" href="<%= ResolveUrl("~/Default.aspx") %>">
                WATCHVAULT
            </a>

            <nav class="nav-links" aria-label="Main navigation">
                <a href="<%= ResolveUrl("~/Home.aspx") %>">Home</a>

                <a href="<%= ResolveUrl("~/About.aspx") %>" class="active">
                    About Us
                </a>

                <a href="<%= ResolveUrl("~/Home.aspx#products") %>">
                    Shop Watches
                </a>

                <a href="<%= ResolveUrl("~/Login.aspx") %>">
                    Login
                </a>
            </nav>
        </header>

        <!-- Hero section -->
        <section class="hero">
            <span class="eyebrow">Our Story</span>

            <h1>
                Time Is More Than<br />
                Just a Moment.
            </h1>

            <p>
                Welcome to WatchVault, your destination for discovering
                timepieces that reflect your style, personality, and
                appreciation for timeless design.
            </p>
        </section>

        <main>

            <!-- About introduction -->
            <section class="container intro">
                <div>
                    <span class="eyebrow">Who We Are</span>

                    <h2>A Passion for Timepieces</h2>

                    <p>
                        WatchVault is an online watch-shopping platform
                        designed to make discovering watches simple,
                        enjoyable, and convenient.
                    </p>

                    <p>
                        Whether you appreciate classic designs, modern
                        styles, or everyday watches, our goal is to help
                        you explore different timepieces and find one
                        that suits your preferences.
                    </p>

                    <p>
                        We bring product discovery and online shopping
                        together in one accessible experience.
                    </p>
                </div>

                <div class="watch-art">
                    <div>
                        <div class="watch-symbol" aria-hidden="true">
                            &#8986;
                        </div>

                        <h2>Every Second Matters</h2>

                        <p>Discover your style. Value your time.</p>
                    </div>
                </div>
            </section>

            <!-- Mission and values -->
            <section class="values-section">
                <div class="container">
                    <div class="section-title">
                        <span class="eyebrow">What We Stand For</span>

                        <h2 class="section-heading">
                            The WatchVault Values
                        </h2>

                        <p>
                            The principles behind the shopping experience
                            we aim to create.
                        </p>
                    </div>

                    <div class="values">
                        <article class="value-card">
                            <div class="value-icon" aria-hidden="true">
                                &#9733;
                            </div>

                            <h3>Style &amp; Variety</h3>

                            <p>
                                Explore different watch styles and designs
                                to find a timepiece that fits your taste
                                and everyday needs.
                            </p>
                        </article>

                        <article class="value-card">
                            <div class="value-icon" aria-hidden="true">
                                &#9825;
                            </div>

                            <h3>Customer Focus</h3>

                            <p>
                                We aim to make browsing products and
                                navigating the online shopping experience
                                straightforward and user-friendly.
                            </p>
                        </article>

                        <article class="value-card">
                            <div class="value-icon" aria-hidden="true">
                                &#9201;
                            </div>

                            <h3>Timeless Design</h3>

                            <p>
                                We celebrate the role of watches as both
                                useful accessories and expressions of
                                individual personality.
                            </p>
                        </article>
                    </div>
                </div>
            </section>

            <!-- Mission -->
            <section class="container mission">
                <span class="eyebrow">Our Mission</span>

                <h2 class="section-heading">
                    Making Your Next Watch Easier to Discover
                </h2>

                <p>
                    Our mission is to provide a convenient online
                    destination where customers can browse watch
                    collections, learn about products, and enjoy a
                    clear and accessible shopping journey.
                </p>

                <a class="shop-button"
                   href="<%= ResolveUrl("~/Home.aspx#products") %>">
                    Explore Watches
                </a>
            </section>

        </main>

        <!-- Footer -->
        <footer class="footer">
            <p>
                &copy; <%= DateTime.Now.Year %> WatchVault.
                All rights reserved.
            </p>

            <p>Discover your style. Value your time.</p>
        </footer>

    </form>
</body>
</html>
