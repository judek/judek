<%@ Page Title="" Language="C#" MasterPageFile="judek.Master" AutoEventWireup="true" CodeBehind="LiveCam.aspx.cs" Inherits="judek.LiveCam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- PICTURE TABLE -->
<table cellpadding="0" cellspacing="0" border="1" bordercolor="#FFFFFF" style="border-collapse: collapse"><tr><td>
<%--<img src="picts/LiveCam.jpg" height="125" width="466" border="0" /><br />--%>
</td></tr></table>
<!-- PICTURE TABLE -->

<!-- CONTENT TABLE --> 
<table cellpadding="10" cellspacing="0" border="0" width="100%"><tr><td align="left" valign="top">
   <span class="title">Live Camera</span><br />
    <asp:Literal ID="Literal1" runat="server" Text="Please wait while image loads...click on image to view in full size. Refresh this page to get an updated picture."></asp:Literal>
    <br />
    <br />
   <span style="display: block !important; width: 320px; text-align: center; font-family: sans-serif; font-size: 12px;"><a href="http://www.wunderground.com/cgi-bin/findweather/getForecast?query=zmw:60543.1.99999&bannertypeclick=wu_clean2day" title="Oswego, Illinois Weather Forecast" target="_blank"><img src="http://weathersticker.wunderground.com/weathersticker/cgi-bin/banner/ban/wxBanner?bannertype=wu_clean2day_cond&airportcode=KARR&ForcedCity=Oswego&ForcedState=IL&zip=60543&language=EN" alt="Find more about Weather in Oswego, IL" width="300" /></a><br><a href="http://www.wunderground.com/cgi-bin/findweather/getForecast?query=zmw:60543.1.99999&bannertypeclick=wu_clean2day" title="Get latest Weather Forecast updates" style="font-family: sans-serif; font-size: 12px" target="_blank"></a></span>
   <br />
<!-- COPY AND PASTE CODE BELOW TO MAKE A NEW PARAGRAPH --><br /><br />

<%string homeserverIP = GetHomeServerIP(@"31ashlawn"); %>
Driveway South East<hr />

 <a href="http://<%=homeserverIP%>/driveway1" target="_blank">
<img src="http://<%=homeserverIP%>/driveway1" alt="driveway1" width="670" /><br /><br />
</a> 

 <br />

Driveway North East<hr />

 <a href="http://<%=homeserverIP%>/driveway2" target="_blank">
<img src="http://<%=homeserverIP%>/driveway2" alt="driveway2" width="670" /><br /><br />

</a> 


<br />

Where's Bootzie?<hr />

 <a href="http://<%=homeserverIP%>/bootzie" target="_blank">
<img src="http://<%=homeserverIP%>/bootzie" alt="bootzie" width="670" /><br /><br />

</a> 


 <br />



Inside Bootzie's house<hr />

 <a href="http://<%=homeserverIP%>/bootziehouse" target="_blank">
<img src="http://<%=homeserverIP%>/bootziehouse" alt="bootizehouse" width="670" /><br /><br />

</a> 


 <br />


Raccon Possum Cam<hr />

 <a href="http://<%=homeserverIP%>/outdoor1" target="_blank">
<img src="http://<%=homeserverIP%>/outdoor1" alt="outdoor" width="670" /><br /><br />

</a> 


 

 <%--<br />

Captain Jackie 1<hr />

 <a href="GetLiveImage.aspx?id=5014" target="_blank">
<asp:Image ID="Image7" runat="server" ImageUrl="GetLiveImage.aspx?w=640&h=360&id=5014"/><br /><br />
</a> --%>


 <br />


The Garage Door<hr />

 <a href="http://<%=homeserverIP%>/garage" target="_blank">
<img src="http://<%=homeserverIP%>/garage" alt="garage" width="670" /><br /><br />
</a> 


 <br />

Back Patio<hr />

 <a href="http://<%=homeserverIP%>/brad" target="_blank">
<img src="http://<%=homeserverIP%>/brad" alt="brad" width="670" /><br /><br />

</a> 

<br />


    <br />

Kitchen Counters<hr />

 <a href="http://<%=homeserverIP%>/kitchen" target="_blank">
<img src="http://<%=homeserverIP%>/kitchen" alt="kitchen" width="670" /><br /><br />
</a> 


       <br />

Master Bedroom<hr />

 <a href="http://<%=homeserverIP%>/bedroom" target="_blank">
<img src="http://<%=homeserverIP%>/bedroom" alt="bedroom" width="670" /><br /><br />
</a> 

<br />

New Port Richey Weather Cam<hr />

 <!--<a href="http://www.aprsfl.net/cam/images-cam/image.jpg" target="_blank"> -->
<asp:Image ID="Image8" runat="server" ImageUrl="GetLiveImage.aspx"/><br /><br />
<!-- </a>  -->

<br />

 <br />

USA Current Radar<hr />

 <a href="http://images.intellicast.com/WxImages/Radar/usa.gif" target="_blank">
<img src="http://images.intellicast.com/WxImages/Radar/usa.gif" alt="Current Radar" style="width:670px;" /><br /><br />
</a>

<br />


  
</td></tr></table>
<!-- CONTENT TABLE -->


</asp:Content>
