using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalWeb
{
    public partial class Login : System.Web.UI.Page
    {
        public static string userRoleLogged;
        public static int userID;
        public static string name;
        public static string surname;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(@"Data Source = X280\SQLEXPRESS; Initial Catalog = CarRentalCWBack; Integrated Security = True");
            if (RadioButton1.Checked)
            {
                var command = ("SELECT KONTA_PRACOWNIKOW.ID_PRAC, NAZWA_PRACOWNIK, HASLO_PRACOWNIK, PRACOWNICY.IMIE_PRACOWNIK, PRACOWNICY.NAZWISKO_PRACOWNIK, ROLE.ROLA FROM KONTA_PRACOWNIKOW " +
                    "JOIN PRACOWNICY ON KONTA_PRACOWNIKOW.ID_PRAC = PRACOWNICY.ID_PRAC " +
                    "JOIN ROLE ON KONTA_PRACOWNIKOW.ID_ROLA = ROLE.ID_ROLA " +
                    "WHERE NAZWA_PRACOWNIK = @Username AND HASLO_PRACOWNIK = @Password");
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command, connection);
                    adapter.SelectCommand.Parameters.AddWithValue("@Username", userText.Text);
                    adapter.SelectCommand.Parameters.AddWithValue("@Password", passText.Text);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    if (dt.Rows.Count == 1)
                    {
                        object idObj = dt.Rows[0][0];
                        object nameObj = dt.Rows[0][3];
                        object surnameObj = dt.Rows[0][4];
                        object roleObj = dt.Rows[0][5];
                        userID = Convert.ToInt32(idObj);
                        name = nameObj.ToString();
                        surname = surnameObj.ToString();
                        userRoleLogged = roleObj.ToString();
                        connection.Close();
                        Console.WriteLine(userRoleLogged);
                        Response.Redirect("EmployeeView.aspx");
                    }
                    else
                    {
                        Response.Write("Nieprawidłowa nazwa użytkownika lub hasło!");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }

            }
            else if (RadioButton2.Checked)
            {
                var command = ("SELECT KONTA_KLIENTOW.ID_KLIENT, NAZWA_KLIENT, HASLO_KLIENT, KLIENCI.IMIE_KLIENT, KLIENCI.NAZWISKO_KLIENT FROM KONTA_KLIENTOW " +
                    "JOIN KLIENCI ON KONTA_KLIENTOW.ID_KLIENT = KLIENCI.ID_KLIENT " +
                    "WHERE NAZWA_KLIENT = @Username AND HASLO_KLIENT = @Password");
                try
                {
                    SqlDataAdapter adapter = new SqlDataAdapter(command, connection);
                    adapter.SelectCommand.Parameters.AddWithValue("@Username", userText.Text);
                    adapter.SelectCommand.Parameters.AddWithValue("@Password", passText.Text);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    if (dt.Rows.Count == 1)
                    {
                        object idObj = dt.Rows[0][0];
                        object nameObj = dt.Rows[0][3];
                        object surnameObj = dt.Rows[0][4];
                        userID = Convert.ToInt32(idObj);
                        name = nameObj.ToString();
                        surname = surnameObj.ToString();
                        connection.Close();
                        Response.Redirect("ClientView.aspx");
                    }
                    else
                    {
                        Response.Write("Nieprawidłowa nazwa użytkownika lub hasło!");
                    }
                }
                catch(Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");
        }
    }
}