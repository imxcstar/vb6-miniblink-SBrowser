VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MiniblinkAPI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit
Private api_jsAddRef As String, api_jsArg As String, _
        api_jsArgCount As String, api_jsArgType As String, _
        api_jsArrayBuffer As String, api_jsBindFunction As String, _
        api_jsBindGetter As String, api_jsBindSetter As String, _
        api_jsBoolean As String, api_jsCall As String, _
        api_jsCallGlobal As String, api_jsDeleteObjectProp As String, _
        api_jsDouble As String, api_jsEmptyArray As String, _
        api_jsEmptyObject As String, api_jsEval As String, _
        api_jsEvalExW As String, api_jsEvalW As String, _
        api_jsFalse As String, api_jsFloat As String, _
        api_jsFunction As String, api_jsGC As String, _
        api_jsGet As String, api_jsGetArrayBuffer As String, _
        api_jsGetAt As String, api_jsGetCallstack As String, _
        api_jsGetData As String, api_jsGetGlobal As String, _
        api_jsGetKeys As String, api_jsGetLastErrorIfException As String, _
        api_jsGetLength As String, api_jsGetWebView As String, _
        api_jsGlobalObject As String, api_jsInt As String, _
        api_jsIsArray As String, api_jsIsBoolean As String, _
        api_jsIsFalse As String, api_jsIsFunction As String, _
        api_jsIsJsValueValid As String, api_jsIsNull As String

Private api_jsIsNumber As String, api_jsIsObject As String, _
        api_jsIsString As String, api_jsIsTrue As String, _
        api_jsIsUndefined As String, api_jsIsValidExecState As String, _
        api_jsNull As String, api_jsObject As String, _
        api_jsReleaseRef As String, api_jsSet As String, _
        api_jsSetAt As String, api_jsSetGlobal As String, _
        api_jsSetLength As String, api_jsString As String, _
        api_jsStringW As String, api_jsThrowException As String, _
        api_jsToBoolean As String, api_jsToDouble As String, _
        api_jsToFloat As String, api_jsToInt As String, _
        api_jsToString As String, api_jsToStringW As String, _
        api_jsToTempString As String, api_jsToTempStringW As String, _
        api_jsToV8Value As String, api_jsTrue As String, _
        api_jsTypeOf As String, api_jsUndefined As String, _
        api_wkeAddDirtyArea As String, api_wkeAddNpapiPlugin As String, _
        api_wkeAddPluginDirectory As String, api_wkeAwaken As String, _
        api_wkeCanGoBack As String, api_wkeCanGoForward As String, _
        api_wkeConfigure As String, api_wkeContentsHeight As String, _
        api_wkeContentsWidth As String, api_wkeContextMenuEvent As String, _
        api_wkeCookieEnabled As String, api_wkeCopy As String

Private api_wkeCreateMemBuf As String, api_wkeCreateString As String, _
        api_wkeCreateStringW As String, api_wkeCreateWebView As String, _
        api_wkeCreateWebWindow As String, api_wkeCut As String, _
        api_wkeDelete As String, api_wkeDeleteString As String, _
        api_wkeDestroyWebView As String, api_wkeDestroyWebWindow As String, _
        api_wkeDragTargetDragEnter As String, api_wkeDragTargetDragLeave As String, _
        api_wkeDragTargetDragOver As String, api_wkeDragTargetDrop As String, _
        api_wkeDragTargetEnd As String, api_wkeEditorCopy As String, _
        api_wkeEditorCut As String, api_wkeEditorDelete As String, _
        api_wkeEditorPaste As String, api_wkeEditorRedo As String, _
        api_wkeEditorSelectAll As String, api_wkeEditorUndo As String, _
        api_wkeEditorUnSelect As String, api_wkeEnableWindow As String, _
        api_wkeFinalize As String, api_wkeFireContextMenuEvent As String, _
        api_wkeFireKeyDownEvent As String, api_wkeFireKeyPressEvent As String, _
        api_wkeFireKeyUpEvent As String, api_wkeFireMouseEvent As String, _
        api_wkeFireMouseWheelEvent As String, api_wkeFireWindowsMessage As String, _
        api_wkeFocus As String, api_wkeFreeMemBuf As String, _
        api_wkeGC As String, api_wkeGetBlinkMainThreadIsolate As String, _
        api_wkeGetCaret As String, api_wkeGetCaretRect As String, _
        api_wkeGetClientHandler As String, api_wkeGetContentHeight As String

Private api_wkeGetContentWidth As String, api_wkeGetCookie As String, _
        api_wkeGetCookieW As String, api_wkeGetCursorInfoType As String, _
        api_wkeGetDocumentCompleteURL As String, api_wkeGetFrameUrl As String, _
        api_wkeGetGlobalExecByFrame As String, api_wkeGetHeight As String, _
        api_wkeGetHostHWND As String, api_wkeGetMediaVolume As String, _
        api_wkeGetName As String, api_wkeGetSource As String, _
        api_wkeGetString As String, api_wkeGetStringW As String, _
        api_wkeGetTempCallbackInfo As String, api_wkeGetTitle As String, _
        api_wkeGetTitleW As String, api_wkeGetURL As String, _
        api_wkeGetUserAgent As String, api_wkeGetUserKeyValue As String, _
        api_wkeGetVersion As String, api_wkeGetVersionString As String, _
        api_wkeGetViewDC As String, api_wkeGetWebViewByNData As String, _
        api_wkeGetWebViewForCurrentContext As String, api_wkeGetWebviewId As String, _
        api_wkeGetWidth As String, api_wkeGetWindowHandle As String, _
        api_wkeGetZoomFactor As String, api_wkeGlobalExec As String, _
        api_wkeGoBack As String, api_wkeGoForward As String, _
        api_wkeGoToIndex As String, api_wkeGoToOffset As String, _
        api_wkeHeight As String, api_wkeInit As String, _
        api_wkeInitialize As String, api_wkeInitializeEx As String, _
        api_wkeInsertCSSByFrame As String, api_wkeIsAwake As String

Private api_wkeIsCookieEnabled As String, api_wkeIsDirty As String, _
        api_wkeIsDocumentReady As String, api_wkeIsInitialize As String, _
        api_wkeIsLoadComplete As String, api_wkeIsLoaded As String, _
        api_wkeIsLoadFailed As String, api_wkeIsLoading As String, _
        api_wkeIsLoadingCompleted As String, api_wkeIsLoadingFailed As String, _
        api_wkeIsLoadingSucceeded As String, api_wkeIsMainFrame As String, _
        api_wkeIsProcessingUserGesture As String, api_wkeIsTransparent As String, _
        api_wkeIsWebRemoteFrame As String, api_wkeIsWebviewAlive As String, _
        api_wkeJsBindFunction As String, api_wkeJsBindGetter As String, _
        api_wkeJsBindSetter As String, api_wkeKeyDown As String, _
        api_wkeKeyPress As String, api_wkeKeyUp As String, _
        api_wkeKillFocus As String, api_wkeLayoutIfNeeded As String, _
        api_wkeLoadFile As String, api_wkeLoadFileW As String, _
        api_wkeLoadHTML As String, api_wkeLoadHTMLW As String, _
        api_wkeLoadHtmlWithBaseUrl As String, api_wkeLoadURL As String, _
        api_wkeLoadURLW As String, api_wkeLoadW As String, _
        api_wkeMediaVolume As String, api_wkeMouseEvent As String, _
        api_wkeMouseWheel As String, api_wkeMoveToCenter As String, _
        api_wkeMoveWindow As String, api_wkeNetAddHTTPHeaderFieldToUrlRequest As String, _
        api_wkeNetCancelRequest As String, api_wkeNetCancelWebUrlRequest As String

Private api_wkeNetChangeRequestUrl As String, api_wkeNetContinueJob As String, _
        api_wkeNetCreatePostBodyElement As String, api_wkeNetCreatePostBodyElements As String, _
        api_wkeNetCreateWebUrlRequest As String, api_wkeNetFreePostBodyElement As String, _
        api_wkeNetFreePostBodyElements As String, api_wkeNetGetExpectedContentLength As String, _
        api_wkeNetGetFavicon As String, api_wkeNetGetHTTPHeaderField As String, _
        api_wkeNetGetHttpStatusCode As String, api_wkeNetGetMIMEType As String, _
        api_wkeNetGetPostBody As String, api_wkeNetGetRequestMethod As String, _
        api_wkeNetGetResponseUrl As String, api_wkeNetGetUrlByJob As String, _
        api_wkeNetHoldJobToAsynCommit As String, api_wkeNetHookRequest As String, _
        api_wkeNetOnResponse As String, api_wkeNetSetData As String, _
        api_wkeNetSetHTTPHeaderField As String, api_wkeNetSetMIMEType As String, _
        api_wkeNetStartUrlRequest As String, api_wkeNodeOnCreateProcess As String, _
        api_wkeOnAlertBox As String, api_wkeOnConfirmBox As String, _
        api_wkeOnConsole As String, api_wkeOnCreateView As String, _
        api_wkeOnDidCreateScriptContext As String, api_wkeOnDocumentReady As String, _
        api_wkeOnDocumentReady2 As String, api_wkeOnDownload As String, _
        api_wkeOnDraggableRegionsChanged As String, api_wkeOnLoadingFinish As String, _
        api_wkeOnLoadUrlBegin As String, api_wkeOnLoadUrlEnd As String, _
        api_wkeOnMouseOverUrlChanged As String, api_wkeOnNavigation As String, _
        api_wkeOnOtherLoad As String, api_wkeOnPaintBitUpdated As String

