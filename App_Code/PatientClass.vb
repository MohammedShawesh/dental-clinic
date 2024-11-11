Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class PatientClass
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("clinic_con").ConnectionString)

    Sub add_Patient(ByVal Patient_name, ByVal phoneNumber, ByVal Username)

        Dim cmd As New SqlCommand("insert into Patient ( Patient_name, phoneNumber, Username)Values(@Patient_name,@phoneNumber,@Username)", con)
        cmd.Parameters.AddWithValue("@Patient_name", Patient_name)
        cmd.Parameters.AddWithValue("@phoneNumber", phoneNumber)
        cmd.Parameters.AddWithValue("@Username", Username)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Sub edit_Patient(ByVal Patient_id, ByVal Patient_name, ByVal phoneNumber)

        Dim cmd As New SqlCommand("update Patient set Patient_name=@Patient_name, phoneNumber=@phoneNumber where Patient_id=@Patient_id", con)
        cmd.Parameters.AddWithValue("@Patient_id", Patient_id)
        cmd.Parameters.AddWithValue("@Patient_name", Patient_name)
        cmd.Parameters.AddWithValue("@phoneNumber", phoneNumber)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Sub delete_Patient(ByVal Patient_id)

        Dim cmd As New SqlCommand("delete from Patient  where Patient_id=@Patient_id", con)
        cmd.Parameters.AddWithValue("@Patient_id", Patient_id)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Function show_PatientData(ByVal Username)
        Dim cmd As New SqlCommand("Select * from Patient where Username=@Username ", con)
        cmd.Parameters.AddWithValue("@Username ", Username)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function
End Class
