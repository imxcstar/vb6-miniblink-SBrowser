VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "SBrowserCls"
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

Private m_WebWindow As Long

Private c_handleDocumentReady_address As Long, c_handleLoadUrlBegin_address As Long, c_JsCall_address As Long
Private c_showNewView_address As Long, c_handleLoadUrlEnd_address As Long

Public Event DocumentReady(ByVal url As String)
Public Event LoadUrlBegin(ByVal title As String, ByVal url As String)
Public Event jsCall(ByVal index As Long, ByVal info As String)
Public Event ShowNewView(ByVal url As String, ByRef ret As Long)
Public Event LoadUrlEnd(ByVal url As String, ByRef data() As Byte)

Private tmp_load_url As String, tmp_load_html As String, tmp_load_filename As String
Private is_qd As Boolean, tmp_TouchEnabled As Boolean, tmp_MouseEnabled As Boolean
Private tmp_job As Long
Private IsInit As Boolean
Private MiniblinkAPICls As MiniblinkAPI
Private SDLL As cUniversalDLLCalls

Private Sub Class_Initialize()
    If IsInit = False Then
        Set SDLL = New cUniversalDLLCalls
        
        IsInit = True
        tmp_MouseEnabled = True
        
        c_handleDocumentReady_address = zb_AddressOf(1, 2, 0)
        c_handleLoadUrlBegin_address = zb_AddressOf(2, 4, 1)
        c_JsCall_address = zb_AddressOf(3, 2, 2)
        c_showNewView_address = zb_AddressOf(4, 5, 3)
        c_handleLoadUrlEnd_address = zb_AddressOf(5, 6, 4)
        
        Set MiniblinkAPICls = New MiniblinkAPI
        
        MiniblinkAPICls.wkeInitializeEx 0
        
        If IsBindJs = False Then
            IsBindJs = True
            MiniblinkAPICls.wkeJsBindFunction "jsCall", GetFunAddress(AddressOf SBrowserCallBack.ChandleJsCall), 0, 2
        End If
        
        m_WebWindow = MiniblinkAPICls.wkeCreateWebView()
        
        CallBackInfoList.WriteProperty m_WebWindow & "-" & CBI_JsCallAddress, c_JsCall_address, 0
    
        MiniblinkAPICls.wkeOnDocumentReady m_WebWindow, c_handleDocumentReady_address, 0
        MiniblinkAPICls.wkeOnLoadUrlBegin m_WebWindow, c_handleLoadUrlBegin_address, 0
        MiniblinkAPICls.wkeOnCreateView m_WebWindow, c_showNewView_address, 0
        MiniblinkAPICls.wkeOnLoadUrlEnd m_WebWindow, c_handleLoadUrlEnd_address, 0
        
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

'============================================================================================
' /////////////////// 回调函数的形式转换例程 \\\\\\\\\\\\\\\\\\\
'============================================================================================

'*************************************************************************************************
'* cCallback - 类通用的回调模板
'“*
'*注意：
'*为一类，窗体或用户控件的回调声明和代码是完全一样的。
'*回调函数的声明和代码可以共同存在子类的声明和代码。
'对于这两种类型的代码在一个文件中，“*..
'*删除重复的声明和代码，按Ctrl+ F5就会发现他们为你
'*要特别注意的nOrdinal参数，zAddressOf
'“*
'“* Paul_Caton@hotmail.com
'“版权免费的，您认为合适的使用和滥用。
'“*
'*1.0版的原........................................... .......................... 20060408
'* v1.1加入多thunk的支持........................................ ................ 20060409
'*1.2版增加了可选的IDE保护......................................... ........... 20060411
'* V1.3增加了一个可选的回调目标对象....................................... .. 20060413
'*************************************************************************************************

