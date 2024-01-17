<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeCars.aspx.cs" Inherits="CarRentalWeb.EmployeeCars" %>

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
    <form id="form2" runat="server">
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
            <br /><br />
            <asp:Label ID="Label19" runat="server" Text="Label" Enabled="False" Visible="False"></asp:Label>
</div>

<!-- Page content -->
<div class="content">
    <h1>Samochody</h1>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" DataKeyNames="ID_SAMOCHOD" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID_SAMOCHOD" HeaderText="ID_SAMOCHOD" InsertVisible="False" ReadOnly="True" SortExpression="ID_SAMOCHOD" />
            <asp:BoundField DataField="NAZWA_RODZAJ" HeaderText="NAZWA_RODZAJ" SortExpression="NAZWA_RODZAJ" />
            <asp:BoundField DataField="NAZWA_MARKA" HeaderText="NAZWA_MARKA" SortExpression="NAZWA_MARKA" />
            <asp:BoundField DataField="NAZWA_MODEL" HeaderText="NAZWA_MODEL" SortExpression="NAZWA_MODEL" />
            <asp:BoundField DataField="ROCZNIK" HeaderText="ROCZNIK" SortExpression="ROCZNIK" />
            <asp:BoundField DataField="GENERACJA" HeaderText="GENERACJA" SortExpression="GENERACJA" />
            <asp:BoundField DataField="SEGMENT" HeaderText="SEGMENT" SortExpression="SEGMENT" />
            <asp:BoundField DataField="NAZWA_NADWOZIE" HeaderText="NAZWA_NADWOZIE" SortExpression="NAZWA_NADWOZIE" />
            <asp:BoundField DataField="MIASTO" HeaderText="MIASTO" SortExpression="MIASTO" />
            <asp:BoundField DataField="KOLOR" HeaderText="KOLOR" SortExpression="KOLOR" />
            <asp:BoundField DataField="PRZEBIEG" HeaderText="PRZEBIEG" SortExpression="PRZEBIEG" />
            <asp:BoundField DataField="VIN" HeaderText="VIN" SortExpression="VIN" />
            <asp:BoundField DataField="POJEMNOSC" HeaderText="POJEMNOSC" SortExpression="POJEMNOSC" />
            <asp:BoundField DataField="MOC" HeaderText="MOC" SortExpression="MOC" />
            <asp:BoundField DataField="SKRZYNIA" HeaderText="SKRZYNIA" SortExpression="SKRZYNIA" />
            <asp:BoundField DataField="MIEJSCA" HeaderText="MIEJSCA" SortExpression="MIEJSCA" />
            <asp:BoundField DataField="CENA_DZIEN" HeaderText="CENA_DZIEN" SortExpression="CENA_DZIEN" />
            <asp:BoundField DataField="CENA_TYDZIEN" HeaderText="CENA_TYDZIEN" SortExpression="CENA_TYDZIEN" />
            <asp:BoundField DataField="CENA_MIESIAC" HeaderText="CENA_MIESIAC" SortExpression="CENA_MIESIAC" />
            <asp:BoundField DataField="KAUCJA" HeaderText="KAUCJA" SortExpression="KAUCJA" />
            <asp:BoundField DataField="ID_PALIWO" HeaderText="ID_PALIWO" SortExpression="ID_PALIWO" />
            <asp:BoundField DataField="ID_MODEL" HeaderText="ID_MODEL" SortExpression="ID_MODEL" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT SAMOCHODY.ID_SAMOCHOD, RODZAJE_PALIWA.NAZWA_RODZAJ, MARKI.NAZWA_MARKA, MODELE.NAZWA_MODEL, MODELE.ROCZNIK, MODELE.GENERACJA, MODELE.SEGMENT, RODZAJE_NADWOZIA.NAZWA_NADWOZIE, WYPOZYCZALNIE.MIASTO, SAMOCHODY.KOLOR, SAMOCHODY.PRZEBIEG, SAMOCHODY.VIN, SAMOCHODY.POJEMNOSC, SAMOCHODY.MOC, SAMOCHODY.SKRZYNIA, SAMOCHODY.MIEJSCA, SAMOCHODY.CENA_DZIEN, SAMOCHODY.CENA_TYDZIEN, SAMOCHODY.CENA_MIESIAC, SAMOCHODY.KAUCJA, SAMOCHODY.ID_PALIWO, SAMOCHODY.ID_MODEL FROM MARKI INNER JOIN MODELE ON MARKI.ID_MARKA = MODELE.ID_MARKA INNER JOIN RODZAJE_NADWOZIA ON MODELE.ID_NADWOZIE = RODZAJE_NADWOZIA.ID_NADWOZIE INNER JOIN SAMOCHODY ON MODELE.ID_MODEL = SAMOCHODY.ID_MODEL INNER JOIN RODZAJE_PALIWA ON SAMOCHODY.ID_PALIWO = RODZAJE_PALIWA.ID_PALIWO INNER JOIN WYPOZYCZALNIE ON SAMOCHODY.ID_WYPOZYCZALNIA = WYPOZYCZALNIE.ID_WYPOZYCZALNIA WHERE (SAMOCHODY.ID_WYPOZYCZALNIA = @ID_WYPOZYCZALNIA)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label19" Name="ID_WYPOZYCZALNIA" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h1>Filtry</h1>
    <asp:Label class="label" ID="Label4" runat="server" Text="Marka"></asp:Label>
    <br />
    <asp:DropDownList class="textbox" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="NAZWA_MARKA" DataValueField="ID_MODEL"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT DISTINCT MODELE.ID_MODEL, MARKI.NAZWA_MARKA FROM MARKI INNER JOIN MODELE ON MARKI.ID_MARKA = MODELE.ID_MARKA INNER JOIN SAMOCHODY ON MODELE.ID_MODEL = SAMOCHODY.ID_MODEL"></asp:SqlDataSource>
    <h1>Dodaj/modyfikuj/usuń samochód</h1>
     <asp:Label class="label" ID="Label5" runat="server" Text="Paliwo"></asp:Label>
 <br />
    <asp:DropDownList class="textbox" ID="DropDownList2" runat="server" DataSourceID="SqlDataSource3" DataTextField="NAZWA_RODZAJ" DataValueField="ID_PALIWO"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT [ID_PALIWO], [NAZWA_RODZAJ] FROM [RODZAJE_PALIWA]"></asp:SqlDataSource>
    <br /><br />
        <asp:Label class="label" ID="Label6" runat="server" Text="Model"></asp:Label>
