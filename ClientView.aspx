<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientView.aspx.cs" Inherits="CarRentalWeb.ClientView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="style.css">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
<div class="navbar">
    <asp:Button class="button" ID="rentButton" runat="server" Text="Wypożycz samochód" OnClick="rentButton_Click" /> 
    <asp:Button class="button" ID="ordersButton" runat="server" Text="Moje zamówienia" OnClick="ordersButton_Click" />
    <asp:Button class="logout" ID="logoutButton" runat="server" Text="Wyloguj" OnClick="logoutButton_Click" />
     <br>
 <asp:Label class="user" ID="infoLabel" runat="server" Text="Zalogowany jako:"></asp:Label>
 <br><br>
 <asp:Label class="user" ID="Label1" runat="server" Text="Label"></asp:Label>   
</div>

<!-- Page content -->
<div class="content">
</div>
    </form>
</body>
</html>