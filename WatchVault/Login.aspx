<%@ Page Title="Login | WatchVault" Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WatchVault.Login" %>
<!DOCTYPE html>
<html lang="en">
<head runat="server">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title>Sign in | WatchVault</title>
<link rel="preconnect" href="https://fonts.googleapis.com" /><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Instrument+Serif:ital@0;1&family=Manrope:wght@400;500;600;700&display=swap" rel="stylesheet" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<style>
:root{--ink:#0E1A2B;--ink2:#16273F;--brass:#B8914F;--brassdk:#8F6D34;--paper:#F6F7F9;--line:#D9DEE5;--muted:#5B6675}
body{font-family:Manrope,system-ui,"Segoe UI",Arial,sans-serif;color:#1B2430;min-height:100vh;margin:0;-webkit-font-smoothing:antialiased}
h1,h2,.serif{font-family:"Instrument Serif",Georgia,serif;font-weight:400;letter-spacing:-.01em}
:focus-visible{outline:3px solid var(--brass);outline-offset:3px}
.shell{display:grid;grid-template-columns:1.05fr 1fr;min-height:100vh}
.side{background:radial-gradient(900px 500px at 20% 90%,var(--ink2),var(--ink) 70%);color:#fff;padding:2.5rem 3.5rem;display:flex;flex-direction:column}
.brand{font-family:"Instrument Serif",Georgia,serif;font-size:1.8rem;color:#fff;text-decoration:none}
.brand em{color:var(--brass);font-style:normal}
.side h2{font-size:clamp(2.4rem,4vw,3.6rem);line-height:1.05;margin:auto 0 1rem}
.side h2 em{color:var(--brass)}
.side p.lead{color:#B9C4D3;max-width:28rem}
.perks{list-style:none;padding:0;margin:1.6rem 0 0}
.perks li{padding:.5rem 0 .5rem 1.8rem;position:relative;color:#DCE3EC;font-size:.95rem}
.perks li:before{content:"";position:absolute;left:0;top:.85rem;width:.75rem;height:.38rem;border-left:2px solid var(--brass);border-bottom:2px solid var(--brass);transform:rotate(-45deg)}
.side small{color:#8FA0B6;margin-top:auto;padding-top:2rem}
.main{display:flex;align-items:center;justify-content:center;padding:2.5rem 1.2rem;background:#fff}
.card-login{width:100%;max-width:410px}
.eyebrow{color:var(--brassdk);text-transform:uppercase;letter-spacing:.18em;font-size:.76rem;font-weight:700}
.card-login h1{font-size:2.8rem;margin:.3rem 0 .3rem}
.form-label{font-weight:600;font-size:.88rem}
.form-control{padding:.8rem .9rem;border-radius:10px;border-color:var(--line)}
.form-control:focus{border-color:var(--brass);box-shadow:0 0 0 3px rgba(184,145,79,.3)}
.pw{position:relative}.pw .form-control{padding-right:4.2rem}
.pw button{position:absolute;right:.5rem;top:50%;transform:translateY(-50%);border:0;background:none;color:var(--brassdk);font-weight:600;font-size:.82rem;padding:.3rem .5rem;border-radius:6px}
.btn-login{width:100%;background:var(--ink);color:#fff;border:0;padding:.85rem;border-radius:10px;font-weight:700}
.btn-login:hover{background:var(--brassdk);color:#fff}
.divider{display:flex;align-items:center;gap:.8rem;color:var(--muted);font-size:.82rem;margin:1.4rem 0}
.divider:before,.divider:after{content:"";flex:1;border-top:1px solid var(--line)}
.gwrap{display:flex;justify-content:center;min-height:44px}
.message{display:block}.message:empty{display:none}
.alert{font-size:.9rem;padding:.7rem .9rem;border-radius:10px;margin-bottom:1rem}
.back{color:var(--muted);font-size:.88rem;text-decoration:none}.back:hover{color:var(--ink)}
@media(max-width:900px){.shell{grid-template-columns:1fr}.side{padding:1.4rem 1.5rem}.side h2,.side p.lead,.perks,.side small{display:none}}
@media(prefers-reduced-motion:reduce){*{transition:none!important}}
</style>
</head>
<body>
<form id="form1" runat="server">
<div class="shell">

  <aside class="side">
    <a href="Default.aspx" class="brand">Watch<em>Vault</em></a>
    <h2>Welcome back.<br />Your time, <em>your style</em>.</h2>
    <p class="lead">Sign in to pick up where you left off.</p>
    <ul class="perks">
      <li>Your wishlist, saved across visits</li>
      <li>Order history and delivery tracking</li>
      <li>Faster checkout with your details</li>
    </ul>
    <small>&copy; <%: DateTime.Now.Year %> WatchVault. All rights reserved.</small>
  </aside>

  <main class="main">
    <section class="card-login">
      <a href="Default.aspx" class="back">&larr; Back to home</a>
      <div class="eyebrow mt-4">Welcome back</div>
      <h1>Sign in</h1>
      <p class="text-secondary mb-4">Sign in to access your WatchVault account.</p>

      <asp:Label ID="lblMessage" runat="server" CssClass="message" EnableViewState="false" role="alert" />

      <div class="mb-3">
        <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail" CssClass="form-label" Text="Email address" />
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" MaxLength="254" placeholder="you@example.com" autocomplete="username" />
      </div>

      <div class="mb-4">
        <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword" CssClass="form-label" Text="Password" />
        <div class="pw">
          <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" MaxLength="128" placeholder="Enter your password" autocomplete="current-password" />
          <button type="button" id="tgl" aria-controls="txtPassword" aria-pressed="false">Show</button>
        </div>
      </div>

      <asp:Button ID="btnLogin" runat="server" Text="Sign In" CssClass="btn-login" OnClick="btnLogin_Click" />

      <!-- Continue with Google (hidden automatically until a Client ID is configured) -->
      <asp:Panel ID="pnlGoogle" runat="server">
        <div class="divider">or</div>
        <div id="g_id_onload"
             data-client_id="<%: GoogleClientId %>"
             data-callback="onGoogleSignIn"
             data-auto_prompt="false"
             data-ux_mode="popup"></div>
        <div class="gwrap">
          <div class="g_id_signin" data-type="standard" data-shape="rectangular" data-theme="outline"
               data-text="continue_with" data-size="large" data-logo_alignment="left" data-width="360"></div>
        </div>
        <asp:HiddenField ID="hfGoogleToken" runat="server" />
        <asp:Button ID="btnGoogle" runat="server" CssClass="d-none" CausesValidation="false" OnClick="btnGoogle_Click" UseSubmitBehavior="false" />
      </asp:Panel>

      <p class="text-center mt-4 mb-0">Don't have an account? <a href="Register.aspx" style="color:var(--brassdk);font-weight:600">Create an account</a></p>
    </section>
  </main>
</div>
</form>

<script>
// Called by Google once the user picks an account; sends the ID token to the server.
function onGoogleSignIn(response) {
    document.getElementById('<%= hfGoogleToken.ClientID %>').value = response.credential;
    document.getElementById('<%= btnGoogle.ClientID %>').click();
  }
  (function () {
    var t = document.getElementById('tgl'), p = document.getElementById('<%= txtPassword.ClientID %>');
    t.addEventListener('click', function () {
      var show = p.type === 'password';
      p.type = show ? 'text' : 'password';
      t.textContent = show ? 'Hide' : 'Show';
      t.setAttribute('aria-pressed', show);
    });
  })();
</script>
<% if (GoogleEnabled) { %><script src="https://accounts.google.com/gsi/client" async defer></script><% } %>
</body>
</html>
