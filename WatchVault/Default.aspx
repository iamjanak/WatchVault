<%@ Page Title="Home | WatchVault" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WatchVault._Default" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>WatchVault | Premium Watches</title>
<meta name="description" content="Explore, compare and discover wristwatches with clear specifications and warranty details." />

<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Manrope:wght@400;500;600;700&display=swap" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="Content/Site.css" rel="stylesheet" />

<style>
:root {
    --ink: #0E1A2B;
    --ink2: #16273F;
    --brass: #B8914F;
    --brassdk: #8F6D34;
    --paper: #F6F7F9;
    --line: #D9DEE5;
    --muted: #5B6675;
}
html { scroll-behavior: smooth; scroll-padding-top: 80px; }
body {
    margin: 0;
    color: #1B2430;
    font-family: Manrope, Arial, sans-serif;
}
h1, h2, h3, .serif {
    font-family: "Instrument Serif", Georgia, serif;
    font-weight: 400;
}
:focus-visible {
    outline: 3px solid var(--brass);
    outline-offset: 3px;
}

/* ===== Header ===== */
.wv-header {
    position: sticky;
    top: 0;
    z-index: 1030;
    background: #fff;
    padding: .8rem 0;
    border-bottom: 1px solid var(--line);
    box-shadow: 0 2px 8px rgba(14,26,43,.08);
}
.wv-brand {
    display: flex;
    align-items: center;
    gap: .65rem;
    color: var(--brass);
    font-family: "Instrument Serif", Georgia, serif;
    font-size: 1.9rem;
    letter-spacing: 1px;
    text-transform: uppercase;
    text-decoration: none;
}
.wv-brand:hover { color: var(--brassdk); }
.wv-brand svg { width: 30px; height: 42px; flex: none; }

.wv-nav .nav-link {
    color: #1B2430;
    font-size: 1rem;
    font-weight: 500;
    padding: .5rem .85rem;
}
.wv-nav .nav-link:hover,
.wv-nav .nav-link:focus { color: var(--brassdk); }
.wv-nav .dropdown-menu {
    border: 1px solid var(--line);
    border-radius: 10px;
    box-shadow: 0 10px 24px rgba(14,26,43,.1);
    padding: .5rem;
}
.wv-nav .dropdown-item {
    border-radius: 6px;
    font-size: .93rem;
    padding: .45rem .8rem;
}
.wv-nav .dropdown-item:hover { background: var(--paper); color: var(--brassdk); }

