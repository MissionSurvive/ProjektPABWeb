using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;

namespace CarRentalWeb
{
    public partial class Register : System.Web.UI.Page
    {
        KLIENCI model = new KLIENCI();
        KONTA_KLIENTOW model2 = new KONTA_KLIENTOW();

        protected void Page_Load(object sender, EventArgs e)
        {
            peselText.Attributes.Add("onkeypress", "return isNumberKey(event)");
            nipText.Attributes.Add("onkeypress", "return isNumberKey(event)");
        }

        protected void registerButton_Click(object sender, EventArgs e)
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
                int? nip = null;
                if (!string.IsNullOrEmpty(nipText.Text))
                {
                    nip = int.Parse(nipText.Text);
                }
                string pesel = string.IsNullOrEmpty(peselText.Text) ? null : peselText.Text;
                string fax = string.IsNullOrEmpty(faxText.Text) ? null : faxText.Text;

                model.IMIE_KLIENT = nameText.Text;
                model.NAZWISKO_KLIENT = surnameText.Text;
                model.PESEL_KLIENT = pesel;
                model.TELEFON_KLIENT = phoneText.Text;
                model.FAX = fax;
                model.NIP = nip;

                using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                {
                    db.KLIENCI.Add(model);
                    db.SaveChanges();
                }

                model2.ID_KLIENT = nextId;
                model2.ID_ROLA = 5;
                model2.NAZWA_KLIENT = userText.Text;
                model2.HASLO_KLIENT = passText.Text;

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

                Response.Write("Zarejestrowano użytkownika pomyślnie!");
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }
    }
}