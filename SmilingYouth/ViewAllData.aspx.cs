using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewAllData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void displayData(object sender, GridViewCommandEventArgs e)
    {
        pnl2.Visible = true;
        message1.Text = gvCustomers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[2].Text;
        message3.Text = gvCustomers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[3].Text;
        message4.Text = gvCustomers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[4].Text;
        message5.Text = gvCustomers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[5].Text;
        message6.Text = gvCustomers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[6].Text;
        message7.Text = gvCustomers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[7].Text
 + "<br>" + "postCode:" + gvCustomers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[8].Text;
        message8.Text = gvCustomers.Rows[Convert.ToInt32(e.CommandArgument)].Cells[9].Text;
    }

    protected void SearchClick(object sender, EventArgs e)
    {

    }
}