<%@ Page Title="" Language="C#" MasterPageFile="judek.Master" AutoEventWireup="true" CodeBehind="calendar.aspx.cs" Inherits="judek.calendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- PICTURE TABLE -->
<table cellpadding="0" cellspacing="0" border="1" bordercolor="#FFFFFF" style="border-collapse: collapse"><tr><td>
<img src="picts/dashboard.jpg" height="125" width="466" border="0"><br />
</td></tr></table>
<!-- PICTURE TABLE -->

<!-- CONTENT TABLE --> 
<table cellpadding="10" cellspacing="0" border="0" width="100%"><tr><td align="Left" valign="top">
   <asp:Label ID="LabelMain" runat="server" Text=""></asp:Label>
 
    <br /><b><asp:Label ID="LabelTodayMessage" runat="server" 
        Text="LabelTodayMessage"></asp:Label></b><center /><br />
    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="White" 
        BorderWidth="1px" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
        Height="300px" Width="452px" CellPadding="0" 
        CaptionAlign="Top" ShowGridLines="True" 
    ondayrender="Calendar1_DayRender" 
    onvisiblemonthchanged="Calendar1_VisibleMonthChanged" 
            onselectionchanged="Calendar1_SelectionChanged">
    <SelectedDayStyle BackColor="#009999" ForeColor="#CCFF99" Font-Bold="True" />
    <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
    <WeekendDayStyle BackColor="#FFFFFF" />
    <TodayDayStyle BackColor="#949494" ForeColor="White" />
    <OtherMonthDayStyle ForeColor="#999999" />
    <NextPrevStyle Font-Size="20pt" ForeColor="Black" />
    <DayHeaderStyle BackColor="White" ForeColor="#00AF00" Height="1px" />
    <TitleStyle BackColor="White" BorderColor="#3366CC" BorderWidth="1px" 
        Font-Bold="True" Font-Size="20pt" ForeColor="#640000" Height="25px" />
    </asp:Calendar>
 
</td></tr>
</table>
<br />
<br />
<!-- CONTENT TABLE -->

</asp:Content>