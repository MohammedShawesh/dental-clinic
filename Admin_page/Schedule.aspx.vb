Imports System.Data

Partial Class Views_Admin_page_Schedule
    Inherits System.Web.UI.Page

    Dim obj As New scheduleClass
    Sub Clear_page()
        GridView1.DataBind()
        TextBox_Day.Text = ""
        TextBox_Time.Text = ""
        TextBox_ClinicNum.Text = ""
        Button_save.Visible = True
        Button_edit.Visible = False
        Button_delete.Visible = False
    End Sub

    Protected Sub Button_save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_save.Click
        If TextBox_Day.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال اليوم"
            TextBox_Day.Focus()
            Exit Sub
        ElseIf TextBox_Time.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال التوقيت"
            TextBox_Time.Focus()
            Exit Sub
        ElseIf DropDownList2.SelectedIndex = -1 Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال الفترة"
            DropDownList2.Focus()
            Exit Sub
        ElseIf DropDownList1.SelectedIndex = -1 Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب اختيار اسم الطبيب"
            DropDownList1.Focus()
            Exit Sub
        ElseIf TextBox_ClinicNum.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال رقم العيادة  "
            TextBox_ClinicNum.Focus()
            Exit Sub
        End If

        obj.add_schedule(TextBox_Day.Text, TextBox_Time.Text, DropDownList2.SelectedValue, DropDownList1.SelectedValue, TextBox_ClinicNum.Text)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم اضافة بنجاح"
        Clear_page()
    End Sub

    Protected Sub Button_show_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_show.Click
        Dim dt As DataTable = obj.view_schedule(TextBox_search.Text)

        If dt.Rows.Count = 0 Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يوجد خطأ في رقم الموعد"
            Clear_page()
        Else

            TextBox_appoint.Text = dt.Rows(0).Item("appointmentNum")
            TextBox_Day.Text = dt.Rows(0).Item("Day")
            TextBox_Time.Text = dt.Rows(0).Item("Time").ToString
            DropDownList2.SelectedValue = dt.Rows(0).Item("Period")
            DropDownList1.SelectedValue = dt.Rows(0).Item("DoctPhone")
            TextBox_ClinicNum.Text = dt.Rows(0).Item("ClinicNum")
            Button_save.Visible = False
            Button_edit.Visible = True
            Button_delete.Visible = True
        End If
    End Sub

    Protected Sub Button_edit_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_edit.Click
        If TextBox_Day.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال اليوم"
            TextBox_Day.Focus()
            Exit Sub
        ElseIf TextBox_Time.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال التوقيت"
            TextBox_Time.Focus()
            Exit Sub
        ElseIf DropDownList2.SelectedIndex = -1 Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال الفترة"
            DropDownList2.Focus()
            Exit Sub
        ElseIf DropDownList1.SelectedIndex = -1 Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب اختيار اسم الطبيب"
            DropDownList1.Focus()
            Exit Sub
        ElseIf TextBox_ClinicNum.Text = "" Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب ادخال رقم العيادة  "
            TextBox_ClinicNum.Focus()
            Exit Sub
        End If

        obj.edit_schedule(TextBox_Day.Text, TextBox_Time.Text, DropDownList2.SelectedValue, DropDownList1.SelectedValue, TextBox_ClinicNum.Text)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم تعديل جدول المواعيد بنجاح"
        Clear_page()
    End Sub


    Protected Sub Button_delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_delete.Click
        obj.delete_scheduel(TextBox_appoint)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم حذف جدول المواعيد بنجاح"
     Clear_page()
    End Sub

End Class
