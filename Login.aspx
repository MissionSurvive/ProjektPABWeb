<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CarRentalWeb.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
form {
  border: 3px solid #f1f1f1;
  width: 50%;
  margin-left: 25%;
}
.textbox {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
.button {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}
.label {
    font-weight: bold;
}
.login {
  padding: 16px;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login">
            <br class="Apple-interchange-newline">
            <h1>Panel logowania</h1>
            <asp:Label class="label" id="userLabel" runat="server" Text="Nazwa użytkownika"></asp:Label>
            <br>
            <asp:TextBox class="textbox" id="userText" runat="server"></asp:TextBox>
            <br><br>
            <asp:Label class="label" id="passLabel" runat="server" Text="Hasło"></asp:Label>
            <br>
            <asp:TextBox class="textbox" id="passText" TextMode="Password" runat="server"></asp:TextBox>
            <br><br>
            <asp:RadioButton ID="RadioButton1" GroupName="role" runat="server" Text="Pracownik" Checked="True" />
            <asp:RadioButton ID="RadioButton2" GroupName="role" runat="server" text="Klient"/>
            <asp:Button class="button" ID="loginButton" runat="server" Text="Zaloguj się" OnClick="loginButton_Click"></asp:Button>
            <asp:Button class="button" runat="server" Text="Zarejestruj się" OnClick="Unnamed1_Click"></asp:Button>
        </div>
    </form>
</body>
</html>
