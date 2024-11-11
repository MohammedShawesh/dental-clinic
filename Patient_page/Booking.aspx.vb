
Partial Class Views_Patient_page_Booking
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Dim obj As New AppointmentBookingClass()
        obj.add_Booking(Request.QueryString("id"), Date.Today, Date.Now.TimeOfDay, Session("Patient_id"))
        Response.Redirect("https://docs.google.com/forms/d/e/1FAIpQLSdfxlmTChxAzg6jjE6b1cSK9LuGGEmfW2zjUsPtgAIuB8CNjg/viewform?usp=sf_link")
    End Sub
End Class
