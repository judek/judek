<%
Function GetGalleryLink(strLink, nPos)

	GetGalleryLink = strLink
End Function
Function GetGalleryName(strLink, nPos)

	GetGalleryName = strLink
End Function







Response.Redirect("gallery.aspx")





%>








<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>

<!-- CHANGE THE NEXT THREE LINES -->

<title>judek.com - Gallery</title>

<!-- CHANGE THE ABOVE THREE LINES -->

<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<META http-equiv="Content-Language" content="en">
<META name="revisit-after" content="15 days">
<META name="robots" content="index, follow">
<META name="Rating" content="General">
<META name="Robots" content="All">

<link rel=StyleSheet href="coolstyle.css" type="text/css" media="screen">

<script language="JavaScript" src="blockerror.js"></script>

</head>

<BODY BGCOLOR="#BB0000" background="picts/background.gif" TEXT="#FFFFFF" LINK="#99CCFF" VLINK="#99CCFF" ALINK="#99CCFF" leftmargin="0" rightmargin="0" topmargin="0" bottommargin="0" marginheight="0" marginwidth="0">



<script language="JavaScript" src="header.js"></script>



<!-- OUTER TABLE-->
<TABLE cellpadding="0" cellspacing="0" border="0" bordercolor="666666" width="650"><tr><td ALIGN="CENTER" VALIGN="TOP">



<!-- SPLIT TABLE-->
<TABLE cellpadding="0" cellspacing="0" border="0" width="100%">
<tr><td ALIGN=LEFT VALIGN=TOP WIDTH="180">


<IMG SRC="picts/spacer.gif" HEIGHT="450" WIDTH="180" border="0"><BR>




</td><td ALIGN=CENTER VALIGN=TOP background="picts/background-main.jpg">


<IMG SRC="picts/spacer.gif" HEIGHT="100" WIDTH="50" border="0"><BR>

<!-- PICTURE TABLE -->
<TABLE cellpadding="0" cellspacing="0" border="1" bordercolor="#FFFFFF" style="border-collapse: collapse"><tr><td>
<IMG SRC="picts/gallery.jpg" HEIGHT="125" WIDTH="466" border="0"><BR>
</td></tr></table>
<!-- PICTURE TABLE -->


<!-- CONTENT TABLE -->
<TABLE cellpadding="10" cellspacing="0" border="0" width="100%"><tr><td ALIGN=LEFT VALIGN=TOP>




<span class="title">
PICTURE GALLERY<BR>
</span>

<!-- CLOSE UP TABLE-->
<TABLE cellpadding=0 cellspacing=0 border=0><tr><td>
<IMG SRC="picts/small-windows.gif" HEIGHT="25" WIDTH="25">
</td><td>
<span class="picturetitle">Hold mouse over for description. Click picture for close up view. </span><br>
</td></tr></table>
<!-- CLOSE UP TABLE-->

<p>


<%
Const ForReading = 1, ForWriting = 2, ForAppending = 3
Const TristateUseDefault = -2, TristateTrue = -1, TristateFalse = 0

CONST adFldIsNullable = &H00000020 
CONST adVarChar = 200 
CONST adDate = 7 
Const adInteger = 3
CONST adOpenDynamic = 2 
CONST adUseClient = 3 



qfolder = request.querystring("f")
if qfolder = "" then
	folderspec = server.mappath(".")
	Set filesys = CreateObject("Scripting.FileSystemObject") 
	Set demofolder = filesys.GetFolder(folderspec) 
	Set folcoll = demofolder.SubFolders
	
	Set rs = CreateObject("ADODB.Recordset")
    rs.CursorLocation = adUseClient 
	rs.CursorType = adOpenDynamic 
	rs.Fields.Append "folderame", adVarChar, 255, adFldIsNullable 
	rs.Fields.Append "size", adInteger, adFldIsNullable
	rs.Fields.Append "folderDateCreated", adDate, 32, adFldIsNullable
	rs.Open 
	
	
	folist = folist & "<span class=""smalltitle"">"
	folist = folist & "Galleries<BR>" & vbcrlf
	For Each subfol in folcoll
		NameLen = Len(subfol.name)
		If (InStr(subfol.name, "gallery") > 0) And NameLen  > 9 Then

	        rs.AddNew 
            rs.Fields("folderame") = subfol.name
            rs.Fields("size") = left((subfol.size/1000000), 3)
            rs.Fields("folderDateCreated") = subfol.dateCreated
            rs.update 

