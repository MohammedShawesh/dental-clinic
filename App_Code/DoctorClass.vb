Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class DoctorClass
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("clinic_con").ConnectionString)

    Function Show_Doctor(ByVal DoctPhone)
        Dim cmd As New SqlCommand("Select * from Doctor where DoctPhone=@DoctPhone ", con)
        cmd.Parameters.AddWithValue("@DoctPhone ", DoctPhone)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function

    Sub add_Doctor(ByVal DoctPhone, ByVal DoctorName, ByVal Age, ByVal Specialization, ByVal Username)

        Dim cmd As New SqlCommand("insert into Doctor (DoctPhone, DoctorName, Age, Specialization, Username)Values(@DoctPhone,@DoctorName,@Age,@Specialization,@Username)", con)
        cmd.Parameters.AddWithValue("@DoctPhone", DoctPhone)
        cmd.Parameters.AddWithValue("@DoctorName", DoctorName)
        cmd.Parameters.AddWithValue("@Age", Age)
        cmd.Parameters.AddWithValue("@Specialization", Specialization)
        cmd.Parameters.AddWithValue("@Username", Username)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Sub edit_Doctor(ByVal DoctPhone, ByVal DoctorName, ByVal Age, ByVal Specialization)

        Dim cmd As New SqlCommand("update Doctor set DoctorName=@DoctorName, Age=@Age, Specialization=@Specialization where DoctPhone=@DoctPhone", con)
        cmd.Parameters.AddWithValue("@DoctPhone", DoctPhone)
        cmd.Parameters.AddWithValue("@DoctorName", DoctorName)
        cmd.Parameters.AddWithValue("@Age", Age)
        cmd.Parameters.AddWithValue("@Specialization", Specialization)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Sub delete_Doctor(ByVal DoctPhone)

        Dim cmd As New SqlCommand("delete from Doctor  where DoctPhone=@DoctPhone", con)
        cmd.Parameters.AddWithValue("@DoctPhone", DoctPhone)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Function show_DoctorData(ByVal Username)
        Dim cmd As New SqlCommand("Select * from Doctor where Username=@Username ", con)
        cmd.Parameters.AddWithValue("@Username ", Username)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function
End Class
