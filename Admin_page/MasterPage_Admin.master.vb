
Partial Class Views_Admin_page_MasterPage_Admin
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If IsNothing(Session("User_name")) = True Then
            Response.Redirect("~/Views/Login.aspx")
        End If
    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Session.RemoveAll()
        Response.Redirect("~/Views/Login.aspx")
    End Sub
End Class

