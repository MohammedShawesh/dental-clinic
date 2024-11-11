<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Patient_page/MasterPage_Patient.master" AutoEventWireup="false" CodeFile="Comments.aspx.vb" Inherits="Views_Patient_page_Comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container" dir="rtl">

     <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-2">التشخيصات </h2>
            <p>.........................................................</p>
          </div>
        </div>
        <div class="row">
        
        
        </div>
<asp:DataList ID="DataList1" runat="server" DataKeyField="diagnosticNum" 
              DataSourceID="SqlDataSource1" RepeatColumns="3" 
              RepeatDirection="Horizontal" Width="1000px">
    <ItemTemplate>
        <div class="col-md-12 ftco-animate">
            <div class="blog-entry">
              <a href="Add_Comment.aspx?id=<%# Eval("diagnosticNum") %>" class="block-20" style="background-image: url('../images/person_6.jpg');">
              </a>
              <div class="text d-flex py-4">
                <div class="meta mb-3">
                  <div><a href="#"><%# Eval("diagnoDate") %></a></div>
                  <div><a href="#"><%# Eval("DoctorName") %></a></div>
                  <div><a href="Add_Comment.aspx?id=<%# Eval("diagnosticNum") %>" class="meta-chat"><span class="icon-eye"></span> عرض الصور</a></div>
                </div>
                <div class="desc pl-3">
	                <h3 class="heading"><a href="#"><%# Eval("diagnosisType") %></a></h3>
	              </div>
              </div>
            </div>
          </div>

    </ItemTemplate>
          </asp:DataList>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
              ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
              
              SelectCommand="SELECT Doctor.DoctorName, Diagnostic.diagnoDate, Diagnostic.diagnosisType, Diagnostic.diagnosticNum, Diagnostic.state FROM Diagnostic INNER JOIN AppointmentBooking ON Diagnostic.bookingNum = AppointmentBooking.bookingNum INNER JOIN Schedule ON AppointmentBooking.appointmentNum = Schedule.appointmentNum INNER JOIN Doctor ON Schedule.DoctPhone = Doctor.DoctPhone WHERE (Diagnostic.state = @p1)">
              <SelectParameters>
                  <asp:Parameter DefaultValue="True" Name="p1" />
              </SelectParameters>
          </asp:SqlDataSource>
      </div>
    </section>
    

  </div>
</asp:Content>

