<%@ Language=VBScript %>

<%Session("BackPage") = "Calendar.asp"%>

<%

Dim IsRepeatingEvent

IsRepeatingEvent = false

If Request.QueryString("ID") = "" Then
		Response.Write "Unable to open empty record." 
		Response.End
End If

Set conn = Server.CreateObject("ADODB.Connection") 
conn.open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source="& Server.MapPath("../../database/steph.mdb")  

SQL = "SELECT * FROM CalendarEvents WHERE ID = " + Request.QueryString("ID")

Set RS = conn.execute(SQL) 

If RS.EOF Then
		%><p>Document not found.</p><%
		conn.Close
		Set conn = Nothing
		Set RS = Nothing
		Response.End
End if

Dim strTimeSpan
strTimeSpan = "All Day"


If RS("IsAllDayEvent") = 0 Then
	Dim EndTime
	EndTime = RS("EventTime")
	EndTime = DateAdd("H", RS("LengthHrs"), EndTime)
	EndTime = DateAdd("N", RS("LengthMins"), EndTime)
	strTimeSpan = RS("EventTime") &  " - " & EndTime
End If


%>
<html>

<head>
<meta http-equiv="Content-Language" content="en-us">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<meta name="GENERATOR" content="Microsoft Notepad">
<title><%=RS("Subject")%></title>
</head>

<body>

<font face="Arial" size="5" color="#C0C0C0"><b><%=RS("Subject")%></b></font><br><br>
<table cellSpacing="0" cellPadding="4" width="100%" border="0">
  <tbody>
    <tr>
<%If RS("CollectionID") > -1 Then%>
      <td vAlign="top" noWrap align="right" width="1%"><font face="Arial" size="2"><b>Date:</b></td>
      <td><font face="Arial" size="2"><font size="2"><%=FormatDateTime(RS("EventDate"), 1)%></font></font></td>
<%Else%>      
	<%If RS("CollectionID") = -1 Then%>
      <td vAlign="top" noWrap align="right" width="1%"><font face="Arial" size="2"><b>Day:</b></td>
      <td><font face="Arial" size="2"><font size="2"><%=MonthName(Month(RS("EventDate"))) & " " & Day(RS("EventDate"))%></font></font></td>
	<%End If%>
<%End If%>

    </tr>
    <tr>
      <td vAlign="top" noWrap align="right" width="1%"><b><font face="Arial" size="2">Time:</b></td>
      <td><font face="Arial" size="2"><%=strTimeSpan%></td>
    </tr>
    <tr>
      <td vAlign="top" noWrap align="right" width="1%"><font face="Arial" size="2"><b>Details:</b></font></td>
      <td><textarea tabindex="3" name="txtBody" rows="15" wrap="virtual" cols="35" readonly="readonly"><%=RS("Details")%></textarea></td>
      
    </tr>
  </tbody>
</table>

</body>

</html>

<%conn.Close
Set conn = Nothing
Set RS = Nothing
%>


