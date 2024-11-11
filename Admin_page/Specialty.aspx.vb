Imports System.Data

Partial Class Views_Admin_page_Specialty
    Inherits System.Web.UI.Page

    Dim obj As New SpecialtyClass
    Sub Clear_page()
        GridView1.DataBind()
        TextBox_specializ.Text = ""
        TextBox_degree.Text = ""
        TextBox_college.Text = ""
        Button_save.Visible = True
        Button_edit.Visible = False
        Button_delete.Visible = False
    End Sub

    Protected Sub Button_save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_save.Click
        If TextBox_specializ.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال اسم التخصص"
            TextBox_specializ.Focus()
            Exit Sub

        ElseIf TextBox_degree.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال الدرجة العلمية"
            TextBox_degree.Focus()
            Exit Sub

        ElseIf TextBox_college.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال الكلية"
            TextBox_college.Focus()
            Exit Sub
        End If

        obj.add_specialty(TextBox_specializ.Text, TextBox_degree.Text, TextBox_college.Text)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم اضافة بنجاح"
        Clear_page()

    End Sub

    Protected Sub Button_show_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_show.Click
        Dim dt As DataTable = obj.Show_specialty(TextBox_search.Text)

        If dt.Rows.Count = 0 Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يوجد خطأ في اسم التخصص"
            Clear_page()
        Else

            TextBox_specializ.Text = dt.Rows(0).Item("Specialization")
            TextBox_degree.Text = dt.Rows(0).Item("scientificDegree")
            TextBox_college.Text = dt.Rows(0).Item("College")
            Button_save.Visible = False
            Button_edit.Visible = True
            Button_delete.Visible = True
        End If
    End Sub

    Protected Sub Button_edit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_edit.Click

        If TextBox_specializ.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال اسم التخصص"
            TextBox_specializ.Focus()
            Exit Sub

        ElseIf TextBox_degree.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال الدرجة العلمية"
            TextBox_degree.Focus()
            Exit Sub

        ElseIf TextBox_college.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال الكلية"
            TextBox_college.Focus()
            Exit Sub
        End If

        obj.edit_specialty(TextBox_specializ.Text, TextBox_degree.Text, TextBox_college.Text)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم تعديل بيانات التخصص بنجاح"
        Clear_page()

    End Sub

    Protected Sub Button_delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_delete.Click
        obj.delete_specialty(TextBox_specializ.Text)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم حذف التخصص بنجاح"
        Clear_page()
    End Sub

End Class
