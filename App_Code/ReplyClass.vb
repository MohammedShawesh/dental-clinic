Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class ReplyClass
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("clinic_con").ConnectionString)

    Function view_reply(ByVal commentNum)
        Dim cmd As New SqlCommand("Select * from Reply where commentNum=@commentNum ", con)
        cmd.Parameters.AddWithValue("@commentNum ", commentNum)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function
    Sub add_reply(ByVal reply, ByVal Datee, ByVal commentNum)

        Dim cmd As New SqlCommand("insert into Reply (reply, Datee, commentNum)Values(@reply,@Date,@commentNum)", con)
        cmd.Parameters.AddWithValue("@reply", reply)
        cmd.Parameters.AddWithValue("@Date", Datee)
        cmd.Parameters.AddWithValue("@commentNum", commentNum)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Sub edit_reply(ByVal replyNum, ByVal reply)
        Dim cmd As New SqlCommand("update Reply set reply=@reply where replyNum=@replyNum", con)
        cmd.Parameters.AddWithValue("@replyNum", replyNum)
        cmd.Parameters.AddWithValue("@reply", reply)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Sub delete_reply(ByVal replyNum)

        Dim cmd As New SqlCommand("delete from Reply  where replyNum=@replyNum", con)
        cmd.Parameters.AddWithValue("@replyNum", replyNum)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
End Class
