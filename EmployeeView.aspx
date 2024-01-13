<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeView.aspx.cs" Inherits="CarRentalWeb.EmployeeView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="style.css">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
    <asp:Button class="button" ID="carsButton" runat="server" Text="Samochody" /> 
    <asp:Button class="button" ID="ordersButton" runat="server" Text="Zamówienia" />
    <asp:Button class="button" ID="historyButton" runat="server" Text="Historia zdarzeń" /> 
    <asp:Button class="button" ID="managementButton" runat="server" Text="Wydania/przyjęcia" />
            <asp:Button class="logout" ID="logoutButton" runat="server" Text="Wyloguj" OnClick="logoutButton_Click" />
     <br>
 <asp:Label class="user" ID="infoLabel" runat="server" Text="Zalogowany jako:"></asp:Label>
 <br><br>
 <asp:Label class="user" ID="Label1" runat="server" Text="Label"></asp:Label>   
 <br><br>
 <asp:Label class="user" ID="Label2" runat="server" Text="Label"></asp:Label> 
</div>

<!-- Page content -->
<div class="content">
  <h1>Page Title</h1>
  <p>This is the page content. You can add any HTML elements here.</p>
</div>
    </form>
</body>
</html>
