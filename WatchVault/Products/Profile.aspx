<%@ Page Title="My Profile | WatchVault"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="Profile.aspx.cs"
    Inherits="WatchVault.Products.Profile" %>

<%@ Register Src="~/Controls/Header.ascx"
    TagPrefix="wv" TagName="Header" %>

<%@ Register Src="~/Controls/Footer.ascx"
    TagPrefix="wv" TagName="Footer" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Title comes from the Page directive above -->

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Cormorant+Garamond:wght@500;600;700&display=swap"
          rel="stylesheet" />

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet" />

    <!-- Shared WatchVault Styles -->
    <link href="<%= ResolveUrl("~/Content/Site.css") %>" rel="stylesheet" />

    <style>

        :root {
            --navy: #101820;
            --navy-light: #263746;
            --gold: #d6ad65;
            --gold-deep: #8a642c;
            --gold-light: #f0d8a8;
            --cream: #f7f5f0;
            --white: #ffffff;
            --text: #252b33;
            --muted: #6b737c;
            --border: #e8e5df;
            --danger: #b3261e;
            --danger-bg: #fdf1f0;
            --success: #1f6b45;
            --success-bg: #eef8f2;

            --font-heading: 'Cormorant Garamond', Georgia, serif;
            --font-body: 'Inter', Arial, sans-serif;
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

        .profile-hero {
            padding: 48px 24px 56px;
            background: radial-gradient(ellipse at top, var(--navy-light) 0%, var(--navy) 72%);
            color: white;
        }

        .profile-hero-inner {
            max-width: 1080px;
            margin: 0 auto;
        }

        .profile-breadcrumb {
            margin-bottom: 22px;
            color: #aeb6be;
            font-size: 12px;
        }

        .profile-breadcrumb a {
            color: inherit;
            text-decoration: none;
        }

        .profile-breadcrumb a:hover,
        .profile-breadcrumb a:focus-visible {
            color: var(--gold-light);
            text-decoration: underline;
        }

        .profile-breadcrumb .sep {
            margin: 0 8px;
            opacity: .5;
        }

        .profile-hero h1 {
            margin: 0 0 8px;
            font-family: var(--font-heading);
            font-size: clamp(38px, 5vw, 54px);
            font-weight: 500;
            line-height: 1.1;
            color: white;
        }

        .profile-hero p {
            max-width: 520px;
            margin: 0;
            color: #ccd2d8;
            font-size: 14px;
        }

        /* ---------- Layout ---------- */

        .profile-page {
            padding: 0 24px 80px;
        }

        .profile-layout {
            display: grid;
            grid-template-columns: 300px minmax(0, 1fr);
            gap: 24px;
            max-width: 1080px;
            margin: -28px auto 0;
            align-items: start;
        }

        .panel {
            background: white;
            border: 1px solid var(--border);
            border-radius: 8px;
            box-shadow: 0 6px 24px rgba(16, 24, 32, .05);
        }

        /* ---------- Identity panel ---------- */

        .identity {
            padding: 28px 24px;
            text-align: center;
            position: sticky;
            top: 16px;
        }

        .monogram {
            display: flex;
            width: 88px;
            height: 88px;
            margin: 0 auto 16px;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            background: var(--navy);
            border: 3px solid var(--gold);
            color: var(--gold-light);
            font-family: var(--font-heading);
            font-size: 34px;
            font-weight: 600;
            letter-spacing: 1px;
            user-select: none;
        }

        .identity-name {
            margin: 0;
            color: var(--navy);
            font-family: var(--font-heading);
            font-size: 26px;
            font-weight: 600;
            line-height: 1.2;
            overflow-wrap: anywhere;
        }

        .identity-email {
            margin: 4px 0 0;
            color: var(--muted);
            font-size: 12.5px;
            overflow-wrap: anywhere;
        }

        .identity-meta {
            margin-top: 22px;
            padding-top: 6px;
            border-top: 1px solid var(--border);
            text-align: left;
        }

        .meta-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
            padding: 11px 0;
            border-bottom: 1px solid var(--border);
            font-size: 12.5px;
        }

        .meta-row:last-child {
            border-bottom: none;
        }

        .meta-label {
            color: var(--muted);
        }

        .meta-value {
            color: var(--navy);
            font-weight: 600;
            text-align: right;
        }

        .status-badge {
            display: inline-block;
            padding: 2px 10px;
            border-radius: 999px;
            background: #f1efe9;
            color: var(--navy);
            font-size: 11.5px;
            font-weight: 600;
        }

        .status-badge.is-active {
            background: var(--success-bg);
            color: var(--success);
        }

        /* ---------- Form panel ---------- */

        .form-panel {
            padding: 34px 36px 32px;
        }

        .form-panel-head {
            margin-bottom: 26px;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--border);
        }

        .form-panel-head h2 {
            margin: 0 0 4px;
            color: var(--navy);
            font-family: var(--font-heading);
            font-size: 32px;
            font-weight: 600;
        }

        .form-panel-head p {
            margin: 0;
            color: var(--muted);
            font-size: 13px;
        }

        .profile-label {
            display: block;
            margin-bottom: 7px;
            color: var(--navy);
            font-size: 13px;
            font-weight: 600;
        }

        .profile-input {
            display: block;
            width: 100%;
            min-height: 46px;
            padding: 11px 14px;
            background: white;
            border: 1px solid #d6d4ce;
            border-radius: 6px;
            color: var(--text);
            font-size: 14px;
            transition: border-color .15s ease, box-shadow .15s ease;
        }

        .profile-input:hover {
            border-color: #bdb9b0;
        }

        .profile-input:focus {
            outline: none;
            border-color: var(--gold);
            box-shadow: 0 0 0 3px rgba(214, 173, 101, .28);
        }

        .profile-input.is-invalid {
            border-color: var(--danger);
        }

        .profile-help {
            margin: 7px 0 0;
            color: var(--muted);
            font-size: 12px;
        }

        .profile-error {
            display: block;
            margin-top: 6px;
            color: var(--danger);
            font-size: 12px;
            font-weight: 500;
        }

        /* ---------- Message ---------- */

        .profile-message {
            display: block;
            margin-bottom: 22px;
            padding: 12px 16px;
            border: 1px solid var(--border);
            border-left: 4px solid var(--gold);
            border-radius: 6px;
            background: #fffdf8;
            color: var(--text);
            font-size: 13px;
            font-weight: 500;
        }

        .profile-message.success {
            border-left-color: var(--success);
            background: var(--success-bg);
            color: var(--success);
        }

        .profile-message.error {
            border-left-color: var(--danger);
            background: var(--danger-bg);
            color: var(--danger);
        }

        /* ---------- Actions ---------- */

        .profile-actions {
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            gap: 12px;
            margin-top: 30px;
            padding-top: 24px;
            border-top: 1px solid var(--border);
        }

        .unsaved-note {
            margin-left: auto;
            color: var(--gold-deep);
            font-size: 12px;
            font-weight: 500;
            visibility: hidden;
        }

        .unsaved-note.show {
            visibility: visible;
        }

        .btn-watchvault,
        .btn-profile-reset {
            display: inline-block;
            padding: 12px 26px;
            border-radius: 5px;
            font-size: 13px;
            font-weight: 600;
            cursor: pointer;
            transition: background-color .15s ease, border-color .15s ease, color .15s ease;
        }

        .btn-watchvault {
            background: var(--navy);
            border: 1px solid var(--navy);
            color: white;
        }

        .btn-watchvault:hover {
            background: var(--navy-light);
            border-color: var(--navy-light);
            color: var(--gold-light);
        }

        .btn-watchvault.is-busy {
            opacity: .7;
            cursor: progress;
        }

        .btn-profile-reset {
            background: white;
            border: 1px solid #d0cdc6;
            color: var(--text);
        }

        .btn-profile-reset:hover {
            border-color: var(--gold);
            color: var(--navy);
        }

        .btn-watchvault:focus-visible,
        .btn-profile-reset:focus-visible,
        .profile-breadcrumb a:focus-visible {
            outline: 3px solid rgba(214, 173, 101, .6);
            outline-offset: 2px;
        }

        /* ---------- Responsive ---------- */

        @media (max-width: 860px) {

            .profile-layout {
                grid-template-columns: 1fr;
            }

            .identity {
                position: static;
            }
        }

        @media (max-width: 560px) {

            .profile-hero {
                padding: 36px 16px 50px;
            }

            .profile-page {
                padding: 0 16px 50px;
            }

            .form-panel {
                padding: 24px 20px;
            }

            .form-panel-head h2 {
                font-size: 28px;
            }

            .profile-actions .btn-watchvault,
            .profile-actions .btn-profile-reset {
                width: 100%;
                text-align: center;
            }

            .unsaved-note {
                width: 100%;
                margin-left: 0;
                order: -1;
            }
        }

        @media (prefers-reduced-motion: reduce) {

            * {
                transition: none !important;
            }
        }

    </style>

