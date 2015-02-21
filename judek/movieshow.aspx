<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="movieshow.aspx.cs" Inherits="judek.movieshow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>judek.com</title>
    <link rel="StyleSheet" href="coolstyle.css" type="text/css" media="screen" />
</head>
<body bgcolor="#BB0000" background="picts/background.gif" >
    <form id="form1" runat="server">
    <div>
<table border="0">
	<tr>
		<td width="100" ></td>
		<td>
		    
            <hr />
            <!-- START OF THE PLAYER EMBEDDING TO COPY-PASTE -->


	<object id="player" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" name="player" width="640" height="388">
		<param name="movie" value="/videos/player.swf" />
		<param name="allowfullscreen" value="true" />
		<param name="flashvars" value="file=/videos/<%=Request.QueryString["movie"]%>&image=<%=Request.QueryString["movie"]%>.jpg&bufferlength=10&type=video" />
		<object type="application/x-shockwave-flash" data="/videos/player.swf" width="640" height="388">
			<param name="movie" value="/videos/player.swf" />
			<param name="allowfullscreen" value="true" />
			<param name="allowscriptaccess" value="always" />
			<param name="flashvars" value="file=/videos/<%=Request.QueryString["movie"]%>&image=<%=Request.QueryString["movie"]%>.jpg&bufferlength=10&type=video" />
			<p><a href="http://get.adobe.com/flashplayer">Get Flash</a> to see this player.</p>
		</object>
	</object>

	<!-- END OF THE PLAYER EMBEDDING -->
            <br />                  <asp:Button ID="ButtonDone" runat="server" Text="Done" 
                onclick="ButtonDone_Click"/>
                <table width="900">
             <tr>
                 <td colspan="2">
                     <asp:Literal ID="LiteralDescription" runat="server" Text="Description Coming Soon..."></asp:Literal>
                     <asp:TextBox ID="TextBoxDescription" runat="server" TextMode="MultiLine" 
                         Width="734px" Height="90px"></asp:TextBox>
                     <asp:Button ID="ButtonSave" runat="server" onclick="ButtonSave_Click" 
                         Text="Save" />
                 </td>
             </tr>
         </table>
		</td>
		
	</tr>
</table>

           
       
       
       
    </div>
    </form>
</body>
</html>
