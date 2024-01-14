<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeHistory.aspx.cs" Inherits="CarRentalWeb.EmployeeHistory" %>

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
.buttony {
  background-color: #04AA6D;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 30%;
}
.buttonz {
  background-color: #f5dd42;
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
    <asp:Button class="button" ID="carsButton" runat="server" Text="Samochody" /> 
    <asp:Button class="button" ID="clientsButton" runat="server" Text="Klenci" />
    <asp:Button class="button" ID="ordersButton" runat="server" Text="Zamówienia" />
    <asp:Button class="button" ID="historyButton" runat="server" Text="Zdarzenia" OnClick="historyButton_Click" /> 
    
            <asp:Button class="logout" ID="logoutButton" runat="server" Text="Wyloguj" OnClick="logoutButton_Click" />
     <br>
 <asp:Label class="user" ID="infoLabel" runat="server" Text="Zalogowany jako:"></asp:Label>
 <br><br>
 <asp:Label class="user" ID="Label1" runat="server" Text="Label"></asp:Label>   
 <br><br>
 <asp:Label class="user" ID="Label2" runat="server" Text="Label"></asp:Label> 
            <br /><br />
            <asp:Label ID="Label3" runat="server" Text="Label" Enabled="False"></asp:Label>
</div>

<!-- Page content -->
<div class="content">
    <h1>Zamówienia powiązane z tobą</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_ZAMOWIENIE" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID_ZAMOWIENIE" HeaderText="ID_ZAMOWIENIE" InsertVisible="False" ReadOnly="True" SortExpression="ID_ZAMOWIENIE" />
            <asp:BoundField DataField="NAZWA" HeaderText="NAZWA" SortExpression="NAZWA" />
            <asp:BoundField DataField="MIASTO" HeaderText="MIASTO" SortExpression="MIASTO" />
            <asp:BoundField DataField="ID_PRAC" HeaderText="ID_PRAC" SortExpression="ID_PRAC" />
            <asp:BoundField DataField="IMIE_KLIENT" HeaderText="IMIE_KLIENT" SortExpression="IMIE_KLIENT" />
            <asp:BoundField DataField="NAZWISKO_KLIENT" HeaderText="NAZWISKO_KLIENT" SortExpression="NAZWISKO_KLIENT" />
            <asp:BoundField DataField="NAZWA_MODEL" HeaderText="NAZWA_MODEL" SortExpression="NAZWA_MODEL" />
            <asp:CheckBoxField DataField="SAMOCHOD_WYDANY" HeaderText="SAMOCHOD_WYDANY" SortExpression="SAMOCHOD_WYDANY" />
            <asp:CheckBoxField DataField="ZREALIZOWANE" HeaderText="ZREALIZOWANE" SortExpression="ZREALIZOWANE" />
            <asp:BoundField DataField="LICZBA_DNI" HeaderText="LICZBA_DNI" SortExpression="LICZBA_DNI" />
            <asp:BoundField DataField="CENA_ZAMOWIENIE" HeaderText="CENA_ZAMOWIENIE" SortExpression="CENA_ZAMOWIENIE" />
            <asp:BoundField DataField="DATA_START" HeaderText="DATA_START" SortExpression="DATA_START" />
            <asp:BoundField DataField="DATA_KONIEC" HeaderText="DATA_KONIEC" SortExpression="DATA_KONIEC" />
            <asp:BoundField DataField="ID_PAKIET" HeaderText="ID_PAKIET" SortExpression="ID_PAKIET" />
            <asp:BoundField DataField="ID_WYPOZYCZALNIA" HeaderText="ID_WYPOZYCZALNIA" SortExpression="ID_WYPOZYCZALNIA" />
            <asp:BoundField DataField="ID_KLIENT" HeaderText="ID_KLIENT" SortExpression="ID_KLIENT" />
            <asp:BoundField DataField="ID_SAMOCHOD" HeaderText="ID_SAMOCHOD" SortExpression="ID_SAMOCHOD" />
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
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT ZAMOWIENIA.ID_ZAMOWIENIE, PAKIETY.NAZWA, WYPOZYCZALNIE.MIASTO, ZAMOWIENIA.ID_PRAC, KLIENCI.IMIE_KLIENT, KLIENCI.NAZWISKO_KLIENT, MODELE.NAZWA_MODEL, ZAMOWIENIA.SAMOCHOD_WYDANY, ZAMOWIENIA.ZREALIZOWANE, ZAMOWIENIA.LICZBA_DNI, ZAMOWIENIA.CENA_ZAMOWIENIE, ZAMOWIENIA.DATA_START, ZAMOWIENIA.DATA_KONIEC, ZAMOWIENIA.ID_PAKIET, ZAMOWIENIA.ID_WYPOZYCZALNIA, ZAMOWIENIA.ID_KLIENT, ZAMOWIENIA.ID_SAMOCHOD FROM SAMOCHODY INNER JOIN MODELE ON SAMOCHODY.ID_MODEL = MODELE.ID_MODEL INNER JOIN WYPOZYCZALNIE ON SAMOCHODY.ID_WYPOZYCZALNIA = WYPOZYCZALNIE.ID_WYPOZYCZALNIA INNER JOIN PRACOWNICY ON WYPOZYCZALNIE.ID_WYPOZYCZALNIA = PRACOWNICY.ID_WYPOZYCZALNIA INNER JOIN ZAMOWIENIA ON SAMOCHODY.ID_SAMOCHOD = ZAMOWIENIA.ID_SAMOCHOD AND WYPOZYCZALNIE.ID_WYPOZYCZALNIA = ZAMOWIENIA.ID_WYPOZYCZALNIA AND PRACOWNICY.ID_PRAC = ZAMOWIENIA.ID_PRAC INNER JOIN KLIENCI ON ZAMOWIENIA.ID_KLIENT = KLIENCI.ID_KLIENT INNER JOIN PAKIETY ON ZAMOWIENIA.ID_PAKIET = PAKIETY.ID_PAKIET WHERE (ZAMOWIENIA.ID_PRAC = @ID_PRAC)">
        <SelectParameters>
            <asp:ControlParameter ControlID="Label3" DefaultValue="" Name="ID_PRAC" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h1>Historia wybranego zamówienia</h1>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ID_HISTORIA,ID_RODZAJ_ZDARZENIE" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ID_HISTORIA" HeaderText="ID_HISTORIA" InsertVisible="False" ReadOnly="True" SortExpression="ID_HISTORIA" />
            <asp:BoundField DataField="ID_ZAMOWIENIE" HeaderText="ID_ZAMOWIENIE" SortExpression="ID_ZAMOWIENIE" />
            <asp:BoundField DataField="NAZWA_ZDARZENIE" HeaderText="NAZWA_ZDARZENIE" SortExpression="NAZWA_ZDARZENIE" />
            <asp:BoundField DataField="OPLATA" HeaderText="OPLATA" SortExpression="OPLATA" />
            <asp:BoundField DataField="ID_RODZAJ_ZDARZENIE" HeaderText="ID_RODZAJ_ZDARZENIE" InsertVisible="False" ReadOnly="True" SortExpression="ID_RODZAJ_ZDARZENIE" />
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
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT HISTORIA_ZDARZEN.ID_HISTORIA, HISTORIA_ZDARZEN.ID_ZAMOWIENIE, RODZAJE_ZDARZEN.NAZWA_ZDARZENIE, HISTORIA_ZDARZEN.OPLATA, RODZAJE_ZDARZEN.ID_RODZAJ_ZDARZENIE FROM HISTORIA_ZDARZEN INNER JOIN RODZAJE_ZDARZEN ON HISTORIA_ZDARZEN.ID_RODZAJ_ZDARZENIE = RODZAJE_ZDARZEN.ID_RODZAJ_ZDARZENIE WHERE (HISTORIA_ZDARZEN.ID_ZAMOWIENIE = @ID_ZAMOWIENIE)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ID_ZAMOWIENIE" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <h1>Dodaj zdarzenie</h1>
    <asp:DropDownList class="textbox" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="NAZWA_ZDARZENIE" DataValueField="ID_RODZAJ_ZDARZENIE">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT [ID_RODZAJ_ZDARZENIE], [NAZWA_ZDARZENIE] FROM [RODZAJE_ZDARZEN]"></asp:SqlDataSource>
    <br /><br />
    <asp:Label class="label" ID="Label4" runat="server" Text="Data zdarzenia"></asp:Label>
<br />
<asp:TextBox id="DateText" runat="server" cssclass="datepicker-field"/>
    <br /><br />
    <asp:Label class="label" ID="Label5" runat="server" Text="Opłata"></asp:Label>
    <br />
    <asp:TextBox class="textbox" id="PriceText" runat="server">0.00</asp:TextBox>
    <br /><br />
    <asp:Button class="buttony" ID="Button1" runat="server" Text="Dodaj zdarzenie" OnClick="Button1_Click" />
    <br /><br />
    <asp:Button class="buttonz" ID="Button2" runat="server" Text="Modyfikuj zdarzenie" OnClick="Button2_Click" />
    <br />
    <br />
    <asp:Label ID="Label6" runat="server" Text=""></asp:Label>
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
