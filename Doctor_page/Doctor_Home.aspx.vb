﻿Imports System.Data

Partial Class Views_Doctor_page_Doctor_Home
    Inherits System.Web.UI.Page
    Dim obj As New DoctorClass
    Dim obj_U As New UsersClass

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If IsNothing(Session("User_name")) = True Then
            Response.Redirect("~/Views/Login.aspx")
        End If
        TextBox_Uname.Text = Session("User_name")
        TextBox_Uemail.Text = Session("e_mail")
        TextBox_pass.Text = Session("password")

        Dim dt As DataTable = obj.show_DoctorData(Session("User_name"))
        TextBox_Uname.Text = dt.Rows(0).Item("Username")
        TextBox_phone.Text = dt.Rows(0).Item("DoctPhone")
        TextBox_DocName.Text = dt.Rows(0).Item("DoctorName")
        TextBox_age.Text = dt.Rows(0).Item("Age")
        TextBox_Specialy.Text = dt.Rows(0).Item("Specialization")
    End Sub

    Protected Sub Button_save_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_save.Click
        If TextBox_pass.Text = Session("password") Then
            obj_U.edit_Users(Session("User_name"), TextBox_newPass.Text)
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