
Partial Class Views_Doctor_page_rep_comm
    Inherits System.Web.UI.Page

    Dim obj As New CommentClass

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Session("poto_id") = Request.QueryString("poto_id")

    End Sub
    Protected Sub Button_send_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_send.Click

        If TextBox_texer.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال الرد"
            TextBox_texer.Focus()
            Exit Sub
        End If

        obj.add_Comment(Request.QueryString("id"), TextBox_texer.Text, Date.Today)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم الرد بنجاح"
    End Sub

   
End Class
