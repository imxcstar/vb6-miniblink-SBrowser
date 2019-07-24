VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "fastcallCallback"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
'用到的api函数声明==========================
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (pDest As Any, pSrc As Any, ByVal ByteLen As Long)
Private Const MEM_RELEASE = &H8000&
Private Const MEM_COMMIT = &H1000&
Private Const PAGE_EXECUTE_READWRITE = &H40
Private Declare Function VirtualAlloc Lib "kernel32" (ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flAllocationType As Long, ByVal flProtect As Long) As Long
'=====================================

'76F76F26      | 55                 | push ebp                                          |
'76F76F27      | 89E5               | mov ebp,esp                                       |
'76F76F29      | 68 78563412        | push 12345678                                     |
'76F76F2E      | 51                 | push ecx                                          |
'76F76F2F      | 52                 | push edx                                          |
'76F76F30      | FF75 08            | push dword ptr ss:[ebp+8]                         |
'76F76F33      | 90                 | nop                                               |
'76F76F34      | C9                 | leave                                             |
'76F76F35      | C2 0400            | ret 4                                             |
'76F76F38      | B8 78563412        | mov eax,12345678                                  |
'176F76F3D      | FFD0               | call eax                                          |

'此函数放入类模块(类中的函数默认包含pthis)
Public Function 回调fastcall(ByVal 参数个数 As Long, ByVal 回调函数地址 As Long, Optional 是否含有pThis As Boolean = True) As Long '返回回调函数地址，这个地址填入api中
    Dim b(1000) As Byte
    Dim pThis As Long, i As Long, n As Long
    Dim m_VirtualMem As Long
    
    If 参数个数 < 0 Then Exit Function
    
    pThis = ObjPtr(Me)                                                          '获取pthis
    b(0) = &H55                                                                 'push ebp
    b(1) = &H89                                                                 'mov ebp, esp
    b(2) = &HE5
    
    Select Case 参数个数
        
    Case 0
        
        If 是否含有pThis = True Then
            b(3) = &H68                                                         'push pthis
            CopyMemory b(4), pThis, 4
            i = 8
        Else
            i = 3
        End If
        b(i) = &HB8                                                             'mov eax,回调函数地址
        CopyMemory b(i + 1), 回调函数地址, 4
        
        b(i + 5) = &HFF                                                         ' call eax
        b(i + 6) = &HD0
        
        b(i + 7) = &HC9                                                         'leave
        b(i + 8) = &HC3                                                         'ret
    Case 1
        b(3) = &H51                                                             ' push ecx
        If 是否含有pThis = True Then
            b(4) = &H68                                                         'push pthis
            CopyMemory b(5), pThis, 4
            i = 9
        Else
            i = 4
        End If
        b(i) = &HB8                                                             'mov eax,回调函数地址
        CopyMemory b(i + 1), 回调函数地址, 4
        
        b(i + 5) = &HFF                                                         ' call eax
        b(i + 6) = &HD0
        
        b(i + 7) = &HC9                                                         'leave
        b(i + 8) = &HC3                                                         'ret
    Case 2
        b(3) = &H51                                                             ' push ecx
        b(4) = &H52                                                             'push edx
        If 是否含有pThis = True Then
            b(5) = &H68                                                         'push pthis
            CopyMemory b(6), pThis, 4
            i = 10
        Else
            i = 5
        End If
        b(i) = &HB8                                                             'mov eax,回调函数地址
        CopyMemory b(i + 1), 回调函数地址, 4
        
        b(i + 5) = &HFF                                                         ' call eax
        b(i + 6) = &HD0
        
        b(i + 7) = &HC9                                                         'leave
        b(i + 8) = &HC3                                                         'ret
    Case Else
        b(3) = &H51                                                             ' push ecx
        b(4) = &H52                                                             'push edx
        i = 5
        For n = 1 To 参数个数 - 2                                               'push [ebp+x]
            b(i) = &HFF
            b(i + 1) = &H75
            b(i + 2) = &H4 + n * 4
            i = i + 3
        Next
        If 是否含有pThis = True Then
            b(i) = &H68                                                         'push pthis
            CopyMemory b(i + 1), pThis, 4
            i = i + 5
        End If
        b(i) = &HB8                                                             'mov eax,回调函数地址
        CopyMemory b(i + 1), 回调函数地址, 4
        
        b(i + 5) = &HFF                                                         ' call eax
        b(i + 6) = &HD0
        
        b(i + 7) = &HC9                                                         'leave
        b(i + 8) = &HC2                                                         'ret x
        b(i + 9) = (参数个数 - 2) * 4                                           'x
    End Select
    'MsgBox Hex(VarPtr(b(0)))
    m_VirtualMem = VirtualAlloc(0&, 4096, MEM_COMMIT, PAGE_EXECUTE_READWRITE)   '只负责生产不负责销毁，自行解决
    If m_VirtualMem Then
        CopyMemory ByVal m_VirtualMem, b(0), 1001
        回调fastcall = m_VirtualMem
    End If
End Function
