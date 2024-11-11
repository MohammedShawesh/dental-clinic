
Partial Class Views_Patient_page_MasterPage_Patient
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("Patient_name")) = True Then
            Response.Redirect("~/Views/Login.aspx")
        End If
    End Sub

    Protected Sub Logout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Logout.Click
        Session.RemoveAll()
        Response.Redirect("~/Views/Login.aspx")
    End Sub
End Class

