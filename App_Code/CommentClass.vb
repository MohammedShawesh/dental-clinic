Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data

Public Class CommentClass
    Dim con As New SqlConnection(ConfigurationManager.ConnectionStrings("clinic_con").ConnectionString)

    Function view_Comment(ByVal photoNum)
        Dim cmd As New SqlCommand("Select * from Comment where photoNum=@photoNum ", con)
        cmd.Parameters.AddWithValue("@photoNum ", photoNum)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function
    Function show_Comment(ByVal commentNum)
        Dim cmd As New SqlCommand("Select * from Comment where commentNum=@commentNum ", con)
        cmd.Parameters.AddWithValue("@commentNum ", commentNum)
        Dim adp As New SqlDataAdapter(cmd)
        Dim dt As New DataTable
        adp.Fill(dt)
        Return dt
    End Function

    Sub add_Comment(ByVal photoNum, ByVal Text, ByVal Comme_Date)

        Dim cmd As New SqlCommand("insert into Comment (photoNum, Text, Comme_Date)Values(@photoNum,@Text,@Comme_Date)", con)
        cmd.Parameters.AddWithValue("@photoNum", photoNum)
        cmd.Parameters.AddWithValue("@Text", Text)
        cmd.Parameters.AddWithValue("@Comme_Date", Comme_Date)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub

    Sub edit_Comment(ByVal commentNum, ByVal Text)
        Dim cmd As New SqlCommand("update Comment set Text=@Text where commentNum=@commentNum", con)
        cmd.Parameters.AddWithValue("@commentNum", commentNum)
        cmd.Parameters.AddWithValue("@Text", Text)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
    Sub delete_Comment(ByVal commentNum)

        Dim cmd As New SqlCommand("delete from Comment  where commentNum=@commentNum", con)
        cmd.Parameters.AddWithValue("@commentNum", commentNum)
        con.Open()
        cmd.ExecuteNonQuery()
        con.Close()
    End Sub
End Class
