VERSION 5.00
Begin VB.UserControl SBrowser 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   ClientHeight    =   3600
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4800
   ScaleHeight     =   240
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   320
   ToolboxBitmap   =   "SBrowser.ctx":0000
End
Attribute VB_Name = "SBrowser"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
'-Callback declarations for Paul Caton thunking magic----------------------------------------------
Private z_CbMem   As Long                                                       'Callback allocated memory address
Private Declare Function GetModuleHandleA Lib "kernel32" (ByVal lpModuleName As String) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function IsBadCodePtr Lib "kernel32" (ByVal lpfn As Long) As Long
Private Declare Function VirtualAlloc Lib "kernel32" (ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As Long
Private Declare Function VirtualFree Lib "kernel32" (ByVal lpAddress As Long, ByVal dwSize As Long, ByVal dwFreeType As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32.dll" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
'-------------------------------------------------------------------------------------------------

Private zchwnd As Long, m_WebWindow As Long

Public Event DocumentReady(ByVal url As String)
Public Event LoadUrlBegin(ByVal title As String, ByVal url As String)
Public Event ShowNewView(ByVal url As String, ByRef ret As Long)
Public Event LoadUrlEnd(ByVal url As String, ByRef data() As Byte)
Public Event OnTitleChanged(ByVal title As String)
Public Event OnAlertBox(ByVal msg As String)
Public Event OnPromptBox(ByVal msg As String, ByRef retStr As String, ByRef retState As Boolean)

Private tmp_load_url As String, tmp_load_html As String, tmp_load_filename As String
Private is_qd As Boolean, tmp_TouchEnabled As Boolean, tmp_MouseEnabled As Boolean
Private tmp_job As Long
Private IsInit As Boolean
Private MiniblinkAPICls As MiniblinkAPI
Private WithEvents mb_callback As MiniblinkCallBack
Attribute mb_callback.VB_VarHelpID = -1

Private Sub mb_callback_wkeAlertBoxCallback(ByVal webView As Long, ByVal param As Long, ByVal msg As String)
    RaiseEvent OnAlertBox(msg)
End Sub

Private Sub mb_callback_wkeCreateViewCallback(ByVal webView As Long, ByVal param As Long, ByVal navigationType As wkeNavigationType, ByVal url As String, windowFeatures As wkeWindowFeatures)
    Dim ret As Long
    ret = 0
    RaiseEvent ShowNewView(url, ret)
    If ret = 0 Then ret = webView
    If ret > 0 Then
        mb_callback.Return_wkeCreateViewCallback = ret
    Else
        mb_callback.Return_wkeCreateViewCallback = webView
    End If
End Sub

Private Sub mb_callback_wkeDocumentReadyCallback(ByVal webView As Long, ByVal param As Long)
    RaiseEvent DocumentReady(MiniblinkAPICls.wkeGetURL(webView))
End Sub

Private Sub mb_callback_wkeLoadUrlBeginCallback(ByVal webView As Long, ByVal param As Long, ByVal url As String, ByVal job As Long)
    RaiseEvent LoadUrlBegin(MiniblinkAPICls.wkeGetTitle(webView), url)
End Sub

Private Sub mb_callback_wkeLoadUrlEndCallback(ByVal webView As Long, ByVal param As Long, ByVal url As String, ByVal job As Long, ByVal buf As Long, ByVal tlen As Long)
    Dim zc() As Byte
    zc = pGetByteFromPtr(buf, tlen)
    RaiseEvent LoadUrlEnd(url, zc)
End Sub

Private Sub mb_callback_wkePromptBoxCallback(ByVal webView As Long, ByVal param As Long, ByVal msg As String, ByVal defaultResult As String, result As String)
    Dim ret As String
    Dim ret2 As Boolean
    RaiseEvent OnPromptBox(msg, ret, ret2)
    result = ret
    mb_callback.Return_wkePromptBoxCallback = ret2
End Sub

Private Sub mb_callback_wkeTitleChangedCallback(ByVal webView As Long, ByVal param As Long, ByVal title As String)
    RaiseEvent OnTitleChanged(title)
End Sub

Private Sub UserControl_Resize()
    If is_qd = True Then
        MiniblinkAPICls.wkeResize m_WebWindow, UserControl.ScaleWidth, UserControl.ScaleHeight
    End If
End Sub

Public Property Get RunMode() As Boolean
    RunMode = CLng(Ambient.UserMode)
    On Error Resume Next
    RunMode = Extender.parent.RunMode
End Property

Private Sub UserControl_Show()
    If RunMode = True And IsInit = False Then
        Set mb_callback = New MiniblinkCallBack
        
        IsInit = True
        tmp_MouseEnabled = True
        
        zchwnd = UserControl.hWnd
        
        Set MiniblinkAPICls = New MiniblinkAPI

        MiniblinkAPICls.wkeInitializeEx 0
        
        m_WebWindow = MiniblinkAPICls.wkeCreateWebWindow(2, zchwnd, 0, 0, UserControl.ScaleWidth, UserControl.ScaleHeight)
        
        MiniblinkAPICls.wkeShowWindow m_WebWindow, True
        
        MiniblinkAPICls.wkeSetNavigationToNewWindowEnable m_WebWindow, True
        
        MiniblinkAPICls.wkeOnAlertBox m_WebWindow, mb_callback.wkeAlertBoxCallback, 0
        MiniblinkAPICls.wkeOnPromptBox m_WebWindow, mb_callback.wkePromptBoxCallback, 0
        MiniblinkAPICls.wkeOnDocumentReady m_WebWindow, mb_callback.wkeDocumentReadyCallback, 0
        MiniblinkAPICls.wkeOnLoadUrlBegin m_WebWindow, mb_callback.wkeLoadUrlBeginCallback, 0
        MiniblinkAPICls.wkeOnCreateView m_WebWindow, mb_callback.wkeCreateViewCallback, 0
        MiniblinkAPICls.wkeOnLoadUrlEnd m_WebWindow, mb_callback.wkeLoadUrlEndCallback, 0
        MiniblinkAPICls.wkeOnTitleChanged m_WebWindow, mb_callback.wkeTitleChangedCallback, 0
        
        is_qd = True
        
        If tmp_load_url <> "" Then
            LoadURL tmp_load_url
        ElseIf tmp_load_html <> "" Then
            LoadHtml tmp_load_html
        ElseIf tmp_load_filename <> "" Then
            LoadFile tmp_load_filename
        End If
    End If
End Sub

Public Sub LoadURL(ByVal url As String)
    tmp_load_url = url
    If is_qd = True Then
        MiniblinkAPICls.wkeLoadW m_WebWindow, tmp_load_url
    End If
End Sub

Public Sub LoadHtml(ByVal html As String)
    tmp_load_html = html
    If is_qd = True Then
        MiniblinkAPICls.wkeLoadHTMLW m_WebWindow, tmp_load_html
    End If
End Sub

Public Sub LoadFile(ByVal filename As String)
    tmp_load_filename = filename
    If is_qd = True Then
        MiniblinkAPICls.wkeLoadFileW m_WebWindow, tmp_load_filename
    End If
End Sub

Public Function GetWebWindow() As Long
    GetWebWindow = m_WebWindow
End Function

Public Function RunJs(ByVal js As String) As String
    Dim TJsValue As Currency
    TJsValue = MiniblinkAPICls.wkeRunJSW(m_WebWindow, js)
    RunJs = MiniblinkAPICls.jsToTempStringW(GetEs(), TJsValue)
End Function

Public Function GetEs() As Long
    GetEs = MiniblinkAPICls.wkeGlobalExec(m_WebWindow)
End Function

Public Function IsLoadComplete() As Boolean
    IsLoadComplete = MiniblinkAPICls.wkeIsLoadComplete(m_WebWindow)
End Function

Public Function IsDocumentReady() As Boolean
    IsDocumentReady = MiniblinkAPICls.wkeIsDocumentReady(m_WebWindow)
End Function

Public Function SendMouseEvent(ByVal message As Long, ByVal x As Long, ByVal y As Long, ByVal flags As Long) As Boolean
    SendMouseEvent = MiniblinkAPICls.wkeFireMouseEvent(m_WebWindow, message, x, y, flags)
End Function

Public Function SendMouseWheelEvent(ByVal x As Long, ByVal y As Long, ByVal delta As Long, ByVal flags As Long) As Boolean
    SendMouseWheelEvent = MiniblinkAPICls.wkeFireMouseWheelEvent(m_WebWindow, x, y, delta, flags)
End Function

Public Sub NetHookRequest()
    If tmp_job = 0 Then Exit Sub
    MiniblinkAPICls.wkeNetHookRequest tmp_job
End Sub

Public Property Get userAgent() As String
    If is_qd = True Then
        userAgent = MiniblinkAPICls.wkeGetUserAgent(m_WebWindow)
    End If
End Property

Public Property Let userAgent(ByVal data As String)
    If is_qd = True Then
        MiniblinkAPICls.wkeSetUserAgent m_WebWindow, data
    End If
End Property

Public Property Get TouchEnabled() As Boolean
    If is_qd = True Then
        TouchEnabled = tmp_TouchEnabled
    End If
End Property

Public Property Let TouchEnabled(ByVal data As Boolean)
    If is_qd = True Then
        tmp_TouchEnabled = data
        MiniblinkAPICls.wkeSetTouchEnabled m_WebWindow, data
    End If
End Property

Public Property Get MouseEnabled() As Boolean
    If is_qd = True Then
        MouseEnabled = tmp_MouseEnabled
    End If
End Property

Public Property Let MouseEnabled(ByVal data As Boolean)
    If is_qd = True Then
        tmp_MouseEnabled = data
        MiniblinkAPICls.wkeSetMouseEnabled m_WebWindow, data
    End If
End Property

'------------------------------------------------------------------------------
'       初始化属性
'------------------------------------------------------------------------------
Private Sub UserControl_InitProperties()
    '
End Sub


'------------------------------------------------------------------------------
'       读取属性
'------------------------------------------------------------------------------
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    '
End Sub


'------------------------------------------------------------------------------
'       写入属性
'------------------------------------------------------------------------------
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    '
End Sub
