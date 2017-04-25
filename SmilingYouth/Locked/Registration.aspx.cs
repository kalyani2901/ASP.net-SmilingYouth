using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    public void addRegistration(object sender, EventArgs e)
    {
        if (!(Page.IsValid))
        {
            return;
        }

        pnl2.Visible = true;
        panel1.Visible = false;
        message1.Text = txtFirstName.Text;
        foreach (ListItem item in chkSupport.Items)
        {
            if (item.Selected)
                message2.Text += item.Text + "<br>";
        }
        message3.Text = txtEmail.Text;
        message4.Text = RdoGender.SelectedValue;
        message5.Text = txtDob.Text;
        message6.Text = ListBox1.SelectedItem.Text;
        message7.Text = txtAddress.Text + "<br>" + "postCode:" + txtPostcode.Text;
        message8.Text = stateList.SelectedItem.Text;

        customersDS.InsertParameters[0].DefaultValue = txtFirstName.Text;
        customersDS.InsertParameters[1].DefaultValue = txtEmail.Text;
        customersDS.InsertParameters[2].DefaultValue = txtDob.Text;
        customersDS.InsertParameters[3].DefaultValue = RdoGender.SelectedValue; ;
        customersDS.InsertParameters[4].DefaultValue = ListBox1.SelectedItem.Text;
        customersDS.InsertParameters[5].DefaultValue = txtAddress.Text;
        customersDS.InsertParameters[6].DefaultValue = txtPostcode.Text;
        customersDS.InsertParameters[7].DefaultValue = stateList.SelectedItem.Text;
        customersDS.Insert();
    }

    protected void validateDOB_ServerValidate(object source,
           System.Web.UI.WebControls.ServerValidateEventArgs args)
    {
        args.IsValid = false;
        DateTime dob;
        TimeSpan sp;

        try
        {
            dob = DateTime.Parse(txtDob.Text);
            sp = DateTime.Now - dob;
        }
        catch (Exception ex)
        {
            validateDOB.ErrorMessage = "Invalid Date Format";
            return;
        }
        if (sp.Days < 12 * 365)
        {
            validateDOB.ErrorMessage = "You must be above 12 years ";
            return;
        }
        else
            args.IsValid = true;
    }
}