</head>

<body>

<form id="form1" runat="server" novalidate="novalidate">

    <!-- Shared Header -->
    <wv:Header ID="Header1" runat="server" />

    <!-- Hero -->
    <section class="profile-hero">
        <div class="profile-hero-inner">

            <nav class="profile-breadcrumb" aria-label="Breadcrumb">
                <a href="<%= ResolveUrl("~/Default.aspx") %>">Home</a>
                <span class="sep" aria-hidden="true">/</span>
                <span aria-current="page">My profile</span>
            </nav>

            <h1>My profile</h1>
            <p>Keep your name and email up to date so orders and account messages reach you.</p>

        </div>
    </section>

    <main class="profile-page">

        <div class="profile-layout">

            <!-- Identity summary -->
            <aside class="panel identity" aria-label="Account summary">

                <div class="monogram" id="monogram" aria-hidden="true">WV</div>

                <p class="identity-name" id="identityName">Your name</p>
                <p class="identity-email" id="identityEmail">your@email.com</p>

                <div class="identity-meta">

                    <div class="meta-row">
                        <span class="meta-label">Member since</span>
                        <asp:Label ID="lblCreatedAt"
                            runat="server"
                            CssClass="meta-value" />
                    </div>

                    <div class="meta-row">
                        <span class="meta-label">Account status</span>
                        <asp:Label ID="lblAccountStatus"
                            runat="server"
                            CssClass="status-badge" />
                    </div>

                </div>

            </aside>

            <!-- Edit form -->
            <section class="panel form-panel" aria-labelledby="personalInfoHeading">

                <div class="form-panel-head">
                    <h2 id="personalInfoHeading">Personal information</h2>
                    <p>Changes apply to your account as soon as you save.</p>
                </div>

                <!-- Status Message -->
                <asp:Label ID="lblMessage"
                    runat="server"
                    CssClass="profile-message"
                    role="status"
                    aria-live="polite"
                    Visible="false" />

                <!-- Full Name -->
                <div class="mb-4">

                    <label class="profile-label" for="<%= txtFullName.ClientID %>">
                        Full name
                    </label>

                    <asp:TextBox ID="txtFullName"
                        runat="server"
                        CssClass="profile-input"
                        MaxLength="100"
                        autocomplete="name" />

                    <asp:RequiredFieldValidator ID="rfvFullName"
                        runat="server"
                        ControlToValidate="txtFullName"
                        CssClass="profile-error"
                        Display="Dynamic"
                        ErrorMessage="Enter your full name." />

                </div>

                <!-- Email -->
                <div class="mb-2">

                    <label class="profile-label" for="<%= txtEmail.ClientID %>">
                        Email address
                    </label>

                    <asp:TextBox ID="txtEmail"
                        runat="server"
                        CssClass="profile-input"
                        TextMode="Email"
                        MaxLength="254"
                        autocomplete="email" />

                    <asp:RequiredFieldValidator ID="rfvEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        CssClass="profile-error"
                        Display="Dynamic"
                        ErrorMessage="Enter your email address." />

                    <asp:RegularExpressionValidator ID="revEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        CssClass="profile-error"
                        Display="Dynamic"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ErrorMessage="Enter a valid email address, like name@example.com." />

                    <p class="profile-help">
                        You sign in with this email, so use one you check regularly.
                    </p>

                </div>

                <!-- Actions -->
                <div class="profile-actions">

                    <asp:Button ID="btnSaveProfile"
                        runat="server"
                        Text="Save changes"
                        CssClass="btn-watchvault"
                        OnClick="btnSaveProfile_Click" />

                    <asp:Button ID="btnReset"
                        runat="server"
                        Text="Discard changes"
                        CssClass="btn-profile-reset"
                        CausesValidation="false"
                        OnClick="btnReset_Click" />

                    <span class="unsaved-note" id="unsavedNote" aria-live="polite">
                        You have unsaved changes
                    </span>

                </div>

            </section>

        </div>

    </main>

    <!-- Shared Footer -->
    <wv:Footer ID="Footer1" runat="server" />

