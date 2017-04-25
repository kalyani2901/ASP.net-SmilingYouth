<%@ Page Language="C#" Theme="SkinFile" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="_Default" MasterPageFile="~/charityMaster.master" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1"
    runat="server">
    <!DOCTYPE html>
    <script language="c#" runat="server">
        void Page_Load(Object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                searchedOutput.Visible = true;           
                searchResult.EmptyDataText = "No matching records of the member found";
            }
        }
    </script>
    <div class="mainContainer">
     <h2 style="text-align:center"> Search member </h2>
    <table class="messageForm">   
        <tr>    
            <td style="width:70%">
                <asp:Label ID="searchLbl" runat="server" Text="Search by Customer Name/Address/Gender:" />
            </td>
            <td>
                <asp:TextBox ID="SearchString" runat="server"></asp:TextBox>
            </td>
            </tr>
        <tr>
            <td style="text-align:right">
                <asp:Button ID="search" CssClass="btnSubmit" runat="server" Text="Search" />
            </td>
            <td>
        <input type="button" class="btnSubmit" id="returnButton" onclick="Javascript: window.history.go(-1);" value="Go Back" />
            </td>
        </tr>
    </table>
    <br />
       <asp:Panel ID="searchedOutput" Visible="false" runat="server">
        <div class="memberGridView">
             <h2 style="text-align:center"> Searched result</h2>
             <asp:AccessDataSource ID="SqlDataSource1" runat="server" DataFile="Customers.mdb"
       SelectCommand = "SELECT * FROM [Customers] WHERE (([GivenName] LIKE '%' + ? + '%') OR ([Gender] LIKE '%' + ? + '%') OR ([Address] LIKE '%' + ? + '%'))">
            <SelectParameters>
                <asp:ControlParameter ControlID="SearchString" Name="GivenName" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="SearchString" Name="Address" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="SearchString" Name="Address" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:AccessDataSource>
        <asp:GridView ID="searchResult" runat="server" AutoGenerateColumns="False"
             DataKeyNames="CustID" DataSourceID="SqlDataSource1" ForeColor="#333333" BorderStyle="Solid" BorderColor="white" AllowSorting="True">
            <AlternatingRowStyle BackColor="#DEEAFE"></AlternatingRowStyle>
            <Columns>
                <asp:BoundField DataField="CustID" HeaderText="CustID" InsertVisible="False" ReadOnly="True" SortExpression="CustID" />
                <asp:BoundField DataField="GivenName" HeaderText="GivenName" SortExpression="GivenName" />
                <asp:BoundField DataField="Email" HeaderText="Email"/>
                <asp:BoundField DataField="DateOfBirth" HeaderText="DOB" DataFormatString="{0:MM/dd/yyyy}"/>                  
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField DataField="Education" HeaderText="Education"/>
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="Postcode" HeaderText="Postcode"  />
                <asp:BoundField DataField="State" HeaderText="State"/>
            </Columns>
        <HeaderStyle BackColor="#636363" Font-Bold="True" ForeColor="white"></HeaderStyle>
           <RowStyle BackColor="#d9d9d9" ForeColor="#333333"></RowStyle>
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#78bbe6" />
            <SortedAscendingHeaderStyle BackColor="#DEEAFE" />
        </asp:GridView>
                  </div>   
           </asp:Panel>   
        <br />
    </div>
</asp:Content>
