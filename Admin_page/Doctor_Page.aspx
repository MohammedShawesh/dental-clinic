<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Admin_page/MasterPage_Admin.master" AutoEventWireup="false" CodeFile="Doctor_Page.aspx.vb" Inherits="Views_Admin_page_Doctor_Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container" dir="rtl">
        <div class="row d-flex mb-5 contact-info">
         
        </div>
        <div class="row block-9">
          <div class="col-md-6 pr-md-5">
            <div>
              <div class="form-group">
               <asp:TextBox ID="TextBox_name" runat="server" class="form-control" placeholder="ادخل اسم الطبيب" MaxLength="50"></asp:TextBox>
              </div>
              <div class="form-group">
               <asp:TextBox ID="TextBox_Doctphone" runat="server" class="form-control" placeholder="ادخل رقم الهاتف" MaxLength="14"></asp:TextBox>
              </div>
              <div class="form-group">
               <asp:TextBox ID="TextBox_age" runat="server" class="form-control" placeholder="ادخل عمر الطبيب"></asp:TextBox>
              </div>
              <div class="form-group">
                   <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" 
                       DataSourceID="SqlDataSource2" DataTextField="Specialization" 
                       DataValueField="Specialization">
                       <asp:ListItem></asp:ListItem>
                
                   </asp:DropDownList>
                   <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
                       SelectCommand="SELECT [Specialization] FROM [specialty]">
                   </asp:SqlDataSource>
                 </div>

               <div class="form-group">
               <asp:TextBox ID="TextBox_email" runat="server" class="form-control" placeholder="ادخل البريد الألكتروني " MaxLength="50"></asp:TextBox>
              </div>
              <div class="form-group">
               <asp:TextBox ID="TextBox_pass" runat="server" class="form-control" placeholder="ادخل كلمة المرور" MaxLength="12"></asp:TextBox>
              </div>
              <div class="form-group">
              
        <asp:Button ID="Button_save" runat="server" Text="حفظ البيانات" class="btn btn-primary py-3 px-5" />
         <asp:Button ID="Button_edit" runat="server" Text="تعديل البيانات" class="btn btn-primary py-3 px-5" Visible="False" />
          <asp:Button ID="Button_delete" runat="server" Text="حذف البيانات" class="btn btn-primary py-3 px-5" Visible="False" />
            <br/>
           <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
              </div>
            </div>
          
          </div>

          <div class="col-md-6">
          <table>
          <tr>
          <td> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </td>
          <td> <asp:TextBox ID="TextBox_search" runat="server" class="form-control" placeholder="ادخل رقم الهاتف" MaxLength="14"></asp:TextBox>  </td>
          <td> <asp:Button ID="Button_show" runat="server" Text="عرض البيانات" class="btn btn-primary py-3 px-5" />  </td>
         </tr>
          </table>
          <br />

              <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="DoctPhone" DataSourceID="SqlDataSource1" GridLines="None" 
            Width="600px">
            <Columns>
                <asp:BoundField DataField="DoctPhone" HeaderText="رقم الهاتف" ReadOnly="True" 
                    SortExpression="DoctPhone" />
                <asp:BoundField DataField="DoctorName" HeaderText="اسم الطبيب" 
                    SortExpression="DoctorName" />
                <asp:BoundField DataField="Specialization" HeaderText="التخصص" 
                    SortExpression="Specialization" />
               
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
            SelectCommand="SELECT * FROM [Doctor]"></asp:SqlDataSource>
  
          </div>
        </div>
      </div>
</asp:Content>

