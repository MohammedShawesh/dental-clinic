<%@ Page Title="" Language="VB" MasterPageFile="~/Views/Doctor_page/MasterPage_Doctor.master" AutoEventWireup="false" CodeFile="Reply.aspx.vb" Inherits="Views_Doctor_page_Reply" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
            <div align="center" dir="rtl">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataKeyNames="commentNum" DataSourceID="SqlDataSource2" GridLines="None" 
                    Width="200px">
            <Columns>
                <asp:BoundField DataField="Text" HeaderText="التعليق" SortExpression="Text" />
                <asp:BoundField DataField="Comme_Date" DataFormatString="{0:d}" 
                    HeaderText="Comme_Date" SortExpression="Comme_Date" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# Eval("commentNum","~/Views/Doctor_page/rep_comm.aspx?id={0}") %>'>رد</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
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
 
</asp:Content>

