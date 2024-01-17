using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalWeb
{
    public partial class EmployeeRent : System.Web.UI.Page
    {
        ZAMOWIENIA model = new ZAMOWIENIA();
        HISTORIA_ZDARZEN model2 = new HISTORIA_ZDARZEN();
        int packetId;
        int carId;
        decimal packetPrice = -1;
        decimal sum = 0;
        int length;
        int clientId;
        int idInt;
        int nextId;
        int diff;
        int rentalId;
        int empId;
        decimal weekPrice;
        decimal monthPrice;
        DateTime startDate;
        DateTime endDate;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Login.name + " " + Login.surname;
            Label2.Text = Login.userRoleLogged;
            Label3.Text = Login.userID.ToString();
            Label4.Text = Login.empRental;
        }

        protected void carsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeCars.aspx");
        }

        protected void clientsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeClients.aspx");
        }

        protected void ordersButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeOrders.aspx");
        }

        protected void historyButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeHistory.aspx");
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Login.name = null;
            Login.surname = null;
            Login.userRoleLogged = null;
            Login.empRental = null;
            Response.Redirect("Login.aspx");
        }

        private void sumDays()
        {

            bool result = Int32.TryParse(LengthText.Text, out length);
            if (result)
            {
                GridViewRow row = GridView2.SelectedRow;
                decimal dayPrice = Convert.ToDecimal(row.Cells[14].Text);
                decimal depositPrice = Convert.ToDecimal(row.Cells[17].Text);
                sum = (dayPrice * length) + packetPrice + depositPrice;
                SumText.Text = sum.ToString();
            }
        }

        private void sumWeeks()
        {
            GridViewRow row = GridView2.SelectedRow;
            decimal weekPrice = Convert.ToDecimal(row.Cells[15].Text);
            if (weekPrice == 0)
            {
                Label5.Text = "Nie można wypożyczyć tego pojazdu na tygodnie!";
                DayRadio.Checked = true;
            }
            else
            {
                decimal depositPrice = Convert.ToDecimal(row.Cells[17].Text);
                sum = (weekPrice * length) + packetPrice + depositPrice;
                SumText.Text = sum.ToString();
            }
        }

        private void sumMonths()
        {
            GridViewRow row = GridView2.SelectedRow;
            decimal monthPrice = Convert.ToDecimal(row.Cells[16].Text);
            if (monthPrice == 0)
            {
                Label5.Text = "Nie można wypożyczyć tego pojazdu na miesiące!";
                DayRadio.Checked = true;
            }
            else
            {
                decimal depositPrice = Convert.ToDecimal(row.Cells[17].Text);
                sum = (monthPrice * length) + packetPrice + depositPrice;
                SumText.Text = sum.ToString();
            }
        }

        protected void DayRadio_CheckedChanged(object sender, EventArgs e)
        {
            sumDays();
        }

        protected void WeekRadio_CheckedChanged(object sender, EventArgs e)
        {
            sumWeeks();
        }

        protected void MonthRadio_CheckedChanged(object sender, EventArgs e)
        {
            sumMonths();
        }

        protected void LengthText_TextChanged(object sender, EventArgs e)
        {
            if (int.TryParse(LengthText.Text, out length))
            {
                if (DayRadio.Checked)
                {
                    sumDays();
                }
                else if (WeekRadio.Checked)
                {
                    sumWeeks();
                }
                else if (MonthRadio.Checked)
                {
                    sumMonths();
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            clientId = Convert.ToInt32(row.Cells[1].Text);
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView2.SelectedRow;
            carId = Convert.ToInt32(row.Cells[1].Text);
            weekPrice = Convert.ToDecimal(row.Cells[15].Text);
            monthPrice = Convert.ToDecimal(row.Cells[16].Text);
            if (weekPrice == 0)
            {
                WeekRadio.Visible = false;
            }
            if (monthPrice == 0)
            {
                MonthRadio.Visible = false;
            }
            if (DayRadio.Checked)
            {
                sumDays();
            }
            else if (WeekRadio.Checked)
            {
                sumWeeks();
            }
            else if (MonthRadio.Checked)
            {
                sumMonths();
            }
        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView3.SelectedRow;
            packetId = Convert.ToInt32(row.Cells[1].Text);
            packetPrice = Convert.ToDecimal(row.Cells[4].Text);
            if (DayRadio.Checked)
            {
                sumDays();
            }
            else if (WeekRadio.Checked)
            {
                sumWeeks();
            }
            else if (MonthRadio.Checked)
            {
                sumMonths();
            }
        }

        protected void OrderButton_Click(object sender, EventArgs e)
        {
            string role = Label2.Text;
            if(role == "Wydający" || role == "Prezes" || role == "Administrator")
            {
                try
                {
                    GridViewRow row = GridView1.SelectedRow;
                    GridViewRow row2 = GridView2.SelectedRow;
                    GridViewRow row3 = GridView3.SelectedRow;
                    carId = Convert.ToInt32(row2.Cells[1].Text);
                    packetId = Convert.ToInt32(row3.Cells[1].Text);
                    packetPrice = Convert.ToDecimal(row3.Cells[4].Text);
                    clientId = Convert.ToInt32(row.Cells[1].Text);
                    if (packetPrice == -1)
                    {
                        Label5.Text = "Nie wybrano pakietu!";
                    }
                    else
                    {
                        Console.WriteLine(clientId.ToString());
                        SqlConnection connection = new SqlConnection(@"Data Source = X280\SQLEXPRESS; Initial Catalog = CarRentalCWBack; Integrated Security = True");
                        var command = ("SELECT MAX(ID_ZAMOWIENIE) FROM ZAMOWIENIA");
                        SqlDataAdapter adapter = new SqlDataAdapter(command, connection);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);
                        object idObj = dt.Rows[0][0];
                        idInt = Convert.ToInt32(idObj);
                        connection.Close();

                        if (DateTime.TryParseExact(DateText.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out startDate))
                        {
                            endDate = startDate.Date;
                            length = Convert.ToInt32(LengthText.Text);
                            if (DayRadio.Checked)
                            {
                                endDate = startDate.AddDays(length);
                            }
                            else if (WeekRadio.Checked)
                            {
                                endDate = startDate.AddDays(length * 7);
                            }
                            else if (MonthRadio.Checked)
                            {
                                endDate = startDate.AddMonths(length);
                            }
                            string startString = startDate.ToString("yyyy-MM-dd HH:mm:ss");
                            string endString = endDate.ToString("yyyy-MM-dd HH:mm:ss");

                            SqlConnection connection2 = new SqlConnection(@"Data Source = X280\SQLEXPRESS; Initial Catalog = CarRentalCWBack; Integrated Security = True");
                            var command2 = ("SELECT * FROM ZAMOWIENIA WHERE ID_SAMOCHOD = " + carId + " AND DATA_START BETWEEN '" + startString + "' AND '" + endString + "' OR ID_SAMOCHOD = " + carId + " AND DATA_KONIEC BETWEEN '" + startString + "' AND '" + endString + "'");
                            SqlDataAdapter adapter2 = new SqlDataAdapter(command2, connection2);
                            DataTable dt2 = new DataTable();
                            adapter2.Fill(dt2);
                            int xd = dt2.Rows.Count;
                            if (dt2.Rows.Count >= 1)
                            {
                                Label8.Text = "Samochód jest niedostępny w danym terminie!";
                            }
                            else
                            {
                                diff = (endDate - startDate).Days;
                                rentalId = Convert.ToInt32(Label4.Text);
                                empId = Convert.ToInt32(Label3.Text);
                                sum = Convert.ToDecimal(SumText.Text);
                                model.ID_PAKIET = packetId;
                                model.ID_WYPOZYCZALNIA = rentalId;
                                model.ID_PRAC = empId;
                                model.ID_KLIENT = clientId;
                                model.ID_SAMOCHOD = carId;
                                model.SAMOCHOD_WYDANY = false;
                                model.ZREALIZOWANE = false;
                                model.LICZBA_DNI = diff;
                                model.CENA_ZAMOWIENIE = sum;
                                model.DATA_START = startDate;
                                model.DATA_KONIEC = endDate;

                                using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                                {
                                    db.ZAMOWIENIA.Add(model);
                                    db.SaveChanges();
                                }

                                nextId = idInt + 1;
                                model2.ID_ZAMOWIENIE = nextId;
                                model2.ID_RODZAJ_ZDARZENIE = 1;
                                model2.OPLATA = sum;
                                model2.DATA_ZDARZENIE = DateTime.Now;

                                using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                                {
                                    db.HISTORIA_ZDARZEN.Add(model2);
                                    db.SaveChanges();
                                }
                                Label8.Text = "Złożono zamówienie pomyślnie!";
                            }
                        }
                        else
                        {
                            Label8.Text = "Błąd konwersji daty!";
                        }
                    }
                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }
            } 
            else
            {
                Label8.Text = "Brak uprawnien!";
            }     
        }
    }
}