'			folsize = left((subfol.size/1000000), 3)
'			folist = folist & "<a href='?f=" & subfol.name & "'><strong title='view'>&#187;</strong> " & Right(subfol.name,(NameLen-9)) & " </a><small>&nbsp;(" & folsize & " MB)</small>" & vbcrlf
'	   		folist = folist & "<BR>"  
	   	End If
	Next
	

	if rs.eof = false Then
		rs.Sort = "folderame asc" 
		rs.MoveFirst
	End If    
    
    do while not rs.eof 
		NameLen = Len(rs.Fields(0))
		folist = folist & "<a href='?f=" & rs.Fields(0) & "'><strong title='view'>&#187;</strong> " & Right(rs.Fields(0),(NameLen-9)) & " </a><small>&nbsp;(" & rs.Fields(1) & " MB)</small>" & vbcrlf
		folist = folist & "<BR>"  
		rs.MoveNext
    Loop
	
	
	
	folist = folist & "</span>"
	set filesys = nothing
	rs.Close
	set rs = nothing
%>	
<center>
 
<table border="0" cellpadding="0" cellspacing="0" width="466">
  <tr>
    <td><%=folist%></td>
  </tr>
</table>
	
<%	
'	Response.Write folist

else

	folderspec = server.mappath(qfolder)
	Set filesys = CreateObject("Scripting.FileSystemObject") 
	Set demofolder = filesys.GetFolder(folderspec) 
	Set folcoll = demofolder.SubFolders

	Set rs = CreateObject("ADODB.Recordset")
    rs.CursorLocation = adUseClient 
	rs.CursorType = adOpenDynamic 
	rs.Fields.Append "folderame", adVarChar, 255, adFldIsNullable 
	rs.Fields.Append "size", adInteger, adFldIsNullable
	rs.Fields.Append "folderDateCreated", adDate, 32, adFldIsNullable
	rs.Open 




'	folist = folist & "Albums<BR>" & vbcrlf
	For Each subfol in folcoll

		rs.AddNew 
		rs.Fields("folderame") = subfol.name
		rs.Fields("size") = left((subfol.size/1000000), 3)
		rs.Fields("folderDateCreated") = subfol.dateCreated
		rs.update 



'		NameLen = Len(subfol.name)
'		folsize = left((subfol.size/1000000), 3)
'		folist = folist & "<a href='?f=" & qfolder & "\" & subfol.name & "'><strong title='view'>&#187;</strong> " & Right(subfol.name,(NameLen-9)) & " </a><small>&nbsp;(" & folsize & " MB)</small>" & vbcrlf
'	    folist = folist & "<BR>"  
	Next

	if rs.eof = false Then
		rs.Sort = "folderame asc" 
		rs.MoveFirst
    End If
    
    do while not rs.eof 
		NameLen = Len(rs.Fields(0))
		

'		folsize = left((subfol.size/1000000), 3)
		folist = folist & "<a href='?f=" & qfolder & "\" & rs.Fields(0) & "'><strong title='view'>&#187;</strong> " & Right(rs.Fields(0),(NameLen-9)) & " </a><small>&nbsp;(" & rs.Fields(1) & " MB)</small>" & vbcrlf
		folist = folist & "<BR>"  
		rs.MoveNext
    Loop
	




	set filesys = nothing
	rs.Close
	set rs = nothing
	'Response.Write folist



filepath = server.mappath(".") & "\" & qfolder
captionfile = filepath & "\captions.txt"
Set filesys = CreateObject("Scripting.FileSystemObject")
Dim SomeArray()
'caption part
	If filesys.FileExists(captionfile) then
		set file = filesys.GetFile(captionfile)
		Set TextStream = file.OpenAsTextStream(ForReading,TristateUseDefault)
		captioncount = 0
		Do While Not TextStream.AtEndOfStream
			Line = TextStream.readline
			ReDim Preserve SomeArray(captioncount)
			SomeArray(captioncount) = line
			'response.write captioncount & " " & somearray(captioncount) & "<br>"
			captioncount = captioncount + 1
			'Response.write Line
		Loop
		textStream.close
	end if

'Description Part
strDescription = ""
Discriptionfile = filepath & "\description.txt"
If filesys.FileExists(Discriptionfile) then
	set file = filesys.GetFile(Discriptionfile)
	Set TextStream = file.OpenAsTextStream(ForReading,TristateUseDefault)
	Do While Not TextStream.AtEndOfStream
		strDescription = strDescription & TextStream.readline & "<br>"
	Loop
	textStream.close
End If
	



