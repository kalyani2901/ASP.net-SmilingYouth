<%@ Page Language="C#" Theme="SkinFile" MasterPageFile="~/charityMaster.master" Debug="true"
     Title="Log In" %>

<asp:Content ID="loginContent" ContentPlaceHolderID="ContentPlaceHolder1" 
        runat="server">

<script language="C#" runat="server">

    void Login_Authenticate(object sender, AuthenticateEventArgs e)
    {
        DS1.SelectCommand = "SELECT * FROM UnitUsers WHERE user_name = '" + Login.UserName + "'AND user_password = '" + Login.Password + "'";


        DS1.Select(DataSourceSelectArguments.Empty);
    }
    private void CheckLogin(object sender,
      SqlDataSourceStatusEventArgs e)
    {
        if (e.AffectedRows > 0)
        {
            FormsAuthentication.RedirectFromLoginPage(Login.UserName,
              false);
        }
        else
        {
            Login.FailureText = "Invalid Login";
        }
    }
</script>

    <asp:AccessDataSource ID="DS1" runat="server" 
      DataFile="~/Login.mdb" OnSelected="CheckLogin" SelectCommand="SELECT * FROM [UnitUsers]" />

    <div class="mainContainer" runat="server">
<h2> LOG IN</h2>
             <asp:Login ID="Login" runat="server"
        OnAuthenticate="Login_Authenticate" CssClass="logSearchContainer" TitleTextStyle-Font-Bold="true"
        TitleText="<br />Enter credentials<br />" 
        UserNameLabelText="Username:" 
        UserNameRequiredErrorMessage="Username required<p />" 
        PasswordLabelText="Password:" 
        PasswordRequiredErrorMessage="Password required" 
        Height = "250" Width = "330" 
        LoginButtonText="Click to login" DisplayRememberMe="false">
        <LabelStyle CssClass="loginText" /> 
        <TitleTextStyle CssClass="loginText" /> 
        <ValidatorTextStyle CssClass="loginValidator" />
      </asp:Login>
      <p />
        <%--</table>--%>
      
     

      <asp:ValidationSummary id="vlSummary1" Font-Names="Arial" 
        Visible="true" CssClass="vldSummary" 
        runat="server" ValidationGroup="Login" 
        HeaderText="Please correct the following errors:" />

    </div>
</asp:Content>