using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CarRentalWeb
{
    public partial class EmployeeView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Login.name + " " + Login.surname;
            Label2.Text = Login.userRoleLogged;
            Label3.Text = Login.userID.ToString();
        }

        protected void logoutButton_Click(object sender, EventArgs e)
        {
            Login.name = null;
            Login.surname = null;
            Login.userRoleLogged = null;
            Login.empRental = null;
            Response.Redirect("Login.aspx");
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
    }
}