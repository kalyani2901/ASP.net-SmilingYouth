<%@ Import Namespace="System.Data" %>
<%@ Page Title="Register" Theme="SkinFile" Language="C#" MasterPageFile="~/charityMaster.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <asp:AccessDataSource
        id="customersDS"
        DataFile="~/Customers.mdb"
        runat="server"
        SelectCommand="SELECT * FROM [Customers]"
        InsertCommand="INSERT INTO [Customers] ([GivenName], [Email], [DateOfBirth], [Gender], [Education], [Address], [Postcode], [State]) VALUES (?, ?, ?, ?, ?, ?, ?, ?)" 
        DeleteCommand="DELETE FROM [Customers] WHERE [CustID] = ?" 
        UpdateCommand="UPDATE [Customers] SET [GivenName] = ?, [Email] = ? WHERE [CustID] = ?" >
        <DeleteParameters>
            <asp:Parameter Name="CustID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="GivenName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="DateOfBirth" Type="DateTime" />
            <asp:Parameter Name="Gender" Type="String" />
            <asp:Parameter Name="Education" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="Postcode" Type="Int32" />
            <asp:Parameter Name="State" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="GivenName" Type="String" />
            <asp:Parameter Name="Email" Type="String" />
            <asp:Parameter Name="CustID" Type="Int32" />
        </UpdateParameters>
    </asp:AccessDataSource>
    <div class="mainContainer">
    <asp:Panel ID="panel1" runat="server">
        <table class="registrationForm">
            <tr>
                <td class="column1" colspan="3"> <h2>Registration</h2>
