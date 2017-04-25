<%@ Page Title="Site Map" Language="C#" Theme="SkinFile" MasterPageFile="~/charityMaster.master" AutoEventWireup="true" CodeFile="SiteMap.aspx.cs" Inherits="SiteMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="siteMapBg">
        <h1>Site navigation tree view</h1>
        <p></p>
        <asp:SiteMapDataSource ID="SiteMapDataSource1"
   runat="server" />

  <asp:TreeView ID="TreeView1" runat="server"
     DataSourceID="SiteMapDataSource1" ShowLines="True" CssClass="siteMap">
      <NodeStyle CssClass="siteMap" /> </asp:TreeView></div>
    
</asp:Content>

 