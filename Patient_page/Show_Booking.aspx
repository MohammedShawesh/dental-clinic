<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Patient_page/MasterPage_Patient.master" AutoEventWireup="false" CodeFile="Show_Booking.aspx.vb" Inherits="Views_Patient_page_Show_Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container" dir="rtl">
        <div class="row d-flex mb-5 contact-info">
          </div>
         
         <div class="col-md-6">
          <table>
          <tr>
          <td> &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </td>
          <td> <asp:TextBox ID="TextBox_search" runat="server" class="form-control" placeholder="ادخل اليوم\الفترة" MaxLength="14"></asp:TextBox>  </td>
          <td> <asp:Button ID="Button_show" runat="server" Text="عرض البيانات" class="btn btn-primary py-3 px-5" />  </td>
         </tr>
          </table>
          <br />
          </div>

        <div class="row block-12">
          <div class="col-md-6 pr-md-5">
           
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                  DataKeyNames="appointmentNum" DataSourceID="SqlDataSource1" GridLines="None" 
                  Width="800px" >
        <Columns>
            <asp:BoundField DataField="appointmentNum" HeaderText="رقم الموعد" 
                ReadOnly="True" SortExpression="appointmentNum" />
            <asp:BoundField DataField="Day" HeaderText="اليوم" SortExpression="Day" />
            <asp:BoundField DataField="Time" HeaderText="التوقيت" SortExpression="Time" />
            <asp:BoundField DataField="Period" HeaderText="الفترة" 
                SortExpression="Period" />
            <asp:BoundField DataField="DoctorName" HeaderText="اسم الطبيب" 
                SortExpression="DoctorName" />
            <asp:BoundField DataField="ClinicNum" HeaderText="رقم الغرفة" 
                SortExpression="ClinicNum" />
            <asp:BoundField DataField="Specialization" HeaderText="التخصص" 
                SortExpression="Specialization" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("appointmentNum","~/Views/Patient_page/Booking.aspx?id={0}") %>'>حجز موعد</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
              <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
                  
                  
                  SelectCommand="SELECT Schedule.appointmentNum, Schedule.Day, Schedule.Time, Schedule.Period, Schedule.DoctPhone, Schedule.ClinicNum, Doctor.DoctorName, specialty.Specialization FROM Schedule INNER JOIN Doctor ON Schedule.DoctPhone = Doctor.DoctPhone INNER JOIN specialty ON Doctor.Specialization = specialty.Specialization"></asp:SqlDataSource>

                          
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                  DataKeyNames="appointmentNum" DataSourceID="SqlDataSource2" GridLines="None" 
                  Width="800px" Visible="False">
        <Columns>
            <asp:BoundField DataField="appointmentNum" HeaderText="رقم الموعد" 
                ReadOnly="True" SortExpression="appointmentNum" />
            <asp:BoundField DataField="Day" HeaderText="اليوم" SortExpression="Day" />
            <asp:BoundField DataField="Time" HeaderText="التوقيت" SortExpression="Time" />
            <asp:BoundField DataField="Period" HeaderText="الفترة" 
                SortExpression="Period" />
            <asp:BoundField DataField="DoctorName" HeaderText="اسم الطبيب" 
                SortExpression="DoctorName" />
            <asp:BoundField DataField="ClinicNum" HeaderText="رقم الغرفة" 
                SortExpression="ClinicNum" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("appointmentNum","~/Views/Patient_page/Booking.aspx?id={0}") %>'>حجز موعد</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>

    </asp:GridView>
              <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                  ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
                  
                  
                  SelectCommand="SELECT Schedule.appointmentNum, Schedule.Day, Schedule.Time, Schedule.Period, Schedule.DoctPhone, Schedule.ClinicNum, Doctor.DoctorName FROM Schedule INNER JOIN Doctor ON Schedule.DoctPhone = Doctor.DoctPhone WHERE (Schedule.Day = @d ) OR (Schedule.Period = @p)">
                  <SelectParameters>
                      <asp:ControlParameter ControlID="TextBox_search" Name="d" PropertyName="Text" />
                      <asp:ControlParameter ControlID="TextBox_search" Name="p" PropertyName="Text" />
                  </SelectParameters>
              </asp:SqlDataSource>
            </div>
          </div>

           <div class="col-md-1 pr-md-2" >
           &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
          
           </div>

          <div class="col-md-5 pr-md-4" >
         
                      
          </div>
        </div>
</asp:Content>

