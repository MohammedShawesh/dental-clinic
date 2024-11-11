Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class AppointmentBookingClass
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("clinic_con").ConnectionString)

    Function view_booking(ByVal bookingDate)
        Dim cmd As New SqlCommand("Select * from AppointmentBooking where bookingDate=@bookingDate ", con)
        cmd.Parameters.AddWithValue("@bookingDate ", bookingDate)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function

    Function show_booking(ByVal bookingNum)
        Dim cmd As New SqlCommand("Select * from AppointmentBooking where bookingNum=@bookingNum ", con)
        cmd.Parameters.AddWithValue("@bookingNum ", bookingNum)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function
    Sub add_Booking(ByVal appointmentNum, ByVal bookingDate, ByVal bookingTime, ByVal Patient_id)

        Dim cmd As New SqlCommand("insert into AppointmentBooking (appointmentNum, bookingDate, bookingTime, Patient_id)Values(@appointmentNum,@bookingDate,@bookingTime,@Patient_id)", con)
        cmd.Parameters.AddWithValue("@appointmentNum", appointmentNum)
        cmd.Parameters.AddWithValue("@bookingDate", bookingDate)
        cmd.Parameters.AddWithValue("@bookingTime", bookingTime)
        cmd.Parameters.AddWithValue("@Patient_id", Patient_id)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Sub edit_Booking(ByVal appointmentNum, ByVal bookingDate, ByVal bookingTime, ByVal Patient_id, ByVal Username)

        Dim cmd As New SqlCommand("update AppointmentBooking set appointmentNum=@appointmentNum, bookingDate=@bookingDate, bookingTime=@bookingTime,Patient_id=@Patient_id where DoctPhone=@DoctPhone", con)
        cmd.Parameters.AddWithValue("@appointmentNum", appointmentNum)
        cmd.Parameters.AddWithValue("@bookingDate", bookingDate)
        cmd.Parameters.AddWithValue("@bookingTime", bookingTime)
        cmd.Parameters.AddWithValue("@Patient_id", Patient_id)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Sub delete_Booking(ByVal bookingNum)

        Dim cmd As New SqlCommand("delete from AppointmentBooking  where bookingNum=@bookingNum", con)
        cmd.Parameters.AddWithValue("@bookingNum", bookingNum)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

End Class
