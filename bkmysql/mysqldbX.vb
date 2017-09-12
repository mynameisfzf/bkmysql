Imports MySql.Data.MySqlClient   'net->mysql.data 4
Public Class mysqldbX
    Property RootHost As String
    Property RootUser As String
    Property RootPaw As String = ""
    Property DataBaseName As String

    Property CreatLog As Boolean = False
    Property LogFile As String = ""
    Dim is_connt As Boolean = False

    Structure conninfo
        Dim connhost As String
        Dim connuser As String
        Dim connpaw As String
        Dim conndb As String
    End Structure

    Sub New(mhost, muser, mpassword, mdb)
        _RootHost = mhost
        _RootUser = muser
        _RootPaw = mpassword
        _DataBaseName = mdb

    End Sub

    Sub New()
        _RootHost = ""
        _RootUser = ""
        _RootPaw = ""
        _DataBaseName = ""
    End Sub

    Sub New(ByVal mconninfo As conninfo)
        _RootHost = mconninfo.connhost
        _RootUser = mconninfo.connuser
        _RootPaw = mconninfo.connpaw
        _DataBaseName = mconninfo.conndb

    End Sub

    Private Function connt() As String

        If String.IsNullOrWhiteSpace(_RootHost) Or String.IsNullOrWhiteSpace(_RootUser) Or String.IsNullOrWhiteSpace(_DataBaseName) Then
            is_connt = False
            MsgBox("数据库连接参数不完整，无法连接数据库", 48, "提示")
            Return ""
        Else
            Dim connstr As String = "host=" & _RootHost & ";database=" & _DataBaseName & ";uid=" & _RootUser & ";pwd=" & _RootPaw & ";charset=utf8;allow zero datetime=true"
            'Dim connstr As String = "data source=" & da & ";database=" & database & ";initial catalog=;integrated security=true"
            'is_connt = testconn(connstr)
            is_connt = True
            Return connstr
        End If
    End Function

    Private Sub xlog(ByVal str As String)
        If _CreatLog = False Then
            Exit Sub
        End If

        Try

            If _LogFile = "" Then
                Dim f As String = Application.StartupPath
                If f.EndsWith("\") Then
                    f = f & "logs"
                Else
                    f = f & "\logs"
                End If

                If Not IO.Directory.Exists(f) Then
                    IO.Directory.CreateDirectory(f)
                End If

                _LogFile = f & "\sqllist.log"

            End If
            If _LogFile.Trim <> "" Then
                Dim sw As IO.StreamWriter = New IO.StreamWriter(_LogFile, IO.FileMode.Append)
                Dim info As String = My.Computer.Name & "[" & getSystemTime() & "]: " & str
                sw.WriteLine(info)
                sw.WriteLine("-----")
                sw.Close()
                sw.Dispose()
            End If


        Catch ex As Exception

        End Try

    End Sub

    Sub updateZeroDate(table As String, col As String)
        '将日期是“0000-00-00”改成“NULL”
        Dim connstr As String = connt()
        If is_connt Then

            Dim cmt As String = "update " & table & " set " & col & "=NULL where " & col & "='0000-00-00'"
            ''*****写入文件
            xlog(cmt)

            Dim conn As MySqlConnection
            Dim cmm As MySqlCommand
            Try
                conn = New MySqlConnection(connstr)
                conn.Open()
                cmm = New MySqlCommand
                cmm.Connection = conn
                cmm.CommandText = cmt
                cmm.ExecuteNonQuery()
                conn.Close()
            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")

            Finally
                cmm = Nothing
                conn = Nothing
            End Try
        End If


    End Sub

    Function selectTB(ByVal table As String, ByVal where As String, ByVal st As Integer, ByVal lt As Integer, ByVal order As String, ByVal ParamArray col() As String) As DataTable
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim zd = "*"
            If col.Count > 0 Then
                If col(0) <> "" Then
                    zd = ""
                    For Each i As String In col
                        If Trim(i).Length > 0 Then
                            zd = zd & i & ","
                        End If
                    Next
                End If
            End If
            If zd.EndsWith(",") Then
                zd = zd.Substring(0, zd.Length - 1)
            End If
            Dim tj As String = ""                    '条件
            If Trim(where).Length > 0 Then
                tj = " where " & where
            End If
            Dim px As String = ""                      '排序
            If order <> "" Then
                px = " order by " & order
            End If
            'order by ckdyh Desc
            Dim gs As String = ""            '个数
            If lt > 0 Then
                If st > 0 Then
                    gs = " limit " & st & "," & lt
                Else
                    gs = " limit 0," & lt
                End If
            End If

            Dim sql As String = "select " & zd & " from " & table & " " & tj & px & gs

            ''*****写入文件
            xlog(sql)

            Dim mydataset As DataSet = New DataSet
            Try
                conn.Open()
                'MsgBox(sql)
                'MsgBox(conn.ConnectionString)
                'Dim sqlcomm As MySqlCommand = New MySqlCommand(sql, conn)

                Dim myadapter As MySqlDataAdapter = New MySqlDataAdapter(sql, conn)
                myadapter.Fill(mydataset)
                conn.Close()
                Return (mydataset.Tables(0))
            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            End Try
        End If
        Return New DataTable
    End Function

    Function selectTB(ByVal table As String, Optional ByVal where As String = "", Optional ByVal st As Integer = 0, Optional ByVal lt As Integer = 0, Optional ByVal order As String = "") As DataTable
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim zd = "*"
            Dim tj As String = ""                    '条件
            If Trim(where).Length > 0 Then
                tj = " where " & where
            End If
            Dim px As String = ""                      '排序
            If order <> "" Then
                px = " order by " & order
            End If
            'order by ckdyh Desc
            Dim gs As String = ""            '个数
            If lt > 0 Then
                If st > 0 Then
                    gs = " limit " & st & "," & lt
                Else
                    gs = " limit 0," & lt
                End If
            End If

            Dim sql As String = "select " & zd & " from " & table & " " & tj & px & gs
            ''*****写入文件
            xlog(sql)

            'MsgBox(sql)
            Dim mydataset As DataSet = New DataSet
            Try
                conn.Open()

                'MsgBox(conn.ConnectionString)
                'Dim sqlcomm As MySqlCommand = New MySqlCommand(sql, conn)

                Dim myadapter As MySqlDataAdapter = New MySqlDataAdapter(sql, conn)
                myadapter.Fill(mydataset)
                conn.Close()
                Return (mydataset.Tables(0))
            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            End Try
        End If
        Return New DataTable
    End Function

    ''' <summary>
    ''' 查询几个表，将数据合并成一个表
    ''' </summary>
    ''' <param name="tblist">要查询的表</param>
    ''' <param name="where">条件</param>
    ''' <param name="st">从第几条开始</param>
    ''' <param name="lt">一共查询几条</param>
    ''' <param name="order">排序</param>
    ''' <param name="unionAll">是否保留重复行</param>
    ''' <param name="col">要显示的字段，排序的字段必须要包含在内</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function selectUnionTB(ByVal tblist As List(Of String), ByVal where As String, ByVal st As Integer, ByVal lt As Integer, ByVal order As String, ByVal unionAll As Boolean, ByVal ParamArray col() As String) As DataTable
        If tblist.Count > 0 Then
            Dim connstr As String = connt()
            If is_connt Then
                Dim conn As MySqlConnection = New MySqlConnection(connstr)
                Dim zd = "*"
                If col.Count > 0 Then
                    If col(0) <> "" Then
                        zd = ""
                        For Each i As String In col
                            If Trim(i).Length > 0 Then
                                zd = zd & i & ","
                            End If
                        Next
                    End If
                End If
                If zd.EndsWith(",") Then
                    zd = zd.Substring(0, zd.Length - 1)
                End If
                Dim tj As String = ""                    '条件
                If Trim(where).Length > 0 Then
                    tj = " where " & where
                End If
                Dim px As String = ""                      '排序
                If order <> "" Then
                    px = "  order by " & order
                End If
                'order by ckdyh Desc
                Dim gs As String = ""            '个数
                If lt > 0 Then
                    If st > 0 Then
                        gs = " limit " & st & "," & lt
                    Else
                        gs = " limit 0," & lt
                    End If
                End If
                Dim un As String = " union "
                If unionAll Then
                    un = " union all "
                End If
                'Dim sql As String = "select " & zd & " from " & table & " " & tj & px & gs
                Dim sql As String = "select * from ( "
                For Each tt As String In tblist
                    sql = sql & "select " & zd & " from " & tt & " " & tj & un
                Next
                sql = sql.Substring(0, sql.Length - un.Length)
                sql = sql & ")t" & px & gs
                'MsgBox(sql)

                ''*****写入文件
                xlog(sql)

                Dim mydataset As DataSet = New DataSet
                Try
                    conn.Open()
                    Dim myadapter As MySqlDataAdapter = New MySqlDataAdapter(sql, conn)
                    myadapter.Fill(mydataset)
                    conn.Close()
                    Return (mydataset.Tables(0))
                Catch ex As Exception
                    MsgBox(Err.Description, 48, "提示")
                End Try
            End If

        End If
        Return New DataTable

    End Function

    ''' <summary>
    ''' 查询几个表，将数据合并成一个表
    ''' </summary>
    ''' <param name="tblist">要查询的表</param>
    ''' <param name="where">条件</param>
    ''' <param name="st">从第几条开始</param>
    ''' <param name="lt">一共查询几条</param>
    ''' <param name="order">排序</param>
    ''' <param name="unionAll">是否删除重复行</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function selectUnionTB(ByVal tblist As List(Of String), Optional ByVal where As String = "", Optional ByVal st As Integer = 0, Optional ByVal lt As Integer = 0, Optional ByVal order As String = "", Optional ByVal unionAll As Boolean = False) As DataTable
        If tblist.Count > 0 Then
            Dim connstr As String = connt()
            If is_connt Then
                Dim conn As MySqlConnection = New MySqlConnection(connstr)
                Dim zd = "*"
                Dim tj As String = ""                    '条件
                If Trim(where).Length > 0 Then
                    tj = " where " & where
                End If
                Dim px As String = ""                      '排序
                If order <> "" Then
                    px = " order  by " & order
                End If
                'order by ckdyh Desc
                Dim gs As String = ""            '个数
                If lt > 0 Then
                    If st > 0 Then
                        gs = " limit " & st & "," & lt
                    Else
                        gs = " limit 0," & lt
                    End If
                End If
                Dim un As String = " union "
                If unionAll Then
                    un = " union all "
                End If
                'Dim sql As String = "select " & zd & " from " & table & " " & tj & px & gs
                Dim sql As String = "select * from ( "
                For Each tt As String In tblist
                    sql = sql & "select " & zd & " from " & tt & " " & tj & un
                Next
                sql = sql.Substring(0, sql.Length - un.Length)
                sql = sql & ")t" & px & gs
                'MsgBox(sql)

                ''*****写入文件
                xlog(sql)

                Dim mydataset As DataSet = New DataSet
                Try
                    conn.Open()
                    Dim myadapter As MySqlDataAdapter = New MySqlDataAdapter(sql, conn)
                    myadapter.Fill(mydataset)
                    conn.Close()
                    Return (mydataset.Tables(0))
                Catch ex As Exception
                    MsgBox(Err.Description, 48, "提示")
                End Try
            End If

        End If
        Return New DataTable

    End Function

    Function distinct(ByVal table As String, ByVal where As String, ByVal st As Integer, ByVal lt As Integer, ByVal order As String, ByVal onecol As String, ByVal ParamArray col() As String) As DataTable
        '查找onecol中规定的不重复项
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim zd = "*"
            If col.Count > 0 Then
                If col(0) <> "" Then
                    zd = ""
                    For Each i As String In col
                        If Trim(i).Length > 0 Then
                            zd = zd & i & ","
                        End If
                    Next
                End If
            End If
            If zd.EndsWith(",") Then
                zd = zd.Substring(0, zd.Length - 1)
            End If
            Dim tj As String = ""                    '条件
            If Trim(where).Length > 0 Then
                tj = " where " & where
            End If
            Dim px As String = ""                      '排序
            If order <> "" Then
                px = " order by " & order
            End If
            'order by ckdyh Desc
            Dim gs As String = ""            '个数
            If lt > 0 Then
                If st > 0 Then
                    gs = " limit " & st & "," & lt
                Else
                    gs = " limit 0," & lt
                End If
            End If

            Dim sql As String = "select " & zd & ",count( distinct " & onecol & ") from " & table & tj & " group by  " & onecol & px & gs
            Dim mydataset As DataSet = New DataSet
            ''*****写入文件
            xlog(sql)

            Try
                conn.Open()
                'MsgBox(sql)
                'MsgBox(conn.ConnectionString)
                Dim myadapter As MySqlDataAdapter = New MySqlDataAdapter(sql, conn)
                myadapter.Fill(mydataset)
                conn.Close()
                Return (mydataset.Tables(0))
            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            End Try
        End If
        Return New DataTable

    End Function

    Function distinct(ByVal table As String, ByVal where As String, ByVal st As Integer, ByVal lt As Integer, ByVal order As String, ByVal onecol As String) As DataTable
        '查找onecol中规定的不重复项
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim zd = "*"
            Dim tj As String = ""                    '条件
            If Trim(where).Length > 0 Then
                tj = " where " & where
            End If
            Dim px As String = ""                      '排序
            If order <> "" Then
                px = " order by " & order
            End If
            'order by ckdyh Desc
            Dim gs As String = ""            '个数
            If lt > 0 Then
                If st > 0 Then
                    gs = " limit " & st & "," & lt
                Else
                    gs = " limit 0," & lt
                End If
            End If

            Dim sql As String = "select " & zd & ",count( distinct " & onecol & ") from " & table & tj & "  group by  " & onecol & px & gs
            Dim mydataset As DataSet = New DataSet

            ''*****写入文件
            xlog(sql)

            Try
                conn.Open()
                'MsgBox(sql)
                'MsgBox(conn.ConnectionString)
                Dim myadapter As MySqlDataAdapter = New MySqlDataAdapter(sql, conn)
                myadapter.Fill(mydataset)
                conn.Close()
                Return (mydataset.Tables(0))
            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            End Try
        End If
        Return New DataTable

    End Function

    Function selectCount(ByVal table As String, ByVal where As String) As Integer
        Dim va As Integer = 0
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)

            Dim sqlstr As String = "select count(*) from " & table & " where " & where
            Dim mydataset As DataSet = New DataSet
            ''*****写入文件
            xlog(sqlstr)

            Try
                conn.Open()
                Dim myadapter As MySqlDataAdapter = New MySqlDataAdapter(sqlstr, conn)
                myadapter.Fill(mydataset)
                conn.Close()
                va = mydataset.Tables(0).Rows(0)(0).ToString
            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            Finally
                conn = Nothing
            End Try

        End If
        Return va
    End Function

    Function selectSum(ByVal table As String, ByVal zd As String, ByVal where As String) As Double
        Dim va As Double = 0
        Dim connstr As String = connt()
        If is_connt Then

            Dim conn As MySqlConnection = New MySqlConnection(connstr)

            Dim sqlstr As String = "select sum(" & zd & ") from " & table & " where " & where
            Dim mydataset As DataSet = New DataSet
            ''*****写入文件
            xlog(sqlstr)


            Try
                conn.Open()
                Dim myadapter As MySqlDataAdapter = New MySqlDataAdapter(sqlstr, conn)
                myadapter.Fill(mydataset)
                conn.Close()

                Dim vva As String = mydataset.Tables(0).Rows(0)(0).ToString
                If vva.Trim = "" Then
                    va = 0
                Else
                    va = CSng(vva)
                End If
            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            Finally
                conn = Nothing
            End Try


        End If
        Return va
    End Function

    Function insert(ByVal table As String, ByVal col As List(Of String), ByVal val As List(Of String)) As Boolean
        Dim sa As Boolean = False
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim cmm As MySqlCommand
            Dim sqlstr As String = "insert into " & table & "("
            For Each c As String In col
                sqlstr = sqlstr & c & ","
            Next
            If sqlstr.EndsWith(",") Then
                sqlstr = sqlstr.Substring(0, sqlstr.Length - 1)
            End If
            sqlstr = sqlstr & ") values ("
            For Each v As String In val
                sqlstr = sqlstr & "'" & v & "',"
            Next
            If sqlstr.EndsWith(",") Then
                sqlstr = sqlstr.Substring(0, sqlstr.Length - 1)
            End If
            sqlstr = sqlstr & ")"

            ''*****写入文件
            xlog(sqlstr)


            Try
                conn.Open()
                cmm = New MySqlCommand
                cmm.Connection = conn
                cmm.CommandText = sqlstr
                If cmm.ExecuteNonQuery() > 0 Then
                    sa = True
                Else
                    sa = False
                End If

            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            Finally
                conn.Close()
                cmm = Nothing
                conn = Nothing
            End Try

        End If

        Return sa

    End Function

    Function insert(ByVal table As String, ByVal val As List(Of String)) As Boolean
        Dim sa As Boolean = False
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim cmm As MySqlCommand
            Dim sqlstr As String = "insert into " & table
            'For Each c As String In col
            '    sqlstr = sqlstr & c & ","
            'Next
            'If sqlstr.EndsWith(",") Then
            '    sqlstr = sqlstr.Substring(0, sqlstr.Length - 1)
            'End If
            sqlstr = sqlstr & " values ("
            For Each v As String In val
                sqlstr = sqlstr & "'" & v & "',"
            Next
            If sqlstr.EndsWith(",") Then
                sqlstr = sqlstr.Substring(0, sqlstr.Length - 1)
            End If
            sqlstr = sqlstr & ")"

            ''*****写入文件
            xlog(sqlstr)


            Try
                conn.Open()
                cmm = New MySqlCommand
                cmm.Connection = conn
                cmm.CommandText = sqlstr
                If cmm.ExecuteNonQuery() > 0 Then
                    sa = True
                Else
                    sa = False
                End If

            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            Finally
                conn.Close()
                cmm = Nothing
                conn = Nothing
            End Try

        End If

        Return sa

    End Function

    Function update(table As String, col As String, val As String, where As String) As Boolean
        Dim sa As Boolean = False
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim cmm As MySqlCommand
            Dim sqlstr As String = "update " & table & " set " & col & "='" & val & "'"
            If where.Trim <> "" Then
                sqlstr = sqlstr & "  where " & where
            End If

            ''*****写入文件
            xlog(sqlstr)


            Try
                conn.Open()
                cmm = New MySqlCommand
                cmm.Connection = conn
                cmm.CommandText = sqlstr
                If cmm.ExecuteNonQuery() > 0 Then
                    sa = True
                Else
                    sa = False
                End If

            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            Finally
                conn.Close()
                cmm = Nothing
                conn = Nothing
            End Try

        End If
        Return sa
    End Function

    Function updateNULL(ByVal table As String, ByVal col As String, ByVal where As String) As Boolean
        Dim sa As Boolean = False
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim cmm As MySqlCommand
            Dim sqlstr As String = "update " & table & " set " & col & "=NULL"
            If where.Trim <> "" Then
                sqlstr = sqlstr & "  where " & where
            End If

            ''*****写入文件
            xlog(sqlstr)


            Try
                conn.Open()
                cmm = New MySqlCommand
                cmm.Connection = conn
                cmm.CommandText = sqlstr
                If cmm.ExecuteNonQuery() > 0 Then
                    sa = True
                Else
                    sa = False
                End If

            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            Finally
                conn.Close()
                cmm = Nothing
                conn = Nothing
            End Try

        End If
        Return sa
    End Function

    Function update(table As String, col As List(Of String), val As List(Of String), where As String) As Boolean
        Dim sa As Boolean = False
        Dim connstr As String = connt()
        If is_connt And (col.Count > 0) And (col.Count = val.Count) Then

            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim cmm As MySqlCommand
            Dim sqlstr As String = "update " & table & " set "
            Dim ii As Integer = 0
            For Each tt As String In col
                sqlstr &= tt & "='" & val(ii) & "',"
                ii += 1
            Next
            If sqlstr.EndsWith(",") Then
                sqlstr = sqlstr.Substring(0, sqlstr.Length - 1)
            End If
            If where.Trim <> "" Then
                sqlstr &= " where " & where
            End If

            ''*****写入文件
            xlog(sqlstr)

            Try
                conn.Open()
                cmm = New MySqlCommand
                cmm.Connection = conn
                cmm.CommandText = sqlstr
                If cmm.ExecuteNonQuery() > 0 Then
                    sa = True
                Else
                    sa = False
                End If

            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            Finally
                conn.Close()
                cmm = Nothing
                conn = Nothing
            End Try
        Else
            MsgBox("没明要更新的字段，或者要更新的字段和值不匹配。", 48, "错误")

        End If
        Return sa
    End Function

    Function updateImage(ByVal table As String, ByVal col As String, ByVal where As String, ByVal ParamArray bf() As Byte) As Boolean

        Dim sa As Boolean = False
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim cmm As MySqlCommand
            Dim sqlstr As String = "update " & table & " set " & col & "=@image"
            If where.Trim <> "" Then
                sqlstr = sqlstr & "  where " & where
            End If

            ''*****写入文件
            xlog(sqlstr)

            Try
                conn.Open()
                cmm = New MySqlCommand
                cmm.Connection = conn
                cmm.CommandText = sqlstr
                cmm.Parameters.AddWithValue("@image", bf)
                If cmm.ExecuteNonQuery() > 0 Then
                    sa = True
                Else
                    sa = False
                End If

            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            Finally
                conn.Close()
                cmm = Nothing
                conn = Nothing
            End Try

        End If
        Return sa

    End Function

    Function ColoumnMaxValue(ByVal table As String, ByVal col As String, Optional ByVal tj As String = "") As String
        Dim va As String = ""
        If (col.Trim <> "") And (table.Trim <> "") Then
            Dim ttb As DataTable = selectTB(table, tj, 0, 1, col & " Desc", New String() {col})
            If ttb.Rows.Count > 0 Then
                va = ttb.Rows(0)(0).ToString
            End If
        End If

        Return va
    End Function

    Function ColoumnMinValue(ByVal table As String, ByVal col As String, Optional ByVal tj As String = "") As String
        Dim va As String = ""
        If (col.Trim <> "") And (table.Trim <> "") Then
            Dim ttb As DataTable = selectTB(table, tj, 0, 1, col & " Asc", New String() {col})
            If ttb.Rows.Count > 0 Then
                va = ttb.Rows(0)(0).ToString
            End If
        End If

        Return va
    End Function

    Function query(ByVal sqlstr As String) As Boolean
        Dim sa As Boolean = False
        Dim connstr As String = connt()
        ''*****写入文件
        xlog(sqlstr)

        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim cmm As MySqlCommand
            Try

                conn.Open()
                cmm = New MySqlCommand
                cmm.Connection = conn
                cmm.CommandText = sqlstr
                If cmm.ExecuteNonQuery > 0 Then
                    sa = True
                End If

            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            Finally
                conn.Close()
                cmm = Nothing
                conn = Nothing
            End Try
        End If

        Return sa


    End Function

    Function CreateTable(ByVal tablename As String, ByVal priamrykey As Integer, collate As String, ByVal ParamArray column() As String) As Boolean
        ' 创建表

        '二进制数据包括 Binary、Varbinary 和 Image. 
        '字符数据的类型包括 Char，Varchar 和 Text。
        'Unicode 数据类型包括 Nchar,Nvarchar 和Ntext
        '日期和时间数据类型包括 Datetime 和 Smalldatetime 两种类型。
        '整数存储的数据类型是 Int，Smallint 和 Tinyint
        '精确小数数据在 SQL Server 中的数据类型是 Decimal(p[,s]) 和 Numeric(p[,s]), p--有效位数，s--小数位数。
        '近似小数数据的数据类型是 Float 和 Real
        '货币数据表示正的或者负的货币数量 。在 Microsoft SQL Server 中，货币数据的数据类型是Money 和 Smallmoney
        '特殊数据类型包括前面没有提过的数据类型。特殊的数据类型有3种，即 Timestamp、Bit 和 Uniqueidentifier。 
        'Timestamp 用于表示SQL Server 活动的先后顺序，以二进投影的格式表示。Timestamp 数据与插入数据或者日期和时间没有关系。 
        'Bit 由 1 或者 0 组成。当表示真或者假、ON 或者 OFF 时，使用 Bit 数据类型。例如，询问是否是每一次访问的客户机请求可以存储在这种数据类型的列中。 
        'Uniqueidentifier 由 16 字节的十六进制数字组成，表示一个全局唯一的。当表的记录行要求唯一时，GUID是非常有用。例如，在客户标识号列使用这种数据类型可以区别不同的客户。 
        '单精度浮点数据类型float或real。


        '参数数组第一个为字段名,第二个为数据类型,第三个如果为"n",则约束为"not null",否则为"null"
        '主键字段从第0个字段开始
        Dim rv As Boolean = False
        Dim connstr As String = connt()
        If is_connt Then
            Dim ubm As String
            If collate = "" Then
                ubm = " collate  utf8_unicode_ci"
            Else
                ubm = " collate " & collate
            End If

            Dim conn As MySqlConnection = New MySqlConnection(connstr)

            Dim cmt As String = ""
            cmt = "create table IF NOT EXISTS " & tablename & " ("
            Dim c() As String = column

            Dim i As Integer = c.Length
            Dim j As Integer = 0
            Try

                For j = 0 To i - 2 Step 3
                    cmt = cmt & c(j) & " " & c(j + 1) & " "
                    Dim ubmm As String = ""
                    Dim cj As String = c(j).Substring(0, 2).ToLower
                    If (cj = "va") Or (cj = "te") Then
                        ubmm = ubm
                    Else
                        ubmm = ""
                    End If
                    If c(j + 2) = "n" Then
                        cmt = cmt & ubmm & " NOT NULL"
                    Else
                        cmt = cmt & ubmm & " NULL"
                    End If
                    If j = priamrykey Then
                        cmt = cmt & " " & "primary key"

                    End If
                    cmt = cmt & ","

                Next
                cmt = cmt.Remove(cmt.Length - 1, 1)
                cmt = cmt & ")ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ;"

            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示(ct42011)")
                Return False
            End Try
            'MsgBox(cmt)
            ''*****写入文件
            xlog(cmt)

            Dim cmm As MySqlCommand
            Try

                conn.Open()

                cmm = New MySqlCommand
                cmm.Connection = conn
                cmm.CommandText = cmt
                cmm.ExecuteNonQuery()

                rv = True
            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示(ct43612)")
            Finally
                conn.Close()
                cmm = Nothing
                conn = Nothing
            End Try
        End If
       
        Return rv

    End Function

    Function ExistsVal(ByVal tablename As String, ByVal col As String, ByVal val As String) As Boolean
        Dim va As Boolean = False
        Dim tb As Integer = selectCount(tablename, col & "='" & val & "'")
        If tb > 0 Then
            va = True
        Else
            va = False
        End If
        Return va
    End Function

    Function ExistsTb(ByVal tablename As String) As Boolean
        Dim va As Boolean = False
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim sqls As String = "SELECT table_name FROM information_schema.TABLES WHERE table_schema='" & _DataBaseName & "'"
            Try
                conn.Open()
                Dim sqlcomm As MySqlCommand = New MySqlCommand(sqls, conn)
                Dim sqlsr As MySqlDataReader = sqlcomm.ExecuteReader

                Do While sqlsr.Read()

                    If sqlsr(0) = tablename Then
                        'MsgBox("表" & tablename & "的确存在")
                        va = True
                    End If

                Loop

            Catch ex As Exception
                MsgBox(ex.Message, 48, "提示（E670）")
            Finally
                conn.Close()
            End Try
        End If
        Return va
    End Function

    Function delete(ByVal table As String, ByVal where As String) As Boolean
        Dim sa As Boolean = False
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Dim cmm As MySqlCommand
            Dim sqlstr As String = ""
            If where.Trim = "" Then
                sqlstr = "delete from " & table
            Else
                sqlstr = "delete from " & table & " where " & where
            End If

            ''*****写入文件
            xlog(sqlstr)

            Try
                conn.Open()
                cmm = New MySqlCommand
                cmm.Connection = conn
                cmm.CommandText = sqlstr
                If cmm.ExecuteNonQuery > 0 Then
                    sa = True
                Else
                    sa = False
                End If

            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            Finally
                conn.Close()
                cmm = Nothing
                conn = Nothing
            End Try

        End If

        Return sa

    End Function

    Function getSystemTime() As Date
        Dim sa As Date = New Date(2000, 1, 1, 0, 0, 0)
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)

            Dim sqlstr As String = "SELECT now() AS Systime "
            Dim mydataset As DataSet = New DataSet
            Try
                conn.Open()
                Dim myadapter As MySqlDataAdapter = New MySqlDataAdapter(sqlstr, conn)
                myadapter.Fill(mydataset)
                conn.Close()
                Dim vva As String = mydataset.Tables(0).Rows(0)(0).ToString

                If IsDate(vva) Then
                    sa = CDate(vva)
                End If
            Catch ex As Exception
                MsgBox(Err.Description, 48, "提示")
            Finally
                conn = Nothing
            End Try
      
        End If

        Return sa
    End Function

    Function show(ByVal sci As showcommand, Optional ByVal nstr As String = "") As DataTable
        '1. show character set [like 'pattern']              显示所有可利用的字符集()
        '2.SHOW [FULL] COLUMNS {FROM | IN} tbl_name [{FROM | IN} db_name] [LIKE 'pattern']        '用于显示所给表的列。
        '3.show create table tbl_name        '显示创建表的sql语句。
        '4。show create database db_name        '        显示创建db_name时候的sql语句()
        '5。show databases [like 'pattern']    显示当前mysql上所有的数据库
        '6。show tables [like 'pattern']        '        显示当前数据库上的所有表()
        '7.show grants [for user]    显示对user的授权语句
        '8.SHOW {INDEX | INDEXES | KEYS} {FROM | IN} tbl_name [{FROM | IN} db_name]    '        显示索引()
        '9。show open tables        '        显示当前表缓冲区中的表()
        '10。SHOW PRIVILEGES        '        显示mysql所支持的权限()
        '11。SHOW [FULL] PROCESSLIST        '        显示正在使用的线程(thread)
        '12.SHOW [GLOBAL | SESSION] VARIABLES [LIKE 'pattern']        '        显示变量()
        '13。SHOW WARNINGS [LIMIT [offset,] row_count]  
        '         SHOW COUNT(*) WARNINGS        '        显示当前session中最后的语句生产成的错误, 警告灯信息
        '14.  show table status  显示表的状态
        Dim sqlstr As String = ""
        Select Case sci
            Case showcommand.show_character_set
                If nstr.Trim <> "" Then
                    sqlstr = "show character set like '%" & nstr & "%'"
                Else
                    sqlstr = "show character set"
                End If
            Case showcommand.show_columns_from
                If nstr.Trim = "" Then
                    sqlstr = ""
                Else
                    sqlstr = "show columns from " & nstr
                End If
            Case showcommand.show_create_table
                If nstr.Trim = "" Then
                    sqlstr = ""
                Else
                    sqlstr = "show create table " & nstr
                End If
            Case showcommand.show_create_database
                If nstr.Trim = "" Then
                    sqlstr = ""
                Else
                    sqlstr = "show create database " & nstr
                End If
            Case showcommand.show_databases
                If nstr.Trim = "" Then
                    sqlstr = "show databases"
                Else
                    sqlstr = "show databases  like '%" & nstr & "%'"
                End If
            Case showcommand.show_tables
                If nstr.Trim = "" Then
                    sqlstr = "show tables"
                Else
                    sqlstr = "show tables  like '%" & nstr & "%'"
                End If
            Case showcommand.show_grants
                If nstr.Trim = "" Then
                    sqlstr = "show grants"
                Else
                    sqlstr = "show grants  for " & nstr
                End If
            Case showcommand.show_index_from
                If nstr.Trim = "" Then
                    sqlstr = ""
                Else
                    sqlstr = "show index from " & nstr
                End If
            Case showcommand.show_open_tables
                sqlstr = "show open tables"
            Case showcommand.show_privileges
                sqlstr = "show privileges"
            Case showcommand.show_processlist
                sqlstr = "show  processlist"
            Case showcommand.show_global_variables
                If nstr.Trim = "" Then
                    sqlstr = "show global variables"
                Else
                    sqlstr = "show global variables  like  '%" & nstr & "%'"
                End If
            Case showcommand.show_warnings
                sqlstr = "show  warnings"
            Case showcommand.show_table_status
                sqlstr = "show table status"
        End Select

        ''*****写入文件
        xlog(sqlstr)

        If sqlstr.Trim <> "" Then
            Dim connstr As String = connt()
            If is_connt Then
                Dim conn As MySqlConnection = New MySqlConnection(connstr)
                Dim mydataset As DataSet = New DataSet
                Try
                    conn.Open()
                    Dim myadapter As MySqlDataAdapter = New MySqlDataAdapter(sqlstr, conn)
                    myadapter.Fill(mydataset)
                    conn.Close()
                    Return (mydataset.Tables(0))
                Catch ex As Exception
                    MsgBox(Err.Description, 48, "提示")
                End Try
            End If
        End If
        Return New DataTable
    End Function

    Public Shared Function EnPassword(ByVal mstrPassword As String, ByVal CalculateUserID As Integer) As String

        Dim resultArray As Char() = mstrPassword.ToCharArray
        Dim strAngokaResult As String = ""

        ' 字符加密
        For i As Integer = 0 To resultArray.Length - 1


            Dim intCharToAsc As Integer
            intCharToAsc = Asc(resultArray(i))

            Dim intCalUserID As Integer
            intCalUserID = CalculateUserID


            If intCharToAsc >= Asc(ChrW(97)) AndAlso intCharToAsc <= Asc(ChrW(122)) Then
                resultArray(i) = ChrW(intCharToAsc - 44 + intCalUserID)
            End If

            If intCharToAsc >= Asc(ChrW(48)) AndAlso intCharToAsc <= Asc(ChrW(57)) Then
                resultArray(i) = ChrW(intCharToAsc + 52 + intCalUserID)
            End If


            If intCharToAsc >= Asc(ChrW(65)) AndAlso intCharToAsc <= Asc(ChrW(90)) Then
                If (intCharToAsc + 50 + intCalUserID) > Asc(ChrW(125)) Then
                    resultArray(i) = ChrW(intCharToAsc + 50 + intCalUserID - 93)
                Else
                    resultArray(i) = ChrW(intCharToAsc + 50 + intCalUserID)
                End If
            End If
        Next


        For i As Integer = 0 To resultArray.Length - 1
            strAngokaResult = strAngokaResult + resultArray(i)
        Next

        Return strAngokaResult

    End Function

    Public Shared Function DePassword(ByVal mstrAngoPassword As String, ByVal CalculateUserID As Integer) As String
        Dim resultArray As Char() = mstrAngoPassword.ToCharArray
        Dim strRet As String = ""
        '解密
        For i As Integer = 0 To resultArray.Length - 1

            Dim numAscRet As Integer = Asc(resultArray(i)) - CalculateUserID

            If numAscRet >= Asc(ChrW(48)) AndAlso numAscRet <= Asc(ChrW(78)) Then
                resultArray(i) = ChrW(numAscRet + 44)
            End If

            If numAscRet >= Asc(ChrW(110)) AndAlso numAscRet <= Asc(ChrW(125)) Then
                resultArray(i) = ChrW(numAscRet - 50)
            End If

            If numAscRet >= Asc(ChrW(28)) AndAlso numAscRet <= Asc(ChrW(47)) Then
                resultArray(i) = ChrW(numAscRet + 43)
            End If

            If numAscRet >= Asc(ChrW(95)) AndAlso numAscRet <= Asc(ChrW(109)) Then
                resultArray(i) = ChrW(numAscRet - 52)
            End If
        Next

        For i As Integer = 0 To resultArray.Length - 1
            strRet = strRet + resultArray(i)
        Next

        Return strRet

    End Function

    Shared Function QInt(ByVal str As Object) As Integer
        If IsNothing(str) Then
            Return 0
        End If
        Dim va As Integer = 0
        Dim mstr As String = str.ToString.Trim
        If mstr = "" Then
            va = 0
        Else
            If IsNumeric(mstr) Then
                va = CInt(mstr)
            Else
                va = 0
            End If
        End If
        Return va
    End Function

    Shared Function Qsng(ByVal str As Object) As Single
        If IsNothing(str) Then
            Return 0
        End If

        Dim va As Single = 0

        Dim mstr As String = str.ToString.Trim
        If mstr = "" Then
            va = 0
        Else
            If IsNumeric(mstr) Then
                va = CSng(mstr)
            Else
                va = 0
            End If
        End If
        Return va
    End Function

    Shared Function Qdate(ByVal datestr As Object) As Date
        If IsNothing(datestr) Then
            Return Nothing
        End If

        If IsDate(datestr) Then
            Return CDate(datestr)
        Else
            Return Nothing
        End If
    End Function

    ''' <summary>
    ''' 检测输入的数据是否是由字符和数字组成的
    ''' </summary>
    ''' <param name="str"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Shared Function userinput(ByVal str As String, Optional ByVal inp As UserInputType = UserInputType.sql) As String
        Dim va As String = ""
        Select Case inp
            Case UserInputType.sql
                va = str.Replace("""", "")
                va = va.Replace("'", "")
                va = va.Replace("*", "")
                'va = va.Replace("/", "")
                'va = va.Replace(" ", "")
                va = va.Trim
            Case UserInputType.notNum
                For Each c As Char In str.ToCharArray
                    Select Case c
                        Case "0" To "9"

                        Case Else
                            va = va & c
                    End Select
                Next

            Case UserInputType.notStr
                For Each c As Char In str.ToCharArray
                    Select Case c
                        Case "a" To "z"

                        Case "A" To "Z"

                        Case Else
                            va = va & c
                    End Select
                Next


            Case UserInputType.onlyNum
                For Each c As Char In str.ToCharArray
                    Select Case c
                        Case "0" To "9"
                            va = va & c
                        Case "."
                            va = va & "."
                    End Select
                Next
                If va.StartsWith(".") Then
                    va = "0" & va
                End If

            Case UserInputType.onlyStr
                For Each c As Char In str.ToCharArray
                    Select Case c
                        Case "a" To "z"
                            va = va & c
                        Case "A" To "Z"
                            va = va & c
                       
                    End Select
                Next

            Case UserInputType.StrAndNum
                For Each c As Char In str.ToCharArray
                    Select Case c
                        Case "a" To "z"
                            va = va & c
                        Case "A" To "Z"
                            va = va & c
                        Case "0" To "9"
                            va = va & c
                        
                    End Select
                Next
            Case UserInputType.StrAndDou
                For Each c As Char In str.ToCharArray
                    Select Case c
                        Case "a" To "z"
                            va = va & c
                        Case "A" To "Z"
                            va = va & c
                        Case "0" To "9"
                            va = va & c
                        Case "."
                            va = va & c
                    End Select
                Next
        End Select
       
        Return va
    End Function

    ''' <summary>
    ''' 从一个网站下载文件
    ''' </summary>
    ''' <param name="url">网页地址</param>
    ''' <param name="filename">要保存的文件名</param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Shared Function downloadfile(ByVal url As String, ByVal filename As String) As Boolean
        Try
            If IO.File.Exists(filename) Then
                IO.File.Delete(filename)
            End If
            Dim myrq As System.Net.HttpWebRequest = System.Net.HttpWebRequest.Create(url)
            Dim myrp As System.Net.HttpWebResponse = myrq.GetResponse
            Dim st As System.IO.Stream = myrp.GetResponseStream
            Dim so As System.IO.Stream = New System.IO.FileStream(filename, System.IO.FileMode.Create)
            Dim by(1024) As Byte
            Dim osize As Integer = st.Read(by, 0, by.Length)
            While osize > 0
                so.Write(by, 0, osize)
                osize = st.Read(by, 0, by.Length)
            End While
            so.Close()
            st.Close()
            myrp.Close()
            myrq.Abort()
            Return True
        Catch ex As Exception
            MsgBox(ex.Message & "备份数据库失败。", 48, "提示")
            Return False
        End Try
    End Function

    Function Testconn() As Boolean

        Dim va As Boolean = False
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Try
                conn.Open()

                va = True
            Catch ex As Exception
                va = False
            Finally
                conn.Close()
            End Try

        End If

        Return va
    End Function

    Function ConnectionState() As String
        Dim va As String = ""
        Dim connstr As String = connt()
        If is_connt Then
            Dim conn As MySqlConnection = New MySqlConnection(connstr)
            Try
                conn.Open()

                va = "已经连接数据库"
            Catch ex As Exception
                va = ex.ToString
            Finally
                conn.Close()
            End Try
        Else
            va = "连接数据库的参数不完整"
        End If
        Return va
    End Function

    Enum showcommand
        show_character_set
        show_columns_from
        show_create_table
        show_create_database
        show_databases
        show_tables
        show_grants
        show_index_from
        show_open_tables
        show_privileges
        show_processlist
        show_global_variables
        show_warnings
        show_table_status

    End Enum

    Enum UserInputType
        ''' <summary>
        ''' 消除“ 、‘、*和空格
        ''' </summary>
        ''' <remarks></remarks>
        sql
        ''' <summary>
        ''' 只准输入数字
        ''' </summary>
        ''' <remarks></remarks>
        onlyNum
        ''' <summary>
        ''' 只准输入字母
        ''' </summary>
        ''' <remarks></remarks>
        onlyStr
        ''' <summary>
        ''' 不准输入数字
        ''' </summary>
        ''' <remarks></remarks>
        notNum
        ''' <summary>
        ''' 不准输入字母
        ''' </summary>
        ''' <remarks></remarks>
        notStr
        ''' <summary>
        ''' 只能输入字母和数字
        ''' </summary>
        ''' <remarks></remarks>
        StrAndNum
        ''' <summary>
        ''' 只能输入字母和数字和小数点
        ''' </summary>
        ''' <remarks></remarks>
        StrAndDou
    End Enum
End Class