Private api_wkeOnPaintUpdated As String, api_wkeOnPluginFind As String, _
        api_wkeOnPromptBox As String, api_wkeOnStartDragging As String, _
        api_wkeOnTitleChanged As String, api_wkeOnURLChanged As String, _
        api_wkeOnURLChanged2 As String, api_wkeOnWillMediaLoad As String, _
        api_wkeOnWillReleaseScriptContext As String, api_wkeOnWindowClosing As String, _
        api_wkeOnWindowDestroy As String, api_wkePaint As String, _
        api_wkePaint2 As String, api_wkePaste As String, _
        api_wkePerformCookieCommand As String, api_wkePostURL As String, _
        api_wkePostURLW As String, api_wkeRegisterEmbedderCustomElement As String, _
        api_wkeReload As String, api_wkeRepaintIfNeeded As String, _
        api_wkeResize As String, api_wkeResizeWindow As String, _
        api_wkeRunJS As String, api_wkeRunJsByFrame As String, _
        api_wkeRunJSW As String, api_wkeSelectAll As String, _
        api_wkeSetClientHandler As String, api_wkeSetCookie As String, _
        api_wkeSetCookieEnabled As String, api_wkeSetCookieJarFullPath As String, _
        api_wkeSetCookieJarPath As String, api_wkeSetCspCheckEnable As String, _
        api_wkeSetDebugConfig As String, api_wkeSetDeviceParameter As String, _
        api_wkeSetDirty As String, api_wkeSetDragDropEnable As String, _
        api_wkeSetDragEnable As String, api_wkeSetDragFiles As String, _
        api_wkeSetEditable As String, api_wkeSetFileSystem As String

Private api_wkeSetFocus As String, api_wkeSetHandle As String, _
        api_wkeSetHandleOffset As String, api_wkeSetHeadlessEnabled As String, _
        api_wkeSetLanguage As String, api_wkeSetLocalStorageFullPath As String, _
        api_wkeSetMediaPlayerFactory As String, api_wkeSetMediaVolume As String, _
        api_wkeSetMemoryCacheEnable As String, api_wkeSetMouseEnabled As String, _
        api_wkeSetName As String, api_wkeSetNavigationToNewWindowEnable As String, _
        api_wkeSetNpapiPluginsEnabled As String, api_wkeSetProxy As String, _
        api_wkeSetResourceGc As String, api_wkeSetString As String, _
        api_wkeSetStringW As String, api_wkeSetTouchEnabled As String, _
        api_wkeSetTransparent As String, api_wkeSetUIThreadCallback As String, _
        api_wkeSetUserAgent As String, api_wkeSetUserAgentW As String, _
        api_wkeSetUserKeyValue As String, api_wkeSetViewNetInterface As String, _
        api_wkeSetViewProxy As String, api_wkeSetViewSettings As String, _
        api_wkeSetWebViewName As String, api_wkeSetWindowTitle As String, _
        api_wkeSetWindowTitleW As String, api_wkeSetZoomFactor As String, _
        api_wkeShowDevtools As String, api_wkeShowWindow As String, _
        api_wkeShutdown As String, api_wkeSleep As String, _
        api_wkeStopLoading As String, api_wkeTitle As String, _
        api_wkeTitleW As String, api_wkeToString As String, _
        api_wkeToStringW As String, api_wkeUnfocus As String

Private api_wkeUpdate As String, api_wkeUtilDecodeURLEscape As String, _
        api_wkeUtilSerializeToMHTML As String, api_wkeUtilSetUiCallback As String, _
        api_wkeVersion As String, api_wkeVersionString As String, _
        api_wkeVisitAllCookie As String, api_wkeWake As String, _
        api_wkeWebFrameGetMainFrame As String, api_wkeWebFrameGetMainWorldScriptContext As String, _
        api_wkeWebViewName As String, api_wkeWidth As String, _
        api_wkeZoomFactor As String, api_wkeSetWkeDllPath As String

Private SDLL As cUniversalDLLCalls
Private fcb As fastcallCallback

'ApiFun

Public Function wkeVersion() As Long
    wkeVersion = SDLL.CallFunction_DLL(NodeDllPath, api_wkeVersion, STR_NONE, CR_LONG, CC_CDECL)
End Function

Public Function wkeVersionString() As String
    wkeVersionString = SDLL.PointerToStringUTF8(SDLL.CallFunction_DLL(NodeDllPath, api_wkeVersionString, STR_NONE, CR_LONG, CC_CDECL))
End Function

Public Sub wkeSetWkeDllPath(ByVal dllPath As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetWkeDllPath, STR_UNICODE, CR_None, CC_CDECL, dllPath
End Sub

Public Sub wkeGC(ByVal webView As Long, ByVal delayMs As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeGC, STR_NONE, CR_None, CC_CDECL, webView, delayMs
End Sub

Public Sub wkeSetFileSystem(ByVal pfnOpen As Long, ByVal pfnClose As Long, ByVal pfnSize As Long, ByVal pfnRead As Long, ByVal pfnSeek As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetFileSystem, STR_NONE, CR_None, CC_CDECL, pfnOpen, pfnClose, pfnSize, pfnRead, pfnSeek
End Sub

Public Function wkeIsLoaded(ByVal webView As Long) As Boolean
    wkeIsLoaded = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeIsLoaded, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Function wkeIsLoadingSucceeded(ByVal webView As Long) As Boolean
    wkeIsLoadingSucceeded = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeIsLoadingSucceeded, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Function wkeIsLoadFailed(ByVal webView As Long) As Boolean
    wkeIsLoadFailed = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeIsLoadFailed, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Function wkeIsLoadComplete(ByVal webView As Long) As Boolean
    wkeIsLoadComplete = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeIsLoadComplete, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Function wkeIsDocumentReady(ByVal webView As Long) As Boolean
    wkeIsDocumentReady = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeIsDocumentReady, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Sub wkeStopLoading(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeStopLoading, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Function wkeReload(ByVal webView As Long) As Boolean
    wkeReload = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeReload, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Function wkeGetTitle(ByVal webView As Long) As String
    wkeGetTitle = SDLL.PointerToStringUTF8(SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetTitle, STR_NONE, CR_LONG, CC_CDECL, webView))
End Function

Public Function wkeGetTitleW(ByVal webView As Long) As String
    wkeGetTitleW = SDLL.PointerToStringW(SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetTitleW, STR_NONE, CR_LONG, CC_CDECL, webView))
End Function

Public Sub wkeResize(ByVal webView As Long, ByVal w As Long, ByVal h As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeResize, STR_NONE, CR_None, CC_CDECL, webView, w, h
End Sub

Public Function wkeGetWidth(ByVal webView As Long) As Long
    wkeGetWidth = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetWidth, STR_NONE, CR_LONG, CC_CDECL, webView)
End Function

Public Function wkeGetHeight(ByVal webView As Long) As Long
    wkeGetHeight = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetHeight, STR_NONE, CR_LONG, CC_CDECL, webView)
End Function

Public Function wkeGetContentWidth(ByVal webView As Long) As Long
    wkeGetContentWidth = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetContentWidth, STR_NONE, CR_LONG, CC_CDECL, webView)
End Function

Public Function wkeGetContentHeight(ByVal webView As Long) As Long
    wkeGetContentHeight = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetContentHeight, STR_NONE, CR_LONG, CC_CDECL, webView)
End Function

