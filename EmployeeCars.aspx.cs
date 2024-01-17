using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace CarRentalWeb
{
    public partial class EmployeeCars : System.Web.UI.Page
    {
        int carId;
        int rentalId;
        int? displacement = null;
        int? power = null;
        int? seats = null;
        int fuelId;
        int modelId;
        SqlCommand command = new SqlCommand();
        dbConnect connection = new dbConnect();
        SAMOCHODY model = new SAMOCHODY();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Login.name + " " + Login.surname;
            Label2.Text = Login.userRoleLogged;
            Label3.Text = Login.userID.ToString();
            Label19.Text = Login.empRental;
            MileageText.Attributes.Add("onkeypress", "return isNumberKey(event)");
            DispText.Attributes.Add("onkeypress", "return isNumberKey(event)");
            PowerText.Attributes.Add("onkeypress", "return isNumberKey(event)");
            SeatsText.Attributes.Add("onkeypress", "return isNumberKey(event)");
            DayText.Attributes.Add("onkeypress", "return isNumberKey(event)");
            WeekText.Attributes.Add("onkeypress", "return isNumberKey(event)");
            MonthText.Attributes.Add("onkeypress", "return isNumberKey(event)");
            DepositText.Attributes.Add("onkeypress", "return isNumberKey(event)");
        }

        protected void clientsButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeClients.aspx");
        }

        protected void historyButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeHistory.aspx");
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            carId = Convert.ToInt32(row.Cells[1].Text);
            DropDownList2.SelectedValue = row.Cells[21].Text;
            DropDownList3.SelectedValue = row.Cells[22].Text;
            ColorText.Text = row.Cells[10].Text;
            MileageText.Text = row.Cells[11].Text;
            VinText.Text = row.Cells[12].Text;
            DispText.Text = row.Cells[13].Text;
            PowerText.Text = row.Cells[14].Text;
            GearText.Text = row.Cells[15].Text;
            SeatsText.Text = row.Cells[16].Text;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if(Label2.Text == "Mechanik")
            {
                try
                {
                    if (!string.IsNullOrEmpty(DispText.Text))
                    {
                        displacement = int.Parse(DispText.Text);
                    }
                    if (!string.IsNullOrEmpty(PowerText.Text))
                    {
                        power = int.Parse(PowerText.Text);
                    }
                    if (!string.IsNullOrEmpty(SeatsText.Text))
                    {
                        seats = int.Parse(SeatsText.Text);
                    }
                    string color = string.IsNullOrEmpty(ColorText.Text) ? null : ColorText.Text;
                    if (int.TryParse(DropDownList2.SelectedValue, out fuelId))
                    {
                        if (int.TryParse(DropDownList3.SelectedValue, out modelId))
                        {
                            rentalId = Convert.ToInt32(Label19.Text);
                            int mileage = Convert.ToInt32(MileageText.Text);
                            decimal day = Convert.ToDecimal(DayText.Text, CultureInfo.CreateSpecificCulture("en-US"));
                            decimal week = Convert.ToDecimal(WeekText.Text, CultureInfo.CreateSpecificCulture("en-US"));
                            decimal month = Convert.ToDecimal(MonthText.Text, CultureInfo.CreateSpecificCulture("en-US"));
                            decimal deposit = Convert.ToDecimal(DepositText.Text, CultureInfo.CreateSpecificCulture("en-US"));
                            model.ID_PALIWO = fuelId;
                            model.ID_MODEL = modelId;
                            model.ID_WYPOZYCZALNIA = rentalId;
                            model.ZDJECIE = null;
                            model.KOLOR = color;
                            model.PRZEBIEG = mileage;
                            model.VIN = VinText.Text;
                            model.POJEMNOSC = displacement;
                            model.MOC = power;
                            model.SKRZYNIA = GearText.Text;
                            model.MIEJSCA = seats;
                            model.CENA_DZIEN = day;
                            model.CENA_TYDZIEN = week;
                            model.CENA_MIESIAC = month;
                            model.KAUCJA = deposit;

                            using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                            {
                                db.SAMOCHODY.Add(model);
                                db.SaveChanges();
                            }
                            Label18.Text = "Dodano samochód pomyślnie!";
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
                Label18.Text = "Brak uprawnień!";
            } 
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if(Label2.Text == "Mechanik")
            {
                try
                {
                    GridViewRow row = GridView1.SelectedRow;
                    carId = Convert.ToInt32(row.Cells[1].Text);
                    if (!string.IsNullOrEmpty(DispText.Text))
                    {
                        displacement = int.Parse(DispText.Text);
                    }
                    if (!string.IsNullOrEmpty(PowerText.Text))
                    {
                        power = int.Parse(PowerText.Text);
                    }
                    if (!string.IsNullOrEmpty(SeatsText.Text))
                    {
                        seats = int.Parse(SeatsText.Text);
                    }
                    string color = string.IsNullOrEmpty(ColorText.Text) ? null : ColorText.Text;
                    if (int.TryParse(DropDownList2.SelectedValue, out fuelId))
                    {
                        if (int.TryParse(DropDownList3.SelectedValue, out modelId))
                        {
                            rentalId = Convert.ToInt32(Label19.Text);
                            int mileage = Convert.ToInt32(MileageText.Text);
                            decimal day = Convert.ToDecimal(DayText.Text, CultureInfo.CreateSpecificCulture("en-US"));
                            decimal week = Convert.ToDecimal(WeekText.Text, CultureInfo.CreateSpecificCulture("en-US"));
                            decimal month = Convert.ToDecimal(MonthText.Text, CultureInfo.CreateSpecificCulture("en-US"));
                            decimal deposit = Convert.ToDecimal(DepositText.Text, CultureInfo.CreateSpecificCulture("en-US"));
                            model.ID_SAMOCHOD = carId;
                            model.ID_PALIWO = fuelId;
                            model.ID_MODEL = modelId;
                            model.ID_WYPOZYCZALNIA = rentalId;
                            model.ZDJECIE = null;
                            model.KOLOR = color;
                            model.PRZEBIEG = mileage;
                            model.VIN = VinText.Text;
                            model.POJEMNOSC = displacement;
                            model.MOC = power;
                            model.SKRZYNIA = GearText.Text;
                            model.MIEJSCA = seats;
                            model.CENA_DZIEN = day;
                            model.CENA_TYDZIEN = week;
                            model.CENA_MIESIAC = month;
                            model.KAUCJA = deposit;

                            using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                            {
                                db.Entry(model).State = System.Data.Entity.EntityState.Modified;
                                db.SaveChanges();
                            }
                            Label18.Text = "Zmodyfikowano samochód pomyślnie!";
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
                Label18.Text = "Brak uprawnień!";
            } 
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if(Label2.Text == "Mechanik")
            {
                try
                {
                    GridViewRow row = GridView1.SelectedRow;
                    carId = Convert.ToInt32(row.Cells[1].Text);

                    SAMOCHODY carToDelete;

                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                    {
                        carToDelete = db.SAMOCHODY.Where(x => x.ID_SAMOCHOD == carId).First();
                        db.SAMOCHODY.Remove(carToDelete);
                        db.SaveChanges();
                    }

                    command = new SqlCommand("DBCC CHECKIDENT (SAMOCHODY, RESEED, 0)", connection.connect());
                    connection.open();
                    command.ExecuteNonQuery();
                    command.CommandText = "DBCC CHECKIDENT (SAMOCHODY, RESEED)";
                    command.ExecuteNonQuery();
                    connection.close();

                    Label18.Text = "Usunięto samochód pomyślnie!";
                }
                catch (Exception ex)
                {
                    Response.Redirect(ex.ToString());
                }
            }
            else
            {
                Label18.Text = "Brak uprawnień!";
            }
        }
    }
}