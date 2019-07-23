Imports SBrowser_G

Public Class Form1
    Private WithEvents mb_callback As SBrowser_G.MiniblinkCallBackClass
    Private mb_api As New SBrowser_G.MiniblinkAPI
    Private mb As Integer

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        mb_api.wkeRunJSW(mb, "window.test('xcv','hj自行车5gj');")
    End Sub

    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        mb_callback = New SBrowser_G.MiniblinkCallBackClass

        mb_api.wkeInitializeEx(0)

        mb_api.wkeJsBindFunction("test", mb_callback.wkeJsNativeFunction, 0, 2)

        mb = mb_api.wkeCreateWebWindow(2, PictureBox1.Handle, 0, 0, PictureBox1.Width, PictureBox1.Height)
        mb_api.wkeShowWindow(mb, True)

        mb_api.wkeOnLoadUrlBegin(mb, mb_callback.wkeLoadUrlBeginCallback, 0)
        mb_api.wkeOnCreateView(mb, mb_callback.wkeCreateViewCallback, 0)
        mb_api.wkeOnDownload(mb, mb_callback.wkeDownloadCallback, 0)

        mb_api.wkeLoadURL(mb, "http://www.baidu.com")
    End Sub

    Private Sub mb_callback___MiniblinkCallBack_Event_wkeLoadUrlBeginCallback(webView As Integer, param As Integer, url As String, job As Integer) Handles mb_callback.__MiniblinkCallBack_Event_wkeLoadUrlBeginCallback
        Debug.WriteLine(url)
    End Sub

    Private Sub mb_callback___MiniblinkCallBack_Event_wkeCreateViewCallback(webView As Integer, param As Integer, navigationType As wkeNavigationType, url As String, ByRef windowFeatures As wkeWindowFeatures) Handles mb_callback.__MiniblinkCallBack_Event_wkeCreateViewCallback
        Debug.WriteLine("触发了wkeCreateViewCallback")
        mb_callback.Return_wkeCreateViewCallback = webView
    End Sub

    Private Sub mb_callback___MiniblinkCallBack_Event_wkeDownloadCallback(webView As Integer, param As Integer, url As String) Handles mb_callback.__MiniblinkCallBack_Event_wkeDownloadCallback
        Debug.WriteLine("触发了下载事件，下载地址：" & url)
    End Sub

    Private Sub mb_callback___MiniblinkCallBack_Event_wkeJsNativeFunction(es As Integer, param As Integer) Handles mb_callback.__MiniblinkCallBack_Event_wkeJsNativeFunction
        Dim tret1 As Decimal, tret2 As Decimal
        tret1 = mb_api.jsArg(es, 0)
        tret2 = mb_api.jsArg(es, 1)
        MsgBox(mb_api.jsToTempStringW(es, tret1) & "/" & mb_api.jsToTempStringW(es, tret2))
    End Sub
End Class