Public Sub wkeSetDirty(ByVal webView As Long, ByVal dirty As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetDirty, STR_NONE, CR_None, CC_CDECL, webView, booltoint(dirty)
End Sub

Public Function wkeIsDirty(ByVal webView As Long) As Boolean
    wkeIsDirty = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeIsDirty, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Sub wkeAddDirtyArea(ByVal webView As Long, ByVal x As Long, ByVal y As Long, ByVal w As Long, ByVal h As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeAddDirtyArea, STR_NONE, CR_None, CC_CDECL, webView, x, y, w, h
End Sub

Public Sub wkeLayoutIfNeeded(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeLayoutIfNeeded, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Sub wkePaint2(ByVal webView As Long, ByVal bits As Long, ByVal bufWid As Long, ByVal bufHei As Long, ByVal xDst As Long, ByVal yDst As Long, ByVal w As Long, ByVal h As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal bCopyAlpha As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkePaint2, STR_NONE, CR_None, CC_CDECL, webView, bits, bufWid, bufHei, xDst, yDst, w, h, xSrc, ySrc, booltoint(bCopyAlpha)
End Sub

Public Sub wkePaint(ByVal webView As Long, ByVal bits As Long, ByVal pitch As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkePaint, STR_NONE, CR_None, CC_CDECL, webView, bits, pitch
End Sub

Public Sub wkeRepaintIfNeeded(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeRepaintIfNeeded, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Function wkeGetViewDC(ByVal webView As Long) As Long
    wkeGetViewDC = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetViewDC, STR_NONE, CR_LONG, CC_CDECL, webView)
End Function

Public Function wkeGetHostHWND(ByVal webView As Long) As Long
    wkeGetHostHWND = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetHostHWND, STR_NONE, CR_LONG, CC_CDECL, webView)
End Function

Public Function wkeCanGoBack(ByVal webView As Long) As Boolean
    wkeCanGoBack = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeCanGoBack, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Function wkeGoBack(ByVal webView As Long) As Boolean
    wkeGoBack = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeGoBack, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Function wkeCanGoForward(ByVal webView As Long) As Boolean
    wkeCanGoForward = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeCanGoForward, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Function wkeGoForward(ByVal webView As Long) As Boolean
    wkeGoForward = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeGoForward, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Sub wkeEditorSelectAll(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeEditorSelectAll, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Sub wkeEditorUnSelect(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeEditorUnSelect, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Sub wkeEditorCopy(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeEditorCopy, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Sub wkeEditorCut(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeEditorCut, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Sub wkeEditorDelete(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeEditorDelete, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Sub wkeEditorUndo(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeEditorUndo, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Sub wkeEditorRedo(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeEditorRedo, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Function wkeGetCookieW(ByVal webView As Long) As String
    wkeGetCookieW = SDLL.PointerToStringW(SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetCookieW, STR_NONE, CR_LONG, CC_CDECL, webView))
End Function

Public Function wkeGetCookie(ByVal webView As Long) As String
    wkeGetCookie = SDLL.PointerToStringUTF8(SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetCookie, STR_NONE, CR_LONG, CC_CDECL, webView))
End Function

Public Sub wkeSetCookie(ByVal webView As Long, ByVal url As String, ByVal cookie As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetCookie, STR_ANSI, CR_None, CC_CDECL, webView, url, cookie
End Sub

Public Sub wkeVisitAllCookie(ByVal params As Long, ByVal visitor As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeVisitAllCookie, STR_NONE, CR_None, CC_CDECL, params, visitor
End Sub

Public Sub wkePerformCookieCommand(ByVal command As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkePerformCookieCommand, STR_NONE, CR_None, CC_CDECL, command
End Sub

Public Sub wkeSetCookieEnabled(ByVal webView As Long, ByVal enable As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetCookieEnabled, STR_NONE, CR_None, CC_CDECL, webView, booltoint(enable)
End Sub

Public Function wkeIsCookieEnabled(ByVal webView As Long) As Boolean
    wkeIsCookieEnabled = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeIsCookieEnabled, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Sub wkeSetCookieJarPath(ByVal webView As Long, ByVal path As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetCookieJarPath, STR_UNICODE, CR_None, CC_CDECL, webView, path
End Sub

Public Sub wkeSetCookieJarFullPath(ByVal webView As Long, ByVal path As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetCookieJarFullPath, STR_UNICODE, CR_None, CC_CDECL, webView, path
End Sub

Public Sub wkeSetLocalStorageFullPath(ByVal webView As Long, ByVal path As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetLocalStorageFullPath, STR_UNICODE, CR_None, CC_CDECL, webView, path
End Sub

Public Sub wkeSetMediaVolume(ByVal webView As Long, ByVal volume As Double)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetMediaVolume, STR_NONE, CR_None, CC_CDECL, webView, volume
End Sub

Public Function wkeGetMediaVolume(ByVal webView As Long) As Double
    wkeGetMediaVolume = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetMediaVolume, STR_NONE, CR_DOUBLE, CC_CDECL, webView)
End Function

Public Function wkeFireMouseEvent(ByVal webView As Long, ByVal message As Long, ByVal x As Long, ByVal y As Long, ByVal flags As Long) As Boolean
    wkeFireMouseEvent = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeFireMouseEvent, STR_NONE, CR_BYTE, CC_CDECL, webView, message, x, y, flags))
End Function

Public Function wkeFireContextMenuEvent(ByVal webView As Long, ByVal x As Long, ByVal y As Long, ByVal flags As Long) As Boolean
    wkeFireContextMenuEvent = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeFireContextMenuEvent, STR_NONE, CR_BYTE, CC_CDECL, webView, x, y, flags))
End Function

Public Function wkeFireMouseWheelEvent(ByVal webView As Long, ByVal x As Long, ByVal y As Long, ByVal delta As Long, ByVal flags As Long) As Boolean
    wkeFireMouseWheelEvent = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeFireMouseWheelEvent, STR_NONE, CR_BYTE, CC_CDECL, webView, x, y, delta, flags))
End Function

Public Function wkeFireKeyUpEvent(ByVal webView As Long, ByVal virtualKeyCode As Long, ByVal flags As Long, ByVal systemKey As Boolean) As Boolean
    wkeFireKeyUpEvent = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeFireKeyUpEvent, STR_NONE, CR_BYTE, CC_CDECL, webView, virtualKeyCode, flags, booltoint(systemKey)))
End Function

Public Function wkeFireKeyDownEvent(ByVal webView As Long, ByVal virtualKeyCode As Long, ByVal flags As Long, ByVal systemKey As Boolean) As Boolean
    wkeFireKeyDownEvent = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeFireKeyDownEvent, STR_NONE, CR_BYTE, CC_CDECL, webView, virtualKeyCode, flags, booltoint(systemKey)))
End Function

Public Function wkeFireKeyPressEvent(ByVal webView As Long, ByVal charCode As Long, ByVal flags As Long, ByVal systemKey As Boolean) As Boolean
    wkeFireKeyPressEvent = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeFireKeyPressEvent, STR_NONE, CR_BYTE, CC_CDECL, webView, charCode, flags, booltoint(systemKey)))
End Function

Public Function wkeFireWindowsMessage(ByVal webView As Long, ByVal hWnd As Long, ByVal message As Long, ByVal wParam As Long, ByVal lParam As Long, ByVal result As Long) As Boolean
    wkeFireWindowsMessage = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeFireWindowsMessage, STR_NONE, CR_BYTE, CC_CDECL, webView, hWnd, message, wParam, lParam, result))
End Function

Public Sub wkeSetFocus(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetFocus, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Sub wkeKillFocus(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeKillFocus, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Function wkeGetCaretRect(ByVal webView As Long) As Long
    wkeGetCaretRect = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetCaretRect, STR_NONE, CR_LONG, CC_CDECL, webView)
End Function

Public Function wkeRunJS(ByVal webView As Long, ByVal script As String) As Currency
    wkeRunJS = SDLL.CallFunction_DLL(NodeDllPath, api_wkeRunJS, STR_ANSI, CR_CURRENCY, CC_CDECL, webView, script)
End Function

Public Function wkeRunJSW(ByVal webView As Long, ByVal script As String) As Currency
    wkeRunJSW = SDLL.CallFunction_DLL(NodeDllPath, api_wkeRunJSW, STR_UNICODE, CR_CURRENCY, CC_CDECL, webView, script)
End Function

Public Function wkeGlobalExec(ByVal webView As Long) As Long
    wkeGlobalExec = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGlobalExec, STR_NONE, CR_LONG, CC_CDECL, webView)
End Function

Public Sub wkeSleep(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSleep, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Sub wkeWake(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeWake, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Function wkeIsAwake(ByVal webView As Long) As Boolean
    wkeIsAwake = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeIsAwake, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Sub wkeSetZoomFactor(ByVal webView As Long, ByVal factor As Double)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetZoomFactor, STR_NONE, CR_None, CC_CDECL, webView, factor
End Sub

Public Function wkeGetZoomFactor(ByVal webView As Long) As Double
    wkeGetZoomFactor = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetZoomFactor, STR_NONE, CR_DOUBLE, CC_CDECL, webView)
End Function

Public Sub wkeSetEditable(ByVal webView As Long, ByVal editable As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetEditable, STR_NONE, CR_None, CC_CDECL, webView, booltoint(editable)
End Sub

Public Function wkeIsMainFrame(ByVal webView As Long, ByVal frameId As Long) As Boolean
    wkeIsMainFrame = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeIsMainFrame, STR_NONE, CR_BYTE, CC_CDECL, webView, frameId))
End Function

Public Function wkeWebFrameGetMainFrame(ByVal webView As Long) As Long
    wkeWebFrameGetMainFrame = SDLL.CallFunction_DLL(NodeDllPath, api_wkeWebFrameGetMainFrame, STR_NONE, CR_LONG, CC_CDECL, webView)
End Function

Public Function wkeRunJsByFrame(ByVal webView As Long, ByVal frameId As Long, ByVal script As String, ByVal isInClosure As Boolean) As Currency
    wkeRunJsByFrame = SDLL.CallFunction_DLL(NodeDllPath, api_wkeRunJsByFrame, STR_ANSI, CR_CURRENCY, CC_CDECL, webView, frameId, script, booltoint(isInClosure))
End Function

Public Function wkeGetFrameUrl(ByVal webView As Long, ByVal frameId As Long) As String
    wkeGetFrameUrl = SDLL.PointerToStringUTF8(SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetFrameUrl, STR_NONE, CR_LONG, CC_CDECL, webView, frameId))
End Function

Public Function wkeGetString(ByVal s As Long) As String
    wkeGetString = SDLL.PointerToStringUTF8(SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetString, STR_NONE, CR_LONG, CC_CDECL, s))
End Function

Public Function wkeGetStringW(ByVal string_K As Long) As String
    wkeGetStringW = SDLL.PointerToStringW(SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetStringW, STR_NONE, CR_LONG, CC_CDECL, string_K))
End Function

