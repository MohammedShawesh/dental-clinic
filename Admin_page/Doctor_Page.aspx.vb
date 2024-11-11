Imports System.Data

Partial Class Views_Admin_page_Doctor_Page
    Inherits System.Web.UI.Page

    Dim obj As New DoctorClass
    Dim obj2 As New UsersClass
    Sub Clear_page()
        GridView1.DataBind()
        TextBox_name.Text = ""
        TextBox_Doctphone.Text = ""
        TextBox_age.Text = ""
        TextBox_email.Text = ""
        TextBox_pass.Text = ""
        Button_save.Visible = True
        Button_edit.Visible = False
        Button_delete.Visible = False
    End Sub
    Protected Sub Button_save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_save.Click
        If TextBox_name.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال اسم الطبيب"
            TextBox_name.Focus()
            Exit Sub

        ElseIf TextBox_Doctphone.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال رقم هاتف الطبيب"
            TextBox_Doctphone.Focus()
            Exit Sub


        ElseIf TextBox_age.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال عمر الطبيب"
            TextBox_age.Focus()
            Exit Sub


        ElseIf DropDownList1.SelectedValue = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال تخصص الطبيب"
            DropDownList1.Focus()
            Exit Sub

        ElseIf TextBox_email.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال البريد الالكتروني"
            TextBox_email.Focus()
            Exit Sub

        ElseIf TextBox_pass.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال كلمة المرور"
            TextBox_pass.Focus()
            Exit Sub
        End If

        obj2.add_Users(TextBox_name.Text, TextBox_email.Text, TextBox_pass.Text, "طبيب")
        obj.add_Doctor(TextBox_Doctphone.Text, TextBox_name.Text, TextBox_age.Text, DropDownList1.SelectedValue, TextBox_name.Text)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم اضافة الطبيب بنجاح"
        Clear_page()
      
    End Sub

    Protected Sub Button_show_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_show.Click
        Dim dt As DataTable = obj.Show_Doctor(TextBox_search.Text)
        If dt.Rows.Count = 0 Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يوجد خطأ في رقم هاتف الطبيب"
            Clear_page()
        Else
            TextBox_Doctphone.Text = dt.Rows(0).Item("DoctPhone")
            TextBox_name.Text = dt.Rows(0).Item("DoctorName")
            TextBox_age.Text = dt.Rows(0).Item("Age")
            DropDownList1.SelectedValue = dt.Rows(0).Item("Specialization")
           
            Dim dt2 As DataTable = obj2.Login(dt.Rows(0).Item("Username"))
            TextBox_email.Text = dt2.Rows(0).Item("e_mail")
            TextBox_pass.Text = dt2.Rows(0).Item("Password")
            Button_save.Visible = False
            Button_edit.Visible = True
            Button_delete.Visible = True
        End If

    End Sub

    Protected Sub Button_edit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_edit.Click
        If TextBox_name.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال اسم الطبيب"
            TextBox_name.Focus()
            Exit Sub

        ElseIf TextBox_Doctphone.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال رقم هاتف الطبيب"
            TextBox_Doctphone.Focus()
            Exit Sub


        ElseIf TextBox_age.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال عمر الطبيب"
            TextBox_age.Focus()
            Exit Sub


        ElseIf DropDownList1.SelectedValue = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال تخصص الطبيب"
            DropDownList1.Focus()
            Exit Sub

        ElseIf TextBox_email.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال البريد الالكتروني"
            TextBox_email.Focus()
            Exit Sub

        ElseIf TextBox_pass.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال كلمة المرور"
            TextBox_pass.Focus()
            Exit Sub
        End If

        obj2.edit_Users(TextBox_name.Text, TextBox_pass.Text)
        obj.edit_Doctor(TextBox_Doctphone.Text, TextBox_name.Text, TextBox_age.Text, DropDownList1.SelectedValue)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم تعديل الطبيب بنجاح"
        Clear_page()
    End Sub

    Protected Sub Button_delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_delete.Click

        obj2.delete_Users(TextBox_name.Text)
        obj.delete_Doctor(TextBox_Doctphone.Text)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم حذف الطبيب بنجاح"
    Clear_page()
    End Sub

End Class
