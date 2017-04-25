<%@ Page Language="C#" Theme="SkinFile" MasterPageFile="~/charityMaster.master" AutoEventWireup="true" CodeFile="PersonDetails.aspx.cs" Inherits="PersonDetails" %>


<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script language="c#" runat="server">
  void Page_Load(Object sender, EventArgs e)
  {
      dsAccess.SelectCommand = "SELECT * FROM Customers WHERE CustID  = " + Convert.ToInt32(Request.QueryString["CustID"]);
    lvMem.DataSource = dsAccess;
    lvMem.DataBind();
  }
</script>
    <asp:AccessDataSource runat="server" ID="dsAccess" DataFile="~/Customers.mdb" SelectCommand="SELECT * FROM [Customers]" />
      <div class="mainContainer">           

       <asp:listView runat="server" id="lvMem"> 
      <ItemTemplate> 
          <h2 style="text-align:center"> Selected member details(URL) </h2>
          <table class="messageForm">            
            <tr>
                <td class="column1">
                    <asp:Label ID="Label1" runat="server" Text="Name:" /></td>
                <td class="column2">
                    <%# Eval("GivenName") %></td>                                
                <td class="column1">
                    <asp:Label ID="Label14" runat="server" Text="Gender:" /></td>
                <td class="column2">
                   <%# Eval("Gender") %></td>                
            </tr>
            <tr>
                <td class="column1">
                    <asp:Label ID="Label3" runat="server" Text="Email:" /></td>
                <td class="column2">
                   <%# Eval("Email") %></td>
                <td class="column1">
                    <asp:Label ID="Label6" runat="server" Text="Education:" /></td>
                <td class="column2">
                   <%# Eval("Education") %></td>
                
            </tr>
            <tr>
                <td class="column1">
                    <asp:Label ID="Label7" runat="server" Text="Address:" /></td>
                <td class="column2">
                   <%# Eval("Address") %> <br /> Postcode: <%# Eval("Postcode") %></td> 
                <td class="column1">
                    <asp:Label ID="Label8" runat="server" Text="State:" /></td>
                <td class="column2">
                   <%# Eval("State") %></td>
            </tr>
        </table>
      </ItemTemplate> 
    </asp:listView>
     <input type="button" class="btnSubmit" id="Button2" onclick="Javascript: window.history.go(-1);" value="Go Back" />

          </div>
</asp:Content>