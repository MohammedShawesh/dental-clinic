<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Doctor_page/MasterPage_Doctor.master" AutoEventWireup="false" CodeFile="Diagnostic_Images.aspx.vb" Inherits="Views_Doctor_page_Diagnostic_Images" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container" dir="rtl">

     <div class="form-group">
      <h6 align="right">اختيار صور:</h6>
         <asp:FileUpload ID="FileUpload1" runat="server" class="form-control"/>
     </div>
     <div class="form-group">
    
         <asp:CheckBox ID="CheckBox1" runat="server" Text="السماح بعرض الصور على الموقع" />
     </div>
      <div class="form-group">
     <asp:Button ID="Button_save" runat="server" Text="رفع الصور" class="btn btn-primary py-3 px-5" />
      <br />
      <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
      </div>
  </div>
</asp:Content>

