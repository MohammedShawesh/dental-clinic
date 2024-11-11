
Partial Class Views_Doctor_page_Reports
    Inherits System.Web.UI.Page

    Protected Sub Button_show_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button_show.Click
        If RadioButton_file.Checked = False And RadioButton_date.Checked = False And RadioButton_type.Checked = False Then
            Label1.Visible = True
            Label1.ForeColor = Drawing.Color.Red
            Label1.Text = "يجب اختيار طريقة البحث"
            Exit Sub
        End If
        If RadioButton_file.Checked = True Then
            GridView_patient_id.Visible = True
            GridView_patient_id.DataBind()
        Else
            GridView_patient_id.Visible = False
        End If

        If RadioButton_date.Checked = True Then
            GridView_data.Visible = True
            GridView_data.DataBind()
        Else
            GridView_data.Visible = False
        End If

        If RadioButton_type.Checked = True Then
            GridView_type.Visible = True
            GridView_type.DataBind()
        Else
            GridView_type.Visible = False

        End If
    End Sub
End Class
