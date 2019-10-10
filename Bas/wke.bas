Attribute VB_Name = "wke"
Option Explicit
Private IsInitWkeApi As Boolean
Public NodeDllPath As String

Public Sub wke_api_init()
    If IsInitWkeApi = True Then Exit Sub
    
    Dim TmpNodePath As String, TmpAppPath As String
    '------------------------------------
    TmpAppPath = App.path
    If Right(TmpAppPath, 1) <> "\" Then TmpAppPath = TmpAppPath & "\"
    '------------------------------------
    
    TmpNodePath = TmpAppPath & "node.dll"
    NodeDllPath = "node.dll"
    
    If Dir(TmpNodePath) = "" Then
        MsgBox "node.dll ²»´æÔÚ", vbSystemModal
        IsInitWkeApi = False
        Exit Sub
    End If
    
    IsInitWkeApi = True
End Sub
