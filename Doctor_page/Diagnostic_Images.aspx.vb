Imports System.Data

Partial Class Views_Doctor_page_Diagnostic_Images
    Inherits System.Web.UI.Page
    Dim obj As New DiagnosticImagesClass


    Protected Sub Button_save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_save.Click
        If FileUpload1.HasFile = True Then
            FileUpload1.SaveAs(Server.MapPath("~/Diagnosty_img/") + FileUpload1.FileName)
        Else
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب تحميل صورة"
            Exit Sub
        End If
        Dim check As Boolean
        If CheckBox1.Checked = True Then
            check = True
        Else
            check = False
        End If
        obj.add_DiagnostIMG(FileUpload1.FileName, check, Request.QueryString("id"))
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم اضافة الصورة بنجاح"
    End Sub
End Class
