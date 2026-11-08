
<%@ Page Title="Register | WatchVault" Language="C#" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="WatchVault.Register" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Create Account | WatchVault</title>

    <style>
        :root {
            --primary: #263b80;
            --primary-dark: #1c2d65;
            --background: #f3f4f6;
            --white: #ffffff;
            --text: #202938;
            --muted: #737b89;
            --border: #dfe3eb;
            --gold: #c49b55;
            --success: #198754;
            --danger: #dc3545;
        }

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            padding: 45px 18px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--background);
            font-family: Arial, Helvetica, sans-serif;
            color: var(--text);
        }

        .register-wrapper {
            width: 100%;
            max-width: 470px;
        }

        .brand {
            text-align: center;
            margin-bottom: 22px;
        }

        .brand-name {
            color: var(--primary);
            font-size: 29px;
            font-weight: 800;
            letter-spacing: 3px;
            margin: 0;
        }

        .brand-line {
            width: 45px;
            height: 3px;
            background: var(--gold);
            margin: 10px auto;
            border-radius: 5px;
        }

        .brand-tagline {
            color: var(--muted);
            font-size: 12px;
            letter-spacing: 2px;
            text-transform: uppercase;
            margin: 0;
        }

        .register-card {
            background: var(--white);
            border-radius: 12px;
            padding: 36px 38px;
            border: 1px solid #e8eaf0;
            box-shadow: 0 8px 30px rgba(24, 39, 75, 0.08);
        }

        .register-heading {
            text-align: center;
            margin-bottom: 28px;
        }

        .register-heading h1 {
            font-size: 25px;
            font-weight: 700;
            color: var(--text);
            margin: 0 0 9px;
        }

        .register-heading p {
            font-size: 14px;
            color: var(--muted);
            line-height: 1.6;
            margin: 0;
        }

        .field {
            margin-bottom: 19px;
        }

        .field label {
            display: block;
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 8px;
            color: var(--text);
        }

        .input-wrap {
            position: relative;
        }

        .field input {
            display: block;
            width: 100%;
            height: 47px;
            padding: 0 14px;
            font-size: 14px;
            color: var(--text);
            background: #fff;
            border: 1px solid var(--border);
            border-radius: 6px;
            outline: none;
            transition: border-color .2s, box-shadow .2s;
        }

        .field input:focus {
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(38, 59, 128, .10);
        }

        .field input::placeholder {
            color: #a0a7b3;
        }

        .password-input {
            padding-right: 75px !important;
        }

        .toggle-password {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: var(--primary);
            font-size: 12px;
            font-weight: 700;
            cursor: pointer;
            padding: 5px;
        }

        .toggle-password:hover {
            color: var(--primary-dark);
        }

        .validator {
            display: block;
            color: var(--danger);
            font-size: 11px;
            margin-top: 5px;
        }

        .validation-summary {
            margin-bottom: 15px;
            padding: 11px;
            background: #fff1f1;
            border: 1px solid #f2cccc;
            border-radius: 6px;
            color: var(--danger);
            font-size: 12px;
        }

        .message {
            display: block;
            padding: 11px 13px;
            margin-bottom: 17px;
            border-radius: 6px;
            font-size: 13px;
            line-height: 1.5;
        }

        .password-strength {
            margin-top: 8px;
            display: none;
        }

        .strength-track {
            height: 4px;
            width: 100%;
            background: #e9edf3;
            border-radius: 5px;
            overflow: hidden;
        }

        .strength-fill {
            height: 100%;
            width: 0;
            transition: width .2s, background .2s;
        }

        .strength-text {
            display: block;
            margin-top: 5px;
            font-size: 11px;
            color: var(--muted);
        }

        .register-button {
            display: block;
            width: 100%;
            height: 49px;
            margin-top: 8px;
            background: var(--primary);
            color: var(--white);
            border: none;
            border-radius: 6px;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: .5px;
            cursor: pointer;
            transition: background .2s, transform .2s;
        }

        .register-button:hover {
            background: var(--primary-dark);
            transform: translateY(-1px);
        }

        .login-link {
            text-align: center;
            margin-top: 23px;
            padding-top: 19px;
            border-top: 1px solid #edf0f4;
            font-size: 13px;
            color: var(--muted);
        }

        .login-link a {
            color: var(--primary);
            font-weight: 700;
            text-decoration: none;
            margin-left: 4px;
        }

        .login-link a:hover {
            text-decoration: underline;
        }

        .back-home {
            text-align: center;
            margin-top: 20px;
        }

        .back-home a {
            color: var(--muted);
            font-size: 12px;
            text-decoration: none;
        }

        .back-home a:hover {
            color: var(--primary);
        }

        .footer-note {
            text-align: center;
            margin-top: 22px;
            font-size: 11px;
            color: #9299a5;
        }

        @media (max-width: 520px) {
            body {
                padding: 25px 14px;
            }

            .register-card {
                padding: 28px 21px;
            }

            .brand-name {
                font-size: 25px;
            }

            .register-heading h1 {
                font-size: 22px;
            }
        }
    </style>
