<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Doctor_page/MasterPage_Doctor.master" AutoEventWireup="false" CodeFile="Doctor_Home.aspx.vb" Inherits="Views_Doctor_page_Doctor_Home" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container">
        <div class="row d-flex mb-5 contact-info" dir="rtl">
          <div class="col-md-12 mb-4">
            <h2 class="h4" align="right">بيانات الشخصية</h2>
          </div>
        
        <div class="row block-12">
          <div class="col-md-6 pr-md-5">
            <div>
              <div class="form-group">
                <asp:TextBox ID="TextBox_Uname" runat="server" class="form-control" placeholder="Your UserName " ReadOnly="True"></asp:TextBox>
              </div>
              <div class="form-group">
               <asp:TextBox ID="TextBox_Uemail" runat="server" class="form-control" placeholder="Your Email" ReadOnly="True"></asp:TextBox>
             </div>
              <div class="form-group">
               <asp:TextBox ID="TextBox_pass" runat="server" class="form-control" placeholder="ادخل كلمة المرور القديمة" TextMode="Password"></asp:TextBox>
              </div>
              <div class="form-group">
                <asp:TextBox ID="TextBox_newPass" runat="server" class="form-control" placeholder="تعيين كلمة مرور جديدة" TextMode="Password"></asp:TextBox>
               </div>
               <div class="form-group">
                <asp:TextBox ID="TextBox_ConfPass" runat="server" class="form-control" placeholder="تأكيد كلمة المرور" TextMode="Password"></asp:TextBox>
               </div>
               <div class="form-group">
<asp:TextBox ID="TextBox_DocName" runat="server" class="form-control" placeholder=" اسمك"  MaxLength="50"></asp:TextBox>
              </div>
              <div class="form-group">
<asp:TextBox ID="TextBox_age" runat="server" class="form-control" placeholder=" العمر"  MaxLength="50" ReadOnly="True"></asp:TextBox>
              </div>
              <div class="form-group">
<asp:TextBox ID="TextBox_phone" runat="server" class="form-control" placeholder="تعديل رقم الهاتف"  MaxLength="12"></asp:TextBox>
              </div>
              <div class="form-group">
<asp:TextBox ID="TextBox_Specialy" runat="server" class="form-control" placeholder="التخصص"  MaxLength="12" ReadOnly="True"></asp:TextBox>
              </div>
              <div class="form-group">
              <asp:Button ID="Button_save" runat="server" Text="حفظ التعديلات" class="btn btn-primary py-3 px-5" />
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

