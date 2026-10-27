<%@ Control Language="C#" AutoEventWireup="true" %>

<footer class="wv-site-footer">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-4">
                <a class="wv-footer-brand mb-3 d-inline-block"
                   href="<%= ResolveUrl("~/Default.aspx") %>">
                    WatchVault
                </a>
                <p class="text-secondary small">
                    Your definitive destination for precise horology,
                    detailed technical comparisons, and verified timepieces.
                </p>
            </div>

            <div class="col-6 col-lg-2">
                <h4>Catalog</h4>
                <a href="<%= ResolveUrl("~/Products/Watches.aspx?category=Dress") %>">Dress Watches</a>
                <a href="<%= ResolveUrl("~/Products/Watches.aspx?category=Sport") %>">Sport Watches</a>
                <a href="<%= ResolveUrl("~/Products/Watches.aspx?category=Dive") %>">Dive Watches</a>
                <a href="<%= ResolveUrl("~/Products/Watches.aspx?category=Chronograph") %>">Chronograph</a>
                <a href="<%= ResolveUrl("~/Products/NewArrivals.aspx") %>">New Arrivals</a>
            </div>

            <div class="col-6 col-lg-2">
                <h4>Lifestyle</h4>
                <a href="<%= ResolveUrl("~/Products/Watches.aspx?category=WallClocks") %>">Wall Clocks</a>
                <a href="<%= ResolveUrl("~/Products/Watches.aspx?category=TableClocks") %>">Table Clocks</a>
                <a href="<%= ResolveUrl("~/Products/Watches.aspx?category=Accessories") %>">Accessories</a>
            </div>

            <div class="col-lg-4">
                <h4>Client Support</h4>
                <a href="<%= ResolveUrl("~/ServiceCenter.aspx") %>">Service Center &amp; Repairs</a>
                <a href="<%= ResolveUrl("~/About.aspx") %>">About Our Curations</a>
                <a href="<%= ResolveUrl("~/Contact.aspx") %>">Contact Specialists</a>
            </div>
        </div>

        <div class="wv-legal d-flex flex-wrap justify-content-between align-items-center gap-3">
            <div>&copy; <%: DateTime.Now.Year %> WatchVault Inc. All rights reserved.</div>
            <div class="d-flex flex-wrap gap-4">
                <a href="<%= ResolveUrl("~/Privacy.aspx") %>">Privacy Policy</a>
                <a href="<%= ResolveUrl("~/Terms.aspx") %>">Terms of Service</a>
            </div>
        </div>
    </div>
</footer>
