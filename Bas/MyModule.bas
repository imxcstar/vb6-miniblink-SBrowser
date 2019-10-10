Attribute VB_Name = "MyModule"
Option Explicit
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function SafeArrayGetDim Lib "oleaut32.dll" (ByRef saArray() As Any) As Long

Public Function pGetByteFromPtr(ByVal lPtr As Long, ByVal tlen As Long) As Byte()
    Dim Buff() As Byte
    Dim lPointer As Long
    lPointer = lPtr
    If lstrlen(lPointer) <= 0 Then Exit Function
    ReDim Buff(0 To tlen - 1) As Byte
    CopyMemory Buff(0), ByVal lPointer, tlen
    pGetByteFromPtr = Buff
End Function

Public Function booltoint(ByVal zbool As Boolean) As Byte
    Dim t_zbool As Byte
    If zbool Then t_zbool = 1
    booltoint = t_zbool
End Function

Public Function inttobool(ByVal zint As Byte) As Boolean
    Dim t_zbool As Boolean
    If zint = 1 Then t_zbool = True
    inttobool = t_zbool
End Function

Public Function UTF8_URLEncoding(ByVal szInput As String) As String
    On Error Resume Next
    Dim wch As String, uch As String, szRet As String
    Dim x As Long
    Dim nAsc As Long
    If szInput = "" Then
        UTF8_URLEncoding = szInput
        Exit Function
    End If
    For x = 1 To Len(szInput)
        wch = Mid(szInput, x, 1)
        nAsc = AscW(wch)
        If nAsc < 0 Then nAsc = nAsc + 65536
        If (nAsc And &HFF80) = 0 Then
            szRet = szRet & wch
        Else
            If (nAsc And &HF000) = 0 Then
                uch = "%" & Hex(((nAsc \ 2 ^ 6)) Or &HC0) & Hex(nAsc And &H3F Or &H80)
                szRet = szRet & uch
            Else
                uch = "%" & Hex((nAsc \ 2 ^ 12) Or &HE0) & "%" & _
                Hex((nAsc \ 2 ^ 6) And &H3F Or &H80) & "%" & _
                Hex(nAsc And &H3F Or &H80)
                szRet = szRet & uch
            End If
        End If
    Next
    UTF8_URLEncoding = szRet
End Function

Public Function UTF8_UrlDecode(ByVal url As String)
    Dim b, ub   ''中文字的Unicode码(2字节)
    Dim AA, BB
    Dim UtfB    ''Utf-8单个字节
    Dim UtfB1, UtfB2, UtfB3 ''Utf-8码的三个字节
    Dim i, n, s
    Dim str1 As String
    Dim str2 As String
    n = 0
    ub = 0
    For i = 1 To Len(url)
        b = Mid(url, i, 1)
        Select Case b
            Case "+"
                s = s & " "
            Case "%"
                ub = Mid(url, i + 1, 2)
                If InStr(ub, vbLf) <= 0 And ub <> "" Then
                    AA = Mid(ub, 1, 1)
                    BB = Mid(ub, 2, 1)
                    If AA < "g" And AA < "G" And BB < "g" And BB < "G" And AA <> "%" And BB <> "%" Then
                        UtfB = CInt("&H" & ub)
                    End If
                End If
                
                If UtfB < 128 Then
                    i = i + 2
                    s = s & ChrW(UtfB)
                Else
                    UtfB1 = (UtfB And &HF) * &H1000   ''取第1个Utf-8字节的二进制后4位
                    str1 = Mid(url, i + 4, 2)
                    If InStr(str1, vbLf) <= 0 And str1 <> "" Then
                    
                        AA = Mid(str1, 1, 1)
                        BB = Mid(str1, 2, 1)
                        If AA < "g" And AA < "G" And BB < "g" And BB < "G" And AA <> "%" And BB <> "%" Then
                            UtfB2 = (CInt("&H" & str1) And &H3F) * &H40      ''取第2个Utf-8字节的二进制后6位
                        End If
                    
                        str2 = Mid(url, i + 7, 2)
                        If InStr(str2, vbLf) <= 0 And str2 <> "" Then
                                AA = Mid(str2, 1, 1)
                                BB = Mid(str2, 2, 1)
                                If AA < "g" And AA < "G" And BB < "g" And BB < "G" And AA <> "%" And BB <> "%" Then
                                     UtfB3 = CInt("&H" & str2) And &H3F      ''取第3个Utf-8字节的二进制后6位
                                End If
                        End If
                    End If
                    s = s & ChrW(UtfB1 Or UtfB2 Or UtfB3)
                    i = i + 8
                End If
 
            Case Else    ''Ascii码
                s = s & b
        End Select
    Next
    UTF8_UrlDecode = s
End Function

Public Function ByteToStr(ByRef data() As Byte, Optional ByVal Encoding As String = "Unicode") As String
    If SafeArrayGetDim(data) = 0 Then Exit Function
    Dim objstream As Object
    Set objstream = CreateObject("ADODB.Stream")
    With objstream
        .Type = 1
        .Mode = 3
        .Open
        .Write data
        .Position = 0
        .Type = 2
        .Charset = Encoding
        ByteToStr = .ReadText
       .Close
    End With
    Set objstream = Nothing
End Function

Public Function StrToByte(ByVal data As String, Optional ByVal Encoding As String = "Unicode") As Byte()
    Dim objstream As Object
    Set objstream = CreateObject("ADODB.Stream")
    With objstream
        .Type = 2
        .Mode = 3
        .Open
        .WriteText data
        .Position = 0
        .Charset = Encoding
        .Type = 1
        StrToByte = .Read
       .Close
    End With
    Set objstream = Nothing
End Function

Public Function GetFunAddress(ByVal Address As Long) As Long
    GetFunAddress = Address
End Function