'file part the picture name
	Dim sGetThumbNailCommand
	Dim sSlideShowCommand
	Set demofolder = filesys.GetFolder(filepath) 
	Set filecoll = demofolder.Files
	filecount = 0

	Set rs2 = CreateObject("ADODB.Recordset")
    rs2.CursorLocation = adUseClient 
	rs2.CursorType = adOpenDynamic 
	rs2.Fields.Append "filename", adVarChar, 255, adFldIsNullable 
	rs2.Fields.Append "size", adInteger, adFldIsNullable
	rs2.Fields.Append "fileDateCreated", adDate, 32, adFldIsNullable
	rs2.Open 




	For Each file in filecoll
		Ext = UCase(Right(File.Path, 3))  
		If Ext = "JPG" OR Ext = "GIF" Then
		on error resume next
		data = SomeArray(filecount)
		on error goto 0

		rs2.AddNew 
		rs2.Fields("filename") = file.name
		rs2.Fields("size") = left((file.size/1000000), 3)
		rs2.Fields("fileDateCreated") = file.dateCreated
		rs2.update 
		end if
	Next



	if rs2.eof = false Then
		rs2.Sort = "filename asc" 
		rs2.MoveFirst
    End If

    do while not rs2.eof 
		PictureName = rs2.Fields(0)

		hrefpath = qfolder & "/" & PictureName
		sSlideShowCommand = "slideshow.asp?f=" & qfolder & "&i=" & PictureName
		sGetThumbNailCommand = "getThumbNail.asp?File=" & qfolder & "/" & PictureName & "&Width=100"
		'filist = filist & sGetThumbNailCommand
		'filist = filist & "<br>"
		'imagepath = "<strong>" & data & "</strong><br><a href='" & hrefpath & "'  border=0><img src='" & hrefpath & "' border='" & border_size & "' title=""" & data & """ style='border-color: " & border_color & ";'></a><br>"
	    'filist = filist & "<strong>" & "</strong>" & "<a href=""" & hrefpath & """ target='_blank'><img src=""" & sGetThumbNailCommand & """" & " alt=""" & data & """" & ">"
	    filist = filist & "<strong>" & "</strong>" & "<a href=""" & sSlideShowCommand & """><img src=""" & sGetThumbNailCommand & """" & " alt=""" & data & """" & ">"
	    filist = filist & imagepath & vbcrlf
	    'filist = filist & "&nbsp;"
		filecount = filecount + 1
		data = ""
		rs2.MoveNext
    Loop

	set filesys = Nothing
	set rs2 = Nothing
	'filist = filist & "<br><small><a href='http://www.allscoop.com/' target='_blank'>allscoop free image gallery</a></small>"

%>




<%galpos = InStrRev(filepath, "gallery")%>


<%dirpos = Instr(galpos, "\")%>


<%if dirpos = 0 then
	dirpos = Len(filepath) - galpos
End if%> 
 
 <center><span class="smalltitle"><%=Mid(filepath, (galpos + 9), dirpos)%></center><br></span>
 <span class="copytext"><%=strDescription%><br></span>
<table border="0" cellpadding="0" cellspacing="0" width="466">
  <tr>

<input type=button value="BACK" onClick="history.go(-1)" onmouseover="this.className='buttonon'" onmouseout="this.className='button'" class="button" id=button1 name=button1>


</td>
  </tr>
  <tr>
    <td><%=filist%>
    <%If Not filist = "" Then%>
		<br><input type=button value="BACK" onClick="history.go(-1)" onmouseover="this.className='buttonon'" onmouseout="this.className='button'" class="button" id=button1 name=button1>
    <%End If%>
    </td>
  </tr>
  
<%If Len(folist) > 9 Then%>  
  <tr>
    <td><br>Sub Galleries<br><%=folist%></td>
  </tr>
  
 <%End If%>


</table>
</span>
<% end if %>


</p>



</td></tr></table>
<!-- CONTENT TABLE -->




</td></tr></table>
<!-- SPLIT TABLE -->






</td></tr></table>
<!-- OUTER TABLE-->




<!-- COPYRIGHT -->
<TABLE cellpadding="0" cellspacing="1" border="0" bordercolor="#000000" width="660" BGCOLOR="000000"><tr><td>
<TABLE cellpadding="0" cellspacing="2" border="0" width="100%" background="picts/bottom-background.gif"><tr><td WIDTH="10">
<IMG SRC="picts/spacer.gif" HEIGHT="10" WIDTH="10" border="0"><BR>

</td><td ALIGN=LEFT VALIGN=TOP>

<script language="JavaScript" src="copyright.js"></script>


</td><td ALIGN=RIGHT VALIGN=TOP>


<script language="JavaScript" src="copyright-allwebco.js"></script>


</TD><td WIDTH="10">

<IMG SRC="picts/spacer.gif" HEIGHT="10" WIDTH="10" border="0"><BR>

</td></tr></table>
</td></tr></table>
<!-- COPYRIGHT -->

<script language="JavaScript" src="menu.js"></script>


</BODY>

</HTML>