</td>
            </tr>
            <tr>
                <td class="column1">
                    <asp:Label ID="lblFirstName" runat="server" CssClass="formLabel" Text="*Full Name :" />
                </td>
                <td class="column2">
                    <asp:TextBox ID="txtFirstName" runat="server" />
                </td>
                <td class="column3">
                    <asp:RequiredFieldValidator ID="RfvFirstName" runat="server" ErrorMessage="* Required"
                        ForeColor="#FF3300" ControlToValidate="txtFirstName"/><br />
                    <asp:RegularExpressionValidator ID="reFname" ControlToValidate="txtFirstName" ValidationExpression="^[a-zA-Z]*$" ErrorMessage="Please Enter Characters"
                        ForeColor="#FF0000" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="column1">
                    <asp:Label ID="lblEmail" runat="server" CssClass="formLabel" Text="*E-Mail :" />
                </td>
                <td class="column2">
                    <asp:TextBox ID="txtEmail" runat="server" />
                </td>
                <td class="column3">
                    <asp:RequiredFieldValidator ID="RfvUserName" runat="server" ErrorMessage="* Required"
                        ForeColor="#FF3300" ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RxvEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="Invalid E-mail" ForeColor="#FF3300" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>

            <tr>
                <td class="column1">
                    <asp:Label ID="lblGender" runat="server" CssClass="formLabel" Text="*Gender :" />
                </td>
                <td class="column2">
                    <asp:RadioButtonList ID="RdoGender" runat="server" RepeatDirection="Horizontal" Width="176px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="column3">
                    <asp:RequiredFieldValidator ID="RfvGender" runat="server" ErrorMessage="* Required"
                        ForeColor="#FF3300" ControlToValidate="RdoGender"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="column1">
                    <asp:Label ID="lblDob" runat="server" CssClass="formLabel" Text="*DOB :" />
                </td>
                <td class="column2">
                    <asp:TextBox ID="txtDob" runat="server" />
                    <asp:Label ID="dateLbl" runat="server" Text="(mm/dd/yyyy)" />
                </td>
                <td class="column3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="* Required"
                        ForeColor="#FF3300" ControlToValidate="txtDob"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CustomValidator ID="validateDOB" runat="server" ErrorMessage="CustomValidator"
                        OnServerValidate="validateDOB_ServerValidate" ForeColor="#FF3300"></asp:CustomValidator>                   
                </td>
            </tr>

              <tr>
                <td class="column1">
                    <asp:Label ID="lblListBox" runat="server" CssClass="formLabel" Text="*Education:" />
                </td>
                  <td class="column2">
               <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Single">
                        <asp:ListItem Selected="True" Text="Diploma" />
                        <asp:ListItem Text="Graduate" />
                        <asp:ListItem Text="Post Graduate" />
                        <asp:ListItem Text="Doctrate" />
	                </asp:ListBox>
                      </td>
             </tr>
            <tr>
                <td class="column1">
                    <asp:Label ID="lblAddress" runat="server" CssClass="formLabel" Text="*Address :" />
                </td>
                <td class="column2">
                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" />
                </td>
                <td class="column3">
                    <asp:RequiredFieldValidator ID="RfvAddress" runat="server" ErrorMessage="* Required"
                        ForeColor="Red" ControlToValidate="txtAddress"></asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="column1">
                    <asp:Label ID="lblState" runat="server" CssClass="formLabel" Text="*State :" />
                </td>
                <td class="column2">
                    <asp:DropDownList ID="stateList" runat="server">
                        <asp:ListItem Selected="True" Value="none">--Select--</asp:ListItem>
                        <asp:ListItem> VIC </asp:ListItem>
                        <asp:ListItem> NSW </asp:ListItem>
                        <asp:ListItem> QLD </asp:ListItem> 
                        <asp:ListItem> WA </asp:ListItem> 
                        <asp:ListItem> TAS </asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="column3">
                    <asp:RequiredFieldValidator ID="RfvState" runat="server" InitialValue="none" ErrorMessage="* Required"
                        ForeColor="#FF3300" ControlToValidate="stateList" />
                </td>
            </tr>

            <tr>
                <td class="column1">
                    <asp:Label ID="lblPostcode" runat="server" CssClass="formLabel" Text="*Postcode:" />
                </td>
                <td class="column2">
                    <asp:TextBox ID="txtPostcode" runat="server" />
                </td>
                <td class="column3">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="* Required"
                        ForeColor="#FF3300" ControlToValidate="txtPostcode" />
                    <asp:RangeValidator ID="rngPostCd" runat="server" ControlToValidate="txtPostcode" ErrorMessage="It must be 4 digits"
                        ForeColor="#FF3300" Type="Integer" MinimumValue="1111" MaximumValue="9999" />
                </td>
            </tr>

  

            <tr>
                <td class="column1">
                    <asp:Label ID="lblPassword" runat="server" CssClass="formLabel" Text="*Password:" />
                </td>
                <td class="column2">
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                </td>
                <td class="column3">
                    <asp:RequiredFieldValidator ID="RfvPwd" runat="server" ErrorMessage="* Required"
                        ForeColor="#FF3300" ControlToValidate="txtPassword" />
                </td>
            </tr>

            <tr>
                <td class="column1">
                    <asp:Label ID="lblConfirmPwd" runat="server" CssClass="formLabel" Text="*Confirm:" />
                </td>
                <td class="column2">
                    <asp:TextBox ID="txtConfirmPwd" runat="server" TextMode="Password" />
                </td>
                <td class="column3">
                    <asp:RequiredFieldValidator ID="RfvCnfrmPwd" runat="server" ErrorMessage="* Required"
                        ForeColor="#FF3300" ControlToValidate="txtConfirmPwd"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CvCnfmPwd" runat="server" ErrorMessage="Password didn't matched"
                        ForeColor="#FF3300" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPwd"></asp:CompareValidator>
                </td>
            </tr>

            <tr>
                <td class="column1">
                    <asp:Label ID="lblSupport" runat="server" CssClass="formLabel" Text="*Mode of support:" />
                </td>
                <td colspan="2">
                    <asp:CheckBoxList ID="chkSupport" runat="server" RepeatDirection="Horizontal" Width="250px">
                        <asp:ListItem Text="Volunteer" Value="Volunteer"></asp:ListItem>
                        <asp:ListItem Text="Donation" Value="Donation"></asp:ListItem>
                        <asp:ListItem Text="None" Value="None"></asp:ListItem>
                    </asp:CheckBoxList></td>
            </tr>

            <tr>               
                <td style="text-align:center" colspan="3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="addRegistration" CssClass="btnSubmit" />
                </td>
            </tr>
             <tr>
                 <td> <asp:HyperLink ID="HyperLinkData" CssClass="HyperLinkHover" runat="server" NavigateUrl="~/ViewAllData.aspx" Text="View all Members" /></td>
                 <td></td>
       <td> <asp:HyperLink ID="HyperLinkSearch" CssClass="HyperLinkHover" runat="server" NavigateUrl="~/Search.aspx" Text="Search Members" /></td>
            </tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnl2" runat="server" Visible="false">
        <table class="messageForm">
           <tr> <td class="column1" colspan="3"> <h2>Registered member details</h2></td> </tr>
            <tr>
                <td class="column1">
                    <asp:Label ID="Label1" runat="server" Text="Name:" /></td>
                <td class="column2">
                    <asp:Label ID="message1" runat="server" CssClass="highlight" /></td>
                <td class="column1">
                    <asp:Label ID="Label14" runat="server" Text="Gender:" /></td>
                <td class="column2">
                    <asp:Label ID="message4" runat="server" CssClass="highlight" /></td>
            </tr>
            <tr>
                <td class="column1">
                    <asp:Label ID="Label3" runat="server" Text="Email:" /></td>
                <td class="column2">
                    <asp:Label ID="message3" runat="server" CssClass="highlight" /></td>
                <td class="column1">
                    <asp:Label ID="Label6" runat="server" Text="Education:" /></td>
                <td class="column2">
                    <asp:Label ID="message6" runat="server" CssClass="highlight" /></td>
            </tr>
            <tr>
                <td class="column1">
                    <asp:Label ID="Label5" runat="server" Text="DOB:" /></td>
                <td class="column2">
                    <asp:Label ID="message5" runat="server" CssClass="highlight" />
                </td>
                <td class="column1">
                    <asp:Label ID="Label2" runat="server" Text="Support:" /></td>
                <td class="column2">
                    <asp:Label ID="message2" runat="server" CssClass="highlight" /></td>
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
             <tr>
                 <td colspan="2"> <asp:HyperLink ID="HyperLink1" CssClass="HyperLinkHover" runat="server" NavigateUrl="~/ViewAllData.aspx" Text="View all Members" /></td>
                 
       <td colspan="2"> <asp:HyperLink ID="HyperLink2" CssClass="HyperLinkHover" runat="server" NavigateUrl="~/Search.aspx" Text="Search Members" /></td>
            </tr>
        </table>

        
        <br />

   </asp:Panel>
         
 </div>
</asp:Content>

