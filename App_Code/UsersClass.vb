Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class UsersClass
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("clinic_con").ConnectionString)

    Function Login(ByVal Username)
        Dim cmd As New SqlCommand("Select * from Users where Username=@Username ", con)
        cmd.Parameters.AddWithValue("@Username ", Username)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function

    Sub add_Users(ByVal Username, ByVal e_mail, ByVal Password, ByVal Validity)

        Dim cmd As New SqlCommand("insert into Users (Username, e_mail, Password, Validity)Values(@Username,@e_mail,@Password,@Validity)", con)
        cmd.Parameters.AddWithValue("@Username", Username)
        cmd.Parameters.AddWithValue("@e_mail", e_mail)
        cmd.Parameters.AddWithValue("@Password", Password)
        cmd.Parameters.AddWithValue("@Validity", Validity)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Sub edit_Users(ByVal Username, ByVal Password)
        Dim cmd As New SqlCommand("update Users set Password=@Password where Username=@Username", con)
        cmd.Parameters.AddWithValue("@Username", Username)
        cmd.Parameters.AddWithValue("@Password", Password)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Sub delete_Users(ByVal Username)

        Dim cmd As New SqlCommand("delete from Users  where Username=@Username", con)
        cmd.Parameters.AddWithValue("@Username", Username)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
End Class
