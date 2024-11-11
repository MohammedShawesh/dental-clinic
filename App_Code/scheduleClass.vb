Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class scheduleClass
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("clinic_con").ConnectionString)
    Function view_schedule(ByVal appointmentNum)
        Dim cmd As New SqlCommand("Select * from Schedule where appointmentNum=@appointmentNum ", con)
        cmd.Parameters.AddWithValue("@appointmentNum ", appointmentNum)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function
    Function view_schedule_DAy(ByVal Day)
        Dim cmd As New SqlCommand("Select * from Schedule where Day=@Day ", con)
        cmd.Parameters.AddWithValue("@Day ", Day)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function
    Function view_schedule_Time(ByVal Time)
        Dim cmd As New SqlCommand("Select * from Schedule where Time=@Time ", con)
        cmd.Parameters.AddWithValue("@Time ", Time)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function
    Function view_schedule_Clinic(ByVal ClinicNum)
        Dim cmd As New SqlCommand("Select * from Schedule where ClinicNum=@ClinicNum ", con)
        cmd.Parameters.AddWithValue("@ClinicNum ", ClinicNum)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function

    Sub add_schedule(ByVal Day, ByVal Time, ByVal Period, ByVal DoctPhone, ByVal ClinicNum)

        Dim cmd As New SqlCommand("insert into Schedule (DAy, Time, Period, DoctPhone, ClinicNum)Values(@Day,@Time,@Period,@DoctPhone,@ClinicNum)", con)
        cmd.Parameters.AddWithValue("@Day", Day)
        cmd.Parameters.AddWithValue("@Time", Time)
        cmd.Parameters.AddWithValue("@Period", Period)
        cmd.Parameters.AddWithValue("@DoctPhone", DoctPhone)
        cmd.Parameters.AddWithValue("@ClinicNum", ClinicNum)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Sub edit_schedule(ByVal DAy, ByVal Time, ByVal Period, ByVal DoctPhone, ByVal ClinicNum)

        Dim cmd As New SqlCommand("update Schedule set DAy=@DAy, Time=@Time, Period=@Period, DoctPhone=@DoctPhone, ClinicNum=@ClinicNum", con)
        cmd.Parameters.AddWithValue("@DAy", DAy)
        cmd.Parameters.AddWithValue("@Time", Time)
        cmd.Parameters.AddWithValue("@Period", Period)
        cmd.Parameters.AddWithValue("@DoctPhone", DoctPhone)
        cmd.Parameters.AddWithValue("@ClinicNum", ClinicNum)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Sub delete_scheduel(ByVal appointmentNum)

        Dim cmd As New SqlCommand("delete from Schedule  where appointmentNum=@appointmentNum", con)
        cmd.Parameters.AddWithValue("@appointmentNum", appointmentNum)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
End Class


