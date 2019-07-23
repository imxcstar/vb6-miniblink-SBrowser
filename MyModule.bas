Attribute VB_Name = "MyModule"
Option Explicit
Private Declare Function lstrlen Lib "kernel32" Alias "lstrlenA" (ByVal lpString As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

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