</form>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

<script>
    (function () {
        var nameInput = document.getElementById('<%= txtFullName.ClientID %>');
        var emailInput = document.getElementById('<%= txtEmail.ClientID %>');
        var saveBtn = document.getElementById('<%= btnSaveProfile.ClientID %>');
        var resetBtn = document.getElementById('<%= btnReset.ClientID %>');
        var status = document.getElementById('<%= lblAccountStatus.ClientID %>');
        var monogram = document.getElementById('monogram');
        var idName = document.getElementById('identityName');
        var idEmail = document.getElementById('identityEmail');
        var note = document.getElementById('unsavedNote');

        if (!nameInput || !emailInput) return;

        var initialName = nameInput.value;
        var initialEmail = emailInput.value;
        var submitting = false;

        function initials(value) {
            var parts = value.trim().split(/\s+/).filter(Boolean);
            if (!parts.length) return 'WV';
            var first = parts[0].charAt(0);
            var last = parts.length > 1 ? parts[parts.length - 1].charAt(0) : '';
            return (first + last).toUpperCase();
        }

        function isDirty() {
            return nameInput.value !== initialName || emailInput.value !== initialEmail;
        }

        function refresh() {
            var name = nameInput.value.trim();
            var email = emailInput.value.trim();
            monogram.textContent = initials(name);
            idName.textContent = name || 'Your name';
            idEmail.textContent = email || 'your@email.com';
            note.classList.toggle('show', isDirty());
        }

        // Highlight an active account
        if (status && /^\s*active\s*$/i.test(status.textContent)) {
            status.classList.add('is-active');
        }

        // Colour the status message by its content (works with any text set in code-behind)
    var msg = document.getElementById('<%= lblMessage.ClientID %>');
    if (msg) {
        if (/success|updated|saved/i.test(msg.textContent)) msg.classList.add('success');
        else if (/error|fail|invalid|already|could not|unable/i.test(msg.textContent)) msg.classList.add('error');
    }

    nameInput.addEventListener('input', refresh);
    emailInput.addEventListener('input', refresh);

    // Block double submits once validation has passed
    saveBtn.addEventListener('click', function (e) {
        if (typeof Page_IsValid !== 'undefined' && !Page_IsValid) return;
        if (submitting) { e.preventDefault(); return; }
        submitting = true;
        saveBtn.classList.add('is-busy');
    });

    resetBtn.addEventListener('click', function () { submitting = true; });

    window.addEventListener('beforeunload', function (e) {
        if (isDirty() && !submitting) {
            e.preventDefault();
            e.returnValue = '';
        }
    });

    refresh();
})();
</script>

</body>
</html>
