using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalWeb
{
    public partial class EmployeeHistory : System.Web.UI.Page
    {
        HISTORIA_ZDARZEN model = new HISTORIA_ZDARZEN();
        ZAMOWIENIA model2 = new ZAMOWIENIA();
        int orderId = 0;
        int eventToChangeId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Login.name + " " + Login.surname;
            Label2.Text = Login.userRoleLogged;
            Label3.Text = Login.userID.ToString();
            PriceText.Attributes.Add("onkeypress", "return isNumberKey(event)");
        }

        protected void historyButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("EmployeeHistory.aspx");
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
            orderId = Convert.ToInt32(row.Cells[1].Text);
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            eventToChangeId = Convert.ToInt32(row.Cells[1].Text);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Label2.Text == "Wydający" || Label2.Text == "Prezes" || Label2.Text == "Administrator")
            {
                try
                {
                    GridViewRow row = GridView1.SelectedRow;
                    orderId = Convert.ToInt32(row.Cells[1].Text);

                    if (orderId == 0)
                    {
                        Label6.Text = "Nie wybrano zamówienia!";
                    }
                    else
                    {
                        int eventId;
                        DateTime startDate;
                        decimal price = Convert.ToDecimal(PriceText.Text, CultureInfo.CreateSpecificCulture("en-US"));
                        TimeSpan currentTime = DateTime.Now.TimeOfDay;
                        if (int.TryParse(DropDownList1.SelectedValue, out eventId))
                        {
                            if (DateTime.TryParseExact(DateText.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out startDate))
                            {
                                startDate = startDate.Add(currentTime);
                                if (eventId == 2)
                                {
                                    model.ID_ZAMOWIENIE = orderId;
                                    model.ID_RODZAJ_ZDARZENIE = eventId;
                                    model.OPLATA = price;
                                    model.DATA_ZDARZENIE = startDate;

                                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                                    {
                                        db.HISTORIA_ZDARZEN.Add(model);
                                        db.SaveChanges();
                                    }

                                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                                    {
                                        var status = new ZAMOWIENIA { ID_ZAMOWIENIE = orderId, SAMOCHOD_WYDANY = true };
                                        db.ZAMOWIENIA.Attach(status);
                                        db.Entry(status).Property(x => x.SAMOCHOD_WYDANY).IsModified = true;
                                        db.SaveChanges();
                                    }

                                    Label6.Text = "Dodano zdarzenie pomyślnie!";
                                }
                                else if (eventId == 3)
                                {
                                    model.ID_ZAMOWIENIE = orderId;
                                    model.ID_RODZAJ_ZDARZENIE = eventId;
                                    model.OPLATA = price;
                                    model.DATA_ZDARZENIE = startDate;

                                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                                    {
                                        db.HISTORIA_ZDARZEN.Add(model);
                                        db.SaveChanges();
                                    }

                                    var status = new ZAMOWIENIA { ID_ZAMOWIENIE = orderId, SAMOCHOD_WYDANY = false, ZREALIZOWANE = true };

                                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                                    {
                                        db.ZAMOWIENIA.Attach(status);
                                        db.Entry(status).Property(x => x.SAMOCHOD_WYDANY).IsModified = true;
                                        db.Entry(status).Property(y => y.ZREALIZOWANE).IsModified = true;
                                        db.SaveChanges();
                                    }

                                    Label6.Text = "Dodano zdarzenie pomyślnie!";
                                }
                                else
                                {
                                    model.ID_ZAMOWIENIE = orderId;
                                    model.ID_RODZAJ_ZDARZENIE = eventId;
                                    model.OPLATA = price;
                                    model.DATA_ZDARZENIE = startDate;

                                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                                    {
                                        db.HISTORIA_ZDARZEN.Add(model);
                                        db.SaveChanges();
                                    }
                                    Label6.Text = "Dodano zdarzenie pomyślnie!";
                                }
                            }
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
                Label6.Text = "Brak uprawnień!";
            }   
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (Label2.Text == "Wydający" || Label2.Text == "Prezes" || Label2.Text == "Administrator")
            {
                try
                {
                    GridViewRow row1 = GridView1.SelectedRow;
                    GridViewRow row2 = GridView2.SelectedRow;
                    orderId = Convert.ToInt32(row1.Cells[1].Text);
                    eventToChangeId = Convert.ToInt32(row2.Cells[1].Text);
                    if (eventToChangeId == 0)
                    {
                        Label6.Text = "Nie wybrano zdarzenia!";
                    }
                    else
                    {
                        int eventId;
                        DateTime startDate;
                        decimal price = Convert.ToDecimal(PriceText.Text, CultureInfo.CreateSpecificCulture("en-US"));
                        TimeSpan currentTime = DateTime.Now.TimeOfDay;

                        if (int.TryParse(DropDownList1.SelectedValue, out eventId))
                        {
                            if (eventId == 2 || eventId == 3)
                            {
                                Label6.Text = "Nie można edytować zdarzenia pod ten rodzaj zdarzenia!";
                            }
                            else
                            {
                                if (DateTime.TryParseExact(DateText.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out startDate))
                                {
                                    startDate = startDate.Add(currentTime);
                                    model.ID_HISTORIA = eventToChangeId;
                                    model.ID_ZAMOWIENIE = orderId;
                                    model.ID_RODZAJ_ZDARZENIE = eventId;
                                    model.OPLATA = price;
                                    model.DATA_ZDARZENIE = startDate;

                                    using (CarRentalCWBackEntities1 db = new CarRentalCWBackEntities1())
                                    {
                                        db.Entry(model).State = System.Data.Entity.EntityState.Modified;
                                        db.SaveChanges();
                                    }
                                    Label6.Text = "Zmodyfikowano zdarzenie pomyślnie!";
                                }
                            }
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
                Label6.Text = "Brak uprawnień!";
            }
        }
    }
}