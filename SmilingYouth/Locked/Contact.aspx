<%@ Import Namespace="System.Net.Mail" %>
<%@ Import Namespace="System.Net" %>
<%@ Page Title="Contact" Theme="SkinFile" Language="C#" MasterPageFile="~/charityMaster.master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" 
        runat="server">
    <script language="c#" runat="server">
        string strPath = "";

        public void SendEmail(object sender, EventArgs e)
        {
            MailMessage newMsg = new MailMessage();

            foreach (GridViewRow gvRow in gvCustomers.Rows)
            {
                CheckBox cb = (CheckBox)gvRow.FindControl("chkEmail");
                if (cb != null && cb.Checked)
                {
                    newMsg.To.Add(new MailAddress(gvRow.Cells[2].Text,
                      gvRow.Cells[1].Text));
                }
            }

            newMsg.From =
              new MailAddress("ksin57@student.monash.edu", "Kalyani Singh");
            newMsg.Subject = txtSubject.Text;
            newMsg.Body = txtMsg.Text;

            if (fileUpload.HasFile)
            {
                UpLoadFile(fileUpload.FileName);
                Attachment newAttach = new Attachment(strPath);
                newMsg.Attachments.Add(newAttach);
            }

            try
            {
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.monash.edu.au";
                smtp.Send(newMsg);
                lblMail.Text = "Mail Successfully Sent";
            }
            catch (Exception exc)
            {
                lblMail.Text = exc.Message;
            }
        }

        void UpLoadFile(string strFileName)
        {
            strPath = Server.MapPath(".") + @"\UploadFiles\" + strFileName;
            fileUpload.PostedFile.SaveAs(strPath);
        }

        protected void gvCustomers_Sorting(object sender, GridViewSortEventArgs e)
        {

        }
</script>

    <div class="mainContainer">
        <h2> Send email to the members</h2>
        <article class="ScrollStyleY">
        <asp:AccessDataSource ID="dsCustomers" runat="server"
            DataFile="~/Customers.mdb"
            SelectCommand="SELECT CustID, GivenName, Email FROM Customers"></asp:AccessDataSource>
        
<div class="emailGrid">
        <asp:GridView ID="gvCustomers" runat="server" BorderStyle="Ridge" BorderColor="whitesmoke" BorderWidth="5 pt"
            DataSourceID="dsCustomers" DataKeyNames="CustID"
            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowSorting="True">
<AlternatingRowStyle BackColor="#DEEAFE"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="CustID" Visible="false" />
                <asp:BoundField DataField="GivenName"
                    HeaderText="Name" SortExpression="GivenName" />                
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:TemplateField HeaderText="Check">
                    <ItemTemplate>
                        <asp:CheckBox runat="server" ID="chkEmail" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<HeaderStyle BackColor="#636363" Font-Bold="True" ForeColor="white"></HeaderStyle>

<RowStyle BackColor="#d9d9d9" ForeColor="#333333"></RowStyle>
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#78bbe6" />
            <SortedAscendingHeaderStyle BackColor="#DEEAFE" />
        </asp:GridView>
        <br />
       </div>
        

        <table>
            <tr>
                <td class="emailHeader" width="20%">From</td>
                <td class="emailRow">Kalyani Singh</td>
            </tr>
            <tr>
                <td class="emailHeader" width="30%">Subject</td>
                <td class="emailRow">
                    <asp:TextBox ID="txtSubject" Width="350" runat="server" />
                </td>
            </tr>
            <tr>
                <td class="emailHeader" width="30%">Attachment</td>
                <td class="emailRow">
                    <asp:FileUpload ID="fileUpload" runat="server" Width="430" />
                </td>
            </tr>
            <tr>
                <td class="emailHeader">Message</td>
                <td class="emailRow">
                    <asp:TextBox runat="server" ID="txtMsg"
                        TextMode="MultiLine" Columns="55" Rows="10"
                        Font-Names="Arial" />
                </td>
            </tr>
            <tr>
                <td>                     

                </td>
                <td>
                    <asp:Button ID="SendMail" CssClass="btnSubmit" runat="server" OnClick="SendEmail"
            Text="Send Email" />
                </td>
            </tr>
        </table>
        <br />
       
        <asp:Label ID="lblMail" runat="server" BackColor="#d9d9d9" />
        <br />
        <br />
            </article>
        </div>
    </asp:Content>

