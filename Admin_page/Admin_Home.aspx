<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Admin_page/MasterPage_Admin.master" AutoEventWireup="false" CodeFile="Admin_Home.aspx.vb" Inherits="Views_Admin_page_Admin_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
        <div class="row d-flex mb-5 contact-info" dir="rtl">
          <div class="col-md-12 mb-4">
            <h2 class="h4" align="right">بيانات الشخصية</h2>
          </div>
        
        <div class="row block-12">
          <div class="col-md-6 pr-md-5">
            <div>
              <div class="form-group">
                <asp:TextBox ID="TextBox_Uname" runat="server" class="form-control" placeholder="Your Name" ReadOnly="True"></asp:TextBox>
              </div>
              <div class="form-group">
               <asp:TextBox ID="TextBox_Uemail" runat="server" class="form-control" placeholder="Your Email" ReadOnly="True"></asp:TextBox>
             </div>
              <div class="form-group">
               <asp:TextBox ID="TextBox_pass" runat="server" class="form-control" placeholder="ادخل كلمة المرور القديمة"></asp:TextBox>
              </div>
              <div class="form-group">
                <asp:TextBox ID="TextBox_newPass" runat="server" class="form-control" placeholder="تعيين كلمة مرور جديدة"></asp:TextBox>
               </div>
               <div class="form-group">
                <asp:TextBox ID="TextBox_ConfPass" runat="server" class="form-control" placeholder="تأكيد كلمة المرور"></asp:TextBox>
               </div>
              <div class="form-group">
              <asp:Button ID="Button1" runat="server" Text="حفظ التعديلات" class="btn btn-primary py-3 px-5" />
               <br />
               <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                </div>
            </div>
          
          </div>
           <div class="col-md-1 pr-md-2" >
           &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
           </div>

          <div class="col-md-5 pr-md-4" >
          <img src="../images/admihome.jpeg" width="500" height="450" />
          </div>
        </div>
      </div>
</asp:Content>

