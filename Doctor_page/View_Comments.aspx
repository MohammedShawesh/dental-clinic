<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Doctor_page/MasterPage_Doctor.master" AutoEventWireup="false" CodeFile="View_Comments.aspx.vb" Inherits="Views_Doctor_page_View_Comments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container" dir="rtl">

     <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <h2 class="mb-2">تعليقات المرضى </h2>
            <p>.........................................................</p>
          </div>
        </div>
        <div class="row">
        <asp:DataList ID="DataList1" runat="server" 
              DataSourceID="SqlDataSource1" RepeatColumns="3" 
              RepeatDirection="Horizontal" Width="1000px">
    <ItemTemplate>
        <div class="col-md-12 ftco-animate">
            <div class="blog-entry">
            
              <img class="block-20" src="../../Diagnosty_img/<%# Eval("photo") %>" />
              
              <div class="text d-flex py-4">
                <div class="meta mb-3">
                  <div><a href="#"><%# Eval("diagnoDate") %></a></div>
                  <div><a href="#"><%# Eval("photoNum")%></a></div>
                  <div><a href="Reply.aspx?photo_id=<%# Eval("photoNum")%>" class="meta-chat"><span class="icon-eye"></span> عرض التعليقات</a></div>
                </div>
                <div class="desc pl-3">
	                <h3 class="heading"><a href="#"><%# Eval("diagnosisType")%></a></h3>
	              </div>
              </div>
            </div>
          </div>

    </ItemTemplate>
          </asp:DataList>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
              ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
              
              
              SelectCommand="SELECT DiagnosticImages.photoNum, DiagnosticImages.photo, DiagnosticImages.state, Diagnostic.diagnoDate, Diagnostic.diagnosisType, Schedule.DoctPhone FROM DiagnosticImages INNER JOIN Diagnostic ON DiagnosticImages.diagnosticNum = Diagnostic.diagnosticNum INNER JOIN AppointmentBooking ON Diagnostic.bookingNum = AppointmentBooking.bookingNum INNER JOIN Schedule ON AppointmentBooking.appointmentNum = Schedule.appointmentNum INNER JOIN Doctor ON Schedule.DoctPhone = Doctor.DoctPhone WHERE (Schedule.DoctPhone = @p1) AND (DiagnosticImages.state = @p2)">
              <SelectParameters>
                  <asp:SessionParameter DefaultValue="" Name="p1" SessionField="phone" />
                  <asp:Parameter DefaultValue="True" Name="p2" />
              </SelectParameters>
          </asp:SqlDataSource>
        
        </div>

      </div>
    </section>
    

  </div>
</asp:Content>

