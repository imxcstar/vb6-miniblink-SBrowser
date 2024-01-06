VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5970
   ClientLeft      =   165
   ClientTop       =   810
   ClientWidth     =   12585
   LinkTopic       =   "Form1"
   ScaleHeight     =   5970
   ScaleWidth      =   12585
   StartUpPosition =   3  '窗口缺省
   Begin VB.Menu T1 
      Caption         =   "js回调测试"
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
Private WithEvents mb_callback As MiniblinkCallBack
Attribute mb_callback.VB_VarHelpID = -1
Private mb_api As New MiniblinkAPI
Private mb As Long

Private Sub Form_Activate()
    Me.ScaleMode = 3
    
    mb_api.wkeInitializeEx 0
    
    mb_api.wkeJsBindFunction "test", mb_callback.wkeJsNativeFunction, 0, 2               'js回调事件绑定（影响所有webview和webwindow）
    
    mb = mb_api.wkeCreateWebWindow(2, Me.hWnd, 0, 0, Me.ScaleWidth, Me.ScaleHeight)
    mb_api.wkeShowWindow mb, True
    
    mb_api.wkeOnLoadUrlBegin mb, mb_callback.wkeLoadUrlBeginCallback, 0                  'url加载事件绑定
    mb_api.wkeOnCreateView mb, mb_callback.wkeCreateViewCallback, 0                      '创建新窗口事件绑定
    mb_api.wkeOnDownload mb, mb_callback.wkeDownloadCallback, 0                          '下载事件绑定
    
    mb_api.wkeLoadURL mb, "http://www.baidu.com"
End Sub

Private Sub Form_Load()
    Set mb_callback = New MiniblinkCallBack
End Sub

Private Sub Form_Resize()
    If Me.WindowState = 1 Or mb = 0 Then Exit Sub
    mb_api.wkeMoveWindow mb, 0, 0, Me.ScaleWidth, Me.ScaleHeight
End Sub

Private Sub mb_callback_wkeCreateViewCallback(ByVal webView As Long, ByVal param As Long, ByVal navigationType As SBrowser_G_203.wkeNavigationType, ByVal url As String, windowFeatures As SBrowser_G_203.wkeWindowFeatures)
    Debug.Print "触发了wkeCreateViewCallback"
    mb_callback.Return_wkeCreateViewCallback = webView      '使用原webview加载
End Sub

Private Sub mb_callback_wkeDownloadCallback(ByVal webView As Long, ByVal param As Long, ByVal url As String)
    Debug.Print "触发了下载事件，下载地址：" & url
End Sub

Private Sub mb_callback_wkeJsNativeFunction(ByVal es As Long, ByVal param As Long)
    Dim tret1 As Currency, tret2 As Currency
    tret1 = mb_api.jsArg(es, 0)
    tret2 = mb_api.jsArg(es, 1)
    MsgBox mb_api.jsToTempStringW(es, tret1) & "/" & mb_api.jsToTempStringW(es, tret2)
End Sub

Private Sub mb_callback_wkeLoadUrlBeginCallback(ByVal webView As Long, ByVal param As Long, ByVal url As String, ByVal job As Long)
    Debug.Print url
End Sub

Private Sub T1_Click()
    mb_api.wkeRunJSW mb, "window.test('xcv','hj自行车5gj');"
End Sub
