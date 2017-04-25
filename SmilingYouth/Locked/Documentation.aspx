<%@ Page Title="Ducumentation"Theme="SkinFile" Language="C#" MasterPageFile="~/charityMaster.master" AutoEventWireup="true" CodeFile="Documentation.aspx.cs" Inherits="Documentation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="mainContainer">
    <h2> Author Details </h2><p />
        Name: Kalyani Singh<p />
        Student Id: 27231631 <p />
        Unit Name: Internet application development <p />
        Unit Provider: Monash University, Caufield school of Information Technology <p />
        Assignment Number: Distinction Task <p />
        Date of submission: 09/10/2016 <p />
        Tutors name: Linh Chu <p />
        <p>
         <asp:HyperLink ID="HyperLink2" runat="server" CssClass="HyperLinkHover" NavigateUrl="mailto:ksin57@student.monash.edu" Text = "E-mail: Author" /></p><br />
            <asp:HyperLink ID="HyperLink1" runat="server" CssClass="HyperLinkHover" NavigateUrl="http://moodle.vle.monash.edu/mod/page/view.php?id=3321999" Text="Assignment Specification" /><br />
    </div>
</asp:Content>