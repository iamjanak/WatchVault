
<%@ Page Title="Service Center | WatchVault"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="ServiceCenter.aspx.cs"
    Inherits="WatchVault.Products.ServiceCenter" %>

<%@ Register Src="~/Controls/Header.ascx"
    TagPrefix="wv" TagName="Header" %>

<%@ Register Src="~/Controls/Footer.ascx"
    TagPrefix="wv" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Service Center | WatchVault</title>

    <meta name="description"
        content="Explore WatchVault watch repair, maintenance, warranty assistance and customer support services." />

    <!-- Same fonts used throughout WatchVault -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Manrope:wght@400;500;600;700&display=swap"
        rel="stylesheet" />

    <!-- Bootstrap CSS: required for the shared responsive navigation -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet" />

    <!-- WatchVault global stylesheet -->
    <link href="<%= ResolveUrl("~/Content/Site.css") %>"
        rel="stylesheet"
        type="text/css" />

    <!-- Service Center page stylesheet -->
    <link href="<%= ResolveUrl("~/Content/ServiceCenter.css") %>"
        rel="stylesheet"
        type="text/css" />

</head>

<body class="service-page">

    <form id="form1" runat="server">

        <!-- Shared WatchVault Header -->
        <wv:Header ID="Header1" runat="server" />

        <main>

            <!-- =====================================
                 HERO SECTION
            ====================================== -->

            <section class="service-hero">

                <div class="service-container">

                    <span class="service-eyebrow">
                        WATCHVAULT CUSTOMER CARE
                    </span>

                    <h1>WatchVault Service Center</h1>

                    <p>
                        Your watch deserves the best care. Explore our watch
                        maintenance and repair support, warranty assistance,
                        and service coverage locations across Kathmandu Valley.
                    </p>

                </div>

            </section>


            <!-- =====================================
                 WATCH CARE SERVICES
            ====================================== -->

            <section class="service-section">

                <div class="service-container">

                    <div class="section-heading">

                        <span class="section-eyebrow">
                            CARE FOR YOUR TIMEPIECE
                        </span>

                        <h2>Our Watch Care Services</h2>

                        <p>
                            Professional care to keep your timepiece
                            performing at its best.
                        </p>

                    </div>


                    <div class="service-grid">

                        <article class="service-card">

                            <div class="service-icon">⌚</div>

                            <h3>Watch Repair</h3>

                            <p>
                                Assistance with watch inspection, movement
                                problems, and general repair requirements.
                            </p>

                        </article>


                        <article class="service-card">

                            <div class="service-icon">🔋</div>

                            <h3>Battery Replacement</h3>

                            <p>
                                Battery replacement support for compatible
                                quartz and digital watches.
                            </p>

                        </article>


                        <article class="service-card">

                            <div class="service-icon">⚙</div>

                            <h3>Watch Maintenance</h3>

                            <p>
                                General inspection, cleaning, and maintenance
                                support for your timepiece.
                            </p>

                        </article>


                        <article class="service-card">

                            <div class="service-icon">🔗</div>

                            <h3>Strap Replacement</h3>

                            <p>
                                Assistance with replacing damaged or worn
                                watch straps and bracelets.
                            </p>

                        </article>


                        <article class="service-card">

                            <div class="service-icon">🛡</div>

                            <h3>Warranty Assistance</h3>

                            <p>
                                Get information about warranty coverage,
                                eligibility, and claim procedures.
                            </p>

                        </article>


                        <article class="service-card">

                            <div class="service-icon">💬</div>

                            <h3>Customer Support</h3>

                            <p>
                                Get help with service enquiries and
                                watch-related support.
                            </p>

                        </article>

                    </div>

                </div>

            </section>


            <!-- =====================================
                 SERVICE LOCATIONS
            ====================================== -->

            <section class="service-section location-section">

                <div class="service-container">

                    <div class="section-heading">

                        <span class="section-eyebrow">
                            KATHMANDU VALLEY
                        </span>

                        <h2>Find a Service Location</h2>

                        <p>
                            Explore our proposed service coverage areas
                            around Kathmandu Valley.
                        </p>

                    </div>


                    <div class="location-grid">


                        <!-- LAZIMPAT -->

                        <article class="location-card">

                            <iframe
                                title="Lazimpat map"
                                loading="lazy"
                                src="https://maps.google.com/maps?q=Lazimpat%2C%20Kathmandu%2C%20Nepal&output=embed">
                            </iframe>

                            <div class="location-info">

                                <h3>Lazimpat</h3>

                                <p>Kathmandu, Nepal</p>

                                <span class="location-tag">
                                    Proposed service area
                                </span>

                                <a class="location-link"
                                   href="https://www.google.com/maps/search/?api=1&query=Lazimpat%2C+Kathmandu%2C+Nepal"
                                   target="_blank"
                                   rel="noopener noreferrer">

                                    View on Google Maps →

                                </a>

                            </div>

                        </article>


                        <!-- KOTESHWOR -->

                        <article class="location-card">

                            <iframe
                                title="Koteshwor map"
                                loading="lazy"
                                src="https://maps.google.com/maps?q=Koteshwor%2C%20Kathmandu%2C%20Nepal&output=embed">
                            </iframe>

                            <div class="location-info">

                                <h3>Koteshwor</h3>

                                <p>Kathmandu, Nepal</p>

                                <span class="location-tag">
                                    Proposed service area
                                </span>

                                <a class="location-link"
                                   href="https://www.google.com/maps/search/?api=1&query=Koteshwor%2C+Kathmandu%2C+Nepal"
                                   target="_blank"
                                   rel="noopener noreferrer">

                                    View on Google Maps →

                                </a>

                            </div>

                        </article>


                        <!-- NEW BANESHWOR -->

                        <article class="location-card">

                            <iframe
                                title="New Baneshwor map"
                                loading="lazy"
                                src="https://maps.google.com/maps?q=New%20Baneshwor%2C%20Kathmandu%2C%20Nepal&output=embed">
                            </iframe>

                            <div class="location-info">

                                <h3>New Baneshwor</h3>

                                <p>Kathmandu, Nepal</p>

                                <span class="location-tag">
                                    Proposed service area
                                </span>

                                <a class="location-link"
                                   href="https://www.google.com/maps/search/?api=1&query=New+Baneshwor%2C+Kathmandu%2C+Nepal"
                                   target="_blank"
                                   rel="noopener noreferrer">

                                    View on Google Maps →

                                </a>

                            </div>

                        </article>


                        <!-- BHAKTAPUR -->

                        <article class="location-card">

                            <iframe
                                title="Bhaktapur map"
                                loading="lazy"
                                src="https://maps.google.com/maps?q=Bhaktapur%2C%20Nepal&output=embed">
                            </iframe>

                            <div class="location-info">

                                <h3>Bhaktapur</h3>

                                <p>Bhaktapur, Nepal</p>

                                <span class="location-tag">
                                    Proposed service area
                                </span>

                                <a class="location-link"
                                   href="https://www.google.com/maps/search/?api=1&query=Bhaktapur%2C+Nepal"
                                   target="_blank"
                                   rel="noopener noreferrer">

                                    View on Google Maps →

                                </a>

                            </div>

                        </article>


                    </div>

                </div>

            </section>


            <!-- =====================================
                 WARRANTY INFORMATION
            ====================================== -->

            <section class="service-section">

                <div class="service-container">

                    <div class="warranty-box">

                        <div class="warranty-icon">🛡</div>

                        <h2>Need Warranty Assistance?</h2>

                        <p>
                            Keep your purchase receipt and warranty information
                            ready when requesting assistance. Warranty coverage
                            depends on the product and its manufacturer's terms.
                            Please check your individual watch warranty details.
                        </p>

                    </div>

                </div>

            </section>


            <!-- =====================================
                 CONTACT SUPPORT
            ====================================== -->

            <section class="contact-section">

                <div class="service-container">

                    <span class="section-eyebrow">
                        WATCHVAULT SUPPORT
                    </span>

                    <h2>We Are Here to Help</h2>

                    <p>
                        Have a question about your watch or need service
                        assistance? Contact the WatchVault support team.
                    </p>

                </div>

            </section>

        </main>


        <!-- Shared WatchVault Footer -->
        <wv:Footer ID="Footer1" runat="server" />

    </form>

    <!-- Bootstrap JavaScript for dropdown and mobile navigation -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
