<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Admin_page/MasterPage_Admin.master" AutoEventWireup="false" CodeFile="Schedule.aspx.vb" Inherits="Views_Admin_page_Schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" dir="rtl">
        <div class="row d-flex mb-5 contact-info">
         
        </div>
        <div class="row block-9">
          <div class="col-md-6 pr-md-5">
            <div>
            <p align="right" style="color: #000000"> <b> انشاء جدول مواعيد </b></p>
            <br /> 
              <div class="form-group">
              <asp:TextBox ID="TextBox_appoint" runat="server" class="form-control" placeholder="ادخل رقم الموعد"></asp:TextBox>
              </div>
              <div class="form-group">
              <asp:TextBox ID="TextBox_Day" runat="server" class="form-control" placeholder="ادخل اليوم" MaxLength="14"></asp:TextBox>
              </div>
              <div class="form-group" dir="ltr">
               <asp:TextBox ID="TextBox_Time" runat="server" class="form-control" placeholder="ادخل التوقيت" TextMode="Time"></asp:TextBox>
              </div>
              <div class="form-group">
              <h6 align="right"> الفترة </h6>
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>الصباحية</asp:ListItem>
            <asp:ListItem>المسائية</asp:ListItem>
        </asp:DropDownList>
                </div>
              <div class="form-group">
               <h6 align="right">اسم الطبيب</h6>
                   <asp:DropDownList ID="DropDownList1" runat="server" class="form-control"
                      DataSourceID="SqlDataSource1" DataTextField="DoctorName" 
                      DataValueField="DoctPhone">
                   </asp:DropDownList>
                  <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                      ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
                      SelectCommand="SELECT [DoctorName], [DoctPhone] FROM [Doctor]">
                  </asp:SqlDataSource>
               </div>
              <div class="form-group">
               <asp:TextBox ID="TextBox_ClinicNum" runat="server" class="form-control" placeholder="ادخل رقم العيادة " MaxLength="50"></asp:TextBox>
              </div>
            
              <div class="form-group">
        <asp:Button ID="Button_save" runat="server" Text="حفظ البيانات" class="btn btn-primary py-3 px-5" />
        <asp:Button ID="Button_edit" runat="server" Text="تعديل البيانات" class="btn btn-primary py-3 px-5"  Visible="False" />
        <asp:Button ID="Button_delete" runat="server" Text="حذف البيانات" class="btn btn-primary py-3 px-5"  Visible="False" />

        <br /> 
              <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
              </div>
            </div>
          </div>

          <div class="col-md-6">
          <table>
          <tr>
          <td> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;  </td>
          <td> <asp:TextBox ID="TextBox_search" runat="server" class="form-control" placeholder=" ادخل رقم الموعد" ></asp:TextBox>  </td>
          <td> <asp:Button ID="Button_show" runat="server" Text="عرض جدول مواعيد " class="btn btn-primary py-3 px-5" />  </td>
         </tr>
          </table>
          <br /> 

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="appointmentNum" DataSourceID="SqlDataSource2" GridLines="None" 
            Width="500px">
            <Columns>
                <asp:BoundField DataField="appointmentNum" HeaderText="رقم الموعد" 
                    InsertVisible="False" ReadOnly="True" SortExpression="appointmentNum" />
                <asp:BoundField DataField="Day" HeaderText="اليوم" SortExpression="Day" />
                <asp:BoundField DataField="Time" HeaderText="التوقيت" SortExpression="Time" />
                <asp:BoundField DataField="Period" HeaderText="الفترة" 
                    SortExpression="Period" />
                <asp:BoundField DataField="DoctPhone" HeaderText="رقم هاتف الطبيب" 
                    SortExpression="DoctPhone" />
                <asp:BoundField DataField="ClinicNum" HeaderText="رقم العيادة" 
                    SortExpression="ClinicNum" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
            SelectCommand="SELECT * FROM [Schedule]"></asp:SqlDataSource>
     

          </div>
        </div>
      </div>

</asp:Content>

