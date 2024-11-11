<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Doctor_page/MasterPage_Doctor.master" AutoEventWireup="false" CodeFile="View_Booking.aspx.vb" Inherits="Views_Doctor_page_View_Booking" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container" dir="rtl">
       <h6 dir="rtl" align="right">الحجوزات:</h6>
         <br /><br />

        <div class="row block-9">
         
         
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="bookingNum" DataSourceID="SqlDataSource1" GridLines="None" 
                Width="700px" >
        <Columns>
            <asp:BoundField DataField="bookingNum" HeaderText="رقم الحجز" 
                InsertVisible="False" ReadOnly="True" SortExpression="bookingNum" />
            <asp:BoundField DataField="bookingTime" HeaderText="توقيت الحجز" 
                SortExpression="bookingTime" />
            <asp:BoundField DataField="Patient_name" HeaderText="اسم المريض" 
                SortExpression="Patient_name" />
            <asp:BoundField DataField="Period" HeaderText="الفترة" 
                SortExpression="Period" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl='<%# Eval("bookingNum", "~/Views/Doctor_page/Diagnostic.aspx?id={0}") %>'>التشخيص</asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
  
         
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
                
                SelectCommand="SELECT AppointmentBooking.bookingNum, AppointmentBooking.appointmentNum, AppointmentBooking.bookingDate, AppointmentBooking.bookingTime, Schedule.DoctPhone, Patient.Patient_name, Schedule.Period FROM AppointmentBooking INNER JOIN Schedule ON AppointmentBooking.appointmentNum = Schedule.appointmentNum INNER JOIN Patient ON AppointmentBooking.Patient_id = Patient.Patient_id WHERE (Schedule.DoctPhone = @p1) AND (AppointmentBooking.bookingDate = @p2)">
                <SelectParameters>
                    <asp:SessionParameter Name="p1" SessionField="phone" />
                    <asp:SessionParameter Name="p2" SessionField="date_today" />
                </SelectParameters>
            </asp:SqlDataSource>
  
         
        </div>
      </div>
</asp:Content>

