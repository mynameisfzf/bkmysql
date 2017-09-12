Public Class Form1
    Dim host As String
    Dim user As String
    Dim paw As String
    Dim dbname As String


    Dim sql As mysqldbX
    Dim ckstr As String = ""
    Dim ckname As String = ""
    Dim dcfilename As String = ""

    Dim dctm As Date

    Dim nextbktim As Integer = 0
    Const BKTIME As Integer = 24 * 60 * 60
    Dim bkwjj As String = ""

    Private Sub Form1_FormClosing(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles MyBase.FormClosing

        If e.CloseReason = CloseReason.UserClosing Then
            e.Cancel = True
            Me.Hide()
        Else

        End If
    End Sub

    Sub wrini()
        Dim inif As String = bkwjj & "config.ini"
        Dim tt As String = "[backup mysql]" & vbCrLf & "time=" & Now.ToString & vbCrLf & "host=" & iptext.Text.Trim & vbCrLf &
                             "user=" & ustext.Text.Trim & vbCrLf & vbCrLf & "database=" & dbtext.Text.Trim

        IO.File.WriteAllText(inif, tt)

    End Sub

    Sub rdini()
        Dim inif As String = bkwjj & "config.ini"
        If IO.File.Exists(inif) Then
            Dim rdf() As String = IO.File.ReadAllLines(inif)
            If rdf.Count > 0 Then
                For Each tt As String In rdf
                    tt = tt.Trim
                    If tt.StartsWith("host=") Then
                        iptext.Text = tt.Substring(5)
                    End If
                    If tt.StartsWith("user=") Then
                        ustext.Text = tt.Substring(5)
                    End If
                    If tt.StartsWith("password=") Then
                        pwtext.Text = tt.Substring(9)
                    End If
                    If tt.StartsWith("database=") Then
                        dbtext.Text = tt.Substring(9)
                    End If
                Next
            End If
        End If
    End Sub

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        host = ""
        user = ""
        paw = ""
        dbname = ""

        Me.Text = "备份数据库"


        bkwjj = Application.StartupPath
        If bkwjj.EndsWith("\") Then
            bkwjj = bkwjj & "mysql\"
        Else
            bkwjj = bkwjj & "\mysql\"
        End If
        If IO.Directory.Exists(bkwjj) = False Then
            IO.Directory.CreateDirectory(bkwjj)
        End If
        ComboBox2.SelectedIndex = 19

        rdini()
    End Sub
    
    Private Sub bgw_DoWork(ByVal sender As System.Object, ByVal e As System.ComponentModel.DoWorkEventArgs) Handles bgw.DoWork

        If bkmysql() = False Then
            nextbktim = 15 * 60
        End If
    End Sub

    Private Sub bgw_ProgressChanged(ByVal sender As Object, ByVal e As System.ComponentModel.ProgressChangedEventArgs) Handles bgw.ProgressChanged
        ToolStripProgressBar1.Value = e.ProgressPercentage
        If IsNothing(e.UserState) Then
            ToolStripStatusLabel1.Text = "..."
        Else
            'ToolStripStatusLabel1.Text = e.UserState.ToString
            If e.UserState.ToString <> "" Then
                TextBox1.AppendText(Now.ToString & " " & e.UserState.ToString & vbCrLf)
            End If

        End If

    End Sub

    Private Sub bgw_RunWorkerCompleted(ByVal sender As Object, ByVal e As System.ComponentModel.RunWorkerCompletedEventArgs) Handles bgw.RunWorkerCompleted
        'MsgBox("已完成")
        ToolStripProgressBar1.Value = 0
        ToolStripStatusLabel1.Text = "完成"
    End Sub

    Function bkmysql()
        If IO.Directory.Exists(bkwjj) = False Then

            bgw.ReportProgress(10, "没有找到备份文件夹")
            Return False
        End If
        host = iptext.Text
        user = ustext.Text
        paw = pwtext.Text
        dbname = dbtext.Text

        sql = New mysqldbX(host, user, paw, dbname)
        If sql.Testconn Then


            bgw.ReportProgress(50, "数据库可以连接，准备下载备份...")
            If Not bkwjj.EndsWith("\") Then
                bkwjj = bkwjj & "\"
            End If
            Dim f As String = bkwjj & Now.ToString("yyMMdd_HHmmss") & ".sql"
            Dim doscommand As String = "mysqldump -h " & iptext.Text & " -u" & ustext.Text & " -p" & pwtext.Text & " " & dbtext.Text & " >" & """" & f & """"

            Dim pro As Process = New Process
            Dim info As ProcessStartInfo = New ProcessStartInfo
            info.FileName = "cmd.exe"
            info.Arguments = "/C " + doscommand
            info.UseShellExecute = False
            info.RedirectStandardInput = False
            info.RedirectStandardOutput = True
            info.CreateNoWindow = True
            pro.StartInfo = info
            Try
                If pro.Start Then


                    pro.WaitForExit()
                    If IO.File.Exists(f) Then
                        bgw.ReportProgress(80, "已经成功下载备份文件")
                        Return True
                    Else
                        bgw.ReportProgress(80, "下载备份文件没有成功")
                        Return False
                    End If
                End If


            Catch ex As Exception
                MsgBox(ex.Message, 48, "提示")
            Finally
                If Not IsNothing(pro) Then
                    pro.Close()
                End If
                bgw.ReportProgress(100, "")
            End Try
        Else

            bgw.ReportProgress(0, "连接数据库失败，15分钟后再次启动备份进程")
        End If
        Return False
    End Function

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        nextbktim -= 1
        tlabel2.Text = "离下次备份时间还有" & nextbktim & "秒"
        NotifyIcon1.Text = "离下次备份时间还有" & nextbktim & "秒"
        If nextbktim = 0 Then


            If bgw.IsBusy = False Then
                bgw.RunWorkerAsync()
            End If
            nextbktim = BKTIME

        End If
    End Sub

    Private Sub CheckBox1_CheckedChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles CheckBox1.CheckedChanged
        If CheckBox1.Checked Then
            iptext.Enabled = False
            ustext.Enabled = False
            pwtext.Enabled = False
            pttext.Enabled = False
            dbtext.Enabled = False
            wrini()

            If bgw.IsBusy = False Then
                bgw.RunWorkerAsync()
            End If
            Dim tm As Date = New Date(Now.Year, Now.Month, Now.Day, ComboBox2.SelectedIndex, 0, 0)

            nextbktim = (tm - Now).TotalSeconds
            If nextbktim < 0 Then
                nextbktim += 24 * 60 * 60

            End If
            Timer1.Start()
        Else
            iptext.Enabled = True
            ustext.Enabled = True
            pwtext.Enabled = True
            dbtext.Enabled = True
            pttext.Enabled = True
            Timer1.Stop()
        End If
    End Sub

    Private Sub NotifyIcon1_MouseDoubleClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles NotifyIcon1.MouseDoubleClick
        Me.Show()
    End Sub

    Private Sub 显示ToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles 显示ToolStripMenuItem.Click
        Me.Show()
    End Sub

    Private Sub 退出ToolStripMenuItem_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles 退出ToolStripMenuItem.Click
        Application.Exit()
    End Sub

    Private Sub Button2_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Button2.Click
        System.Diagnostics.Process.Start(bkwjj)
    End Sub


End Class
