Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class SpecialtyClass
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("clinic_con").ConnectionString)

    Function Show_specialty(ByVal Specialization)
        Dim cmd As New SqlCommand("Select * from specialty where Specialization=@Specialization ", con)
        cmd.Parameters.AddWithValue("@Specialization ", Specialization)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function

    Sub add_specialty(ByVal Specialization, ByVal scientificDegree, ByVal College)

        Dim cmd As New SqlCommand("insert into specialty (Specialization, scientificDegree ,College)Values(@Specialization,@scientificDegree,@College)", con)
        cmd.Parameters.AddWithValue("@Specialization", Specialization)
        cmd.Parameters.AddWithValue("@scientificDegree", scientificDegree)
        cmd.Parameters.AddWithValue("@College", College)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Sub edit_specialty(ByVal Specialization, ByVal scientificDegree, ByVal College)

        Dim cmd As New SqlCommand("update specialty set scientificDegree=@scientificDegree, College=@College where Specialization=@Specialization", con)
        cmd.Parameters.AddWithValue("@Specialization", Specialization)
        cmd.Parameters.AddWithValue("@scientificDegree", scientificDegree)
        cmd.Parameters.AddWithValue("@College", College)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Sub delete_specialty(ByVal Specialization)

        Dim cmd As New SqlCommand("delete from specialty  where Specialization=@Specialization", con)
        cmd.Parameters.AddWithValue("@Specialization", Specialization)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub


End Class
