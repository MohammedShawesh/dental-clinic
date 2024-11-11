Imports System.Data

Partial Class Views_Patient_page_Delandedit_Comment
    Inherits System.Web.UI.Page

    Dim obj As New CommentClass
    Sub clear_page()
        GridView1.DataBind()
        TextBox_text.Text = ""
        TextBox_cnum.Text = ""
    End Sub

    Protected Sub Button_show_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_show.Click
        Dim dt As DataTable = obj.show_Comment(TextBox_search.Text)
        If dt.Rows.Count = 0 Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "لا يوجد تعليق بهذا الرقم"
            clear_page()
        Else
            TextBox_text.Text = dt.Rows(0).Item("Text")
            TextBox_cnum.Text = dt.Rows(0).Item("commentNum")
            Button_edit.Visible = True
            Button_delete.Visible = True
        End If
    End Sub

    Protected Sub Button_edit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_edit.Click
        If TextBox_text.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال التعليق"
            TextBox_text.Focus()
            Exit Sub
        End If

        obj.edit_Comment(TextBox_cnum.Text, TextBox_text.Text)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم تعديل التعليق"
        clear_page()
    End Sub

    Protected Sub Button_delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_delete.Click
        obj.delete_Comment(TextBox_cnum.Text)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم حذف التعليق "
        clear_page()
    End Sub

   
End Class
