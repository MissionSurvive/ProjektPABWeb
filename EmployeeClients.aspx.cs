using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace CarRentalWeb
{
    public partial class EmployeeClients : System.Web.UI.Page
    {
        KLIENCI model = new KLIENCI();
        KONTA_KLIENTOW model2 = new KONTA_KLIENTOW();
        SqlCommand command = new SqlCommand();
        dbConnect connection = new dbConnect();
        int clientId;
        string name = "";
        string surname = "";
        string pesel = "";
        string phone = "";
        string fax = "";
        int? nip = null;
        int nnip;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Login.name + " " + Login.surname;
            Label2.Text = Login.userRoleLogged;
            Label3.Text = Login.userID.ToString();
            PeselText.Attributes.Add("onkeypress", "return isNumberKey(event)");
            NipText.Attributes.Add("onkeypress", "return isNumberKey(event)");
        }

        protected void historyButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeHistory.aspx");
        }

        protected void clientsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeClients.aspx");
        }

        protected void carsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeCars.aspx");
        }

        protected void ordersButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeOrders.aspx");
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Login.name = null;
            Login.surname = null;
            Login.userRoleLogged = null;
            Login.empRental = null;
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource2;
            GridView1.DataSourceID = "SqlDataSource2";
            GridView1.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            GridView1.DataSource = null;
            GridView1.DataSourceID = null;
            GridView1.DataSource = SqlDataSource1;
            GridView1.DataSourceID = "SqlDataSource2";
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            clientId = Convert.ToInt32(row.Cells[1].Text);
            name = row.Cells[2].Text;
            surname = row.Cells[3].Text;
            pesel = row.Cells[4].Text;
            phone = row.Cells[5].Text;
            fax = row.Cells[6].Text;
            if (int.TryParse(row.Cells[7].Text, out nnip))
            {
                NipText.Text = nnip.ToString();
            }
            else
            {
                NipText.Text = "";
            }
            if (pesel == "")
            {
                PeselText.Text = "";
            }
            else
            {
                PeselText.Text = pesel;
            }
            if (fax == "")
            {
                FaxText.Text = "";
            }
            else
            {
                FaxText.Text = fax;
            }
            NameText.Text = name;
            SurnameText.Text = surname;
            //PeselText.Text = pesel;
            PhoneText.Text = phone;
            //FaxText.Text = fax;
            //NipText.Text = nip.ToString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if(Label2.Text == "Wydający" || Label2.Text == "Prezes" || Label2.Text == "Administrator")
            {
                try
                {
                    SqlConnection connection = new SqlConnection(@"Data Source = X280\SQLEXPRESS; Initial Catalog = CarRentalCWBack; Integrated Security = True");
                    var command = ("SELECT MAX(ID_KLIENT) FROM KLIENCI");
                    SqlDataAdapter adapter = new SqlDataAdapter(command, connection);
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    object idObj = dt.Rows[0][0];
                    int idInt = Convert.ToInt32(idObj);
                    connection.Close();
                    int nextId = idInt + 1;
                    /*GridViewRow row = GridView1.SelectedRow;
                    clientId = Convert.ToInt32(row.Cells[1].Text);
                    name = row.Cells[2].Text;
                    surname = row.Cells[3].Text;
                    pesel = row.Cells[4].Text;
                    phone = row.Cells[5].Text;
                    fax = row.Cells[6].Text;
                    nip = Convert.ToInt32(row.Cells[7].Text);*/

                    if (!string.IsNullOrEmpty(NipText.Text))
                    {
                        nip = int.Parse(NipText.Text);
                    }
                    pesel = string.IsNullOrEmpty(PeselText.Text) ? null : PeselText.Text;
                    fax = string.IsNullOrEmpty(FaxText.Text) ? null : FaxText.Text;

                    model.IMIE_KLIENT = NameText.Text;
                    model.NAZWISKO_KLIENT = SurnameText.Text;
                    model.PESEL_KLIENT = pesel;
                    model.TELEFON_KLIENT = PhoneText.Text;
                    model.FAX = fax;
                    model.NIP = nip;

                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                    {
                        db.KLIENCI.Add(model);
                        db.SaveChanges();
                    }

                    model2.ID_KLIENT = nextId;
                    model2.ID_ROLA = 5;
                    model2.NAZWA_KLIENT = UserText.Text;
                    model2.HASLO_KLIENT = PassText.Text;

                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                    {
                        db.KONTA_KLIENTOW.Add(model2);
                        db.SaveChanges();
                    }

                    model.iD_KON_KLIENT = nextId;

                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                    {
                        db.Entry(model).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }

                    Label13.Text = "Zarejestrowano użytkownika pomyślnie!";
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
            else
            {
                Label13.Text = "Brak uprawnień!";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (Label2.Text == "Wydający" || Label2.Text == "Prezes" || Label2.Text == "Administrator")
            {
                try
                {
                    GridViewRow row = GridView1.SelectedRow;
                    clientId = Convert.ToInt32(row.Cells[1].Text);

                    if (!string.IsNullOrEmpty(NipText.Text))
                    {
                        nip = int.Parse(NipText.Text);
                    }
                    pesel = string.IsNullOrEmpty(PeselText.Text) ? null : PeselText.Text;
                    fax = fax = string.IsNullOrEmpty(FaxText.Text) ? null : FaxText.Text;
                    model.ID_KLIENT = clientId;
                    model.iD_KON_KLIENT = clientId;
                    model.IMIE_KLIENT = NameText.Text;
                    model.NAZWISKO_KLIENT = SurnameText.Text;
                    model.PESEL_KLIENT = pesel;
                    model.TELEFON_KLIENT = PhoneText.Text;
                    model.FAX = fax;
                    model.NIP = nip;

                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                    {
                        db.Entry(model).State = System.Data.Entity.EntityState.Modified;
                        db.SaveChanges();
                    }

                    var account = new KONTA_KLIENTOW { iD_KON_KLIENT = clientId, NAZWA_KLIENT = UserText.Text, HASLO_KLIENT = PassText.Text };

                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                    {
                        db.KONTA_KLIENTOW.Attach(account);

                        db.Entry(account).Property(x => x.NAZWA_KLIENT).IsModified = true;
                        db.Entry(account).Property(y => y.HASLO_KLIENT).IsModified = true;
                        db.SaveChanges();
                    }

                    Label13.Text = "Zmodyfikowano klienta pomyślnie!";
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
            else
            {
                Label13.Text = "Brak uprawnień!";
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (Label2.Text == "Wydający" || Label2.Text == "Prezes" || Label2.Text == "Administrator")
            {
                try
                {
                    GridViewRow row = GridView1.SelectedRow;
                    clientId = Convert.ToInt32(row.Cells[1].Text);

                    KLIENCI clientToDelete;
                    KONTA_KLIENTOW accountToDelete;

                    command = new SqlCommand("UPDATE KLIENCI SET ID_KON_KLIENT = NULL WHERE ID_KLIENT LIKE'" + clientId + "'", connection.connect());
                    connection.open();
                    command.ExecuteNonQuery();
                    connection.close();

                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                    {
                        accountToDelete = db.KONTA_KLIENTOW.Where(x => x.ID_KLIENT == clientId).First();
                        clientToDelete = db.KLIENCI.Where(x => x.ID_KLIENT == clientId).First();
                        db.KONTA_KLIENTOW.Remove(accountToDelete);
                        db.KLIENCI.Remove(clientToDelete);
                        db.SaveChanges();
                    }

                    command = new SqlCommand("DBCC CHECKIDENT (KONTA_KLIENTOW, RESEED, 0)", connection.connect());
                    connection.open();
                    command.ExecuteNonQuery();
                    command.CommandText = "DBCC CHECKIDENT (KLIENCI, RESEED, 0)";
                    command.ExecuteNonQuery();
                    command.CommandText = "DBCC CHECKIDENT (KONTA_KLIENTOW, RESEED)";
                    command.ExecuteNonQuery();
                    command.CommandText = "DBCC CHECKIDENT (KLIENCI, RESEED)";
                    command.ExecuteNonQuery();
                    connection.close();

                    Label13.Text = "Usunięto klienta pomyślnie!";
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            }
            else
            {
                Label13.Text = "Brak uprawnień!";
            }
        }
    }
}