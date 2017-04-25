<%@ Page Title="View Customers" Theme="SkinFile" Language="C#" MasterPageFile="~/charityMaster.master" AutoEventWireup="true" CodeFile="ViewAllData.aspx.cs" Inherits="ViewAllData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">   
       
       
         <div class="mainContainer">
                 <asp:AccessDataSource ID="dsCustomers" runat="server"
            DataFile="Customers.mdb"
            SelectCommand="SELECT * FROM Customers"></asp:AccessDataSource>
                 <h2 style="text-align:center">View all members</h2>
                <div class="memberGridView">               
                <asp:GridView ID="gvCustomers" runat="server" BorderStyle="Solid" BorderColor="white"
            DataSourceID="dsCustomers" DataKeyNames="CustID" OnRowCommand="displayData"
            AutoGenerateColumns="False" ForeColor="#333333" AllowSorting="True">
<AlternatingRowStyle BackColor="#DEEAFE"></AlternatingRowStyle>

            <Columns>
                <asp:ButtonField ButtonType="Button" CommandName="_select" Text="Display" HeaderText="Select"/> 
                <asp:HyperLinkField DataTextField="CustID" ControlStyle-CssClass="HyperLinkHover" HeaderText="ID"  DataNavigateUrlFields="CustID" 
                    DataNavigateUrlFormatString="PersonDetails.aspx?CustID={0}" InsertVisible="False" SortExpression="CustID" />
                 <asp:BoundField DataField="GivenName" HeaderText="Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Gender" HeaderText="Gender" />
                <asp:BoundField HeaderText="DOB" 
                DataField="DateOfBirth" DataFormatString="{0:MM/dd/yyyy}"/>
                <asp:BoundField DataField="Education" HeaderText="Education" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="Postcode" HeaderText="Postcode" />
                <asp:BoundField DataField="State" HeaderText="State" />

            </Columns>          
<HeaderStyle BackColor="#636363" Font-Bold="True" ForeColor="white"></HeaderStyle>

           <RowStyle BackColor="#d9d9d9" ForeColor="#333333"></RowStyle>
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#78bbe6" />
            <SortedAscendingHeaderStyle BackColor="#DEEAFE" />
        </asp:GridView>
                  </div>
           <br />
               <asp:Panel ID="pnl2" runat="server" Visible="false">
        <table class="messageForm">
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Selected Person Details" /></td>
               
                <td class="column1">
                    <asp:Label ID="Label1" runat="server" Text="Name:" /></td>
                <td class="column2">
                    <asp:Label ID="message1" runat="server" CssClass="highlight" /></td>
                
            </tr>
            <tr>
                <td class="column1">
                    <asp:Label ID="Label3" runat="server" Text="Email:" /></td>
                <td class="column2">
                    <asp:Label ID="message3" runat="server" CssClass="highlight"/></td>
                <td class="column1">
                    <asp:Label ID="Label14" runat="server" Text="Gender:" /></td>
                <td class="column2">
                    <asp:Label ID="message4" runat="server" CssClass="highlight" /></td>
                
            </tr>
            <tr>
                <td class="column1">
                    <asp:Label ID="Label5" runat="server" Text="DOB:" /></td>
                <td class="column2">
                    <asp:Label ID="message5" runat="server" CssClass="highlight" />
                </td>
                <td class="column1">
                    <asp:Label ID="Label6" runat="server" Text="Education:" /></td>
                <td class="column2">
                    <asp:Label ID="message6" runat="server" CssClass="highlight" /></td>
                
            </tr>
            <tr>
                <td class="column1">
                    <asp:Label ID="Label7" runat="server" Text="Address:" /></td>
                <td class="column2">
                    <asp:Label ID="message7" runat="server" CssClass="highlight" />
                </td>
                <td class="column1">
                    <asp:Label ID="Label8" runat="server" Text="State:" /></td>
                <td class="column2">
                    <asp:Label ID="message8" runat="server" CssClass="highlight" /></td>
            </tr>
        </table>
    </asp:Panel>
            <input type="button" class="btnSubmit" id="Button2" onclick="Javascript: window.history.go(-1);" value="Go Back" />
                
    </div>
</asp:Content>