<br />
    <asp:DropDownList class="textbox" ID="DropDownList3" runat="server" DataSourceID="SqlDataSource4" DataTextField="NAZWA_MODEL" DataValueField="ID_MODEL"></asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT [ID_MODEL], [NAZWA_MODEL] FROM [MODELE]"></asp:SqlDataSource>
    <br /><br />
        <asp:Label class="label" ID="Label7" runat="server" Text="Kolor"></asp:Label>
<br />
    <asp:TextBox class="textbox" ID="ColorText" runat="server"></asp:TextBox>
    <br /><br />
        <asp:Label class="label" ID="Label8" runat="server" Text="Przebieg"></asp:Label>
<br />
    <asp:TextBox class="textbox" ID="MileageText" runat="server"></asp:TextBox>
    <br /><br />
        <asp:Label class="label" ID="Label9" runat="server" Text="VIN"></asp:Label>
<br />
    <asp:TextBox class="textbox" ID="VinText" runat="server"></asp:TextBox>
    <br /><br />
        <asp:Label class="label" ID="Label10" runat="server" Text="Pojemność silnika"></asp:Label>
<br />
    <asp:TextBox class="textbox" ID="DispText" runat="server"></asp:TextBox>
    <br /><br />
        <asp:Label class="label" ID="Label11" runat="server" Text="Moc silnika"></asp:Label>
<br />
    <asp:TextBox class="textbox" ID="PowerText" runat="server"></asp:TextBox>
    <br /><br />
        <asp:Label class="label" ID="Label12" runat="server" Text="Skrzynia biegów"></asp:Label>
<br />
    <asp:TextBox class="textbox" ID="GearText" runat="server"></asp:TextBox>
    <br /><br />
        <asp:Label class="label" ID="Label13" runat="server" Text="Ilość miejsc"></asp:Label>
<br />
    <asp:TextBox class="textbox" ID="SeatsText" runat="server"></asp:TextBox>
    <br /><br />
        <asp:Label class="label" ID="Label14" runat="server" Text="Cena za dzień"></asp:Label>
<br />
    <asp:TextBox class="textbox" ID="DayText" runat="server">0.00</asp:TextBox>
    <br /><br />
        <asp:Label class="label" ID="Label15" runat="server" Text="Cena za tydzień"></asp:Label>
<br />
    <asp:TextBox class="textbox" ID="WeekText" runat="server">0.00</asp:TextBox>
    <br /><br />
        <asp:Label class="label" ID="Label16" runat="server" Text="Cena za miesiąc"></asp:Label>
<br />
    <asp:TextBox class="textbox" ID="MonthText" runat="server">0.00</asp:TextBox>
    <br /><br />
        <asp:Label class="label" ID="Label17" runat="server" Text="Kaucja"></asp:Label>
<br />
    <asp:TextBox class="textbox" ID="DepositText" runat="server">0.00</asp:TextBox>
    <br /><br />
    <asp:Button class="buttonx" ID="Button2" runat="server" Text="Dodaj" OnClick="Button2_Click" />
<br /><br />
<asp:Button class="buttony" ID="Button3" runat="server" Text="Modyfikuj" OnClick="Button3_Click" />
<br /><br />
<asp:Button class="buttonz" ID="Button4" runat="server" Text="Usuń" OnClick="Button4_Click" />
<br /><br />
    <asp:Label ID="Label18" runat="server" Text=" "></asp:Label>
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
