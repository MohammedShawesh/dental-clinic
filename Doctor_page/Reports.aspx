<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Doctor_page/MasterPage_Doctor.master" AutoEventWireup="false" CodeFile="Reports.aspx.vb" Inherits="Views_Doctor_page_Reports" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
  <div class="container" dir="rtl">
       
        <div class="row block-9">
         
         <table>
        <tr>
         <td><asp:TextBox ID="TextBox_patient_id" runat="server" class="form-control" placeholder="ادخل ملف المريض"></asp:TextBox></td>
         <td><asp:TextBox ID="TextBox_date" runat="server" class="form-control" TextMode="Date"></asp:TextBox></td>
         <td>
               <asp:DropDownList ID="DropDownList_type" runat="server" class="form-control">
       <asp:ListItem>حشو تجميلي</asp:ListItem>
          <asp:ListItem>حشو ضوئي عميق</asp:ListItem>
          <asp:ListItem>حشو عصب</asp:ListItem>
          <asp:ListItem>اعادة حشو عصب</asp:ListItem>
          <asp:ListItem>حشو زجاجي</asp:ListItem>
          <asp:ListItem>حشو املقم</asp:ListItem>
          <asp:ListItem>تنظيف لثة</asp:ListItem>
          <asp:ListItem>تنظيف جيوب</asp:ListItem>
          <asp:ListItem>تركيبة</asp:ListItem>
          <asp:ListItem>حافظ مسافة للأطفال</asp:ListItem>
          <asp:ListItem>طاقم متحرك كامل</asp:ListItem>
          <asp:ListItem>طاقم متحرك جزئي</asp:ListItem>
          <asp:ListItem>خلع سن لبنية</asp:ListItem>
           <asp:ListItem>خلع</asp:ListItem>
          <asp:ListItem>تقويم اسنان</asp:ListItem>
          <asp:ListItem>خلع بقايا جذور </asp:ListItem>
          <asp:ListItem>خلع سن مدفون</asp:ListItem>
           <asp:ListItem>زراعة اسنان</asp:ListItem>
          <asp:ListItem>زراعة انسجة</asp:ListItem>
    </asp:DropDownList>
      </td>
        </tr>
        <tr>
          <td><asp:RadioButton ID="RadioButton_file" runat="server" Text="تقرير حسب الحالة" GroupName="C" /></td>
          <td><asp:RadioButton ID="RadioButton_date" runat="server" Text="تقرير حسب التاريخ" GroupName="C" /></td>
          <td><asp:RadioButton ID="RadioButton_type" runat="server" Text="تقرير حسب الاجراء" GroupName="C" /></td>
          <td>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</td>
          <td><asp:Button ID="Button_show" runat="server" Text="عرض التقرير" class="btn btn-primary py-3 px-5" /></td>
         <br/>
           <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
        </tr>  
          </table>
   
    <asp:GridView ID="GridView_patient_id" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="Patient_id" DataSourceID="SqlDataSource1" GridLines="None" 
                Width="950px" >
        <Columns>
            <asp:BoundField DataField="Patient_id" HeaderText="Patient_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Patient_id" />
            <asp:BoundField DataField="Patient_name" HeaderText="اسم المريض" 
                SortExpression="Patient_name" />
            <asp:BoundField DataField="phoneNumber" HeaderText="هاتف المريض" 
                SortExpression="phoneNumber" />
            <asp:BoundField DataField="diagnosisType" HeaderText="نوع الاجراء" 
                SortExpression="diagnosisType" />
            <asp:BoundField DataField="notes" HeaderText="الملاحظات" 
                SortExpression="notes" />
            <asp:BoundField DataField="diagnoDate" DataFormatString="{0:d}" 
                HeaderText="تاريخ التشخيص" SortExpression="diagnoDate" />
        </Columns>
    </asp:GridView>
  
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
                   
                SelectCommand="SELECT Patient.Patient_id, Patient.Patient_name, Patient.phoneNumber, Diagnostic.diagnosisType, Diagnostic.notes, Diagnostic.diagnoDate FROM Diagnostic INNER JOIN AppointmentBooking ON Diagnostic.bookingNum = AppointmentBooking.bookingNum INNER JOIN Patient ON AppointmentBooking.Patient_id = Patient.Patient_id WHERE (Patient.Patient_id = @Patient_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox_patient_id" Name="Patient_id" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
  
    <asp:GridView ID="GridView_data" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="diagnosticNum" DataSourceID="SqlDataSource2" GridLines="None" 
                Width="950px" >
        <Columns>
            <asp:BoundField DataField="diagnosticNum" HeaderText="رقم التشخيص" 
                InsertVisible="False" ReadOnly="True" SortExpression="diagnosticNum" />
            <asp:BoundField DataField="diagnosisType" HeaderText="نوع الاجراء" 
                SortExpression="diagnosisType" />
            <asp:BoundField DataField="notes" HeaderText="الملاحظات" 
                SortExpression="notes" />
            <asp:BoundField DataField="diagnoDate" 
                SortExpression="diagnoDate" DataFormatString="{0:d}" 
                HeaderText="تاريخ التشخيص" />
        </Columns>
    </asp:GridView>
  
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
                   
                
                SelectCommand="SELECT * FROM [Diagnostic] WHERE ([diagnoDate] = @diagnoDate)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox_date" Name="diagnoDate" 
                        PropertyName="Text" DbType="Date" />
                </SelectParameters>
            </asp:SqlDataSource>
  
   <asp:GridView ID="GridView_type" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="diagnosticNum" DataSourceID="SqlDataSource3" GridLines="None" 
                Width="950px" >
        <Columns>
            <asp:BoundField DataField="diagnosticNum" HeaderText="رقم التشخيص" 
                InsertVisible="False" ReadOnly="True" SortExpression="diagnosticNum" />
            <asp:BoundField DataField="diagnosisType" HeaderText="نوع الاجراء" 
                SortExpression="diagnosisType" />
            <asp:BoundField DataField="notes" HeaderText="الملاحظات" 
                SortExpression="notes" />
            <asp:BoundField DataField="diagnoDate" HeaderText="تاريخ التشخيص" 
                SortExpression="diagnoDate" DataFormatString="{0:d}" />
        </Columns>
    </asp:GridView>
  
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
                   
                
                SelectCommand="SELECT * FROM [Diagnostic] WHERE ([diagnosisType] = @diagnosisType)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList_type" Name="diagnosisType" 
                        PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
      </div>
</asp:Content>

