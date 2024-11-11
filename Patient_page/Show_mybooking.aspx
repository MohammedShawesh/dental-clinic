<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Patient_page/MasterPage_Patient.master" AutoEventWireup="false" CodeFile="Show_mybooking.aspx.vb" Inherits="Views_Patient_page_Show_mybooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container" dir="rtl" align="center">
        <div class="row d-flex mb-5 contact-info">
         <div class="form-group">
               <asp:TextBox ID="TextBox_appnum" runat="server" class="form-control" placeholder="رقم الحجز" MaxLength="50" ></asp:TextBox>
              </div>
          <div class="form-group">
               <asp:TextBox ID="TextBox_d" runat="server" class="form-control" placeholder="ثاريخ الحجز" MaxLength="50" ></asp:TextBox>
              </div>
              <div class="form-group">
               <asp:TextBox ID="TextBox_time" runat="server" class="form-control" placeholder="وقت الحجز" MaxLength="50" ></asp:TextBox>
              </div>
       
              <div class="form-group">
  
        <asp:Button ID="Button_delete" runat="server" Text="حذف البيانات" class="btn btn-primary py-3 px-5"  Visible="False" />
      
              <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
              </div> 
          </div>
         
         <div class="col-md-6" >
          <table>
          <tr>
          <td> <asp:TextBox ID="TextBox_search" runat="server" class="form-control" placeholder="ادخل رقم الحجز" MaxLength="14"></asp:TextBox>  </td>
          <td> <asp:Button ID="Button_show" runat="server" Text="عرض البيانات" class="btn btn-primary py-3 px-5" />  </td>
         </tr>
          </table>
          <br />
          </div>

        <div class="row block-12">
          <div class="col-md-6 pr-md-5" align="center">
    
         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="bookingNum" DataSourceID="SqlDataSource1" GridLines="None" 
            Width="600px">
            <Columns>
                <asp:BoundField DataField="bookingNum" HeaderText="bookingNum" 
                    InsertVisible="False" ReadOnly="True" SortExpression="bookingNum" />
                <asp:BoundField DataField="bookingDate" DataFormatString="{0:d}" 
                    HeaderText="bookingDate" SortExpression="bookingDate" />
                <asp:BoundField DataField="Patient_id" HeaderText="Patient_id" 
                    SortExpression="Patient_id" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
            SelectCommand="SELECT * FROM [AppointmentBooking] WHERE ([Patient_id] = @Patient_id)">
            <SelectParameters>
                <asp:SessionParameter Name="Patient_id" SessionField="patient_id" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
          </div>

           <div class="col-md-1 pr-md-2" >
           &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
          
           </div>
         
          </div>
          <div class="col-md-5 pr-md-4" >
         
                   
          </div>
        </div>
         </div>
</asp:Content>