</head>

<body>

    <form id="form1" runat="server">

        <div class="register-wrapper">

            <!-- WatchVault Branding -->
            <div class="brand">

                <p class="brand-name">WATCHVAULT</p>

                <div class="brand-line"></div>

                <p class="brand-tagline">
                    Discover Your Perfect Timepiece
                </p>

            </div>

            <!-- Registration Card -->
            <div class="register-card">

                <div class="register-heading">

                    <h1>Create Your Account</h1>

                    <p>
                        Join WatchVault and discover watches
                        that match your style.
                    </p>

                </div>

                <!-- Validation Summary -->
                <asp:ValidationSummary
                    ID="vsRegister"
                    runat="server"
                    ValidationGroup="Register"
                    CssClass="validation-summary"
                    HeaderText="Please correct the following:" />

                <!-- Server Message -->
                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message"
                    EnableViewState="false" />

                <!-- Full Name -->
                <div class="field">

                    <asp:Label
                        ID="lblFullName"
                        runat="server"
                        AssociatedControlID="txtFullName"
                        Text="Full Name" />

                    <asp:TextBox
                        ID="txtFullName"
                        runat="server"
                        MaxLength="100"
                        placeholder="Enter your full name" />

                    <asp:RequiredFieldValidator
                        ID="rfvFullName"
                        runat="server"
                        ControlToValidate="txtFullName"
                        ErrorMessage="Full name is required."
                        CssClass="validator"
                        Display="Dynamic"
                        ValidationGroup="Register" />

                </div>

                <!-- Email -->
                <div class="field">

                    <asp:Label
                        ID="lblEmail"
                        runat="server"
                        AssociatedControlID="txtEmail"
                        Text="Email Address" />

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        TextMode="Email"
                        MaxLength="254"
                        placeholder="example@email.com" />

                    <asp:RequiredFieldValidator
                        ID="rfvEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ErrorMessage="Email address is required."
                        CssClass="validator"
                        Display="Dynamic"
                        ValidationGroup="Register" />

                    <asp:RegularExpressionValidator
                        ID="revEmail"
                        runat="server"
                        ControlToValidate="txtEmail"
                        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                        ErrorMessage="Please enter a valid email address."
                        CssClass="validator"
                        Display="Dynamic"
                        ValidationGroup="Register" />

                </div>

                <!-- Password -->
                <div class="field">

                    <asp:Label
                        ID="lblPassword"
                        runat="server"
                        AssociatedControlID="txtPassword"
                        Text="Password" />

                    <div class="input-wrap">

                        <asp:TextBox
                            ID="txtPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="password-input"
                            placeholder="Create a password"
                            onkeyup="checkPasswordStrength()" />

                        <button
                            type="button"
                            class="toggle-password"
                            onclick="togglePassword('txtPassword', this)">
                            Show
                        </button>

                    </div>

                    <asp:RequiredFieldValidator
                        ID="rfvPassword"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Password is required."
                        CssClass="validator"
                        Display="Dynamic"
                        ValidationGroup="Register" />

                    <asp:RegularExpressionValidator
                        ID="revPassword"
                        runat="server"
                        ControlToValidate="txtPassword"
                        ValidationExpression="^.{8,}$"
                        ErrorMessage="Password must contain at least 8 characters."
                        CssClass="validator"
                        Display="Dynamic"
                        ValidationGroup="Register" />

                    <div class="password-strength" id="passwordStrength">

                        <div class="strength-track">
                            <div class="strength-fill" id="strengthFill"></div>
                        </div>

                        <span class="strength-text" id="strengthText">
                            Password strength
                        </span>

                    </div>

                </div>

                <!-- Confirm Password -->
                <div class="field">

                    <asp:Label
                        ID="lblConfirmPassword"
                        runat="server"
                        AssociatedControlID="txtConfirmPassword"
                        Text="Confirm Password" />

                    <div class="input-wrap">

                        <asp:TextBox
                            ID="txtConfirmPassword"
                            runat="server"
                            TextMode="Password"
                            CssClass="password-input"
                            placeholder="Re-enter your password" />

                        <button
                            type="button"
                            class="toggle-password"
                            onclick="togglePassword('txtConfirmPassword', this)">
                            Show
                        </button>

                    </div>

                    <asp:RequiredFieldValidator
                        ID="rfvConfirmPassword"
                        runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ErrorMessage="Please confirm your password."
                        CssClass="validator"
                        Display="Dynamic"
                        ValidationGroup="Register" />

                    <asp:CompareValidator
                        ID="cvConfirmPassword"
                        runat="server"
                        ControlToValidate="txtConfirmPassword"
                        ControlToCompare="txtPassword"
                        ErrorMessage="Passwords do not match."
                        CssClass="validator"
                        Display="Dynamic"
                        ValidationGroup="Register" />

                </div>

                <!-- Register Button -->
                <asp:Button
                    ID="btnRegister"
                    runat="server"
                    Text="CREATE ACCOUNT"
                    CssClass="register-button"
                    ValidationGroup="Register"
                    OnClick="btnRegister_Click" />

                <!-- Login Link -->
                <div class="login-link">

                    Already have an account?

                    <asp:HyperLink
                        ID="lnkLogin"
                        runat="server"
                        NavigateUrl="~/Login.aspx"
                        Text="Log in" />

                </div>

                <!-- Back to Home -->
                <div class="back-home">

                    <a href="<%= ResolveUrl("~/Default.aspx") %>">
                        ← Back to Home
                    </a>

                </div>

            </div>

            <div class="footer-note">
                © <%= DateTime.Now.Year %> WatchVault. All Rights Reserved.
            </div>

        </div>

    </form>

    <script>

        function togglePassword(id, button) {

            var passwordField = document.getElementById(
                '<%= txtPassword.ClientID %>'
            );

            var confirmField = document.getElementById(
                '<%= txtConfirmPassword.ClientID %>'
            );

            var field = id === 'txtPassword'
                ? passwordField
                : confirmField;

            if (field.type === "password") {

                field.type = "text";
                button.textContent = "Hide";

            } else {

                field.type = "password";
                button.textContent = "Show";

            }

        }

        function checkPasswordStrength() {

            var password = document.getElementById(
                '<%= txtPassword.ClientID %>'
            ).value;

            var strengthBox = document.getElementById("passwordStrength");
            var strengthFill = document.getElementById("strengthFill");
            var strengthText = document.getElementById("strengthText");

            if (password.length === 0) {

                strengthBox.style.display = "none";
                return;

            }

            strengthBox.style.display = "block";

            var score = 0;

            if (password.length >= 8) score++;
            if (/[A-Z]/.test(password)) score++;
            if (/[a-z]/.test(password)) score++;
            if (/[0-9]/.test(password)) score++;
            if (/[^A-Za-z0-9]/.test(password)) score++;

            var percentage = score * 20;

            strengthFill.style.width = percentage + "%";

            if (score <= 2) {

                strengthFill.style.background = "#dc3545";
                strengthText.textContent = "Weak password";

            }
            else if (score <= 3) {

                strengthFill.style.background = "#e0a800";
                strengthText.textContent = "Moderate password";

            }
            else {

                strengthFill.style.background = "#198754";
                strengthText.textContent = "Strong password";

            }

        }

    </script>

</body>
</html>
