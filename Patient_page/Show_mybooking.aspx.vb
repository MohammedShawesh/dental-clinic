Imports System.Data

Partial Class Views_Patient_page_Show_mybooking
    Inherits System.Web.UI.Page
    Dim obj As New AppointmentBookingClass
    Sub clear_page()
        GridView1.DataBind()
        TextBox_appnum.Text = ""
        TextBox_d.Text = ""
        TextBox_time.Text = ""
    End Sub
    Protected Sub Button_show_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_show.Click
        Dim dt As DataTable = obj.show_booking(TextBox_search.Text)
        If dt.Rows.Count = 0 Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "لا يوجد حجز بهذا الرقم"
            clear_page()
        Else
            TextBox_appnum.Text = dt.Rows(0).Item("bookingNum")
            TextBox_d.Text = dt.Rows(0).Item("bookingDate")
            TextBox_time.Text = dt.Rows(0).Item("bookingTime").ToString
            Button_delete.Visible = True
        End If
    End Sub

    Protected Sub Button_delete_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_delete.Click
        obj.delete_Booking(TextBox_appnum.Text)
        Label1.Visible = True
        Label1.ForeColor = Drawing.Color.Green
        Label1.Text = "تم حذف حجز "
        clear_page()
    End Sub
End Class
