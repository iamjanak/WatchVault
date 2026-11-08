
<%@ Page Title="About Us | WatchVault" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WatchVault.About" %>

<asp:Content ID="AboutContent" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        /* =========================================
           WATCHVAULT - ABOUT US PAGE
        ========================================= */

        .wv-about {
            --wv-navy: #102542;
            --wv-blue: #438fe0;
            --wv-muted: #718096;
            --wv-light: #f5f8fc;
            --wv-border: #e5ebf2;
            color: var(--wv-navy);
            overflow: hidden;
        }

        .wv-about * {
            box-sizing: border-box;
        }

        .wv-about .wv-container {
            width: min(1200px, 90%);
            margin: auto;
        }

        /* HERO SECTION */

        .wv-about-hero {
            background: #f5f8fc;
            padding: 85px 0;
        }

        .wv-about-hero-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            align-items: center;
            gap: 65px;
        }

        .wv-about-label {
            display: inline-block;
            color: #438fe0;
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 3px;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        .wv-about-hero h1 {
            font-family: Georgia, serif;
            font-size: clamp(38px, 5vw, 62px);
            line-height: 1.15;
            font-weight: 400;
            margin: 0 0 25px;
            color: #102542;
        }

        .wv-about-hero h1 span {
            color: #438fe0;
            font-style: italic;
        }

        .wv-about-hero p {
            color: #718096;
            font-size: 16px;
            line-height: 1.9;
            margin-bottom: 30px;
        }

        .wv-about-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            padding: 14px 27px;
            background: #102542;
            color: white !important;
            text-decoration: none !important;
            border: 1px solid #102542;
            border-radius: 3px;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: 1px;
            transition: .3s ease;
        }

        .wv-about-btn:hover {
            background: #438fe0;
            border-color: #438fe0;
            transform: translateY(-2px);
        }

        .wv-about-hero-image {
            position: relative;
        }

        .wv-about-hero-image img {
            width: 100%;
            height: 440px;
            object-fit: cover;
            display: block;
        }

        .wv-image-caption {
            position: absolute;
            bottom: -20px;
            left: -25px;
            background: white;
            padding: 22px 28px;
            box-shadow: 0 8px 30px rgba(16, 37, 66, .10);
        }

        .wv-image-caption strong {
            display: block;
            font-family: Georgia, serif;
            font-size: 21px;
            font-weight: 400;
        }

        .wv-image-caption span {
            color: #718096;
            font-size: 11px;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        /* OUR STORY */

        .wv-about-story {
            padding: 100px 0;
        }

        .wv-about-story-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            align-items: center;
            gap: 75px;
        }

        .wv-story-image img {
            width: 100%;
            height: 420px;
            object-fit: cover;
        }

        .wv-about-section-title {
            font-family: Georgia, serif;
            font-size: clamp(30px, 4vw, 43px);
            font-weight: 400;
            line-height: 1.25;
            margin-bottom: 24px;
            color: #102542;
        }

        .wv-about-text {
            color: #718096;
            font-size: 15px;
            line-height: 1.95;
            margin-bottom: 18px;
        }

        .wv-story-line {
            width: 55px;
            height: 3px;
            background: #438fe0;
            margin-bottom: 25px;
        }

        /* STATISTICS */

        .wv-about-stats {
            background: #102542;
            padding: 55px 0;
        }

        .wv-stats-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 25px;
            text-align: center;
        }

        .wv-stat-item h3 {
            color: #fff;
            font-family: Georgia, serif;
            font-size: 39px;
            font-weight: 400;
            margin-bottom: 8px;
        }

        .wv-stat-item p {
            color: #b9c8dc;
            font-size: 12px;
            letter-spacing: 1.5px;
            text-transform: uppercase;
            margin: 0;
        }

        /* OUR VALUES */

        .wv-about-values {
            padding: 100px 0;
            background: #f5f8fc;
        }

        .wv-about-heading {
            text-align: center;
            max-width: 650px;
            margin: 0 auto 55px;
        }

        .wv-about-heading p {
            color: #718096;
            font-size: 15px;
            line-height: 1.8;
        }

        .wv-values-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 25px;
        }

        .wv-value-card {
            background: #fff;
            padding: 38px 30px;
            border: 1px solid #e5ebf2;
            transition: .3s ease;
        }

        .wv-value-card:hover {
            transform: translateY(-7px);
            box-shadow: 0 12px 30px rgba(16, 37, 66, .08);
        }

        .wv-value-number {
            color: #438fe0;
            font-family: Georgia, serif;
            font-size: 27px;
            margin-bottom: 22px;
        }

        .wv-value-card h3 {
            color: #102542;
            font-family: Georgia, serif;
            font-size: 23px;
            font-weight: 400;
            margin-bottom: 15px;
        }

        .wv-value-card p {
            color: #718096;
            font-size: 14px;
            line-height: 1.9;
            margin: 0;
        }

        /* CLOSING SECTION */

        .wv-about-cta {
            padding: 95px 20px;
            text-align: center;
            background: #fff;
        }

        .wv-about-cta h2 {
            font-family: Georgia, serif;
            font-size: clamp(30px, 4vw, 45px);
            font-weight: 400;
            margin-bottom: 18px;
        }

        .wv-about-cta p {
            max-width: 600px;
            margin: 0 auto 30px;
            color: #718096;
            line-height: 1.9;
            font-size: 15px;
        }

        /* RESPONSIVE DESIGN */

        @media (max-width: 768px) {

            .wv-about-hero {
                padding: 55px 0 75px;
            }

            .wv-about-hero-grid,
            .wv-about-story-grid {
                grid-template-columns: 1fr;
                gap: 40px;
            }

            .wv-about-hero h1 {
                font-size: 42px;
            }

            .wv-about-hero-image img {
                height: 320px;
            }

            .wv-image-caption {
                left: 10px;
                bottom: -15px;
            }

            .wv-about-story,
            .wv-about-values {
                padding: 65px 0;
            }

            .wv-story-image img {
                height: 320px;
            }

            .wv-stats-grid {
                grid-template-columns: repeat(2, 1fr);
                gap: 35px 15px;
            }

            .wv-stat-item h3 {
                font-size: 32px;
            }

            .wv-values-grid {
                grid-template-columns: 1fr;
            }

            .wv-about-cta {
                padding: 65px 20px;
            }
        }

        @media (max-width: 380px) {
            .wv-about-hero h1 {
                font-size: 35px;
            }

            .wv-about-container {
                width: 94%;
            }
        }
    </style>


    <main class="wv-about">

        <!-- HERO SECTION -->

            <section class="wv-about-hero">
                <div class="wv-container">

                <div class="wv-about-hero-grid">

                    <div>
                        <span class="wv-about-label">
                            Welcome to WatchVault
                        </span>

                        <h1>
                            More Than Time.<br />
                            A Statement of <span>Style.</span>
                        </h1>

                        <p>
                            At WatchVault, we believe a watch is more than
                            an instrument that tells time. It represents
                            personality, craftsmanship, precision and
                            timeless elegance. Our collection brings
                            together carefully selected timepieces for
                            every moment and every lifestyle.
                        </p>

                        <a href="<%= ResolveUrl("~/Products/NewArrivals.aspx") %>"
                           class="wv-about-btn">
                            EXPLORE OUR COLLECTION
                        </a>
                    </div>

                    <div class="wv-about-hero-image">
                        <img src="<%= ResolveUrl("~/Images/about-watch.jpg") %>"
                             alt="Luxury watch collection at WatchVault" />

                        <div class="wv-image-caption">
                            <strong>Timeless by Design.</strong>
                            <span>Precision Meets Elegance</span>
                        </div>
                    </div>

                </div>

            </div>
        </section>


        <!-- OUR STORY -->

        <section class="wv-about-story">
            <div class="wv-container">

                <div class="wv-about-story-grid">

                    <div class="wv-story-image">
                        <img src="<%= ResolveUrl("~/Images/watch-craftsmanship.jpg") %>"
                             alt="Detailed craftsmanship of a luxury watch" />
                    </div>

                    <div>

                        <span class="wv-about-label">
                            Our Story
                        </span>

                        <h2 class="wv-about-section-title">
                            Celebrating the Art of Fine Watchmaking
                        </h2>

                        <div class="wv-story-line"></div>

                        <p class="wv-about-text">
                            WatchVault was created with a passion for
                            exceptional timepieces and the art of
                            watchmaking. We aim to bring together
                            watches that combine outstanding design,
                            reliable performance and lasting quality.
                        </p>

                        <p class="wv-about-text">
                            From sophisticated dress watches to
                            adventurous sports watches, our collection
                            is designed to help customers discover
                            timepieces that match their individual
                            preferences and lifestyles.
                        </p>

                        <p class="wv-about-text">
                            Our goal is to make discovering and
                            purchasing quality watches simple,
                            informative and enjoyable through a
                            convenient online shopping experience.
                        </p>

                    </div>

                </div>

            </div>
        </section>


        <!-- BRAND HIGHLIGHTS -->

        <section class="wv-about-stats">
            <div class="wv-container">

                <div class="wv-stats-grid">

                    <div class="wv-stat-item">
                        <h3>01</h3>
                        <p>Quality First</p>
                    </div>

                    <div class="wv-stat-item">
                        <h3>02</h3>
                        <p>Timeless Design</p>
                    </div>

                    <div class="wv-stat-item">
                        <h3>03</h3>
                        <p>Customer Focus</p>
                    </div>

                    <div class="wv-stat-item">
                        <h3>04</h3>
                        <p>Precision</p>
                    </div>

                </div>

            </div>
        </section>


        <!-- OUR VALUES -->

        <section class="wv-about-values">
            <div class="wv-container">

                <div class="wv-about-heading">

                    <span class="wv-about-label">
                        What Defines Us
                    </span>

                    <h2 class="wv-about-section-title">
                        The Values Behind WatchVault
                    </h2>

                    <p>
                        Every detail matters. Our commitment to quality,
                        design and customer satisfaction shapes the
                        WatchVault experience.
                    </p>

                </div>


                <div class="wv-values-grid">

                    <div class="wv-value-card">

                        <div class="wv-value-number">01</div>

                        <h3>Exceptional Quality</h3>

                        <p>
                            We focus on presenting carefully selected
                            timepieces with detailed product information,
                            specifications and warranty details to help
                            customers make informed decisions.
                        </p>

                    </div>


                    <div class="wv-value-card">

                        <div class="wv-value-number">02</div>

                        <h3>Timeless Elegance</h3>

                        <p>
                            We appreciate the balance between classic
                            watchmaking traditions and modern design.
                            Our collections reflect different tastes,
                            occasions and lifestyles.
                        </p>

                    </div>


                    <div class="wv-value-card">

                        <div class="wv-value-number">03</div>

                        <h3>Customer Experience</h3>

                        <p>
                            We aim to provide a convenient shopping
                            journey through easy navigation, product
                            comparisons, secure accounts and accessible
                            order information.
                        </p>

                    </div>

                </div>

            </div>
        </section>


        <!-- CLOSING SECTION -->

        <section class="wv-about-cta">
            <div class="wv-container">

                <span class="wv-about-label">
                    Discover WatchVault
                </span>

                <h2>
                    Find the Timepiece That Defines You.
                </h2>

                <p>
                    Explore our collection and discover watches that
                    complement your personality, celebrate your
                    achievements and accompany every important moment.
                </p>

                <a href="<%= ResolveUrl("~/Products/NewArrivals.aspx") %>"
                   class="wv-about-btn">
                    DISCOVER OUR WATCHES
                </a>

            </div>
        </section>

    </main>

</asp:Content>