'-回调代码-----------------------------------------------------------------------------------
Private Function zb_AddressOf(ByVal nOrdinal As Long, _
    ByVal nParamCount As Long, _
    Optional ByVal nThunkNo As Long = 0, _
    Optional ByVal oCallback As Object = Nothing, _
    Optional ByVal bIdeSafety As Boolean = True) As Long                        '返回地址指定的回调的thunk
    '*************************************************************************************************
    '* nOrdinal - 回拨序号的，最后是私有方法序号1，最后第二是序号2，等等..
    '* nParamCount - 将回调的参数
    '* nThunkNo - 可选，同时允许多个回调引用不同的thunk... ，调整MAX_THUNKS const如果你需要同时使用两个以上的thunk
    '* oCallback - 可选，将接收回调的对象。如果未定义，回调被发送到对象的实例
    '* bIdeSafety - 可选，设置为false来禁用IDE保护。
    '*************************************************************************************************
    Const MAX_FUNKS   As Long = 5                                               '同时进行的thunk数量，调整的味道
    Const FUNK_LONGS  As Long = 22                                              '多头数的thunk
    Const FUNK_LEN    As Long = FUNK_LONGS * 4                                  '一个thunk中的字节
    Const MEM_LEN     As Long = MAX_FUNKS * FUNK_LEN                            '需要的内存字节的回调的thunk
    Const PAGE_RWX    As Long = &H40&                                           '分配可执行内存
    Const MEM_COMMIT  As Long = &H1000&                                         '提交分配的内存
    Dim nAddr       As Long
    Dim nOffset     As Long
    Dim z_Cb()      As Long                                                     'Callback thunk array
    
    If nThunkNo < 0 Or nThunkNo > (MAX_FUNKS - 1) Then
        MsgBox "nThunkNo doesn't exist.", vbCritical + vbApplicationModal, "Error in " & TypeName(Me) & ".cb_Callback"
        Exit Function
    End If
    
    If oCallback Is Nothing Then                                                '如果用户还没有指定的回调雇主
        Set oCallback = Me                                                      '然后，它是我
    End If
    
    nAddr = zAddressOf(oCallback, nOrdinal)                                     '获取指定序号的回调地址
    If nAddr = 0 Then
        MsgBox "Callback address not found.", vbCritical + vbApplicationModal, "Error in " & TypeName(Me) & ".cb_Callback"
        Exit Function
    End If
    
    If z_CbMem = 0 Then                                                         '如果内存没有被分配
        ReDim z_Cb(0 To FUNK_LONGS - 1, 0 To MAX_FUNKS - 1) As Long             '创建机器代码阵列
        z_CbMem = VirtualAlloc(z_CbMem, MEM_LEN, MEM_COMMIT, PAGE_RWX)          '分配可执行内存
        
        If bIdeSafety Then                                                      '如果用户想要IDE保护
            z_Cb(2, 0) = GetProcAddress(GetModuleHandleA("vba6"), "EbMode")     'EbMode地址
        End If
        z_Cb(3, 0) = GetProcAddress(GetModuleHandleA("kernel32"), "IsBadCodePtr")
        z_Cb(4, 0) = &HBB60E089
        z_Cb(6, 0) = &H73FFC589: z_Cb(7, 0) = &HC53FF04: z_Cb(8, 0) = &H7B831F75: z_Cb(9, 0) = &H20750008: z_Cb(10, 0) = &HE883E889: z_Cb(11, 0) = &HB9905004: z_Cb(13, 0) = &H74FF06E3: z_Cb(14, 0) = &HFAE2008D: z_Cb(15, 0) = &H53FF33FF: z_Cb(16, 0) = &HC2906104: z_Cb(18, 0) = &H830853FF: z_Cb(19, 0) = &HD87401F8: z_Cb(20, 0) = &H4589C031: z_Cb(21, 0) = &HEAEBFC
        
        For nOffset = 1 To MAX_FUNKS - 1                                        ' 每个thunk的，复制的基础的thunk
            CopyMemory z_Cb(0, nOffset), z_Cb(0, 0), FUNK_LEN
        Next
        CopyMemory ByVal z_CbMem, z_Cb(0, 0), MEM_LEN                           '复制thunk代码可执行内存
    End If
    
    nOffset = z_CbMem + nThunkNo * FUNK_LEN
    CopyMemory ByVal nOffset, ObjPtr(oCallback), 4&                             '复制到这个thunk的VMEM的objPtr
    CopyMemory ByVal nOffset + 4, nAddr, 4&                                     '回调地址复制到VMEM
    CopyMemory ByVal nOffset + 20, nOffset, 4&                                  '复制到VMEM这个thunk的开始
    CopyMemory ByVal nOffset + 48, nParamCount, 4&                              '“复制到VMEM的参数数
    CopyMemory ByVal nOffset + 68, nParamCount * 4, 4&                          '复制到VMEM参数的总长度
    zb_AddressOf = nOffset + 16                                                 '返回在VMEM这个东西可以被称为
    
End Function

