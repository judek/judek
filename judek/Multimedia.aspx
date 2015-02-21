<%@ Page Title="" Language="C#" MasterPageFile="judek.Master" AutoEventWireup="true" CodeBehind="Multimedia.aspx.cs" Inherits="judek.Multimedia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- PICTURE TABLE -->
<table cellpadding="0" cellspacing="0" border="1" bordercolor="#FFFFFF" style="border-collapse: collapse"><tr><td>
<img src="picts/Movies.jpg" height="125" width="466" border="0"><br />
</td></tr></table>
<!-- PICTURE TABLE -->

<!-- CONTENT TABLE --> 
<table cellpadding="10" cellspacing="0" border="0" width="100%"><tr><td align="Left" valign="top">
<asp:Label ID="LabelMain" runat="server" Text=""></asp:Label>

<table width="600"><tr>
<td width="450"><asp:Label ID="LabelTagCloud" runat="server" Text=""></asp:Label>
<asp:Label ID="LabelMultiMediaFiles" runat="server" Text=""></asp:Label></td>
<td align="left" valign="top"><asp:Label ID="LabelRightSideBarArea" runat="server" Text=""></asp:Label></td>

</tr></table>
 
</td></tr>
</table>
<br />
<br />
<!-- CONTENT TABLE -->
</asp:Content>


