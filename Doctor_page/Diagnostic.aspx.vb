Imports System.Data

Partial Class Views_Doctor_page_Diagnostic
    Inherits System.Web.UI.Page
    Dim obj As New DiagnosticClass

    Sub Clear_page()
        GridView1.DataBind()
        TextBox_notes.Text = ""
        Button_save.Visible = True
        Button_edit.Visible = False
        Button_delete.Visible = False
    End Sub

    Protected Sub Button_save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_save.Click
      
        If  TextBox_notes.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال الملاحظات"
            TextBox_notes.Focus()
            Exit Sub
        End If
        Dim check As Boolean
        If CheckBox1.Checked = True Then
            check = True
        Else
            check = False
        End If
        obj.add_Diagnostic(DropDownList1.SelectedValue, TextBox_notes.Text, Date.Today, Date.Now.TimeOfDay, Request.QueryString("id"), check)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم اضافة التشخيص بنجاح"
        Clear_page()
    End Sub



    Protected Sub Button_edit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_edit.Click
        If  TextBox_notes.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال الملاحظات"
            TextBox_notes.Focus()
            Exit Sub
        End If

        obj.edit_Diagnostic(TextBox_search.Text, DropDownList1.SelectedValue, TextBox_notes.Text)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم تعديل التشخيص بنجاح"
        Clear_page()
    End Sub

    Protected Sub Button_delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_delete.Click
        obj.delete_Diagnostic(TextBox_search.Text)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم حذف الطبيب بنجاح"
        Clear_page()
    End Sub

    Protected Sub Button_show_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_show.Click
        Dim dt As DataTable = obj.view_Diagnostic(TextBox_search.Text)
        If dt.Rows.Count = 0 Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يوجد خطأ في رقم التشخيص"
            Clear_page()
        Else

            DropDownList1.SelectedValue = dt.Rows(0).Item("diagnosisType")
            TextBox_notes.Text = dt.Rows(0).Item("notes")
            Button_save.Visible = False
            Button_edit.Visible = True
            Button_delete.Visible = True
        End If
    End Sub
End Class
