<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Patient_page/MasterPage_Patient.master" AutoEventWireup="false" CodeFile="Delandedit_Comment.aspx.vb" Inherits="Views_Patient_page_Delandedit_Comment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container" dir="rtl">
        <div class="row d-flex mb-5 contact-info">
          <div class="form-group">
               <asp:TextBox ID="TextBox_cnum" runat="server" class="form-control" placeholder="رقم " ReadOnly="True" ></asp:TextBox>
              </div>
          <div class="form-group">
               <asp:TextBox ID="TextBox_text" runat="server" class="form-control" placeholder="التعليق" TextMode="MultiLine"></asp:TextBox>
              </div>
        <div class="form-group">
              <asp:Button ID="Button_edit" runat="server" Text="تعديل التعديل" class="btn btn-primary py-3 px-5" Visible="False" />
              <asp:Button ID="Button_delete" runat="server" Text="حذف التعليق" class="btn btn-primary py-3 px-5"  Visible="False" />
              <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        </div> 
          </div>
       <%--  
         <div class="col-md-6">
        
          </div>
--%>
        <%--<div class="row block-12">--%>
        <div class="col-md-6">
          <table>
           <tr>
          <td> <asp:TextBox ID="TextBox_search" runat="server" class="form-control" placeholder="ادخل رقم التعليق" MaxLength="14"></asp:TextBox>  </td>
          <td> <asp:Button ID="Button_show" runat="server" Text="عرض البيانات" class="btn btn-primary py-3 px-5" />  </td>
         </tr>
          </table>
          <br />
          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="SqlDataSource1" GridLines="None" Width="600px">
            <Columns>
                <asp:BoundField DataField="Text" HeaderText="التعليق" SortExpression="Text" />
                <asp:BoundField DataField="Comme_Date" DataFormatString="{0:d}" 
                    HeaderText="تاريخ التعليق" SortExpression="Comme_Date" />
                <asp:BoundField DataField="commentNum" HeaderText="رقم التعليق" 
                    InsertVisible="False" ReadOnly="True" SortExpression="commentNum" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
            
                
                SelectCommand="SELECT Comment.Text, Comment.Comme_Date, Comment.commentNum, DiagnosticImages.photoNum, Patient.Patient_id FROM Comment INNER JOIN DiagnosticImages ON Comment.photoNum = DiagnosticImages.photoNum INNER JOIN Diagnostic ON DiagnosticImages.diagnosticNum = Diagnostic.diagnosticNum INNER JOIN AppointmentBooking ON Diagnostic.bookingNum = AppointmentBooking.bookingNum INNER JOIN Patient ON AppointmentBooking.Patient_id = Patient.Patient_id WHERE (DiagnosticImages.photoNum = @p2) AND (Patient.Patient_id = @p1)">
            <SelectParameters>
                <asp:QueryStringParameter Name="p2" QueryStringField="photo_id" />
                <asp:SessionParameter Name="p1" SessionField="Patient_id" />
            </SelectParameters>
        </asp:SqlDataSource>
          </div>

       <%--    <div class="col-md-1 pr-md-2" >
           &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
          
           </div>

          <div class="col-md-5 pr-md-4" >
         
                      
          </div>--%>
        </div>
</asp:Content>

