Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class DiagnosticClass
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("clinic_con").ConnectionString)

    Function view_Diagnostic(ByVal diagnosticNum)
        Dim cmd As New SqlCommand("Select * from Diagnostic where diagnosticNum=@diagnosticNum ", con)
        cmd.Parameters.AddWithValue("@diagnosticNum ", diagnosticNum)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function

    Sub add_Diagnostic(ByVal diagnosisType, ByVal notes, ByVal diagnoDate, ByVal diagnoTime, ByVal bookingNum, ByVal state)

        Dim cmd As New SqlCommand("insert into Diagnostic (diagnosisType, notes, diagnoDate, diagnoTime, bookingNum ,state)Values(@diagnosisType,@notes,@diagnoDate,@diagnoTime,@bookingNum,@state)", con)
        cmd.Parameters.AddWithValue("@diagnosisType", diagnosisType)
        cmd.Parameters.AddWithValue("@notes", notes)
        cmd.Parameters.AddWithValue("@diagnoDate", diagnoDate)
        cmd.Parameters.AddWithValue("@diagnoTime", diagnoTime)
        cmd.Parameters.AddWithValue("@bookingNum", bookingNum)
        cmd.Parameters.AddWithValue("@state", state)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Sub edit_Diagnostic(ByVal diagnosticNum, ByVal diagnosisType, ByVal notes)

        Dim cmd As New SqlCommand("update Diagnostic set diagnosisType=@diagnosisType, notes=@notes where diagnosticNum=@diagnosticNum", con)
        cmd.Parameters.AddWithValue("@diagnosticNum", diagnosticNum)
        cmd.Parameters.AddWithValue("@diagnosisType", diagnosisType)
        cmd.Parameters.AddWithValue("@notes", notes)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Sub delete_Diagnostic(ByVal diagnosticNum)

        Dim cmd As New SqlCommand("delete from Diagnostic  where diagnosticNum=@diagnosticNum", con)
        cmd.Parameters.AddWithValue("@diagnosticNum", diagnosticNum)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
End Class
