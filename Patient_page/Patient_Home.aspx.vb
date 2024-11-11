Imports System.Data

Partial Class Views_Patient_page_Patient_Home
    Inherits System.Web.UI.Page
    Dim obj As New PatientClass
    Dim obj_U As New UsersClass


    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If IsNothing(Session("Patient_name")) = True Then
            Response.Redirect("~/Views/Login.aspx")
        End If
        TextBox_Uname.Text = Session("Patient_name")
        TextBox_Uemail.Text = Session("e_mail")
        TextBox_pass.Text = Session("password")

        Dim dt As DataTable = obj.show_PatientData(Session("Patient_name"))
        Session("Patient_id") = dt.Rows(0).Item("Patient_id")
        TextBox_Uname.Text = dt.Rows(0).Item("Username")
        TextBox_phone.Text = dt.Rows(0).Item("phoneNumber")
        TextBox_paitName.Text = dt.Rows(0).Item("Patient_name")



    End Sub



    Protected Sub Button_save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_save.Click
        If TextBox_pass.Text = Session("password") Then
            obj_U.edit_Users(Session("Patient_name"), TextBox_newPass.Text)
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
