<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Doctor_page/MasterPage_Doctor.master" AutoEventWireup="false" CodeFile="rep_comm.aspx.vb" Inherits="Views_Doctor_page_rep_comm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="col-md-8" align="right" dir="rtl">
     <div class="form-group">
           <div class="form-group" dir="rtl" align="center">
              <asp:TextBox ID="TextBox_texer" runat="server" class="form-control" placeholder=" اضافة الرد" TextMode="MultiLine"></asp:TextBox>
           </div>
  
     </div>
      <div class="form-group" dir="rtl" align="center"> 
        <asp:Button ID="Button_send" runat="server" Text="ارسال الرد" class="btn btn-primary py-3 px-5" />
           <br />
         <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
          </div>
    </div>
</asp:Content>

