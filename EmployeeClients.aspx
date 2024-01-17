<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeClients.aspx.cs" Inherits="CarRentalWeb.EmployeeClients" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" href="style.css">
     <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
 <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <title></title>
    <style>
        .textbox, .datepicker-field {
  width: 30%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
.buttonx {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 30%;
}

.buttony {
  background-color: #f5dd42;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 30%;
}

.buttonz {
  background-color: #eb4034;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 30%;
}
.label {
    font-weight: bold;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
    <asp:Button class="button" ID="carsButton" runat="server" Text="Samochody" OnClick="carsButton_Click" /> 
    <asp:Button class="button" ID="clientsButton" runat="server" Text="Klienci" OnClick="clientsButton_Click" />
    <asp:Button class="button" ID="ordersButton" runat="server" Text="Zamówienia" OnClick="ordersButton_Click" />
    <asp:Button class="button" ID="historyButton" runat="server" Text="Zdarzenia" OnClick="historyButton_Click" /> 
    
            <asp:Button class="logout" ID="logoutButton" runat="server" Text="Wyloguj" OnClick="logoutButton_Click" />
     <br>
 <asp:Label class="user" ID="infoLabel" runat="server" Text="Zalogowany jako:"></asp:Label>
 <br><br>
 <asp:Label class="user" ID="Label1" runat="server" Text="Label"></asp:Label>   
 <br><br>
 <asp:Label class="user" ID="Label2" runat="server" Text="Label"></asp:Label> 
            <br /><br />
            <asp:Label ID="Label3" runat="server" Text="Label" Enabled="False" Visible="False"></asp:Label>
</div>

<!-- Page content -->
<div class="content">
    <h1>Klienci</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_KLIENT" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID_KLIENT" HeaderText="ID_KLIENT" InsertVisible="False" ReadOnly="True" SortExpression="ID_KLIENT" />
            <asp:BoundField DataField="IMIE_KLIENT" HeaderText="IMIE_KLIENT" SortExpression="IMIE_KLIENT" />
            <asp:BoundField DataField="NAZWISKO_KLIENT" HeaderText="NAZWISKO_KLIENT" SortExpression="NAZWISKO_KLIENT" />
            <asp:BoundField DataField="PESEL_KLIENT" HeaderText="PESEL_KLIENT" SortExpression="PESEL_KLIENT" />
            <asp:BoundField DataField="TELEFON_KLIENT" HeaderText="TELEFON_KLIENT" SortExpression="TELEFON_KLIENT" />
            <asp:BoundField DataField="FAX" HeaderText="FAX" SortExpression="FAX" />
            <asp:BoundField DataField="NIP" HeaderText="NIP" SortExpression="NIP" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT [ID_KLIENT], [IMIE_KLIENT], [NAZWISKO_KLIENT], [PESEL_KLIENT], [TELEFON_KLIENT], [FAX], [NIP] FROM [KLIENCI]" DeleteCommand="DELETE FROM [KLIENCI] WHERE [ID_KLIENT] = @ID_KLIENT" InsertCommand="INSERT INTO [KLIENCI] ([IMIE_KLIENT], [NAZWISKO_KLIENT], [PESEL_KLIENT], [TELEFON_KLIENT], [FAX], [NIP]) VALUES (@IMIE_KLIENT, @NAZWISKO_KLIENT, @PESEL_KLIENT, @TELEFON_KLIENT, @FAX, @NIP)" UpdateCommand="UPDATE [KLIENCI] SET [IMIE_KLIENT] = @IMIE_KLIENT, [NAZWISKO_KLIENT] = @NAZWISKO_KLIENT, [PESEL_KLIENT] = @PESEL_KLIENT, [TELEFON_KLIENT] = @TELEFON_KLIENT, [FAX] = @FAX, [NIP] = @NIP WHERE [ID_KLIENT] = @ID_KLIENT">
        <DeleteParameters>
            <asp:Parameter Name="ID_KLIENT" Type="Decimal" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="IMIE_KLIENT" Type="String" />
            <asp:Parameter Name="NAZWISKO_KLIENT" Type="String" />
            <asp:Parameter Name="PESEL_KLIENT" Type="String" />
            <asp:Parameter Name="TELEFON_KLIENT" Type="String" />
            <asp:Parameter Name="FAX" Type="String" />
            <asp:Parameter Name="NIP" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="IMIE_KLIENT" Type="String" />
            <asp:Parameter Name="NAZWISKO_KLIENT" Type="String" />
            <asp:Parameter Name="PESEL_KLIENT" Type="String" />
            <asp:Parameter Name="TELEFON_KLIENT" Type="String" />
            <asp:Parameter Name="FAX" Type="String" />
            <asp:Parameter Name="NIP" Type="Decimal" />
            <asp:Parameter Name="ID_KLIENT" Type="Decimal" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <h1>Dodaj/modyfikuj/ klienta</h1>
    <asp:Label class="label" ID="Label5" runat="server" Text="Imię"></asp:Label>
    <br />
    <asp:TextBox class="textbox" ID="NameText" runat="server"></asp:TextBox>
    <br /><br />
    <asp:Label class="label" ID="Label6" runat="server" Text="Nazwisko"></asp:Label>
    <br />
<asp:TextBox class="textbox" ID="SurnameText" runat="server"></asp:TextBox>
<br /><br />
    <asp:Label class="label" ID="Label7" runat="server" Text="PESEL (opcjonalnie)"></asp:Label>
<br />
<asp:TextBox class="textbox" ID="PeselText" runat="server"></asp:TextBox>
<br /><br />
    <asp:Label class="label" ID="Label8" runat="server" Text="Telefon"></asp:Label>
<br />
<asp:TextBox class="textbox" ID="PhoneText" runat="server"></asp:TextBox>
<br /><br />
    <asp:Label class="label" ID="Label9" runat="server" Text="Fax (opcjonalnie)"></asp:Label>
<br />
<asp:TextBox class="textbox" ID="FaxText" runat="server"></asp:TextBox>
<br /><br />
    <asp:Label class="label" ID="Label10" runat="server" Text="NIP (opcjonalnie)"></asp:Label>
<br />
<asp:TextBox class="textbox" ID="NipText" runat="server"></asp:TextBox>
<br /><br />
        <asp:Label class="label" ID="Label11" runat="server" Text="Nazwa użytkownika"></asp:Label>
<br />
<asp:TextBox class="textbox" ID="UserText" runat="server"></asp:TextBox>
<br /><br />
        <asp:Label class="label" ID="Label12" runat="server" Text="Hasło"></asp:Label>
<br />
<asp:TextBox class="textbox" ID="PassText" runat="server"></asp:TextBox>
<br /><br />
    <asp:Button class="buttonx" ID="Button2" runat="server" Text="Dodaj" OnClick="Button2_Click" />
    <br /><br />
    <asp:Button class="buttony" ID="Button3" runat="server" Text="Modyfikuj" OnClick="Button3_Click" />
    <br /><br />
    <asp:Button class="buttonz" ID="Button4" runat="server" Text="Usuń" OnClick="Button4_Click" />
    <br /><br />
    <asp:Label ID="Label13" runat="server" Text=""></asp:Label>
</div>
    </form>
    <script>
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