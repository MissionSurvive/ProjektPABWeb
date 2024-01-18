<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ClientOrders.aspx.cs" Inherits="CarRentalWeb.ClientOrders" %>

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
            <br /><br />
            <asp:Label ID="id" runat="server" Text="0" Visible="False"></asp:Label>
            </div>

<!-- Page content -->
<div class="content">
  <h1>Moje zamówienia</h1>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT ZAMOWIENIA.ID_ZAMOWIENIE, PAKIETY.NAZWA, WYPOZYCZALNIE.MIASTO, PRACOWNICY.IMIE_PRACOWNIK, PRACOWNICY.NAZWISKO_PRACOWNIK, MODELE.NAZWA_MODEL, ZAMOWIENIA.SAMOCHOD_WYDANY, ZAMOWIENIA.ZREALIZOWANE, ZAMOWIENIA.LICZBA_DNI, ZAMOWIENIA.CENA_ZAMOWIENIE, ZAMOWIENIA.DATA_START, ZAMOWIENIA.DATA_KONIEC FROM ZAMOWIENIA INNER JOIN KLIENCI ON ZAMOWIENIA.ID_KLIENT = KLIENCI.ID_KLIENT INNER JOIN PAKIETY ON ZAMOWIENIA.ID_PAKIET = PAKIETY.ID_PAKIET INNER JOIN PRACOWNICY ON ZAMOWIENIA.ID_PRAC = PRACOWNICY.ID_PRAC INNER JOIN SAMOCHODY ON ZAMOWIENIA.ID_SAMOCHOD = SAMOCHODY.ID_SAMOCHOD INNER JOIN MODELE ON SAMOCHODY.ID_MODEL = MODELE.ID_MODEL INNER JOIN WYPOZYCZALNIE ON ZAMOWIENIA.ID_WYPOZYCZALNIA = WYPOZYCZALNIE.ID_WYPOZYCZALNIA AND PRACOWNICY.ID_WYPOZYCZALNIA = WYPOZYCZALNIE.ID_WYPOZYCZALNIA AND SAMOCHODY.ID_WYPOZYCZALNIA = WYPOZYCZALNIE.ID_WYPOZYCZALNIA WHERE (ZAMOWIENIA.ID_KLIENT = @ID_KLIENT)">
    <SelectParameters>
        <asp:ControlParameter ControlID="id" Name="ID_KLIENT" PropertyName="Text" Type="Decimal" />
    </SelectParameters>
    </asp:SqlDataSource>
<asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" DataKeyNames="ID_ZAMOWIENIE" CellPadding="4" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:CommandField ShowSelectButton="True" />
        <asp:BoundField DataField="ID_ZAMOWIENIE" HeaderText="ID_ZAMOWIENIE" InsertVisible="False" ReadOnly="True" SortExpression="ID_ZAMOWIENIE" />
        <asp:BoundField DataField="NAZWA" HeaderText="NAZWA" SortExpression="NAZWA" />
        <asp:BoundField DataField="MIASTO" HeaderText="MIASTO" SortExpression="MIASTO" />
        <asp:BoundField DataField="IMIE_PRACOWNIK" HeaderText="IMIE_PRACOWNIK" SortExpression="IMIE_PRACOWNIK" />
        <asp:BoundField DataField="NAZWISKO_PRACOWNIK" HeaderText="NAZWISKO_PRACOWNIK" SortExpression="NAZWISKO_PRACOWNIK" />
        <asp:BoundField DataField="NAZWA_MODEL" HeaderText="NAZWA_MODEL" SortExpression="NAZWA_MODEL" />
        <asp:CheckBoxField DataField="SAMOCHOD_WYDANY" HeaderText="SAMOCHOD_WYDANY" SortExpression="SAMOCHOD_WYDANY" />
        <asp:CheckBoxField DataField="ZREALIZOWANE" HeaderText="ZREALIZOWANE" SortExpression="ZREALIZOWANE" />
        <asp:BoundField DataField="LICZBA_DNI" HeaderText="LICZBA_DNI" SortExpression="LICZBA_DNI" />
        <asp:BoundField DataField="CENA_ZAMOWIENIE" HeaderText="CENA_ZAMOWIENIE" SortExpression="CENA_ZAMOWIENIE" />
        <asp:BoundField DataField="DATA_START" HeaderText="DATA_START" SortExpression="DATA_START" />
        <asp:BoundField DataField="DATA_KONIEC" HeaderText="DATA_KONIEC" SortExpression="DATA_KONIEC" />
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
<br />
<h1>Szczegóły zamówienia</h1>
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" CellPadding="4" DataKeyNames="ID_ZAMOWIENIE" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <EditRowStyle BackColor="#7C6F57" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="ID_ZAMOWIENIE" HeaderText="ID_ZAMOWIENIE" InsertVisible="False" ReadOnly="True" SortExpression="ID_ZAMOWIENIE" />
            <asp:BoundField DataField="NAZWA" HeaderText="NAZWA" SortExpression="NAZWA" />
            <asp:BoundField DataField="MIASTO" HeaderText="MIASTO" SortExpression="MIASTO" />
            <asp:BoundField DataField="IMIE_PRACOWNIK" HeaderText="IMIE_PRACOWNIK" SortExpression="IMIE_PRACOWNIK" />
            <asp:BoundField DataField="NAZWISKO_PRACOWNIK" HeaderText="NAZWISKO_PRACOWNIK" SortExpression="NAZWISKO_PRACOWNIK" />
            <asp:BoundField DataField="NAZWA_MODEL" HeaderText="NAZWA_MODEL" SortExpression="NAZWA_MODEL" />
            <asp:BoundField DataField="ROCZNIK" HeaderText="ROCZNIK" SortExpression="ROCZNIK" />
            <asp:BoundField DataField="NAZWA_RODZAJ" HeaderText="NAZWA_RODZAJ" SortExpression="NAZWA_RODZAJ" />
            <asp:BoundField DataField="NAZWA_NADWOZIE" HeaderText="NAZWA_NADWOZIE" SortExpression="NAZWA_NADWOZIE" />
            <asp:BoundField DataField="KOLOR" HeaderText="KOLOR" SortExpression="KOLOR" />
            <asp:BoundField DataField="MOC" HeaderText="MOC" SortExpression="MOC" />
            <asp:BoundField DataField="SKRZYNIA" HeaderText="SKRZYNIA" SortExpression="SKRZYNIA" />
            <asp:BoundField DataField="MIEJSCA" HeaderText="MIEJSCA" SortExpression="MIEJSCA" />
            <asp:CheckBoxField DataField="SAMOCHOD_WYDANY" HeaderText="SAMOCHOD_WYDANY" SortExpression="SAMOCHOD_WYDANY" />
            <asp:CheckBoxField DataField="ZREALIZOWANE" HeaderText="ZREALIZOWANE" SortExpression="ZREALIZOWANE" />
            <asp:BoundField DataField="LICZBA_DNI" HeaderText="LICZBA_DNI" SortExpression="LICZBA_DNI" />
            <asp:BoundField DataField="CENA_ZAMOWIENIE" HeaderText="CENA_ZAMOWIENIE" SortExpression="CENA_ZAMOWIENIE" />
            <asp:BoundField DataField="DATA_START" HeaderText="DATA_START" SortExpression="DATA_START" />
            <asp:BoundField DataField="DATA_KONIEC" HeaderText="DATA_KONIEC" SortExpression="DATA_KONIEC" />
        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:DetailsView>
<asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT ZAMOWIENIA.ID_ZAMOWIENIE, PAKIETY.NAZWA, WYPOZYCZALNIE.MIASTO, PRACOWNICY.IMIE_PRACOWNIK, PRACOWNICY.NAZWISKO_PRACOWNIK, MODELE.NAZWA_MODEL, MODELE.ROCZNIK, RODZAJE_PALIWA.NAZWA_RODZAJ, RODZAJE_NADWOZIA.NAZWA_NADWOZIE, SAMOCHODY.KOLOR, SAMOCHODY.MOC, SAMOCHODY.SKRZYNIA, SAMOCHODY.MIEJSCA, ZAMOWIENIA.SAMOCHOD_WYDANY, ZAMOWIENIA.ZREALIZOWANE, ZAMOWIENIA.LICZBA_DNI, ZAMOWIENIA.CENA_ZAMOWIENIE, ZAMOWIENIA.DATA_START, ZAMOWIENIA.DATA_KONIEC FROM RODZAJE_NADWOZIA INNER JOIN MODELE ON RODZAJE_NADWOZIA.ID_NADWOZIE = MODELE.ID_NADWOZIE INNER JOIN SAMOCHODY ON MODELE.ID_MODEL = SAMOCHODY.ID_MODEL INNER JOIN ZAMOWIENIA INNER JOIN PAKIETY ON ZAMOWIENIA.ID_PAKIET = PAKIETY.ID_PAKIET INNER JOIN PRACOWNICY ON ZAMOWIENIA.ID_PRAC = PRACOWNICY.ID_PRAC ON SAMOCHODY.ID_SAMOCHOD = ZAMOWIENIA.ID_SAMOCHOD INNER JOIN RODZAJE_PALIWA ON SAMOCHODY.ID_PALIWO = RODZAJE_PALIWA.ID_PALIWO INNER JOIN WYPOZYCZALNIE ON SAMOCHODY.ID_WYPOZYCZALNIA = WYPOZYCZALNIE.ID_WYPOZYCZALNIA AND ZAMOWIENIA.ID_WYPOZYCZALNIA = WYPOZYCZALNIE.ID_WYPOZYCZALNIA AND PRACOWNICY.ID_WYPOZYCZALNIA = WYPOZYCZALNIE.ID_WYPOZYCZALNIA WHERE (ZAMOWIENIA.ID_ZAMOWIENIE = @ID_ZAMOWIENIE)">
    <SelectParameters>
        <asp:ControlParameter ControlID="GridView1" PropertyName="SelectedValue" Name="ID_ZAMOWIENIE" Type="Decimal"></asp:ControlParameter>
    </SelectParameters>
</asp:SqlDataSource>
    <h1>Historia zamówienia</h1>
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="NAZWA_ZDARZENIE" HeaderText="NAZWA_ZDARZENIE" SortExpression="NAZWA_ZDARZENIE" />
            <asp:BoundField DataField="OPLATA" HeaderText="OPLATA" SortExpression="OPLATA" />
            <asp:BoundField DataField="DATA_ZDARZENIE" HeaderText="DATA_ZDARZENIE" SortExpression="DATA_ZDARZENIE" />
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
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:CarRentalCWBackConnectionString %>" SelectCommand="SELECT RODZAJE_ZDARZEN.NAZWA_ZDARZENIE, HISTORIA_ZDARZEN.OPLATA, HISTORIA_ZDARZEN.DATA_ZDARZENIE FROM HISTORIA_ZDARZEN INNER JOIN RODZAJE_ZDARZEN ON HISTORIA_ZDARZEN.ID_RODZAJ_ZDARZENIE = RODZAJE_ZDARZEN.ID_RODZAJ_ZDARZENIE WHERE (HISTORIA_ZDARZEN.ID_ZAMOWIENIE = @ID_ZAMOWIENIE)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="ID_ZAMOWIENIE" PropertyName="SelectedValue" Type="Decimal" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>
    </form>
</body>
</html>
