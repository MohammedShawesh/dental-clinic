<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Admin_page/MasterPage_Admin.master" AutoEventWireup="false" CodeFile="Specialty.aspx.vb" Inherits="Views_Admin_page_Specialty" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container" dir="rtl">
        <div class="row d-flex mb-5 contact-info">
         
        </div>
        <div class="row block-9">
          <div class="col-md-6 pr-md-5">
            <div>
            <p align="right" style="color: #000000"> <b> التخصصات </b></p>
            <br /> 
              <div class="form-group">
               <asp:TextBox ID="TextBox_specializ" runat="server" class="form-control" placeholder="ادخل تخصص الطبيب" MaxLength="50"></asp:TextBox>
              </div>
              <div class="form-group">
               <asp:TextBox ID="TextBox_degree" runat="server" class="form-control" placeholder="ادخل الدرجة العلمية" MaxLength="50"></asp:TextBox>
              </div>
              <div class="form-group">
               <asp:TextBox ID="TextBox_college" runat="server" class="form-control" placeholder="ادخل اسم الكلية " MaxLength="50"></asp:TextBox>
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
          <td> <asp:TextBox ID="TextBox_search" runat="server" class="form-control" placeholder=" ادخل التخصص" ></asp:TextBox>  </td>
          <td> <asp:Button ID="Button_show" runat="server" Text="عرض التخصصات " class="btn btn-primary py-3 px-5" />  </td>
         </tr>
          </table>
          <br /> 

           
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  
                  DataKeyNames="Specialization" DataSourceID="SqlDataSource1" 
                  GridLines="None" Width="600px">
                <Columns>
                    <asp:BoundField DataField="Specialization" HeaderText="التخصص" ReadOnly="True" 
                        SortExpression="Specialization" />
                    <asp:BoundField DataField="scientificDegree" HeaderText="الدرجة العلمية" 
                        SortExpression="scientificDegree" />
                    <asp:BoundField DataField="College" HeaderText="الكلية" 
                        SortExpression="College" />
                </Columns>
            </asp:GridView>

              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
                  SelectCommand="SELECT * FROM [specialty]"></asp:SqlDataSource>

          </div>
        </div>
      </div>

</asp:Content>

