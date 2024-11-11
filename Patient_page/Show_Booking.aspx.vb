Imports System.Data

Partial Class Views_Patient_page_Show_Booking
    Inherits System.Web.UI.Page


    Protected Sub Button_show_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_show.Click
        GridView1.DataBind()
        GridView2.DataBind()

        If GridView2.Rows.Count > 0 Then
            GridView1.Visible = False
            GridView2.Visible = True
        Else
            GridView1.Visible = True
            GridView2.Visible = False
        End If
    End Sub
End Class
