
<%@ Page Title="Register | WatchVault" Language="C#" AutoEventWireup="true"
    CodeBehind="Register.aspx.cs" Inherits="WatchVault.Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Create WatchVault Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f3f4f6;
            margin: 0;
            padding: 40px 16px;
        }

        .register-card {
            max-width: 420px;
            margin: 30px auto;
            padding: 30px;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 18px rgba(0,0,0,.08);
        }

        h1 { text-align: center; color: #202938; }

        .field { margin-bottom: 16px; }

        .field label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        .field input {
            box-sizing: border-box;
            width: 100%;
            padding: 11px;
            border: 1px solid #cbd5e1;
            border-radius: 6px;
        }

        .register-button {
            width: 100%;
            padding: 12px;
            color: white;
            background: #263b80;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
        }

        .message {
            display: block;
            margin: 12px 0;
        }

        .login-link {
            text-align: center;
            margin-top: 18px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-card">
            <h1>Create Account</h1>
            <p style="text-align:center">Join WatchVault</p>

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message" EnableViewState="false" />

            <div class="field">
                <asp:Label ID="lblFullName" runat="server"
                    AssociatedControlID="txtFullName"
                    Text="Full name" />
                <asp:TextBox ID="txtFullName" runat="server"
                    MaxLength="100" />
            </div>

            <div class="field">
                <asp:Label ID="lblEmail" runat="server"
                    AssociatedControlID="txtEmail"
                    Text="Email address" />
                <asp:TextBox ID="txtEmail" runat="server"
                    TextMode="Email" MaxLength="254" />
            </div>

            <div class="field">
                <asp:Label ID="lblPassword" runat="server"
                    AssociatedControlID="txtPassword"
                    Text="Password" />
                <asp:TextBox ID="txtPassword" runat="server"
                    TextMode="Password" />
            </div>

            <div class="field">
                <asp:Label ID="lblConfirmPassword" runat="server"
                    AssociatedControlID="txtConfirmPassword"
                    Text="Confirm password" />
                <asp:TextBox ID="txtConfirmPassword" runat="server"
                    TextMode="Password" />
            </div>

            <asp:Button ID="btnRegister" runat="server"
                Text="Create Account"
                CssClass="register-button"
                OnClick="btnRegister_Click" />

            <div class="login-link">
                Already registered?
                <asp:HyperLink ID="lnkLogin" runat="server"
                    NavigateUrl="~/Login.aspx" Text="Log in" />
            </div>
        </div>
    </form>
</body>
</html>
