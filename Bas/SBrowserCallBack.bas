Attribute VB_Name = "SBrowserCallBack"
Option Explicit
Public Const CBI_JsCallAddress As String = "JsCallAddress"

Public CallBackInfoList As New PropertyBag
Public IsBindJs As Boolean

Private Type TChandleJsCall
    es As Long
    param As Long
End Type

Private SBrowserCallBackMBAPI As New MiniblinkAPI
Private SBrowserCallBackMSDLL As New cUniversalDLLCalls

Public Function ChandleJsCall(ByVal es As Long, ByVal param As Long) As Long
    Dim twebview As Long, tcallbackaddress As Long
    twebview = SBrowserCallBackMBAPI.jsGetWebView(es)
    tcallbackaddress = Val(CallBackInfoList.ReadProperty(twebview & "-" & CBI_JsCallAddress))
    If tcallbackaddress = 0 Then Exit Function
    Dim tcjc As TChandleJsCall
    tcjc.es = es
    tcjc.param = param
    SBrowserCallBackMSDLL.CallStdcall tcallbackaddress, VarPtr(tcjc), 2
End Function
