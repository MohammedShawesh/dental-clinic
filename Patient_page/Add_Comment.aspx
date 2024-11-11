<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Patient_page/MasterPage_Patient.master" AutoEventWireup="false" CodeFile="Add_Comment.aspx.vb" Inherits="Views_Patient_page_Add_Comment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
               <img class="block-20" src="../../Diagnosty_img/<%# Eval("photo") %>" />
             
              <div class="text d-flex py-4">
                <div class="meta mb-3"> 
                 <div> <a href="Delandedit_Comment.aspx?photo_id=<%# Eval("photoNum") %>" class="meta-chat"><span class=" icon-eye"></span> رويئه تعليقاتي</a> </div>     
              <div> <a href="Add_Comment.aspx?photo_id=<%# Eval("photoNum") %>" class="meta-chat"><span class="icon-chat"></span> اضافة تعليق</a> </div> 
                  </div>
                <div class="desc pl-3">
	                 </div>
              </div>
            </div>
          </div>

    </ItemTemplate>
          </asp:DataList>
          <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
              ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
              
              
              
              SelectCommand="SELECT photo, diagnosticNum, photoNum, state FROM DiagnosticImages WHERE (diagnosticNum = @p1) AND (state = @p2)">
              <SelectParameters>
                  <asp:SessionParameter DefaultValue="" Name="p1" SessionField="id" />
                  <asp:Parameter DefaultValue="True" Name="p2" />
              </SelectParameters>
          </asp:SqlDataSource>
      </div>
    </section>
    <div class="row" align="center" dir="rtl">
     <div class="col-md-2 ftco-animate">
     </div>
     <div class="col-md-8" align="center" dir="rtl">
     <div class="form-group">
    <asp:TextBox ID="TextBox_text" runat="server" class="form-control" placeholder="اضافة التعليق" TextMode="MultiLine" Visible="False"></asp:TextBox>
     </div>
      <div class="form-group">
              <asp:Button ID="Button_save" runat="server" Text="ارسال التعليق" class="btn btn-primary py-3 px-5" Visible="False" />
               <br />
               <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                </div>
                </div>
                   <div class="col-md-6 pr-md-5">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="commentNum" DataSourceID="SqlDataSource2" GridLines="None" 
                    Width="600px">
            <Columns>
                <asp:BoundField DataField="commentNum" HeaderText="رقم التعليق" 
                    InsertVisible="False" ReadOnly="True" SortExpression="commentNum" />
                <asp:BoundField DataField="Text" HeaderText="التعليق" SortExpression="Text" />
                <asp:BoundField DataField="Comme_Date" HeaderText="التاريخ" 
                    SortExpression="Comme_Date" DataFormatString="{0:d}" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:clinic_con %>" 
            SelectCommand="SELECT * FROM [Comment] WHERE ([photoNum] = @photoNum)">
            <SelectParameters>
                <asp:QueryStringParameter Name="photoNum" QueryStringField="photo_id" 
                    Type="Int32" />
            </SelectParameters>
                </asp:SqlDataSource>
  
            </div>
                 <div class="col-md-2 ftco-animate">
     </div>
                </div>
</asp:Content>

