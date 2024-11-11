<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Doctor_page/MasterPage_Doctor.master" AutoEventWireup="false" CodeFile="Diagnostic.aspx.vb" Inherits="Views_Doctor_page_Diagnostic" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="container" dir="rtl">
        <div class="row d-flex mb-5 contact-info">
         
        </div>
        <div class="row block-9">
          <div class="col-md-6 pr-md-5">
            <div>
          
              <h6 align="right">نوع التشخيص:</h6>
     
              <div class="form-group">
    <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
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
                     </div>
             
              <div class="form-group">
               <asp:TextBox ID="TextBox_notes" runat="server" class="form-control" 
                      placeholder="ملاحظات" TextMode="MultiLine" ></asp:TextBox>
              </div>
              <div class="form-group">
    
         <asp:CheckBox ID="CheckBox1" runat="server" Text="السماح بعرض التشخيص على الموقع" />
     </div>
             
              <div class="form-group">
              <asp:Button ID="Button_save" runat="server" Text="حفظ التشخيص" class="btn btn-primary py-3 px-5" />
              <asp:Button ID="Button_edit" runat="server" Text="تعديل البيانات" class="btn btn-primary py-3 px-5" Visible="False" />
              <asp:Button ID="Button_delete" runat="server" Text="حذف البيانات" class="btn btn-primary py-3 px-5" Visible="False" />
               <br />
               <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
          </div>
            </div>
          
          </div>


      <div class="col-md-6">
          <table>
          <tr>
          <td> &nbsp;  &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; </td>
          <td> <asp:TextBox ID="TextBox_search" runat="server" class="form-control" placeholder="ادخل رقم التشخيص " MaxLength="14"></asp:TextBox>  </td>
          <td> <asp:Button ID="Button_show" runat="server" Text="عرض البيانات" class="btn btn-primary py-3 px-5" />  </td>
         </tr>
          </table>
          <br />

          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
              DataKeyNames="diagnosticNum" DataSourceID="SqlDataSource1" 
              GridLines="None" Width="600px">
              <Columns>
                  <asp:BoundField DataField="diagnosticNum" HeaderText="رقم التشخيص" 
                      InsertVisible="False" ReadOnly="True" SortExpression="diagnosticNum" />
                  <asp:BoundField DataField="diagnosisType" HeaderText="نوع التشخيص" 
                      SortExpression="diagnosisType" />
                  <asp:BoundField DataField="notes" HeaderText="الملاحظات" 
                      SortExpression="notes" />
                  <asp:BoundField DataField="diagnoDate" HeaderText="تاريخ التشخيص" 
                      SortExpression="diagnoDate" DataFormatString="{0:d}" />
                  <asp:TemplateField>
                      <ItemTemplate>
                          <asp:HyperLink ID="HyperLink1" runat="server" 
                              NavigateUrl='<%# Eval("diagnosticNum","~/Views/Doctor_page/Diagnostic_Images.aspx?id={0}") %>'>صور الحالة</asp:HyperLink>
                       
                      </ItemTemplate>
                  </asp:TemplateField>
              </Columns>
          
          </asp:GridView>

          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
              ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
              
              SelectCommand="SELECT * FROM [Diagnostic] WHERE ([bookingNum] = @bookingNum)">
              <SelectParameters>
                  <asp:QueryStringParameter Name="bookingNum" QueryStringField="id" 
                      Type="Int32" />
              </SelectParameters>
          </asp:SqlDataSource>

          </div>
        </div>
      </div>

</asp:Content>

