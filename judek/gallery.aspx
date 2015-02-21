<%@ Page Title="" Language="C#" MasterPageFile="judek.Master" AutoEventWireup="true" CodeBehind="gallery.aspx.cs" Inherits="judek.gallery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!-- PICTURE TABLE -->
<TABLE cellpadding="0" cellspacing="0" border="1" bordercolor="#FFFFFF" style="border-collapse: collapse"><tr><td>
<IMG SRC="picts/gallery.jpg" HEIGHT="125" WIDTH="466" border="0"><BR>
</td></tr></table>
<!-- PICTURE TABLE -->

<!-- CONTENT TABLE --> 
<TABLE cellpadding="10" cellspacing="0" border="0" width="100%"><tr><td ALIGN=LEFT VALIGN=TOP>
   <span class="title">Picture Gallery</span> [<a href="/GalleryEdit" title="Friends can edit my picture captions">Click here to edit captions</a>]
   <br /><span class="smalltitle">>><asp:Literal ID="LiteralBreadCrums" runat="server"></asp:Literal></span><br />
        <br /><asp:Literal ID="LiteralGalleryDescription" runat="server"></asp:Literal>
        <asp:TextBox ID="TextBoxGalleryDescription" runat="server" Height="87px" 
            TextMode="MultiLine" Width="718px"></asp:TextBox><br />
        <asp:Button ID="ButtonSave" runat="server" onclick="ButtonSave_Click" 
            Text="Save Description" Width="117px" />
    <br />
    <asp:FileUpload ID="FileUpload1" runat="server" />
    <asp:Button ID="ButtonUpload" runat="server" onclick="ButtonUpload_Click" 
        Text="Upload New Picture" />
    <asp:Literal ID="LiteralUploadMessage" runat="server"></asp:Literal>
    <br />
    <asp:Literal ID="LiteralPictureTable" runat="server" 
        Text="This gallery is empty"></asp:Literal><br />
        <!-- 
        <asp:DataList ID="DataListPictures" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" >
        <ItemTemplate>
        <a href="slideshow.aspx?f=<%# DataBinder.Eval(Container.DataItem, "VirtualDirectory")%>&i=<%# DataBinder.Eval(Container.DataItem, "Name")%>&r=<%# DataBinder.Eval(Container.DataItem, "ParentURLPath")%>">
        <img src="GetThumbNail.aspx?i=<%# DataBinder.Eval(Container.DataItem, "URL")%>&w=100" alt="<%# DataBinder.Eval(Container.DataItem, "Name")%>" />
        </a>
        </ItemTemplate> 
        </asp:DataList>
         -->
        <span class="smalltitle">
        <asp:Literal ID="LiteralOtherGalleries" text="No Sub Galleries" 
        runat="server"></asp:Literal>
        <!-- 
        <asp:Repeater ID="RepeaterGalleries" runat="server">
        <ItemTemplate><a href="gallery.aspx?f=<%# DataBinder.Eval(Container.DataItem, "URL")%>">&#187; <%# DataBinder.Eval(Container.DataItem, "GalleryName")%></a><br /></ItemTemplate>
        </asp:Repeater>-->
        </span>

</td></tr></table>
<!-- CONTENT TABLE -->
</asp:Content>