'返回的回调对象的地址指定序号的方法，1 =最后一个私有方法，2=倒数第二的私有方法等
Private Function zAddressOf(ByVal oCallback As Object, ByVal nOrdinal As Long) As Long
    Dim bSub  As Byte                                                           '的价值，我们希望找到一个虚函数表的方法进入指出在
    Dim bVal  As Byte
    Dim nAddr As Long                                                           '的虚函数表的地址
    Dim i     As Long                                                           '循环索引
    Dim j     As Long                                                           '循环限制
    
    CopyMemory nAddr, ByVal ObjPtr(oCallback), 4                                '获取回调对象的实例的地址
    If Not zProbe(nAddr + &H1C, i, bSub) Then                                   '一类方法的探讨
        If Not zProbe(nAddr + &H6F8, i, bSub) Then                              '的形式方法的探讨
            If Not zProbe(nAddr + &H7A4, i, bSub) Then                          '用于用户控制方法的探讨
                Exit Function                                                   '保释...
            End If
        End If
    End If
    
    i = i + 4                                                                   '碰撞到下一项
    j = i + 1024                                                                '设置一个合理的限度，扫描256个虚函数表的条目
    Do While i < j
        CopyMemory nAddr, ByVal i, 4                                            '获取地址存储在这个vtable项
        
        If IsBadCodePtr(nAddr) Then                                             '进入一个无效的代码地址？
            CopyMemory zAddressOf, ByVal i - (nOrdinal * 4), 4                  '返回指定的虚函数表的入口地址
            Exit Do                                                             '错误的方法签名，退出循环
        End If
        
        CopyMemory bVal, ByVal nAddr, 1                                         '得到的虚函数表项指向的字节
        If bVal <> bSub Then                                                    '如果该字节不匹配预期值...
            CopyMemory zAddressOf, ByVal i - (nOrdinal * 4), 4                  '返回指定的虚函数表的入口地址
            Exit Do                                                             '错误的方法签名，退出循环
        End If
        
        i = i + 4                                                               '下一个vtable项
    Loop
End Function

'在指定的起始地址用于方法签名的探讨
Private Function zProbe(ByVal nStart As Long, ByRef nMethod As Long, ByRef bSub As Byte) As Boolean
    Dim bVal    As Byte
    Dim nAddr   As Long
    Dim nLimit  As Long
    Dim nEntry  As Long
    
    nAddr = nStart                                                              '起始地址
    nLimit = nAddr + 32                                                         '八个项目初探
    Do While nAddr < nLimit                                                     '虽然我们还没有达到我们的探测深度
        CopyMemory nEntry, ByVal nAddr, 4                                       'vtable项
        
        If nEntry <> 0 Then                                                     '如果没有实现接口
            CopyMemory bVal, ByVal nEntry, 1                                    '得到的值所指向的vtable项
            If bVal = &H33 Or bVal = &HE9 Then                                  '检查本机或P码的方法签名
                nMethod = nAddr                                                 '存储vtable项
                bSub = bVal                                                     '存储找到的方法签名
                zProbe = True                                                   '表示成功
                Exit Function                                                   '返回
            End If
        End If
        
        nAddr = nAddr + 4                                                       '下一个vtable项
    Loop
End Function

Private Sub zTerminate()
    Const MEM_RELEASE As Long = &H8000&                                         '释放分配的内存标志
    If Not z_CbMem = 0 Then                                                     '如果内存分配
        VirtualFree z_CbMem, 0, MEM_RELEASE
        z_CbMem = 0                                                             '发布;显示内存释放
    End If
End Sub

Private Function ChandleLoadUrlEnd(ByVal webWindow As Long, ByVal param As Long, ByVal url As Long, ByVal job As Long, ByVal buf As Long, ByVal tlen As Long) As Long
    Dim zc() As Byte
    zc = pGetByteFromPtr(buf, tlen)
    RaiseEvent LoadUrlEnd(SDLL.PointerToStringA(url), zc)
End Function

Private Function ChandleshowNewView(ByVal webWindow As Long, ByVal param As Long, ByVal navigationType As Long, ByVal url As Long, ByVal windowFeatures As Long) As Long
    Dim ret As Long
    ret = 0
    RaiseEvent ShowNewView(SDLL.PointerToStringA(url), ret)
    If ret = 0 Then ret = webWindow
    ChandleshowNewView = ret
End Function

Private Function ChandleJsCall(ByVal es As Long, ByVal param As Long) As Long
    Dim t_index As Currency, t_info As Currency
    t_index = MiniblinkAPICls.jsArg(es, 0)
    t_info = MiniblinkAPICls.jsArg(es, 1)
    RaiseEvent jsCall(Val(MiniblinkAPICls.jsToTempStringW(es, t_index)), MiniblinkAPICls.jsToTempStringW(es, t_info))
End Function

Private Function ChandleLoadUrlBegin(ByVal webWindow As Long, ByVal param As Long, ByVal url As Long, ByVal job As Long) As Long
    RaiseEvent LoadUrlBegin(MiniblinkAPICls.wkeGetTitleW(webWindow), SDLL.PointerToStringA(url))
End Function

Private Function ChandleDocumentReady(ByVal webWindow As Long, ByVal param As Long) As Long
    RaiseEvent DocumentReady(MiniblinkAPICls.wkeGetURL(webWindow))
End Function

