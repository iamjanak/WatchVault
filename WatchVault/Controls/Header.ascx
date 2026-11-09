
<%@ Control Language="C#" AutoEventWireup="true"
    CodeBehind="Header.ascx.cs"
    Inherits="WatchVault.Controls.Header" %>

<nav class="wv-header navbar navbar-expand-lg" aria-label="Main navigation">
    <div class="container">

        <!-- WatchVault Brand -->
        <a class="wv-brand" href="<%= ResolveUrl("~/Default.aspx") %>"
           aria-label="WatchVault home">
            <svg viewBox="0 0 30 42" fill="none" stroke="currentColor"
                 stroke-width="1.5" aria-hidden="true">
                <path d="M10 1h10l1.5 8h-13zM8.5 33h13L20 41H10z" />
                <circle cx="15" cy="21" r="11" />
                <path d="M15 14v7l4 3" />
            </svg>
            WatchVault
        </a>

        <!-- Mobile Navigation -->
        <button class="navbar-toggler wv-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#mainNav"
                aria-controls="mainNav" aria-expanded="false"
                aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="mainNav">

            <!-- Main Navigation -->
            <ul class="navbar-nav wv-nav mx-auto align-items-lg-center">

                <li class="nav-item">
                    <a class="nav-link" href="<%= ResolveUrl("~/Default.aspx") %>">
                        Home
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<%= ResolveUrl("~/About.aspx") %>">
                        About Us
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="<%= ResolveUrl("~/Products/NewArrivals.aspx") %>">
                        New Arrivals
                    </a>
                </li>

                <!-- Watches Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#"
                       role="button" data-bs-toggle="dropdown"
                       aria-expanded="false">
                        Watches
                    </a>

                    <ul class="dropdown-menu">
                        <li>
                            <a class="dropdown-item"
                               href="<%= ResolveUrl("~/Products/Watches.aspx") %>">
                                All Watches
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item"
                               href="<%= ResolveUrl("~/Products/ForMen.aspx") %>">
                                For Men
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item"
                               href="<%= ResolveUrl("~/Products/ForWomen.aspx") %>">
                                For Women
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item"
                               href="<%= ResolveUrl("~/Products/ForSports.aspx") %>">
                                Sport
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item">
                    <a class="nav-link"
                       href="<%= ResolveUrl("~/Products/ServiceCenter.aspx") %>">
                        Service Center
                    </a>
                </li>

            </ul>

            <!-- Search, Cart and Account -->
            <div class="d-flex align-items-center gap-3 flex-wrap">

                <!-- Search -->
                <div class="wv-search-bar" role="search">
                    <input type="search"
                           id="headerSearch"
                           maxlength="80"
                           placeholder="Search timepieces..."
                           aria-label="Search watches" />

                    <button type="button" id="headerSearchBtn"
                            aria-label="Search">
                        <svg viewBox="0 0 24 24" fill="none"
                             stroke="currentColor" stroke-width="2.5"
                             stroke-linecap="round">
                            <circle cx="11" cy="11" r="7" />
                            <path d="M20 20l-4-4" />
                        </svg>
                    </button>
                </div>

                <!-- Shopping Cart -->
                <a class="wv-bag"
                   href="<%= ResolveUrl("~/Products/Cart.aspx") %>"
                   aria-label="Shopping bag">
                    <svg viewBox="0 0 24 24" fill="none"
                         stroke="currentColor" stroke-width="2"
                         stroke-linejoin="round" stroke-linecap="round">
                        <path d="M5 8h14l-1 12H6L5 8z" />
                        <path d="M9 8V6a3 3 0 0 1 6 0v2" />
                    </svg>
                </a>

                <!-- Guest Account -->
                <asp:PlaceHolder ID="phGuest" runat="server">
                    <a class="wv-login"
                       href="<%= ResolveUrl("~/Login.aspx") %>">
                        Sign In
                    </a>
                </asp:PlaceHolder>

                <!-- Logged-in User Profile -->
                <asp:PlaceHolder ID="phUser" runat="server" Visible="false">

                    <div class="dropdown wv-account-dropdown">

                        <a class="wv-account-toggle dropdown-toggle"
                           href="#"
                           id="wvAccountMenu"
                           role="button"
                           data-bs-toggle="dropdown"
                           aria-expanded="false">

                            <!-- Circular Profile Icon -->
                            <span class="wv-profile-avatar">
                                <svg viewBox="0 0 24 24" fill="none"
                                     stroke="currentColor"
                                     stroke-width="1.7"
                                     stroke-linecap="round"
                                     stroke-linejoin="round"
                                     aria-hidden="true">
                                    <circle cx="12" cy="8" r="3.5" />
                                    <path d="M5 20c.5-3.5 3.2-5.5 7-5.5s6.5 2 7 5.5" />
                                </svg>
                            </span>

                            <!-- User Greeting -->
                            <span class="wv-account-details">
                                <span class="wv-welcome-text">
                                    Welcome back
                                </span>

                                <span class="wv-user">
                                    <asp:Literal ID="litUserName" runat="server" />
                                </span>
                            </span>

                            <span class="wv-account-chevron">
                                <svg viewBox="0 0 24 24" fill="none"
                                     stroke="currentColor" stroke-width="2"
                                     stroke-linecap="round"
                                     stroke-linejoin="round">
                                    <path d="m6 9 6 6 6-6" />
                                </svg>
                            </span>

                        </a>

                        <!-- Profile Dropdown -->
                        <ul class="dropdown-menu dropdown-menu-end wv-profile-menu">

                            <li class="wv-dropdown-heading">
                                <span class="wv-dropdown-label">
                                    MY ACCOUNT
                                </span>
                            </li>

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
                                    My Wishlist
                                </a>
                            </li>

                            <li>
                                <hr class="dropdown-divider" />
                            </li>

                            <li>
                                <asp:LinkButton ID="btnLogout"
                                    runat="server"
                                    CssClass="dropdown-item wv-logout-item"
                                    CausesValidation="false"
                                    OnClick="btnLogout_Click">
                                    <i class="fa-solid fa-right-from-bracket me-2"></i>
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

<!-- Header Search Script -->
<script>
    (function () {

        var searchInput = document.getElementById("headerSearch");
        var searchButton = document.getElementById("headerSearchBtn");

        function performSearch() {

            if (!searchInput) return;

            var query = searchInput.value.trim();

            if (query.length > 0) {
                window.location.href =
                '<%= ResolveUrl("~/Products/Watches.aspx") %>?search=' +
                encodeURIComponent(query);
        }
    }

    if (searchButton) {
        searchButton.addEventListener("click", performSearch);
    }

    if (searchInput) {
        searchInput.addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
                event.preventDefault();
                performSearch();
            }
        });
    }

})();
</script>