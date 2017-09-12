
''' <summary>
''' 用键值和键名组成List
''' </summary>
''' <remarks></remarks>
Public Class Xlist
    Dim mkey As List(Of String)
    Dim mvalue As List(Of Object)

    Sub New()
        mkey = New List(Of String)
        mvalue = New List(Of Object)
    End Sub

    ''' <summary>
    ''' 获取所有的键名
    ''' </summary>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    ReadOnly Property Keys As List(Of String)
        Get
            Return mkey
        End Get
    End Property
    ''' <summary>
    ''' 获取一个键的值
    ''' </summary>
    ''' <param name="k"></param>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    ReadOnly Property Items(ByVal k As String) As Object
        Get
            k = k.Trim
            If k = "" Then
                Return Nothing
            End If
            Dim i As Integer = mkey.IndexOf(k)
            If i < 0 Then
                Return Nothing
            Else
                Return mvalue(i)
            End If
        End Get

    End Property
    ''' <summary>
    ''' 获取一个序号的值
    ''' </summary>
    ''' <param name="index"></param>
    ''' <value></value>
    ''' <returns></returns>
    ''' <remarks></remarks>
    ReadOnly Property Items(ByVal index As Integer) As Object
        Get
            Dim i As Integer = Math.Abs(index)
            If mvalue.Count > i Then
                Return mvalue(i)
            Else
                Return Nothing
            End If
        End Get

    End Property



    ''' <summary>
    ''' 添加一个键和值，如果此键已经存在，就修改此键的值
    ''' </summary>
    ''' <param name="k">键名</param>
    ''' <param name="value">要添加的键的值</param>
    ''' <remarks></remarks>
    Sub Add(ByVal k As String, ByVal value As Object)
        k = k.Trim
        If k <> "" Then
            Dim i As Integer = mkey.IndexOf(k)
            If i < 0 Then
                mkey.Add(k)
                mvalue.Add(value)
            Else
                mvalue(i) = value
            End If
        End If

    End Sub

    ''' <summary>
    ''' 添中一个键和值 ，键名是下一个序号
    ''' </summary>
    ''' <param name="value">要添加的键的值</param>
    ''' <remarks></remarks>
    Sub Add(ByVal value As Object)
        mkey.Add(mkey.Count)
        mvalue.Add(value)
    End Sub

    ''' <summary>
    ''' 将k键的值加上一值，如果是数字就相加，是字符就合并,如果不存在此键就添加此键
    ''' </summary>
    ''' <param name="k"></param>
    ''' <param name="v"></param>
    ''' <remarks></remarks>
    Sub ValueAdd(ByVal k As String, ByVal v As String)
        k = k.Trim
        Dim i As Integer = mkey.IndexOf(k)
        If i < 0 Then
            mkey.Add(k)
            mvalue.Add(v)
        Else
            If IsNothing(mvalue(i)) Then
                mvalue(i) = v
            Else
                If IsNumeric(mvalue(i).ToString) And (IsNumeric(v)) Then
                    mvalue(i) = CDbl(mvalue(i)) + v
                Else
                    mvalue(i) = CDbl(mvalue(i)) & v
                End If
            End If


        End If


    End Sub


    ''' <summary>
    ''' 按键名排序
    ''' </summary>
    ''' <remarks></remarks>
    Sub SortByKey()
        If mkey.Count > 0 Then


            Try
                Dim nkey() As String = mkey.ToArray
                Dim oldkey() As String = mkey.ToArray
                Dim nvalue() As Object = mvalue.ToArray
                mkey.Clear()
                mvalue.Clear()
                Array.Sort(nkey, nvalue)
                mkey.AddRange(nkey)
                mvalue.AddRange(nvalue)
            Catch ex As Exception
                MsgBox(ex.ToString, 48, "提示")
            End Try


        End If
    End Sub
    ''' <summary>
    ''' 按值排序
    ''' </summary>
    ''' <remarks></remarks>
    Sub SortByValue()
        If mkey.Count > 0 Then
            Try
                Dim nkey() As String = mkey.ToArray
                Dim oldkey() As String = mkey.ToArray
                Dim nvalue() As Object = mvalue.ToArray
                mkey.Clear()
                mvalue.Clear()
                Array.Sort(nvalue, nkey)
                mkey.AddRange(nkey)
                mvalue.AddRange(nvalue)
            Catch ex As Exception
                MsgBox(ex.ToString, 48, "提示")
            End Try

        End If
    End Sub

    ''' <summary>
    ''' 键按从小到大排列，值按从大到小排列
    ''' </summary>
    ''' <remarks></remarks>
    Sub Sort()
        If mkey.Count > 0 Then
            Try
                Dim nkey() As String = mkey.ToArray
                Dim nval() As Object = mvalue.ToArray

                Dim vk As List(Of String) = New List(Of String)
                Dim vv As List(Of String) = New List(Of String)

                SortByValue()
                Flip()
                Dim tep As List(Of String) = New List(Of String) '临时键
                Dim tev As Object = Nothing
                For i As Integer = mkey.Count - 1 To 0 Step -1
                    Dim tepv As String = mkey(i)
                    tep.Clear()
                    For j As Integer = 0 To nval.Count - 1
                        If tepv = nval(j).ToString Then
                            tep.Add(nkey(j))
                            tev = nval(j)
                        End If
                    Next
                    Dim temp() As String = tep.ToArray
                    Array.Sort(temp)
                    For jj As Integer = 0 To temp.Count - 1
                        vk.Add(temp(jj))
                        vv.Add(tev)
                    Next
                Next

                mkey.Clear()
                mvalue.Clear()

                mkey.AddRange(vk)
                mvalue.AddRange(vv)


            Catch ex As Exception

            End Try

        End If

    End Sub

    ''' <summary>
    ''' 键和值交换，如果原来的值有重复的，只会保留最后一个,如果原值是nothing ,则丢弃
    ''' </summary>
    ''' <remarks></remarks>
    Sub Flip()
        If mkey.Count > 0 Then
            Dim nkey() As String = mkey.ToArray
            Dim nvalue() As Object = mvalue.ToArray

            Try
                mkey.Clear()
                mvalue.Clear()
                For i As Integer = 0 To nvalue.Length - 1

                    If IsNothing(nvalue(i)) = False Then
                        Add(nvalue(i), nkey(i))
                    End If
                Next

            Catch ex As Exception
                MsgBox(ex.ToString, 48, "提示")
            End Try


        End If
    End Sub
    ''' <summary>
    ''' 移除指定的键和值
    ''' </summary>
    ''' <param name="k"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function Remove(ByVal k As String) As Boolean
        Try
            Dim i As Integer = mkey.IndexOf(k)
            If i < 0 Then
                Return False
            Else
                mkey.RemoveAt(i)
                mvalue.RemoveAt(i)
                Return True
            End If
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return False
    End Function

    ''' <summary>
    ''' 清除全部的键和值
    ''' </summary>
    ''' <remarks></remarks>
    Sub Clear()
        mkey.Clear()
        mvalue.Clear()
    End Sub

    ''' <summary>
    ''' 移除指定位置的键和值
    ''' </summary>
    ''' <param name="index"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function Remove(ByVal index As Integer) As Boolean
        Try
            Dim i As Integer = Math.Abs(index)
            If mvalue.Count > i Then
                mvalue.RemoveAt(i)
                mkey.RemoveAt(i)

            Else
                Return Nothing
            End If
        Catch ex As Exception
            MsgBox(ex.ToString)
        End Try
        Return False
    End Function
    ''' <summary>
    ''' 序列中的总数
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Function Count() As Integer
        Return mvalue.Count
    End Function
    ''' <summary>
    ''' 将字符串根据k的位置分割成list数组
    ''' </summary>
    ''' <param name="str"></param>
    ''' <param name="k"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Shared Function Str2List(ByVal str As String, ByVal k As Char) As List(Of String)
        Dim ra As List(Of String) = New List(Of String)
        'str = str.Trim(str)
        If str.Length > 0 Then
            Dim aa As String = ""
            For Each c As Char In str
                If c <> k Then
                    aa = aa & c
                Else
                    ra.Add(aa)
                    aa = ""

                End If
            Next
            ra.Add(aa)


        End If
        Return ra

    End Function
    ''' <summary>
    ''' 将数组用k连接成字符串
    ''' </summary>
    ''' <param name="k"></param>
    ''' <param name="li"></param>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Shared Function List2Str(ByVal k As Char, ByVal ParamArray li() As Object) As String
        Dim ra As String = ""
        If li.Count > 0 Then
            For Each yy As Object In li
                If yy Is Nothing Then
                Else
                    ra = ra & k & yy.ToString
                End If


            Next
            'ra = ra.Substring(1)
            ra = ra.Trim(New Char() {k})


        End If
        Return ra
    End Function
End Class