Public Sub wkeSetString(ByVal string_K As Long, ByVal str As String, ByVal len_K As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetString, STR_ANSI, CR_None, CC_CDECL, string_K, str, len_K
End Sub

Public Sub wkeSetStringW(ByVal string_K As Long, ByVal str As String, ByVal len_K As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetStringW, STR_UNICODE, CR_None, CC_CDECL, string_K, str, len_K
End Sub

Public Function wkeCreateStringW(ByVal str As String, ByVal len_K As Long) As Long
    wkeCreateStringW = SDLL.CallFunction_DLL(NodeDllPath, api_wkeCreateStringW, STR_UNICODE, CR_LONG, CC_CDECL, str, len_K)
End Function

Public Sub wkeDeleteString(ByVal str As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeDeleteString, STR_NONE, CR_None, CC_CDECL, str
End Sub

Public Sub wkeSetUserKeyValue(ByVal webView As Long, ByVal key As String, ByVal value As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetUserKeyValue, STR_ANSI, CR_None, CC_CDECL, webView, key, value
End Sub

Public Function wkeGetUserKeyValue(ByVal webView As Long, ByVal key As String) As Long
    wkeGetUserKeyValue = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetUserKeyValue, STR_ANSI, CR_LONG, CC_CDECL, webView, key)
End Function

Public Function wkeGetCursorInfoType(ByVal webView As Long) As Long
    wkeGetCursorInfoType = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetCursorInfoType, STR_NONE, CR_LONG, CC_CDECL, webView)
End Function

Public Function wkeCreateWebView() As Long
    wkeCreateWebView = SDLL.CallFunction_DLL(NodeDllPath, api_wkeCreateWebView, STR_NONE, CR_LONG, CC_CDECL)
End Function

Public Sub wkeDestroyWebView(ByVal webView As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeDestroyWebView, STR_NONE, CR_None, CC_CDECL, webView
End Sub

Public Function wkeCreateWebWindow(ByVal type_K As Long, ByVal parent As Long, ByVal x As Long, ByVal y As Long, ByVal width As Long, ByVal height As Long) As Long
    wkeCreateWebWindow = SDLL.CallFunction_DLL(NodeDllPath, api_wkeCreateWebWindow, STR_NONE, CR_LONG, CC_CDECL, type_K, parent, x, y, width, height)
End Function

Public Sub wkeDestroyWebWindow(ByVal webWindow As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeDestroyWebWindow, STR_NONE, CR_None, CC_CDECL, webWindow
End Sub

Public Function wkeGetWindowHandle(ByVal webWindow As Long) As Long
    wkeGetWindowHandle = SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetWindowHandle, STR_NONE, CR_LONG, CC_CDECL, webWindow)
End Function

Public Sub wkeShowWindow(ByVal webWindow As Long, ByVal showFlag As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeShowWindow, STR_NONE, CR_None, CC_CDECL, webWindow, booltoint(showFlag)
End Sub

Public Sub wkeEnableWindow(ByVal webWindow As Long, ByVal enableFlag As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeEnableWindow, STR_NONE, CR_None, CC_CDECL, webWindow, booltoint(enableFlag)
End Sub

Public Sub wkeMoveWindow(ByVal webWindow As Long, ByVal x As Long, ByVal y As Long, ByVal width As Long, ByVal height As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeMoveWindow, STR_NONE, CR_None, CC_CDECL, webWindow, x, y, width, height
End Sub

Public Sub wkeMoveToCenter(ByVal webWindow As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeMoveToCenter, STR_NONE, CR_None, CC_CDECL, webWindow
End Sub

Public Sub wkeResizeWindow(ByVal webWindow As Long, ByVal width As Long, ByVal height As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeResizeWindow, STR_NONE, CR_None, CC_CDECL, webWindow, width, height
End Sub

Public Sub wkeSetWindowTitle(ByVal webWindow As Long, ByVal title As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetWindowTitle, STR_ANSI, CR_None, CC_CDECL, webWindow, title
End Sub

Public Sub wkeSetDeviceParameter(ByVal webView As Long, ByVal device As String, ByVal paramStr As String, ByVal paramInt As Long, ByVal paramdouble As Double)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetDeviceParameter, STR_ANSI, CR_None, CC_CDECL, webView, device, paramStr, paramInt, paramdouble
End Sub

Public Sub wkeInit()
    SDLL.CallFunction_DLL NodeDllPath, api_wkeInit, STR_NONE, CR_None, CC_CDECL
End Sub

Public Sub wkeShutdown()
    SDLL.CallFunction_DLL NodeDllPath, api_wkeShutdown, STR_NONE, CR_None, CC_CDECL
End Sub

Public Sub wkeInitialize()
    SDLL.CallFunction_DLL NodeDllPath, api_wkeInitialize, STR_NONE, CR_None, CC_CDECL
End Sub

Public Sub wkeInitializeEx(ByVal settings As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeInitializeEx, STR_NONE, CR_None, CC_CDECL, settings
End Sub

Public Sub wkeSetProxy(ByVal proxy As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetProxy, STR_NONE, CR_None, CC_CDECL, proxy
End Sub

Public Sub wkeSetViewProxy(ByVal webView As Long, ByVal proxy As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetViewProxy, STR_NONE, CR_None, CC_CDECL, webView, proxy
End Sub

Public Sub wkeConfigure(ByVal settings As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeConfigure, STR_NONE, CR_None, CC_CDECL, settings
End Sub

Public Function wkeIsInitialize() As Boolean
    wkeIsInitialize = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeIsInitialize, STR_NONE, CR_BYTE, CC_CDECL))
End Function

Public Sub wkeFinalize()
    SDLL.CallFunction_DLL NodeDllPath, api_wkeFinalize, STR_NONE, CR_None, CC_CDECL
End Sub

Public Sub wkeSetMemoryCacheEnable(ByVal webView As Long, ByVal b As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetMemoryCacheEnable, STR_NONE, CR_None, CC_CDECL, webView, booltoint(b)
End Sub

Public Sub wkeSetTouchEnabled(ByVal webView As Long, ByVal b As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetTouchEnabled, STR_NONE, CR_None, CC_CDECL, webView, booltoint(b)
End Sub

Public Sub wkeSetMouseEnabled(ByVal webView As Long, ByVal b As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetMouseEnabled, STR_NONE, CR_None, CC_CDECL, webView, booltoint(b)
End Sub

Public Sub wkeSetNavigationToNewWindowEnable(ByVal webView As Long, ByVal b As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetNavigationToNewWindowEnable, STR_NONE, CR_None, CC_CDECL, webView, booltoint(b)
End Sub

Public Sub wkeSetCspCheckEnable(ByVal webView As Long, ByVal b As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetCspCheckEnable, STR_NONE, CR_None, CC_CDECL, webView, booltoint(b)
End Sub

Public Sub wkeSetNpapiPluginsEnabled(ByVal webView As Long, ByVal b As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetNpapiPluginsEnabled, STR_NONE, CR_None, CC_CDECL, webView, booltoint(b)
End Sub

Public Sub wkeSetHeadlessEnabled(ByVal webView As Long, ByVal b As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetHeadlessEnabled, STR_NONE, CR_None, CC_CDECL, webView, booltoint(b)
End Sub

Public Sub wkeSetDebugConfig(ByVal webView As Long, ByVal debugString As String, ByVal param As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetDebugConfig, STR_ANSI, CR_None, CC_CDECL, webView, debugString, UTF8_URLEncoding(param)
End Sub

Public Sub wkeSetHandle(ByVal webView As Long, ByVal wnd As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetHandle, STR_NONE, CR_None, CC_CDECL, webView, wnd
End Sub

Public Sub wkeSetHandleOffset(ByVal webView As Long, ByVal x As Long, ByVal y As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetHandleOffset, STR_NONE, CR_None, CC_CDECL, webView, x, y
End Sub

Public Sub wkeSetViewSettings(ByVal webView As Long, ByVal settings As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetViewSettings, STR_NONE, CR_None, CC_CDECL, webView, settings
End Sub

Public Sub wkeSetTransparent(ByVal webView As Long, ByVal transparent As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetTransparent, STR_NONE, CR_None, CC_CDECL, webView, booltoint(transparent)
End Sub

Public Function wkeIsTransparent(ByVal webView As Long) As Boolean
    wkeIsTransparent = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeIsTransparent, STR_NONE, CR_BYTE, CC_CDECL, webView))
End Function

Public Sub wkeSetUserAgent(ByVal webView As Long, ByVal userAgent As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetUserAgent, STR_ANSI, CR_None, CC_CDECL, webView, userAgent
End Sub

Public Sub wkeSetUserAgentW(ByVal webView As Long, ByVal userAgent As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetUserAgentW, STR_UNICODE, CR_None, CC_CDECL, webView, userAgent
End Sub

Public Function wkeGetUserAgent(ByVal webView As Long) As String
    wkeGetUserAgent = SDLL.PointerToStringUTF8(SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetUserAgent, STR_NONE, CR_LONG, CC_CDECL, webView))
End Function

Public Sub wkeLoadURL(ByVal webView As Long, ByVal url As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeLoadURL, STR_ANSI, CR_None, CC_CDECL, webView, url
End Sub

Public Sub wkeLoadW(ByVal webView As Long, ByVal url As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeLoadW, STR_UNICODE, CR_None, CC_CDECL, webView, url
End Sub

Public Sub wkeLoadHTML(ByVal webView As Long, ByVal html As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeLoadHTML, STR_ANSI, CR_None, CC_CDECL, webView, html
End Sub

Public Sub wkeLoadHTMLW(ByVal webView As Long, ByVal html As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeLoadHTMLW, STR_UNICODE, CR_None, CC_CDECL, webView, html
End Sub

Public Sub wkeLoadHtmlWithBaseUrl(ByVal webView As Long, ByVal html As String, ByVal baseUrl As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeLoadHtmlWithBaseUrl, STR_ANSI, CR_None, CC_CDECL, webView, html, baseUrl
End Sub

Public Sub wkeLoadFile(ByVal webView As Long, ByVal filename As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeLoadFile, STR_ANSI, CR_None, CC_CDECL, webView, filename
End Sub

Public Sub wkeLoadFileW(ByVal webView As Long, ByVal filename As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeLoadFileW, STR_UNICODE, CR_None, CC_CDECL, webView, filename
End Sub

Public Function wkeGetURL(ByVal webView As Long) As String
    wkeGetURL = SDLL.PointerToStringUTF8(SDLL.CallFunction_DLL(NodeDllPath, api_wkeGetURL, STR_NONE, CR_LONG, CC_CDECL, webView))
End Function

Public Sub wkeNetSetHTTPHeaderField(ByVal jobPtr As Long, ByVal key As String, ByVal value As String, ByVal response As Boolean)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeNetSetHTTPHeaderField, STR_UNICODE, CR_None, CC_CDECL, jobPtr, key, value, booltoint(response)
End Sub

Public Sub wkeNetSetMIMEType(ByVal jobPtr As Long, ByVal type_K As String)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeNetSetMIMEType, STR_ANSI, CR_None, CC_CDECL, jobPtr, type_K
End Sub

Public Function wkeNetGetMIMEType(ByVal jobPtr As Long, ByVal mime As Long) As String
    wkeNetGetMIMEType = SDLL.PointerToStringA(SDLL.CallFunction_DLL(NodeDllPath, api_wkeNetGetMIMEType, STR_NONE, CR_LONG, CC_CDECL, jobPtr, mime))
End Function

Public Sub wkeNetSetData(ByVal jobPtr As Long, ByVal buf As Long, ByVal len_K As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeNetSetData, STR_NONE, CR_None, CC_CDECL, jobPtr, buf, len_K
End Sub

Public Sub wkeNetCancelRequest(ByVal jobPtr As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeNetCancelRequest, STR_NONE, CR_None, CC_CDECL, jobPtr
End Sub

Public Function wkeNetHoldJobToAsynCommit(ByVal jobPtr As Long) As Boolean
    wkeNetHoldJobToAsynCommit = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_wkeNetHoldJobToAsynCommit, STR_NONE, CR_BYTE, CC_CDECL, jobPtr))
End Function

Public Function wkeNetGetRequestMethod(ByVal jobPtr As Long) As Long
    wkeNetGetRequestMethod = SDLL.CallFunction_DLL(NodeDllPath, api_wkeNetGetRequestMethod, STR_NONE, CR_LONG, CC_CDECL, jobPtr)
End Function

Public Function wkeNetGetPostBody(ByVal jobPtr As Long) As Long
    wkeNetGetPostBody = SDLL.CallFunction_DLL(NodeDllPath, api_wkeNetGetPostBody, STR_NONE, CR_LONG, CC_CDECL, jobPtr)
End Function

Public Function wkeNetCreatePostBodyElements(ByVal webView As Long, ByVal Length As Long) As Long
    wkeNetCreatePostBodyElements = SDLL.CallFunction_DLL(NodeDllPath, api_wkeNetCreatePostBodyElements, STR_NONE, CR_LONG, CC_CDECL, webView, Length)
End Function

Public Sub wkeNetFreePostBodyElements(ByVal elements As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeNetFreePostBodyElements, STR_NONE, CR_None, CC_CDECL, elements
End Sub

Public Function wkeNetCreatePostBodyElement(ByVal webView As Long) As Long
    wkeNetCreatePostBodyElement = SDLL.CallFunction_DLL(NodeDllPath, api_wkeNetCreatePostBodyElement, STR_NONE, CR_LONG, CC_CDECL, webView)
End Function

Public Sub wkeNetFreePostBodyElement(ByVal element As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeNetFreePostBodyElement, STR_NONE, CR_None, CC_CDECL, element
End Sub

Public Function jsArgCount(ByVal es As Long) As Long
    jsArgCount = SDLL.CallFunction_DLL(NodeDllPath, api_jsArgCount, STR_NONE, CR_LONG, CC_CDECL, es)
End Function

Public Function jsArgType(ByVal es As Long, ByVal argIdx As Long) As Long
    jsArgType = SDLL.CallFunction_DLL(NodeDllPath, api_jsArgType, STR_NONE, CR_LONG, CC_CDECL, es, argIdx)
End Function

Public Function jsArg(ByVal es As Long, ByVal argIdx As Long) As Currency
    jsArg = SDLL.CallFunction_DLL(NodeDllPath, api_jsArg, STR_NONE, CR_CURRENCY, CC_CDECL, es, argIdx)
End Function

Public Function jsTypeOf(ByVal v As Currency) As Long
    jsTypeOf = SDLL.CallFunction_DLL(NodeDllPath, api_jsTypeOf, STR_NONE, CR_LONG, CC_CDECL, v)
End Function

Public Function jsIsNumber(ByVal v As Currency) As Boolean
    jsIsNumber = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_jsIsNumber, STR_NONE, CR_BYTE, CC_CDECL, v))
End Function

Public Function jsIsString(ByVal v As Currency) As Boolean
    jsIsString = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_jsIsString, STR_NONE, CR_BYTE, CC_CDECL, v))
End Function

Public Function jsIsBoolean(ByVal v As Currency) As Boolean
    jsIsBoolean = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_jsIsBoolean, STR_NONE, CR_BYTE, CC_CDECL, v))
End Function

Public Function jsIsObject(ByVal v As Currency) As Boolean
    jsIsObject = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_jsIsObject, STR_NONE, CR_BYTE, CC_CDECL, v))
End Function

Public Function jsIsTrue(ByVal v As Currency) As Boolean
    jsIsTrue = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_jsIsTrue, STR_NONE, CR_BYTE, CC_CDECL, v))
End Function

Public Function jsIsFalse(ByVal v As Currency) As Boolean
    jsIsFalse = inttobool(SDLL.CallFunction_DLL(NodeDllPath, api_jsIsFalse, STR_NONE, CR_BYTE, CC_CDECL, v))
End Function

Public Function jsToInt(ByVal es As Long, ByVal v As Currency) As Long
    jsToInt = SDLL.CallFunction_DLL(NodeDllPath, api_jsToInt, STR_NONE, CR_LONG, CC_CDECL, es, v)
End Function

Public Function jsToDouble(ByVal es As Long, ByVal v As Currency) As Double
    jsToDouble = SDLL.CallFunction_DLL(NodeDllPath, api_jsToDouble, STR_NONE, CR_DOUBLE, CC_CDECL, es, v)
End Function

Public Function jsToTempStringW(ByVal es As Long, ByVal v As Currency) As String
    jsToTempStringW = SDLL.PointerToStringW(SDLL.CallFunction_DLL(NodeDllPath, api_jsToTempStringW, STR_NONE, CR_LONG, CC_CDECL, es, v))
End Function

Public Function jsToTempString(ByVal es As Long, ByVal v As Currency) As String
    jsToTempString = SDLL.PointerToStringUTF8(SDLL.CallFunction_DLL(NodeDllPath, api_jsToTempString, STR_NONE, CR_LONG, CC_CDECL, es, v))
End Function

Public Function jsToString(ByVal es As Long, ByVal v As Currency) As String
    jsToString = SDLL.PointerToStringUTF8(SDLL.CallFunction_DLL(NodeDllPath, api_jsToString, STR_NONE, CR_LONG, CC_CDECL, es, v))
End Function

Public Function jsToStringW(ByVal es As Long, ByVal v As Currency) As String
    jsToStringW = SDLL.PointerToStringW(SDLL.CallFunction_DLL(NodeDllPath, api_jsToStringW, STR_NONE, CR_LONG, CC_CDECL, es, v))
End Function

Public Function jsInt(ByVal n_K As Long) As Currency
    jsInt = SDLL.CallFunction_DLL(NodeDllPath, api_jsInt, STR_NONE, CR_CURRENCY, CC_CDECL, n_K)
End Function

Public Function jsString(ByVal es As Long, ByVal str As String) As Currency
    jsString = SDLL.CallFunction_DLL(NodeDllPath, api_jsString, STR_ANSI, CR_CURRENCY, CC_CDECL, es, str)
End Function

Public Function jsArrayBuffer(ByVal es As Long, ByVal buffer As Long, ByVal size As Long) As Currency
    jsArrayBuffer = SDLL.CallFunction_DLL(NodeDllPath, api_jsArrayBuffer, STR_NONE, CR_CURRENCY, CC_CDECL, es, buffer, size)
End Function

Public Function jsGetArrayBuffer(ByVal es As Long, ByVal value As Currency) As Long
    jsGetArrayBuffer = SDLL.CallFunction_DLL(NodeDllPath, api_jsGetArrayBuffer, STR_NONE, CR_LONG, CC_CDECL, es, value)
End Function

Public Function jsEmptyObject(ByVal es As Long) As Currency
    jsEmptyObject = SDLL.CallFunction_DLL(NodeDllPath, api_jsEmptyObject, STR_NONE, CR_CURRENCY, CC_CDECL, es)
End Function

Public Function jsEvalW(ByVal es As Long, ByVal str As String) As Currency
    jsEvalW = SDLL.CallFunction_DLL(NodeDllPath, api_jsEvalW, STR_UNICODE, CR_CURRENCY, CC_CDECL, es, str)
End Function

Public Function jsEvalExW(ByVal es As Long, ByVal str As String, ByVal isInClosure As Boolean) As Currency
    jsEvalExW = SDLL.CallFunction_DLL(NodeDllPath, api_jsEvalExW, STR_UNICODE, CR_CURRENCY, CC_CDECL, es, str, booltoint(isInClosure))
End Function

Public Function jsCall(ByVal es As Long, ByVal func As Long, ByVal thisValue As Long, ByVal args As Long, ByVal argCount As Long) As Currency
    jsCall = SDLL.CallFunction_DLL(NodeDllPath, api_jsCall, STR_NONE, CR_CURRENCY, CC_CDECL, es, func, thisValue, args, argCount)
End Function

Public Function jsCallGlobal(ByVal es As Long, ByVal func As Long, ByVal args As Long, ByVal argCount As Long) As Currency
    jsCallGlobal = SDLL.CallFunction_DLL(NodeDllPath, api_jsCallGlobal, STR_NONE, CR_CURRENCY, CC_CDECL, es, func, args, argCount)
End Function

Public Function jsGet(ByVal es As Long, ByVal object As Long, ByVal prop As String) As Currency
    jsGet = SDLL.CallFunction_DLL(NodeDllPath, api_jsGet, STR_ANSI, CR_CURRENCY, CC_CDECL, es, object, prop)
End Function

Public Sub jsSet(ByVal es As Long, ByVal object As Long, ByVal prop As String, ByVal value As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_jsSet, STR_ANSI, CR_None, CC_CDECL, es, object, prop, value
End Sub

Public Function jsGetGlobal(ByVal es As Long, ByVal prop As String) As Currency
    jsGetGlobal = SDLL.CallFunction_DLL(NodeDllPath, api_jsGetGlobal, STR_ANSI, CR_CURRENCY, CC_CDECL, es, prop)
End Function

Public Sub jsSetGlobal(ByVal es As Long, ByVal prop As String, ByVal v As Currency)
    SDLL.CallFunction_DLL NodeDllPath, api_jsSetGlobal, STR_ANSI, CR_None, CC_CDECL, es, prop, v
End Sub

Public Function jsGetAt(ByVal es As Long, ByVal object As Currency, ByVal index As Long) As Currency
    jsGetAt = SDLL.CallFunction_DLL(NodeDllPath, api_jsGetAt, STR_NONE, CR_CURRENCY, CC_CDECL, es, object, index)
End Function

Public Sub jsSetAt(ByVal es As Long, ByVal object As Currency, ByVal index As Long, ByVal value As Currency)
    SDLL.CallFunction_DLL NodeDllPath, api_jsSetAt, STR_NONE, CR_None, CC_CDECL, es, object, index, value
End Sub

Public Function jsGetKeys(ByVal es As Long, ByVal object As Currency) As Long
    jsGetKeys = SDLL.CallFunction_DLL(NodeDllPath, api_jsGetKeys, STR_NONE, CR_LONG, CC_CDECL, es, object)
End Function

Public Function jsGetLength(ByVal es As Long, ByVal object As Currency) As Long
    jsGetLength = SDLL.CallFunction_DLL(NodeDllPath, api_jsGetLength, STR_NONE, CR_LONG, CC_CDECL, es, object)
End Function

Public Sub jsSetLength(ByVal es As Long, ByVal object As Currency, ByVal Length As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_jsSetLength, STR_NONE, CR_None, CC_CDECL, es, object, Length
End Sub

Public Function jsGetWebView(ByVal es As Long) As Long
    jsGetWebView = SDLL.CallFunction_DLL(NodeDllPath, api_jsGetWebView, STR_NONE, CR_LONG, CC_CDECL, es)
End Function

Public Sub jsGC()
    SDLL.CallFunction_DLL NodeDllPath, api_jsGC, STR_NONE, CR_None, CC_CDECL
End Sub

Public Function jsObject(ByVal es As Long, ByVal data As Long) As Currency
    jsObject = SDLL.CallFunction_DLL(NodeDllPath, api_jsObject, STR_NONE, CR_CURRENCY, CC_CDECL, es, data)
End Function

Public Function jsFunction(ByVal es As Long, ByVal data As Long) As Currency
    jsFunction = SDLL.CallFunction_DLL(NodeDllPath, api_jsFunction, STR_NONE, CR_CURRENCY, CC_CDECL, es, data)
End Function

Public Function jsGetData(ByVal es As Long, ByVal value As Currency) As Long
    jsGetData = SDLL.CallFunction_DLL(NodeDllPath, api_jsGetData, STR_NONE, CR_LONG, CC_CDECL, es, value)
End Function

Public Function jsGetLastErrorIfException(ByVal es As Long) As Long
    jsGetLastErrorIfException = SDLL.CallFunction_DLL(NodeDllPath, api_jsGetLastErrorIfException, STR_NONE, CR_LONG, CC_CDECL, es)
End Function

Public Sub wkeNetHookRequest(ByVal job As Long)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeNetHookRequest, STR_NONE, CR_None, CC_CDECL, job
End Sub

'CallBackFun

Public Sub wkeNetOnResponse(ByVal webView As Long, ByVal callback As Long, ByVal param As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 4)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeNetOnResponse, STR_NONE, CR_None, CC_CDECL, webView, TAddress, param
End Sub

Public Sub wkeSetUIThreadCallback(ByVal webView As Long, ByVal callback As Long, ByVal param As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 3)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeSetUIThreadCallback, STR_NONE, CR_None, CC_CDECL, webView, TAddress, param
End Sub

Public Function wkeNetGetFavicon(ByVal webView As Long, ByVal callback As Long, ByVal param As Long) As Long
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 4)
    wkeNetGetFavicon = SDLL.CallFunction_DLL(NodeDllPath, api_wkeNetGetFavicon, STR_NONE, CR_LONG, CC_CDECL, webView, TAddress, param)
End Function

Public Sub jsBindFunction(ByVal name As String, ByVal fn As Long, ByVal argCount As Long)
    Dim TAddress As Long: TAddress = fcb.»Øµ÷fastcall(1, fn, False)
    SDLL.CallFunction_DLL NodeDllPath, api_jsBindFunction, STR_ANSI, CR_None, CC_CDECL, name, TAddress, argCount
End Sub

Public Sub jsBindGetter(ByVal name As String, ByVal fn As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(fn, 1)
    SDLL.CallFunction_DLL NodeDllPath, api_jsBindGetter, STR_ANSI, CR_None, CC_CDECL, name, TAddress
End Sub

Public Sub jsBindSetter(ByVal name As String, ByVal fn As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(fn, 1)
    SDLL.CallFunction_DLL NodeDllPath, api_jsBindSetter, STR_ANSI, CR_None, CC_CDECL, name, TAddress
End Sub

Public Sub wkeJsBindFunction(ByVal name As String, ByVal fn As Long, ByVal param As Long, ByVal argCount As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(fn, 2)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeJsBindFunction, STR_ANSI, CR_None, CC_CDECL, name, TAddress, param, argCount
End Sub

Public Sub wkeOnTitleChanged(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 3)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnTitleChanged, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnMouseOverUrlChanged(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 3)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnMouseOverUrlChanged, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnURLChanged(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 3)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnURLChanged, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnURLChanged2(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 4)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnURLChanged2, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnPaintUpdated(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 7)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnPaintUpdated, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnPaintBitUpdated(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 6)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnPaintBitUpdated, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnAlertBox(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 3)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnAlertBox, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnConfirmBox(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 3)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnConfirmBox, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnPromptBox(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 5)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnPromptBox, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnNavigation(ByVal webView As Long, ByVal callback As Long, ByVal param As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 4)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnNavigation, STR_NONE, CR_None, CC_CDECL, webView, TAddress, param
End Sub

Public Sub wkeOnCreateView(ByVal webView As Long, ByVal callback As Long, ByVal param As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 5)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnCreateView, STR_NONE, CR_None, CC_CDECL, webView, TAddress, param
End Sub

Public Sub wkeOnDocumentReady(ByVal webView As Long, ByVal callback As Long, ByVal param As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 2)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnDocumentReady, STR_NONE, CR_None, CC_CDECL, webView, TAddress, param
End Sub

Public Sub wkeOnDocumentReady2(ByVal webView As Long, ByVal callback As Long, ByVal param As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 3)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnDocumentReady2, STR_NONE, CR_None, CC_CDECL, webView, TAddress, param
End Sub

Public Sub wkeOnDownload(ByVal webView As Long, ByVal callback As Long, ByVal param As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 3)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnDownload, STR_NONE, CR_None, CC_CDECL, webView, TAddress, param
End Sub

Public Sub wkeOnConsole(ByVal webView As Long, ByVal callback As Long, ByVal param As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 7)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnConsole, STR_NONE, CR_None, CC_CDECL, webView, TAddress, param
End Sub

Public Sub wkeOnLoadUrlBegin(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 4)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnLoadUrlBegin, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnLoadUrlEnd(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 6)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnLoadUrlEnd, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnDidCreateScriptContext(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 6)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnDidCreateScriptContext, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnWillReleaseScriptContext(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 5)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnWillReleaseScriptContext, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnWillMediaLoad(ByVal webView As Long, ByVal callback As Long, ByVal callbackParam As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 4)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnWillMediaLoad, STR_NONE, CR_None, CC_CDECL, webView, TAddress, callbackParam
End Sub

Public Sub wkeOnWindowClosing(ByVal webWindow As Long, ByVal callback As Long, ByVal param As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 2)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnWindowClosing, STR_NONE, CR_None, CC_CDECL, webWindow, TAddress, param
End Sub

Public Sub wkeOnWindowDestroy(ByVal webWindow As Long, ByVal callback As Long, ByVal param As Long)
    Dim TAddress As Long: TAddress = SDLL.ThunkFor_CDeclCallbackToVB(callback, 2)
    SDLL.CallFunction_DLL NodeDllPath, api_wkeOnWindowDestroy, STR_NONE, CR_None, CC_CDECL, webWindow, TAddress, param
End Sub

'ClassSetting

Private Sub Class_Initialize()
    wke_api_init
    InitMiniblinkAPI
    Set SDLL = New cUniversalDLLCalls
    Set fcb = New fastcallCallback
End Sub

Private Sub InitMiniblinkAPI()
    api_jsAddRef = "jsAddRef"
    api_jsArg = "jsArg"
    api_jsArgCount = "jsArgCount"
    api_jsArgType = "jsArgType"
    api_jsArrayBuffer = "jsArrayBuffer"
    api_jsBindFunction = "jsBindFunction"
    api_jsBindGetter = "jsBindGetter"
    api_jsBindSetter = "jsBindSetter"
    api_jsBoolean = "jsBoolean"
    api_jsCall = "jsCall"
    api_jsCallGlobal = "jsCallGlobal"
    api_jsDeleteObjectProp = "jsDeleteObjectProp"
    api_jsDouble = "jsDouble"
    api_jsEmptyArray = "jsEmptyArray"
    api_jsEmptyObject = "jsEmptyObject"
    api_jsEval = "jsEval"
    api_jsEvalExW = "jsEvalExW"
    api_jsEvalW = "jsEvalW"
    api_jsFalse = "jsFalse"
    api_jsFloat = "jsFloat"
    api_jsFunction = "jsFunction"
    api_jsGC = "jsGC"
    api_jsGet = "jsGet"
    api_jsGetArrayBuffer = "jsGetArrayBuffer"
    api_jsGetAt = "jsGetAt"
    api_jsGetCallstack = "jsGetCallstack"
    api_jsGetData = "jsGetData"
    api_jsGetGlobal = "jsGetGlobal"
    api_jsGetKeys = "jsGetKeys"
    api_jsGetLastErrorIfException = "jsGetLastErrorIfException"
    api_jsGetLength = "jsGetLength"
    api_jsGetWebView = "jsGetWebView"
    api_jsGlobalObject = "jsGlobalObject"
    api_jsInt = "jsInt"
    api_jsIsArray = "jsIsArray"
    api_jsIsBoolean = "jsIsBoolean"
    api_jsIsFalse = "jsIsFalse"
    api_jsIsFunction = "jsIsFunction"
    api_jsIsJsValueValid = "jsIsJsValueValid"
    api_jsIsNull = "jsIsNull"
    api_jsIsNumber = "jsIsNumber"
    api_jsIsObject = "jsIsObject"
    api_jsIsString = "jsIsString"
    api_jsIsTrue = "jsIsTrue"
    api_jsIsUndefined = "jsIsUndefined"
    api_jsIsValidExecState = "jsIsValidExecState"
    api_jsNull = "jsNull"
    api_jsObject = "jsObject"
    api_jsReleaseRef = "jsReleaseRef"
    api_jsSet = "jsSet"
    api_jsSetAt = "jsSetAt"
    api_jsSetGlobal = "jsSetGlobal"
    api_jsSetLength = "jsSetLength"
    api_jsString = "jsString"
    api_jsStringW = "jsStringW"
    api_jsThrowException = "jsThrowException"
    api_jsToBoolean = "jsToBoolean"
    api_jsToDouble = "jsToDouble"
    api_jsToFloat = "jsToFloat"
    api_jsToInt = "jsToInt"
    api_jsToString = "jsToString"
    api_jsToStringW = "jsToStringW"
    api_jsToTempString = "jsToTempString"
    api_jsToTempStringW = "jsToTempStringW"
    api_jsToV8Value = "jsToV8Value"
    api_jsTrue = "jsTrue"
    api_jsTypeOf = "jsTypeOf"
    api_jsUndefined = "jsUndefined"
    api_wkeAddDirtyArea = "wkeAddDirtyArea"
    api_wkeAddNpapiPlugin = "wkeAddNpapiPlugin"
    api_wkeAddPluginDirectory = "wkeAddPluginDirectory"
    api_wkeAwaken = "wkeAwaken"
    api_wkeCanGoBack = "wkeCanGoBack"
    api_wkeCanGoForward = "wkeCanGoForward"
    api_wkeConfigure = "wkeConfigure"
    api_wkeContentsHeight = "wkeContentsHeight"
    api_wkeContentsWidth = "wkeContentsWidth"
    api_wkeContextMenuEvent = "wkeContextMenuEvent"
    api_wkeCookieEnabled = "wkeCookieEnabled"
    api_wkeCopy = "wkeCopy"
    api_wkeCreateMemBuf = "wkeCreateMemBuf"
    api_wkeCreateString = "wkeCreateString"
    api_wkeCreateStringW = "wkeCreateStringW"
    api_wkeCreateWebView = "wkeCreateWebView"
    api_wkeCreateWebWindow = "wkeCreateWebWindow"
    api_wkeCut = "wkeCut"
    api_wkeDelete = "wkeDelete"
    api_wkeDeleteString = "wkeDeleteString"
    api_wkeDestroyWebView = "wkeDestroyWebView"
    api_wkeDestroyWebWindow = "wkeDestroyWebWindow"
    api_wkeDragTargetDragEnter = "wkeDragTargetDragEnter"
    api_wkeDragTargetDragLeave = "wkeDragTargetDragLeave"
    api_wkeDragTargetDragOver = "wkeDragTargetDragOver"
    api_wkeDragTargetDrop = "wkeDragTargetDrop"
    api_wkeDragTargetEnd = "wkeDragTargetEnd"
    api_wkeEditorCopy = "wkeEditorCopy"
    api_wkeEditorCut = "wkeEditorCut"
    api_wkeEditorDelete = "wkeEditorDelete"
    api_wkeEditorPaste = "wkeEditorPaste"
    api_wkeEditorRedo = "wkeEditorRedo"
    api_wkeEditorSelectAll = "wkeEditorSelectAll"
    api_wkeEditorUndo = "wkeEditorUndo"
    api_wkeEditorUnSelect = "wkeEditorUnSelect"
    api_wkeEnableWindow = "wkeEnableWindow"
    api_wkeFinalize = "wkeFinalize"
    api_wkeFireContextMenuEvent = "wkeFireContextMenuEvent"
    api_wkeFireKeyDownEvent = "wkeFireKeyDownEvent"
    api_wkeFireKeyPressEvent = "wkeFireKeyPressEvent"
    api_wkeFireKeyUpEvent = "wkeFireKeyUpEvent"
    api_wkeFireMouseEvent = "wkeFireMouseEvent"
    api_wkeFireMouseWheelEvent = "wkeFireMouseWheelEvent"
    api_wkeFireWindowsMessage = "wkeFireWindowsMessage"
    api_wkeFocus = "wkeFocus"
    api_wkeFreeMemBuf = "wkeFreeMemBuf"
    api_wkeGC = "wkeGC"
    api_wkeGetBlinkMainThreadIsolate = "wkeGetBlinkMainThreadIsolate"
    api_wkeGetCaret = "wkeGetCaret"
    api_wkeGetCaretRect = "wkeGetCaretRect"
    api_wkeGetClientHandler = "wkeGetClientHandler"
    api_wkeGetContentHeight = "wkeGetContentHeight"
    api_wkeGetContentWidth = "wkeGetContentWidth"
    api_wkeGetCookie = "wkeGetCookie"
    api_wkeGetCookieW = "wkeGetCookieW"
    api_wkeGetCursorInfoType = "wkeGetCursorInfoType"
    api_wkeGetDocumentCompleteURL = "wkeGetDocumentCompleteURL"
    api_wkeGetFrameUrl = "wkeGetFrameUrl"
    api_wkeGetGlobalExecByFrame = "wkeGetGlobalExecByFrame"
    api_wkeGetHeight = "wkeGetHeight"
    api_wkeGetHostHWND = "wkeGetHostHWND"
    api_wkeGetMediaVolume = "wkeGetMediaVolume"
    api_wkeGetName = "wkeGetName"
    api_wkeGetSource = "wkeGetSource"
    api_wkeGetString = "wkeGetString"
    api_wkeGetStringW = "wkeGetStringW"
    api_wkeGetTempCallbackInfo = "wkeGetTempCallbackInfo"
    api_wkeGetTitle = "wkeGetTitle"
    api_wkeGetTitleW = "wkeGetTitleW"
    api_wkeGetURL = "wkeGetURL"
    api_wkeGetUserAgent = "wkeGetUserAgent"
    api_wkeGetUserKeyValue = "wkeGetUserKeyValue"
    api_wkeGetVersion = "wkeGetVersion"
    api_wkeGetVersionString = "wkeGetVersionString"
    api_wkeGetViewDC = "wkeGetViewDC"
    api_wkeGetWebViewByNData = "wkeGetWebViewByNData"
    api_wkeGetWebViewForCurrentContext = "wkeGetWebViewForCurrentContext"
    api_wkeGetWebviewId = "wkeGetWebviewId"
    api_wkeGetWidth = "wkeGetWidth"
    api_wkeGetWindowHandle = "wkeGetWindowHandle"
    api_wkeGetZoomFactor = "wkeGetZoomFactor"
    api_wkeGlobalExec = "wkeGlobalExec"
    api_wkeGoBack = "wkeGoBack"
    api_wkeGoForward = "wkeGoForward"
    api_wkeGoToIndex = "wkeGoToIndex"
    api_wkeGoToOffset = "wkeGoToOffset"
    api_wkeHeight = "wkeHeight"
    api_wkeInit = "wkeInit"
    api_wkeInitialize = "wkeInitialize"
    api_wkeInitializeEx = "wkeInitializeEx"
    api_wkeInsertCSSByFrame = "wkeInsertCSSByFrame"
    api_wkeIsAwake = "wkeIsAwake"
    api_wkeIsCookieEnabled = "wkeIsCookieEnabled"
    api_wkeIsDirty = "wkeIsDirty"
    api_wkeIsDocumentReady = "wkeIsDocumentReady"
    api_wkeIsInitialize = "wkeIsInitialize"
    api_wkeIsLoadComplete = "wkeIsLoadComplete"
    api_wkeIsLoaded = "wkeIsLoaded"
    api_wkeIsLoadFailed = "wkeIsLoadFailed"
    api_wkeIsLoading = "wkeIsLoading"
    api_wkeIsLoadingCompleted = "wkeIsLoadingCompleted"
    api_wkeIsLoadingFailed = "wkeIsLoadingFailed"
    api_wkeIsLoadingSucceeded = "wkeIsLoadingSucceeded"
    api_wkeIsMainFrame = "wkeIsMainFrame"
    api_wkeIsProcessingUserGesture = "wkeIsProcessingUserGesture"
    api_wkeIsTransparent = "wkeIsTransparent"
    api_wkeIsWebRemoteFrame = "wkeIsWebRemoteFrame"
    api_wkeIsWebviewAlive = "wkeIsWebviewAlive"
    api_wkeJsBindFunction = "wkeJsBindFunction"
    api_wkeJsBindGetter = "wkeJsBindGetter"
    api_wkeJsBindSetter = "wkeJsBindSetter"
    api_wkeKeyDown = "wkeKeyDown"
    api_wkeKeyPress = "wkeKeyPress"
    api_wkeKeyUp = "wkeKeyUp"
    api_wkeKillFocus = "wkeKillFocus"
    api_wkeLayoutIfNeeded = "wkeLayoutIfNeeded"
    api_wkeLoadFile = "wkeLoadFile"
    api_wkeLoadFileW = "wkeLoadFileW"
    api_wkeLoadHTML = "wkeLoadHTML"
    api_wkeLoadHTMLW = "wkeLoadHTMLW"
    api_wkeLoadHtmlWithBaseUrl = "wkeLoadHtmlWithBaseUrl"
    api_wkeLoadURL = "wkeLoadURL"
    api_wkeLoadURLW = "wkeLoadURLW"
    api_wkeLoadW = "wkeLoadW"
    api_wkeMediaVolume = "wkeMediaVolume"
    api_wkeMouseEvent = "wkeMouseEvent"
    api_wkeMouseWheel = "wkeMouseWheel"
    api_wkeMoveToCenter = "wkeMoveToCenter"
    api_wkeMoveWindow = "wkeMoveWindow"
    api_wkeNetAddHTTPHeaderFieldToUrlRequest = "wkeNetAddHTTPHeaderFieldToUrlRequest"
    api_wkeNetCancelRequest = "wkeNetCancelRequest"
    api_wkeNetCancelWebUrlRequest = "wkeNetCancelWebUrlRequest"
    api_wkeNetChangeRequestUrl = "wkeNetChangeRequestUrl"
    api_wkeNetContinueJob = "wkeNetContinueJob"
    api_wkeNetCreatePostBodyElement = "wkeNetCreatePostBodyElement"
    api_wkeNetCreatePostBodyElements = "wkeNetCreatePostBodyElements"
    api_wkeNetCreateWebUrlRequest = "wkeNetCreateWebUrlRequest"
    api_wkeNetFreePostBodyElement = "wkeNetFreePostBodyElement"
    api_wkeNetFreePostBodyElements = "wkeNetFreePostBodyElements"
    api_wkeNetGetExpectedContentLength = "wkeNetGetExpectedContentLength"
    api_wkeNetGetFavicon = "wkeNetGetFavicon"
    api_wkeNetGetHTTPHeaderField = "wkeNetGetHTTPHeaderField"
    api_wkeNetGetHttpStatusCode = "wkeNetGetHttpStatusCode"
    api_wkeNetGetMIMEType = "wkeNetGetMIMEType"
    api_wkeNetGetPostBody = "wkeNetGetPostBody"
    api_wkeNetGetRequestMethod = "wkeNetGetRequestMethod"
    api_wkeNetGetResponseUrl = "wkeNetGetResponseUrl"
    api_wkeNetGetUrlByJob = "wkeNetGetUrlByJob"
    api_wkeNetHoldJobToAsynCommit = "wkeNetHoldJobToAsynCommit"
    api_wkeNetHookRequest = "wkeNetHookRequest"
    api_wkeNetOnResponse = "wkeNetOnResponse"
    api_wkeNetSetData = "wkeNetSetData"
    api_wkeNetSetHTTPHeaderField = "wkeNetSetHTTPHeaderField"
    api_wkeNetSetMIMEType = "wkeNetSetMIMEType"
    api_wkeNetStartUrlRequest = "wkeNetStartUrlRequest"
    api_wkeNodeOnCreateProcess = "wkeNodeOnCreateProcess"
    api_wkeOnAlertBox = "wkeOnAlertBox"
    api_wkeOnConfirmBox = "wkeOnConfirmBox"
    api_wkeOnConsole = "wkeOnConsole"
    api_wkeOnCreateView = "wkeOnCreateView"
    api_wkeOnDidCreateScriptContext = "wkeOnDidCreateScriptContext"
    api_wkeOnDocumentReady = "wkeOnDocumentReady"
    api_wkeOnDocumentReady2 = "wkeOnDocumentReady2"
    api_wkeOnDownload = "wkeOnDownload"
    api_wkeOnDraggableRegionsChanged = "wkeOnDraggableRegionsChanged"
    api_wkeOnLoadingFinish = "wkeOnLoadingFinish"
    api_wkeOnLoadUrlBegin = "wkeOnLoadUrlBegin"
    api_wkeOnLoadUrlEnd = "wkeOnLoadUrlEnd"
    api_wkeOnMouseOverUrlChanged = "wkeOnMouseOverUrlChanged"
    api_wkeOnNavigation = "wkeOnNavigation"
    api_wkeOnOtherLoad = "wkeOnOtherLoad"
    api_wkeOnPaintBitUpdated = "wkeOnPaintBitUpdated"
    api_wkeOnPaintUpdated = "wkeOnPaintUpdated"
    api_wkeOnPluginFind = "wkeOnPluginFind"
    api_wkeOnPromptBox = "wkeOnPromptBox"
    api_wkeOnStartDragging = "wkeOnStartDragging"
    api_wkeOnTitleChanged = "wkeOnTitleChanged"
    api_wkeOnURLChanged = "wkeOnURLChanged"
    api_wkeOnURLChanged2 = "wkeOnURLChanged2"
    api_wkeOnWillMediaLoad = "wkeOnWillMediaLoad"
    api_wkeOnWillReleaseScriptContext = "wkeOnWillReleaseScriptContext"
    api_wkeOnWindowClosing = "wkeOnWindowClosing"
    api_wkeOnWindowDestroy = "wkeOnWindowDestroy"
    api_wkePaint = "wkePaint"
    api_wkePaint2 = "wkePaint2"
    api_wkePaste = "wkePaste"
    api_wkePerformCookieCommand = "wkePerformCookieCommand"
    api_wkePostURL = "wkePostURL"
    api_wkePostURLW = "wkePostURLW"
    api_wkeRegisterEmbedderCustomElement = "wkeRegisterEmbedderCustomElement"
    api_wkeReload = "wkeReload"
    api_wkeRepaintIfNeeded = "wkeRepaintIfNeeded"
    api_wkeResize = "wkeResize"
    api_wkeResizeWindow = "wkeResizeWindow"
    api_wkeRunJS = "wkeRunJS"
    api_wkeRunJsByFrame = "wkeRunJsByFrame"
    api_wkeRunJSW = "wkeRunJSW"
    api_wkeSelectAll = "wkeSelectAll"
    api_wkeSetClientHandler = "wkeSetClientHandler"
    api_wkeSetCookie = "wkeSetCookie"
    api_wkeSetCookieEnabled = "wkeSetCookieEnabled"
    api_wkeSetCookieJarFullPath = "wkeSetCookieJarFullPath"
    api_wkeSetCookieJarPath = "wkeSetCookieJarPath"
    api_wkeSetCspCheckEnable = "wkeSetCspCheckEnable"
    api_wkeSetDebugConfig = "wkeSetDebugConfig"
    api_wkeSetDeviceParameter = "wkeSetDeviceParameter"
    api_wkeSetDirty = "wkeSetDirty"
    api_wkeSetDragDropEnable = "wkeSetDragDropEnable"
    api_wkeSetDragEnable = "wkeSetDragEnable"
    api_wkeSetDragFiles = "wkeSetDragFiles"
    api_wkeSetEditable = "wkeSetEditable"
    api_wkeSetFileSystem = "wkeSetFileSystem"
    api_wkeSetFocus = "wkeSetFocus"
    api_wkeSetHandle = "wkeSetHandle"
    api_wkeSetHandleOffset = "wkeSetHandleOffset"
    api_wkeSetHeadlessEnabled = "wkeSetHeadlessEnabled"
    api_wkeSetLanguage = "wkeSetLanguage"
    api_wkeSetLocalStorageFullPath = "wkeSetLocalStorageFullPath"
    api_wkeSetMediaPlayerFactory = "wkeSetMediaPlayerFactory"
    api_wkeSetMediaVolume = "wkeSetMediaVolume"
    api_wkeSetMemoryCacheEnable = "wkeSetMemoryCacheEnable"
    api_wkeSetMouseEnabled = "wkeSetMouseEnabled"
    api_wkeSetName = "wkeSetName"
    api_wkeSetNavigationToNewWindowEnable = "wkeSetNavigationToNewWindowEnable"
    api_wkeSetNpapiPluginsEnabled = "wkeSetNpapiPluginsEnabled"
    api_wkeSetProxy = "wkeSetProxy"
    api_wkeSetResourceGc = "wkeSetResourceGc"
    api_wkeSetString = "wkeSetString"
    api_wkeSetStringW = "wkeSetStringW"
    api_wkeSetTouchEnabled = "wkeSetTouchEnabled"
    api_wkeSetTransparent = "wkeSetTransparent"
    api_wkeSetUIThreadCallback = "wkeSetUIThreadCallback"
    api_wkeSetUserAgent = "wkeSetUserAgent"
    api_wkeSetUserAgentW = "wkeSetUserAgentW"
    api_wkeSetUserKeyValue = "wkeSetUserKeyValue"
    api_wkeSetViewNetInterface = "wkeSetViewNetInterface"
    api_wkeSetViewProxy = "wkeSetViewProxy"
    api_wkeSetViewSettings = "wkeSetViewSettings"
    api_wkeSetWebViewName = "wkeSetWebViewName"
    api_wkeSetWindowTitle = "wkeSetWindowTitle"
    api_wkeSetWindowTitleW = "wkeSetWindowTitleW"
    api_wkeSetZoomFactor = "wkeSetZoomFactor"
    api_wkeShowDevtools = "wkeShowDevtools"
    api_wkeShowWindow = "wkeShowWindow"
    api_wkeShutdown = "wkeShutdown"
    api_wkeSleep = "wkeSleep"
    api_wkeStopLoading = "wkeStopLoading"
    api_wkeTitle = "wkeTitle"
    api_wkeTitleW = "wkeTitleW"
    api_wkeToString = "wkeToString"
    api_wkeToStringW = "wkeToStringW"
    api_wkeUnfocus = "wkeUnfocus"
    api_wkeUpdate = "wkeUpdate"
    api_wkeUtilDecodeURLEscape = "wkeUtilDecodeURLEscape"
    api_wkeUtilSerializeToMHTML = "wkeUtilSerializeToMHTML"
    api_wkeUtilSetUiCallback = "wkeUtilSetUiCallback"
    api_wkeVersion = "wkeVersion"
    api_wkeVersionString = "wkeVersionString"
    api_wkeVisitAllCookie = "wkeVisitAllCookie"
    api_wkeWake = "wkeWake"
    api_wkeWebFrameGetMainFrame = "wkeWebFrameGetMainFrame"
    api_wkeWebFrameGetMainWorldScriptContext = "wkeWebFrameGetMainWorldScriptContext"
    api_wkeWebViewName = "wkeWebViewName"
    api_wkeWidth = "wkeWidth"
    api_wkeZoomFactor = "wkeZoomFactor"
End Sub
