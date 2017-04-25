<%@ Page Title="" Language="C#" MasterPageFile="~/charityMaster.master" Theme="SkinFile" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="mainContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <table class="homeContent">
     <tr style="height:30%">
         <td colspan="2">
          <div class="article">
            <h1><span>Organization</span> to Trust</h1>
            <div class="clr"></div>
            <p>Our mission is to end the cycle of youth homelessness and also to provide housing for the mentally-challenged homeless throughout the Australia.
    We do this, every day, in cities across Australia. We carry out our mission through our volunteers who go to the streets in order to find, stabilize and otherwise help homeless and street kids improve their lives.
    Together, we're more than a charity. We're a powerful force for change</p>
          </div>
         </td>
     </tr>
<tr class="fbg" style="height:60%">
    <td><h2><span>Image Gallery</span></h2></td>
    <td class="col c1"> 
       <img src="images/home3.jpg" width="88" height="88" alt="" />
         <img src="images/home6.jpg" width="88" height="88" alt="" />
         <asp:AdRotator AdvertisementFile="~/adRotator.xml" runat="server" />
          </td>
    <td class="col c2">
      <asp:AdRotator AdvertisementFile="~/adRotator1.xml" runat="server" />

        <%--<img src="images/home1.jpg" alt="" />--%>
         <a href="#"><img src="images/photo3.jpg" width="88" height="88" alt="" /></a>
          <a href="#"><img src="images/home4.jpg" width="88" height="88" alt="" /></a> </td>
</tr>
    <tr style="height:10%">
        <td colspan="2"> <p><strong> Disclaimer </strong><br />
        <asp:HyperLink ID="HyperLink2" CssClass="HyperLinkHover" runat="server" Text="Personal Disclaimer" NavigateUrl="PersonalDisclaimer.aspx" /> | <asp:HyperLink ID="HyperLink3" runat="server" CssClass="HyperLinkHover" Text="Monash Disclaimer" NavigateUrl="https://www.monash.edu/disclaimer-copyright" />    
        </tr>
     
          </table>
</asp:Content>