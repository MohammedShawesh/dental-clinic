Imports System.Data

Partial Class Views_Admin_page_Admin_Home
    Inherits System.Web.UI.Page
    Dim obj As New UsersClass

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If IsNothing(Session("User_name")) = True Then
            Response.Redirect("~/Views/Login.aspx")
        End If
        TextBox_Uname.Text = Session("User_name")
        Dim dt As DataTable = Obj.login(Session("User_name"))
        TextBox_Uemail.Text = dt.Rows(0).Item("e_mail")
        Session("Old_pass") = dt.Rows(0).Item("Password")

    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        If TextBox_pass.Text = Session("Old_pass") Then
            obj.edit_Users(Session("User_name"), TextBox_newPass.Text)
            If TextBox_ConfPass.Text <> TextBox_newPass.Text Then
                Label1.Visible = True
                Label1.ForeColor = Drawing.Color.Red
                Label1.Text = "عذرا يجب مطابقة كلمة المرور  "
                TextBox_ConfPass.Focus()
                Exit Sub
            Else
                Label1.Visible = True
                Label1.ForeColor = Drawing.Color.Green
                Label1.Text = "تم تغيير كلمة المرور بنجاح"
                TextBox_ConfPass.Focus()
            End If
        Else
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "عذرا يوجد خطأ في كلمة المرور القديمة "
            TextBox_pass.Focus()
        End If
    End Sub
End Class
