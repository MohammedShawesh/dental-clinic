Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class DiagnosticImagesClass
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("clinic_con").ConnectionString)

    Function view_picture(ByVal diagnosticNum)
        Dim cmd As New SqlCommand("Select * from DiagnosticImages where diagnosticNum=@diagnosticNum ", con)
        cmd.Parameters.AddWithValue("@diagnosticNum ", diagnosticNum)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function

    Sub add_DiagnostIMG(ByVal photo, ByVal state, ByVal diagnosticNum)

        Dim cmd As New SqlCommand("insert into DiagnosticImages (photo, state, diagnosticNum)Values(@photo,@state,@diagnosticNum)", con)
        cmd.Parameters.AddWithValue("@photo", photo)
        cmd.Parameters.AddWithValue("@state", state)
        cmd.Parameters.AddWithValue("@diagnosticNum", diagnosticNum)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
End Class
