<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CarRentalWeb.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
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
<body>
    <form id="form1" runat="server">
        <div class="login">
            <asp:Label class="label" id="userLabel" runat="server" Text="Imię (wymagane)"></asp:Label>
            <br>
            <asp:TextBox class="textbox" id="nameText" required="true" runat="server"></asp:TextBox>
            <br><br>
            <asp:Label class="label" id="passLabel" runat="server" Text="Nazwisko (wymagane)"></asp:Label>
            <br>
            <asp:TextBox class="textbox" id="surnameText" required="true" runat="server"></asp:TextBox>
            <br><br>
            <asp:Label class="label" id="Label1" runat="server" Text="PESEL"></asp:Label>
            <br>
            <asp:TextBox class="textbox" id="peselText" runat="server"></asp:TextBox>
            <br><br>
            <asp:Label class="label" id="Label2" runat="server" Text="Telefon (wymagane)"></asp:Label>
            <br>
            <asp:TextBox class="textbox" id="phoneText" required="true" runat="server"></asp:TextBox>
            <br><br>
            <asp:Label class="label" id="Label3" runat="server" Text="Fax"></asp:Label>
            <br>
            <asp:TextBox class="textbox" id="faxText" runat="server"></asp:TextBox>
            <br><br>
            <asp:Label class="label" id="Label4" runat="server" Text="NIP"></asp:Label>
            <br>
            <asp:TextBox class="textbox" id="nipText" runat="server"></asp:TextBox>
            <br><br>
            <asp:Label class="label" id="Label5" runat="server" Text="Nazwa użytkownika (wymagane)"></asp:Label>
            <br>
            <asp:TextBox class="textbox" id="userText" required="true" runat="server"></asp:TextBox>
            <br><br>
            <asp:Label class="label" id="Label6" runat="server" Text="Hasło (wymagane)"></asp:Label>
            <br>
            <asp:TextBox class="textbox" id="passText" required="true" TextMode="Password" runat="server"></asp:TextBox>
            <br><br>
            <asp:Button class="button" ID="registerButton" runat="server" Text="Zarejestruj się" OnClick="registerButton_Click"></asp:Button>
        </div>
    </form>
    <script type="text/javascript">
    function isNumberKey(evt) {
        var charCode = (evt.which) ? evt.which : event.keyCode;
        if (charCode != 46 && charCode > 31
          && (charCode < 48 || charCode > 57))
            return false;
        return true;
    }
    </script>
</body>
</html>