.wv-search {
    display: flex;
    align-items: center;
    width: 300px;
    background: #fff;
    border: 1px solid #1B2430;
    border-radius: 2px;
}
.wv-search:focus-within { box-shadow: 0 0 0 3px var(--brass); }
.wv-search input {
    flex: 1;
    min-width: 0;
    border: 0;
    outline: none;
    padding: .55rem .75rem;
    font-size: .9rem;
    background: transparent;
}
.wv-search button {
    border: 0;
    background: transparent;
    padding: .4rem .7rem;
    color: #1B2430;
    line-height: 0;
}
.wv-search svg, .wv-bag svg { width: 22px; height: 22px; }
.wv-bag { color: #1B2430; line-height: 0; padding: .3rem; }
.wv-bag:hover, .wv-login:hover { color: var(--brassdk); }
.wv-login {
    color: #1B2430;
    font-size: .95rem;
    font-weight: 600;
    text-decoration: none;
}
.wv-toggler { border: 1px solid var(--line); }

/* Footer still uses this */
.navbar-brand {
    color: #fff;
    font-family: "Instrument Serif", Georgia, serif;
    font-size: 1.8rem;
}
.navbar-brand:hover { color: var(--brass); }

.btn { border-radius: 10px; font-weight: 700; }
.btn-brass {
    background: var(--brass);
    border: 1px solid var(--brass);
    color: #171207;
}
.btn-brass:hover {
    background: #C9A25F;
    border-color: #C9A25F;
    color: #171207;
}
.btn-ink {
    color: var(--ink);
    border: 1px solid var(--ink);
}
.btn-ink:hover { background: var(--ink); color: #fff; }
.btn-ghost {
    color: #fff;
    border: 1px solid rgba(255,255,255,.5);
}
.btn-ghost:hover { background: rgba(255,255,255,.1); color: #fff; }

.hero {
    background: radial-gradient(ellipse at 80% 35%, var(--ink2), var(--ink) 70%);
    color: #fff;
    padding: 5rem 0;
}
.hero h1 {
    font-size: clamp(2.8rem, 6vw, 4.8rem);
    line-height: 1.02;
}
.hero h1 em { color: var(--brass); }
.hero .lead {
    color: #B9C4D3;
    max-width: 35rem;
    line-height: 1.8;
}
.hero-search {
    display: flex;
    gap: .5rem;
    max-width: 35rem;
    background: #fff;
    border-radius: 13px;
    padding: .4rem;
}
.hero-search input {
    min-width: 0;
    flex: 1;
    border: 0;
    padding: .75rem;
    outline: none;
}
.hero-search:focus-within { box-shadow: 0 0 0 3px var(--brass); }
.dial {
    max-width: 420px;
    margin: auto;
}
.dial svg {
    display: block;
    width: 100%;
    height: auto;
    filter: drop-shadow(0 25px 35px rgba(0,0,0,.4));
}
.clock-label {
    color: #B9C4D3;
    text-align: center;
    font-size: .85rem;
    margin-top: .8rem;
}

.assure {
    background: var(--paper);
    border-bottom: 1px solid var(--line);
}
.assure-item {
    display: flex;
    gap: .8rem;
    align-items: center;
    padding: 1.3rem 1rem;
}
.assure-item svg {
    width: 29px;
    height: 29px;
    flex: none;
    color: var(--brassdk);
}
.assure-item strong { display: block; font-size: .92rem; }
.assure-item span { color: var(--muted); font-size: .82rem; }

.section { padding: 5rem 0; }
.section-head {
    max-width: 42rem;
    margin-bottom: 2.2rem;
}
.section-head h2 {
    font-size: clamp(2.1rem, 4vw, 3rem);
    line-height: 1.1;
}
.section-head p { color: var(--muted); line-height: 1.7; }
.category-card {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    min-height: 155px;
    padding: 1.25rem;
    color: inherit;
    text-decoration: none;
    border: 1px solid var(--line);
    border-radius: 14px;
    transition: .2s;
}
.category-card:hover {
    border-color: var(--brass);
    background: var(--paper);
    transform: translateY(-2px);
    color: inherit;
}
.category-card svg {
    width: 34px;
    height: 34px;
    color: var(--brassdk);
}
.category-card h3 { font-size: 1.5rem; margin: .6rem 0 .2rem; }
.category-card small { color: var(--muted); }

.product-card {
    display: flex;
    flex-direction: column;
    height: 100%;
    overflow: hidden;
    background: #fff;
    border: 1px solid var(--line);
    border-radius: 15px;
    transition: box-shadow .2s, transform .2s;
}
.product-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 28px rgba(14,26,43,.09);
}
.product-art {
    position: relative;
    display: grid;
    place-items: center;
    min-height: 225px;
    background: var(--paper);
    padding: 1.2rem;
}
.product-art svg { width: 120px; height: 190px; }
.product-tag {
    position: absolute;
    top: .8rem;
    left: .8rem;
    background: var(--ink);
    color: #fff;
    padding: .3rem .65rem;
    border-radius: 30px;
    font-size: .72rem;
    font-weight: 700;
}
.product-body {
    padding: 1.1rem;
    display: flex;
    flex-direction: column;
    flex: 1;
}
.brand-name {
    color: var(--muted);
    font-size: .8rem;
    font-weight: 700;
}
.product-body h3 { font-size: 1.5rem; margin: .2rem 0 .7rem; }
.spec-list {
    list-style: none;
    padding: 0;
    margin: 0 0 1rem;
    color: var(--muted);
    font-size: .84rem;
}
.spec-list li { padding: .18rem 0; }
.product-footer {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: .5rem;
    margin-top: auto;
}
.price { font-size: 1.05rem; font-weight: 800; }

.dark-section { background: var(--ink); color: #fff; }
.dark-section .section-head p { color: #A9B6C7; }
.feature-item {
    border-top: 2px solid var(--brass);
    padding-top: 1rem;
    height: 100%;
}
.feature-item h3 { font-size: 1.5rem; }
.feature-item p { color: #B3BFCE; line-height: 1.7; font-size: .92rem; }

.compare-table {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
    font-size: .9rem;
}
.compare-table th, .compare-table td {
    padding: .9rem;
    border-bottom: 1px solid var(--line);
    text-align: left;
}
.compare-table thead th {
    background: var(--paper);
    font-family: "Instrument Serif", Georgia, serif;
    font-size: 1.2rem;
    font-weight: 400;
}
.compare-table tbody th {
    color: var(--muted);
    font-size: .83rem;
}
.steps {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 1.2rem;
    list-style: none;
    padding: 0;
    counter-reset: step;
}
.steps li {
    counter-increment: step;
    border-left: 1px solid var(--line);
    padding-left: 1rem;
}
.steps li::before {
    content: counter(step, decimal-leading-zero);
    display: block;
    color: var(--brassdk);
    font-family: "Instrument Serif", Georgia, serif;
    font-size: 2.3rem;
}
.steps h3 { font-size: 1.4rem; }
.steps p { color: var(--muted); font-size: .9rem; }

.warranty-panel {
    background: var(--paper);
    border: 1px solid var(--line);
    border-radius: 18px;
    padding: 2rem;
}
.warranty-list { list-style: none; padding: 0; margin: 0; }
.warranty-list li { padding: .45rem 0; }
.warranty-list li::before { content: "✓"; color: var(--brassdk); font-weight: 800; margin-right: .7rem; }

.accordion-button:not(.collapsed) {
    background: var(--paper);
    color: var(--ink);
    box-shadow: none;
}
.accordion-button:focus { box-shadow: 0 0 0 3px var(--brass); }

.cta {
    text-align: center;
    background: var(--paper);
    border-top: 1px solid var(--line);
}
.cta h2 { font-size: clamp(2.2rem, 4vw, 3.2rem); }
footer {
    background: var(--ink);
    color: #A9B6C7;
    padding: 3rem 0 1.5rem;
    font-size: .9rem;
}
footer h4 { color: #fff; font-size: .95rem; font-weight: 700; }
footer a {
    display: block;
    color: #A9B6C7;
    text-decoration: none;
    padding: .25rem 0;
}
footer a:hover { color: #fff; }
.legal {
    border-top: 1px solid rgba(255,255,255,.14);
    margin-top: 2rem;
    padding-top: 1.2rem;
    font-size: .82rem;
}
@media(max-width:991px) {
    .hero { padding: 3.5rem 0; }
    .dial { max-width: 330px; margin-top: 1.5rem; }
    .steps { grid-template-columns: repeat(2,1fr); }
    .wv-search { width: 100%; }
    .wv-right { margin-top: .8rem; flex-wrap: wrap; }
}
@media(max-width:575px) {
    .section { padding: 3.2rem 0; }
    .hero-search { flex-direction: column; }
    .steps { grid-template-columns: 1fr; }
    .compare-table { font-size: .78rem; }
    .compare-table th, .compare-table td { padding: .6rem .45rem; }
}
@media(prefers-reduced-motion:reduce) {
    html { scroll-behavior: auto; }
    *, *::before, *::after { transition: none !important; }
}
</style>
</head>
<body>

<!-- Shared vector watch used by the live clock and product cards -->
<svg width="0" height="0" style="position:absolute" aria-hidden="true">
    <symbol id="watch-symbol" viewBox="0 0 120 190">
        <rect x="40" y="0" width="40" height="55" rx="6" fill="var(--strap)" />
        <rect x="40" y="135" width="40" height="55" rx="6" fill="var(--strap)" />
        <circle cx="60" cy="95" r="44" fill="#B8914F" />
        <circle cx="60" cy="95" r="39" fill="var(--face)" />
        <path d="M60 95 V68 M60 95 L76 103" stroke="var(--hand)" stroke-width="3" stroke-linecap="round" />
        <circle cx="60" cy="95" r="3" fill="#B8914F" />
    </symbol>
</svg>

<form id="form1" runat="server">

<!-- Header -->
<nav class="wv-header navbar navbar-expand-lg" aria-label="Main navigation">
    <div class="container">
        <a class="wv-brand" href="Default.aspx" aria-label="WatchVault home">
            <svg viewBox="0 0 30 42" fill="none" stroke="currentColor" stroke-width="1.5" aria-hidden="true">
                <path d="M10 1h10l1.5 8h-13zM8.5 33h13L20 41H10z"/>
                <circle cx="15" cy="21" r="11"/>
                <path d="M15 14v7l4 3"/>
            </svg>
            WatchVault
        </a>

        <button class="navbar-toggler wv-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainNav">
            <ul class="navbar-nav wv-nav mx-auto align-items-lg-center">
                <li class="nav-item"><a class="nav-link" href="Default.aspx">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="About.aspx">About us</a></li>
                <li class="nav-item"><a class="nav-link" href="Products.aspx?sort=new">New Arrivals</a></li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="Products.aspx" role="button" data-bs-toggle="dropdown" aria-expanded="false">Watches</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="Products.aspx">All watches</a></li>
                        <li><a class="dropdown-item" href="Products.aspx?category=Dress">Dress</a></li>
                        <li><a class="dropdown-item" href="Products.aspx?category=Sport">Sport</a></li>
                        <li><a class="dropdown-item" href="Products.aspx?category=Dive">Dive</a></li>
                        <li><a class="dropdown-item" href="Products.aspx?category=Chronograph">Chronograph</a></li>
                        <li><a class="dropdown-item" href="Products.aspx?category=Smart">Smart</a></li>
                    </ul>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Home &amp; Lifestyle</a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="Products.aspx?category=WallClocks">Wall clocks</a></li>
                        <li><a class="dropdown-item" href="Products.aspx?category=TableClocks">Table clocks</a></li>
                        <li><a class="dropdown-item" href="Products.aspx?category=Accessories">Accessories</a></li>
                    </ul>
                </li>

                <li class="nav-item"><a class="nav-link" href="ServiceCenter.aspx">Service Center</a></li>
            </ul>

            <div class="wv-right d-flex align-items-center gap-3">
                <div class="wv-search" role="search">
                    <input type="search" id="headerSearch" maxlength="80" placeholder="Search..." aria-label="Search watches" />
                    <button type="button" id="headerSearchBtn" aria-label="Search">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"><circle cx="11" cy="11" r="7"/><path d="M20 20l-4-4"/></svg>
                    </button>
                </div>
                <a class="wv-bag" href="Cart.aspx" aria-label="Shopping cart">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linejoin="round" stroke-linecap="round"><path d="M5 8h14l-1 12H6L5 8z"/><path d="M9 8V6a3 3 0 0 1 6 0v2"/></svg>
                </a>
                <asp:PlaceHolder ID="phGuest" runat="server">
    <a class="wv-login" href="Login.aspx">Log in</a>
</asp:PlaceHolder>

<asp:PlaceHolder ID="phUser" runat="server" Visible="false">
    <div class="dropdown">
        <a class="wv-login dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Hi, <span class="wv-user"><asp:Literal ID="litUserName" runat="server" /></span>
        </a>
        <ul class="dropdown-menu dropdown-menu-end">
            <li><a class="dropdown-item" href="Orders.aspx">My orders</a></li>
            <li><a class="dropdown-item" href="Wishlist.aspx">Wishlist</a></li>
            <li><hr class="dropdown-divider" /></li>
            <li>
                <asp:LinkButton ID="btnLogout" runat="server" CssClass="dropdown-item"
                    CausesValidation="false" OnClick="btnLogout_Click">Log out</asp:LinkButton>
            </li>
        </ul>
    </div>
</asp:PlaceHolder>
            </div>
        </div>
    </div>
</nav>

<main>
    <!-- Hero and live clock -->
    <header class="hero">
        <div class="container">
            <div class="row align-items-center g-4">
                <div class="col-lg-7">
                    <p class="text-uppercase small fw-bold mb-3" style="letter-spacing:3px;color:#B8914F">Discover your next favourite</p>
                    <h1>Time is precious.<br />Wear it <em>well.</em></h1>
                    <p class="lead mt-3 mb-4">Explore watches for every style and occasion. Compare the details, understand the specifications, and find a watch that feels right for you.</p>

                    <div class="hero-search mb-3" role="search">
                        <input type="search" id="searchBox" maxlength="80" placeholder="Search brand, model or movement" aria-label="Search watches" />
                        <button type="button" class="btn btn-brass" id="searchButton">Search watches</button>
                    </div>
                    <div class="d-flex flex-wrap gap-2">
                        <a href="#featured" class="btn btn-brass btn-lg">Explore watches</a>
                        <a href="Products.aspx" class="btn btn-ghost btn-lg">Shop all</a>
                    </div>
                    <p class="small mt-3 mb-0" style="color:#A9B6C7">Elegant design. Clear specifications. Easier choices.</p>
                </div>

                <div class="col-lg-5">
                    <div class="dial">
                        <svg viewBox="0 0 400 400" role="img" aria-label="Analogue watch showing the current local time">
                            <rect x="150" y="0" width="100" height="70" rx="12" fill="#2A3B55" />
                            <rect x="150" y="330" width="100" height="70" rx="12" fill="#2A3B55" />
                            <circle cx="200" cy="200" r="150" fill="#B8914F" />
                            <circle cx="200" cy="200" r="142" fill="#0A1322" />
                            <circle cx="200" cy="200" r="132" fill="#F6F1E6" />
                            <g id="clockTicks"></g>
                            <text x="200" y="145" text-anchor="middle" font-family="Instrument Serif,Georgia,serif" font-size="26" fill="#0E1A2B">WatchVault</text>
                            <text x="200" y="263" text-anchor="middle" font-family="Manrope,Arial,sans-serif" font-size="11" fill="#5B6675" letter-spacing="2">AUTOMATIC</text>
                            <g id="hourHand"><rect x="195" y="125" width="10" height="80" rx="4" fill="#0E1A2B" /></g>
                            <g id="minuteHand"><rect x="197.5" y="90" width="5" height="115" rx="2.5" fill="#0E1A2B" /></g>
                            <g id="secondHand"><rect x="199" y="75" width="2" height="130" fill="#B8914F" /></g>
                            <circle cx="200" cy="200" r="8" fill="#B8914F" />
                            <circle cx="200" cy="200" r="3" fill="#0A1322" />
                        </svg>
                        <div class="clock-label">LIVE LOCAL TIME · <span id="digitalTime">Loading time…</span></div>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Service highlights -->
    <section class="assure" aria-label="Store highlights">
        <div class="container">
            <div class="row g-0">
                <div class="col-6 col-lg-3 assure-item">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M12 3l8 3v6c0 5-3.5 8-8 9-4.5-1-8-4-8-9V6l8-3z"/><path d="M8.5 12l2.5 2.5 4.5-5"/></svg>
                    <div><strong>Warranty details</strong><span>Information beside each listing.</span></div>
                </div>
                <div class="col-6 col-lg-3 assure-item">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M4 7h12M13 4l3 3-3 3M20 17H8M11 14l-3 3 3 3"/></svg>
                    <div><strong>Compare watches</strong><span>Review specifications together.</span></div>
                </div>
                <div class="col-6 col-lg-3 assure-item">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><path d="M3 7h11v9H3zM14 10h4l3 3v3h-7z"/><circle cx="7" cy="18" r="1.6"/><circle cx="17" cy="18" r="1.6"/></svg>
                    <div><strong>Order information</strong><span>Keep order details together.</span></div>
                </div>
                <div class="col-6 col-lg-3 assure-item">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="3" y="6" width="18" height="13" rx="2"/><path d="M3 10h18M7 15h4"/></svg>
                    <div><strong>Responsive design</strong><span>Designed for different screens.</span></div>
                </div>
            </div>
        </div>
    </section>

    <!-- Categories -->
    <section class="section" id="categories">
        <div class="container">
            <div class="section-head">
                <h2>Start with your style</h2>
                <p>Explore different watch styles and narrow down your choice by design, movement, materials and price.</p>
            </div>
            <div class="row g-3">
                <div class="col-6 col-md-4 col-lg">
                    <a class="category-card" href="Products.aspx?category=Dress">
                        <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="16" cy="16" r="9"/><path d="M16 11v5l3 2M12 3h8M12 29h8"/></svg>
                        <div><h3>Dress</h3><small>Elegant and formal</small></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg">
                    <a class="category-card" href="Products.aspx?category=Sport">
                        <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="16" cy="16" r="9"/><path d="M16 11v5l3 2M12 3h8M12 29h8"/></svg>
                        <div><h3>Sport</h3><small>Active everyday style</small></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg">
                    <a class="category-card" href="Products.aspx?category=Dive">
                        <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="16" cy="16" r="9"/><path d="M16 11v5l3 2M12 3h8M12 29h8"/></svg>
                        <div><h3>Dive</h3><small>Water-sport styling</small></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg">
                    <a class="category-card" href="Products.aspx?category=Chronograph">
                        <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="1.6"><circle cx="16" cy="16" r="9"/><path d="M16 11v5l3 2M12 3h8M12 29h8"/></svg>
                        <div><h3>Chronograph</h3><small>Precision-inspired</small></div>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg">
                    <a class="category-card" href="Products.aspx?category=Smart">
                        <svg viewBox="0 0 32 32" fill="none" stroke="currentColor" stroke-width="1.6"><rect x="9" y="5" width="14" height="22" rx="4"/><path d="M13 9h6M13 23h6"/></svg>
                        <div><h3>Smart</h3><small>Connected features</small></div>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Featured watches -->
    <section class="section pt-0" id="featured">
        <div class="container">
            <div class="d-flex flex-wrap justify-content-between align-items-end gap-3 mb-4">
                <div class="section-head mb-0">
                    <h2>Featured collection</h2>
                    <p class="mb-0">A sample collection to explore the WatchVault design.</p>
                </div>
                <a class="btn btn-ink" href="Products.aspx">View all watches</a>
            </div>
            <div class="row g-4" id="productGrid">
                <div class="col-12"><p class="text-secondary">Loading featured watches…</p></div>
            </div>
        </div>
    </section>

    <!-- Benefits -->
    <section class="section dark-section" id="why">
        <div class="container">
            <div class="section-head">
                <h2>Make a more informed choice</h2>
                <p>Useful product details help you compare watches and choose the style that best suits you.</p>
            </div>
            <div class="row g-4">
                <div class="col-md-6 col-lg-3"><div class="feature-item"><h3>Useful filters</h3><p>Explore by category, price, movement, strap material and availability when filters are implemented.</p></div></div>
                <div class="col-md-6 col-lg-3"><div class="feature-item"><h3>Comparison</h3><p>Review selected watches side by side to understand differences in their specifications.</p></div></div>
                <div class="col-md-6 col-lg-3"><div class="feature-item"><h3>Wishlist</h3><p>Save watches you like for later when the wishlist feature is connected.</p></div></div>
                <div class="col-md-6 col-lg-3"><div class="feature-item"><h3>Customer feedback</h3><p>Review customer ratings and feedback once the review feature is implemented.</p></div></div>
            </div>
        </div>
    </section>

    <!-- Comparison preview -->
    <section class="section" id="compare">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-lg-5">
                    <div class="section-head mb-3">
                        <h2>Compare before choosing</h2>
                        <p>Here is a preview of how watch specifications can be compared. The values below are sample data.</p>
                    </div>
                    <a href="Compare.aspx" class="btn btn-brass">Open comparison page</a>
                </div>
                <div class="col-lg-7">
                    <div class="table-responsive border rounded-3">
                        <table class="compare-table">
                            <thead>
                                <tr><th>Specification</th><th>Meridian 40</th><th>Tide Diver</th><th>Pilot Field</th></tr>
                            </thead>
                            <tbody>
                                <tr><th>Movement</th><td>Automatic</td><td>Automatic</td><td>Quartz</td></tr>
                                <tr><th>Strap</th><td>Leather</td><td>Steel</td><td>Canvas</td></tr>
                                <tr><th>Case size</th><td>40 mm</td><td>42 mm</td><td>41 mm</td></tr>
                                <tr><th>Water resistance</th><td>50 m</td><td>300 m</td><td>100 m</td></tr>
                                <tr><th>Warranty</th><td>2 years</td><td>3 years</td><td>2 years</td></tr>
                                <tr><th>Sample price</th><td>NPR 8,900</td><td>NPR 12,400</td><td>NPR 4,200</td></tr>
                            </tbody>
                        </table>
                    </div>
                    <p class="small text-secondary mt-2">Sample prices only; replace them with your actual database records.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- How it works -->
    <section class="section pt-0" id="how">
        <div class="container">
            <div class="section-head">
                <h2>From browsing to buying</h2>
                <p>A simple shopping journey designed to help visitors understand each step.</p>
            </div>
            <ol class="steps">
                <li><h3>Browse</h3><p>Explore the catalogue or select a category.</p></li>
                <li><h3>Compare</h3><p>Review the specifications of different watches.</p></li>
                <li><h3>Order</h3><p>Add a selected watch to your cart when checkout is implemented.</p></li>
                <li><h3>Track</h3><p>View order updates after the order-tracking feature is connected.</p></li>
            </ol>
        </div>
    </section>

    <!-- Warranty information -->
    <section class="section pt-0" id="warranty">
        <div class="container">
            <div class="warranty-panel">
                <div class="row g-4 align-items-center">
                    <div class="col-lg-6">
                        <h2 class="serif display-6">Know the details before you choose</h2>
                        <p class="text-secondary mb-0">Product pages can display warranty length, movement, strap material, water resistance and other specifications to support an informed decision.</p>
                    </div>
                    <div class="col-lg-6">
                        <ul class="warranty-list">
                            <li>Warranty information on product listings</li>
                            <li>Specifications displayed clearly</li>
                            <li>Order details associated with an account</li>
                            <li>Responsive design for mobile and desktop</li>
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
                        <h2>Frequently asked questions</h2>
                        <p>Answers to common questions about browsing and choosing watches.</p>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="accordion" id="faqAccordion">
                        <div class="accordion-item">
                            <h3 class="accordion-header">
                                <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#faq1" aria-expanded="true" aria-controls="faq1">Can I browse without registering?</button>
                            </h3>
                            <div id="faq1" class="accordion-collapse collapse show" data-bs-parent="#faqAccordion">
                                <div class="accordion-body text-secondary">Yes. Visitors can browse the public catalogue. Account registration can be required for account-specific features such as order history.</div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h3 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq2" aria-expanded="false" aria-controls="faq2">Where can I find product specifications?</button>
                            </h3>
                            <div id="faq2" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body text-secondary">Open a product's details page to review its specifications, price and warranty information when those fields are available.</div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h3 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq3" aria-expanded="false" aria-controls="faq3">How can I compare watches?</button>
                            </h3>
                            <div id="faq3" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body text-secondary">Use the comparison page to review selected watches together once that feature has been implemented.</div>
                            </div>
                        </div>
                        <div class="accordion-item">
                            <h3 class="accordion-header">
                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#faq4" aria-expanded="false" aria-controls="faq4">Does the site work on mobile devices?</button>
                            </h3>
                            <div id="faq4" class="accordion-collapse collapse" data-bs-parent="#faqAccordion">
                                <div class="accordion-body text-secondary">Yes. The responsive layout adjusts for phones, tablets and desktop screens.</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Call to action -->
    <section class="section cta">
        <div class="container">
            <h2 class="serif">Find the watch that fits you</h2>
            <p class="text-secondary mx-auto mb-4" style="max-width:35rem">Explore the collection and compare different styles before making your choice.</p>
            <a class="btn btn-brass btn-lg" href="Register.aspx">Create an account</a>
            <a class="btn btn-ink btn-lg ms-2" href="Products.aspx">Browse watches</a>
        </div>
    </section>
</main>

<footer ">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-4">
                <h4>Sign up for our newsletter</h4>
                <p class="foot-note">Be the first to get notified about new arrivals, deals and giveaways.</p>
                <input type="email" class="foot-input" placeholder="type your email..." aria-label="Email address for newsletter" maxlength="100" onkeydown="if(event.key==='Enter'){event.preventDefault();}" />
            </div>
            <div class="col-6 col-lg-2">
                <h4>Explore</h4>
                <a href="Products.aspx">All watches</a>
                <a href="Compare.aspx">Compare</a>
                <a href="Wishlist.aspx">Wishlist</a>
            </div>
            <div class="col-6 col-lg-2">
                <h4>Watch Help</h4>
                <a href="Returns.aspx">1-Year Easy Returns</a>
                <a href="Shipping.aspx">Shipping policy</a>
                <a href="Refund.aspx">Refund policy</a>
                <a href="Default.aspx#faq">FAQ</a>
                <a href="Contact.aspx">Contact us</a>
            </div>
            <div class="col-6 col-lg-2">
                <h4>Our Business</h4>
                <a href="#about">About us</a>
                <a href="Terms.aspx">Terms of service</a>
                <a href="Privacy.aspx">Privacy policy</a>
            </div>
            <div class="col-6 col-lg-2">
                <h4>Leading Brands</h4>
                <a href="Products.aspx?q=Aurelian">Aurelian</a>
                <a href="Products.aspx?q=Norvik">Norvik</a>
                <a href="Products.aspx?q=Kestrel">Kestrel</a>
            </div>
        </div>

        <div class="social" aria-label="Social media">
            <a href="#" aria-label="X (Twitter)">
                <svg viewBox="0 0 24 24" fill="currentColor"><path d="M18.2 2.5h3.3l-7.2 8.3 8.5 11.2h-6.6l-5.2-6.8-6 6.8H1.7l7.7-8.8L1.3 2.5h6.8l4.7 6.2 5.4-6.2zm-1.2 17.5h1.8L7 4.4H5.1L17 20z"/></svg>
            </a>
            <a href="#" aria-label="Facebook">
                <svg viewBox="0 0 24 24" fill="currentColor"><path d="M5 3h14a2 2 0 0 1 2 2v14a2 2 0 0 1-2 2h-4v-7h2.5l.5-3H15V9.5c0-.9.3-1.5 1.6-1.5H18V5.3c-.3 0-1.2-.1-2.2-.1C13.6 5.2 12 6.5 12 9v1H9.5v3H12v7H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2z"/></svg>
            </a>
            <a href="#" aria-label="Pinterest">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round"><circle cx="12" cy="12" r="9.5"/><path d="M10.5 20l2-8M9.2 11.3c0-1.8 1.4-2.8 2.9-2.8s2.9.9 2.9 2.4-1 3.4-2.9 3.4c-1 0-1.6-.5-1.8-1"/></svg>
            </a>
            <a href="#" aria-label="Instagram">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8"><rect x="3" y="3" width="18" height="18" rx="5"/><circle cx="12" cy="12" r="4"/><circle cx="17.3" cy="6.7" r="1" fill="currentColor" stroke="none"/></svg>
            </a>
            <a href="#" aria-label="YouTube">
                <svg viewBox="0 0 24 24" fill="currentColor"><path d="M21.6 7.2a2.5 2.5 0 0 0-1.8-1.8C18.2 5 12 5 12 5s-6.2 0-7.8.4A2.5 2.5 0 0 0 2.4 7.2C2 8.8 2 12 2 12s0 3.2.4 4.8a2.5 2.5 0 0 0 1.8 1.8C5.8 19 12 19 12 19s6.2 0 7.8-.4a2.5 2.5 0 0 0 1.8-1.8c.4-1.6.4-4.8.4-4.8s0-3.2-.4-4.8zM10 15V9l5.2 3L10 15z"/></svg>
            </a>
        </div>

        <div class="legal text-center">&copy; <%: DateTime.Now.Year %> WatchVault. All rights reserved.</div>
    </div>
</footer>

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
(function () {
    "use strict";

    // Draw 60 minute markers on the analogue watch.
    var ns = "http://www.w3.org/2000/svg";
    var ticks = document.getElementById("clockTicks");

    for (var i = 0; i < 60; i++) {
        var isHour = i % 5 === 0;
        var angle = i * 6 * Math.PI / 180;
        var innerRadius = isHour ? 108 : 118;
        var line = document.createElementNS(ns, "line");

        line.setAttribute("x1", 200 + innerRadius * Math.sin(angle));
        line.setAttribute("y1", 200 - innerRadius * Math.cos(angle));
        line.setAttribute("x2", 200 + 126 * Math.sin(angle));
        line.setAttribute("y2", 200 - 126 * Math.cos(angle));
        line.setAttribute("stroke", "#0E1A2B");
        line.setAttribute("stroke-width", isHour ? "3" : "1");

        ticks.appendChild(line);
    }

    // Keep the analogue clock synchronized with the visitor's local time.
    var hourHand = document.getElementById("hourHand");
    var minuteHand = document.getElementById("minuteHand");
    var secondHand = document.getElementById("secondHand");
    var digitalTime = document.getElementById("digitalTime");

    function updateClock() {
        var now = new Date();
        var seconds = now.getSeconds();
        var minutes = now.getMinutes() + seconds / 60;
        var hours = (now.getHours() % 12) + minutes / 60;

        hourHand.setAttribute("transform", "rotate(" + (hours * 30) + " 200 200)");
        minuteHand.setAttribute("transform", "rotate(" + (minutes * 6) + " 200 200)");
        secondHand.setAttribute("transform", "rotate(" + (seconds * 6) + " 200 200)");

        digitalTime.textContent = now.toLocaleTimeString([], {
            hour: "2-digit",
            minute: "2-digit",
            second: "2-digit"
        });
    }

    updateClock();
    window.setInterval(updateClock, 1000);

    // Demonstration data for the homepage. Connect to SQL Server later.
    var products = [
        { id: 1, brand: "Aurelian", name: "Meridian 40", movement: "Automatic", strap: "Leather", warranty: "2 years", price: 8900, tag: "New", face: "#F6F1E6", strapColor: "#5A3B22", hand: "#0E1A2B" },
        { id: 2, brand: "Norvik", name: "Tide Diver", movement: "Automatic", strap: "Steel", warranty: "3 years", price: 12400, tag: "Popular", face: "#DCE5ED", strapColor: "#9AA6B4", hand: "#0E1A2B" },
        { id: 3, brand: "Kestrel", name: "Pilot Field", movement: "Quartz", strap: "Canvas", warranty: "2 years", price: 4200, tag: "Best value", face: "#E8E6D9", strapColor: "#6B6A55", hand: "#0E1A2B" },
        { id: 4, brand: "Aurelian", name: "Lumen Slim", movement: "Quartz", strap: "Leather", warranty: "1 year", price: 3100, tag: "Classic", face: "#FFFFFF", strapColor: "#1B2430", hand: "#0E1A2B" },
        { id: 5, brand: "Norvik", name: "Apex Chrono", movement: "Automatic", strap: "Steel", warranty: "3 years", price: 15800, tag: "Premium", face: "#1B2430", strapColor: "#C0C7D0", hand: "#B8914F" },
        { id: 6, brand: "Kestrel", name: "Harbor 38", movement: "Quartz", strap: "Leather", warranty: "2 years", price: 5400, tag: "Everyday", face: "#E9EEF3", strapColor: "#2B3F5C", hand: "#0E1A2B" },
        { id: 7, brand: "Aurelian", name: "Noir Date", movement: "Automatic", strap: "Leather", warranty: "2 years", price: 9600, tag: "Popular", face: "#0A1322", strapColor: "#1B2430", hand: "#F6F1E6" },
        { id: 8, brand: "Norvik", name: "Reef 300", movement: "Automatic", strap: "Rubber", warranty: "3 years", price: 11200, tag: "Sport", face: "#DCECF0", strapColor: "#0E1A2B", hand: "#0E1A2B" }
    ];

    function escapeHtml(value) {
        return String(value).replace(/[&<>"']/g, function (character) {
            return {
                "&": "&amp;",
                "<": "&lt;",
                ">": "&gt;",
                '"': "&quot;",
                "'": "&#39;"
            }[character];
        });
    }

    function renderProducts() {
        var grid = document.getElementById("productGrid");

        grid.innerHTML = products.map(function (product) {
            return '<div class="col-12 col-sm-6 col-lg-3">' +
                '<article class="product-card">' +
                '<div class="product-art">' +
                '<span class="product-tag">' + escapeHtml(product.tag) + '</span>' +
                '<svg viewBox="0 0 120 190" style="--face:' + product.face +
                ';--strap:' + product.strapColor + ';--hand:' + product.hand +
                '" role="img" aria-label="' + escapeHtml(product.name) + '">' +
                '<use href="#watch-symbol"></use></svg>' +
                '</div>' +
                '<div class="product-body">' +
                '<div class="brand-name">' + escapeHtml(product.brand) + '</div>' +
                '<h3>' + escapeHtml(product.name) + '</h3>' +
                '<ul class="spec-list">' +
                '<li>Movement: ' + escapeHtml(product.movement) + '</li>' +
                '<li>Strap: ' + escapeHtml(product.strap) + '</li>' +
                '<li>Warranty: ' + escapeHtml(product.warranty) + '</li>' +
                '</ul>' +
                '<div class="product-footer">' +
                '<span class="price">NPR ' + product.price.toLocaleString("en-NP") + '</span>' +
                '<a class="btn btn-ink btn-sm" href="ProductDetails.aspx?id=' +
                encodeURIComponent(product.id) + '">View details</a>' +
                '</div></div></article></div>';
        }).join("");
    }

    renderProducts();

    // Search (hero box and header box share the same logic)
    function goSearch(box) {
        var query = box.value.trim();
        var target = "Products.aspx";
        if (query) { target += "?q=" + encodeURIComponent(query); }
        window.location.href = target;
    }

    function wireSearch(inputId, buttonId) {
        var box = document.getElementById(inputId);
        var btn = document.getElementById(buttonId);
        btn.addEventListener("click", function () { goSearch(box); });
        box.addEventListener("keydown", function (e) {
            if (e.key === "Enter") { e.preventDefault(); goSearch(box); }
        });
    }

    wireSearch("searchBox", "searchButton");        // hero search
    wireSearch("headerSearch", "headerSearchBtn");  // header search
})();
</script>

</body>
</html>
