<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeOrders.aspx.cs" Inherits="CarRentalWeb.EmployeeRent" %>

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
    <asp:Button class="button" ID="clientsButton" runat="server" Text="Klenci" OnClick="clientsButton_Click" />
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
            <asp:Label ID="Label4" runat="server" Text="Label" Enabled="False" Visible="False"></asp:Label>
</div>

<!-- Page content -->
<div class="content">
    <h1>Dodaj zamówienie klientowi</h1>
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
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT [ID_KLIENT], [IMIE_KLIENT], [NAZWISKO_KLIENT], [PESEL_KLIENT], [TELEFON_KLIENT], [FAX], [NIP] FROM [KLIENCI]"></asp:SqlDataSource>
    <h1>Wybierz samochód</h1>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_SAMOCHOD" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
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
            <asp:BoundField DataField="MOC" HeaderText="MOC" SortExpression="MOC" />
            <asp:BoundField DataField="SKRZYNIA" HeaderText="SKRZYNIA" SortExpression="SKRZYNIA" />
            <asp:BoundField DataField="MIEJSCA" HeaderText="MIEJSCA" SortExpression="MIEJSCA" />
            <asp:BoundField DataField="CENA_DZIEN" HeaderText="CENA_DZIEN" SortExpression="CENA_DZIEN" />
            <asp:BoundField DataField="CENA_TYDZIEN" HeaderText="CENA_TYDZIEN" SortExpression="CENA_TYDZIEN" />
            <asp:BoundField DataField="CENA_MIESIAC" HeaderText="CENA_MIESIAC" SortExpression="CENA_MIESIAC" />
            <asp:BoundField DataField="KAUCJA" HeaderText="KAUCJA" SortExpression="KAUCJA" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT SAMOCHODY.ID_SAMOCHOD, RODZAJE_PALIWA.NAZWA_RODZAJ, MARKI.NAZWA_MARKA, MODELE.NAZWA_MODEL, MODELE.ROCZNIK, MODELE.GENERACJA, MODELE.SEGMENT, RODZAJE_NADWOZIA.NAZWA_NADWOZIE, WYPOZYCZALNIE.MIASTO, SAMOCHODY.KOLOR, SAMOCHODY.MOC, SAMOCHODY.SKRZYNIA, SAMOCHODY.MIEJSCA, SAMOCHODY.CENA_DZIEN, SAMOCHODY.CENA_TYDZIEN, SAMOCHODY.CENA_MIESIAC, SAMOCHODY.KAUCJA FROM MARKI INNER JOIN MODELE ON MARKI.ID_MARKA = MODELE.ID_MARKA INNER JOIN RODZAJE_NADWOZIA ON MODELE.ID_NADWOZIE = RODZAJE_NADWOZIA.ID_NADWOZIE INNER JOIN SAMOCHODY ON MODELE.ID_MODEL = SAMOCHODY.ID_MODEL INNER JOIN RODZAJE_PALIWA ON SAMOCHODY.ID_PALIWO = RODZAJE_PALIWA.ID_PALIWO INNER JOIN WYPOZYCZALNIE ON SAMOCHODY.ID_WYPOZYCZALNIA = WYPOZYCZALNIE.ID_WYPOZYCZALNIA WHERE (SAMOCHODY.ID_WYPOZYCZALNIA = @ID_WYPOZYCZALNIA)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label4" Name="ID_WYPOZYCZALNIA" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h1>Wybierz pakiet</h1>
    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" DataKeyNames="ID_PAKIET" OnSelectedIndexChanged="GridView3_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID_PAKIET" HeaderText="ID_PAKIET" SortExpression="ID_PAKIET" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="NAZWA" HeaderText="NAZWA" SortExpression="NAZWA" />
            <asp:BoundField DataField="ZAWARTOSC" HeaderText="ZAWARTOSC" SortExpression="ZAWARTOSC" />
            <asp:BoundField DataField="CENA" HeaderText="CENA" SortExpression="CENA" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT [ID_PAKIET], [NAZWA], [ZAWARTOSC], [CENA] FROM [PAKIETY]" ></asp:SqlDataSource>
        <h1>Ustal długość wypożyczenia</h1>
    <asp:Label class="label" ID="Label5" runat="server" Text="Okres"></asp:Label>
    <br />
    <asp:RadioButton ID="DayRadio" GroupName="role" runat="server" Text="Dzień" OnCheckedChanged="DayRadio_CheckedChanged"  />
    <asp:RadioButton ID="WeekRadio" GroupName="role" runat="server" Text="Tydzień" OnCheckedChanged="WeekRadio_CheckedChanged"  />
    <asp:RadioButton ID="MonthRadio" GroupName="role" runat="server" Text="Miesiąc" OnCheckedChanged="MonthRadio_CheckedChanged"  />
    <br /><br />
    <asp:Label class="label" ID="Label6" runat="server" Text="Wskaż datę rozpoczęcia wypożyczenia"></asp:Label>
    <br />
    <asp:TextBox id="DateText" runat="server" cssclass="datepicker-field"/>
    <br /><br />
    <asp:Label class="label" ID="Label7" runat="server" Text="Wskaż długość okresu"></asp:Label>
<br />
<asp:TextBox class="textbox" id="LengthText" runat="server" OnTextChanged="LengthText_TextChanged" />
    <br />
    <h1>SUMA</h1>
    <asp:TextBox class="textbox" ID="SumText" runat="server" ReadOnly="True"></asp:TextBox>
    <br /><br />
    <asp:Button class="buttonx" ID="OrderButton" runat="server" Text="Złóż zamówienie" OnClick="OrderButton_Click" />
    <br />
    <asp:Label ID="Label8" runat="server" Text=" "></asp:Label>
</div>
    </form>
    <script>
        $(document).ready(function () {
            $('.datepicker-field').datepicker();
        });

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
