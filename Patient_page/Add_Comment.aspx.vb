
Partial Class Views_Patient_page_Add_Comment
    Inherits System.Web.UI.Page

    Dim obj As New CommentClass

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Session("id") = Request.QueryString("id")
        If IsNothing(Request.QueryString("photo_id")) = True Then
            Button_save.Visible = False
            TextBox_text.Visible = False
        Else
            Button_save.Visible = True
            TextBox_text.Visible = True
        End If
    End Sub

    Protected Sub Button_save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_save.Click

        If TextBox_text.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ارفاق تعليق"
            TextBox_text.Focus()
            Exit Sub
        End If

        obj.add_Comment(Request.QueryString("photo_id"), TextBox_text.Text, Date.Today)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم اضافة تعليق بنجاح"
        GridView1.DataBind()
    End Sub
End Class
