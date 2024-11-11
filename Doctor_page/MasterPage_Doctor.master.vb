
Partial Class Views_Doctor_page_MasterPage_Doctor
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("User_name")) = True Then
            Response.Redirect("~/Views/Login.aspx")
        End If
    End Sub

    Protected Sub Logout_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Logout.Click
        Session.RemoveAll()
        Response.Redirect("~/Views/Login.aspx")
    End Sub
End Class

