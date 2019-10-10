Attribute VB_Name = "MiniblinkAPIConst"
Option Explicit
Public api_jsAddRef As String, api_jsArg As String, _
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

Public api_jsIsNumber As String, api_jsIsObject As String, _
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

Public api_wkeCreateMemBuf As String, api_wkeCreateString As String, _
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

Public api_wkeGetContentWidth As String, api_wkeGetCookie As String, _
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

Public api_wkeIsCookieEnabled As String, api_wkeIsDirty As String, _
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

Public api_wkeNetChangeRequestUrl As String, api_wkeNetContinueJob As String, _
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

Public api_wkeOnPaintUpdated As String, api_wkeOnPluginFind As String, _
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

Public api_wkeSetFocus As String, api_wkeSetHandle As String, _
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

Public api_wkeUpdate As String, api_wkeUtilDecodeURLEscape As String, _
        api_wkeUtilSerializeToMHTML As String, api_wkeUtilSetUiCallback As String, _
        api_wkeVersion As String, api_wkeVersionString As String, _
        api_wkeVisitAllCookie As String, api_wkeWake As String, _
        api_wkeWebFrameGetMainFrame As String, api_wkeWebFrameGetMainWorldScriptContext As String, _
        api_wkeWebViewName As String, api_wkeWidth As String, _
        api_wkeZoomFactor As String, api_wkeSetWkeDllPath As String

Public Sub InitMiniblinkAPI()
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
