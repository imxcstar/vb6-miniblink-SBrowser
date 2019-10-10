VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "MiniblinkTypeEnum"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Option Explicit

Public Type wkeMemBuf
    size As Long
    data As Long
    Length As Long
End Type

Public Type wkeRect
    x As Long
    y As Long
    w As Long
    h As Long
End Type

Public Enum wkeNavigationType
    WKE_NAVIGATION_TYPE_LINKCLICK = 0
    WKE_NAVIGATION_TYPE_FORMSUBMITTE = 1
    WKE_NAVIGATION_TYPE_BACKFORWARD = 2
    WKE_NAVIGATION_TYPE_RELOAD = 3
    WKE_NAVIGATION_TYPE_FORMRESUBMITT = 4
    WKE_NAVIGATION_TYPE_OTHER = 5
End Enum

Public Type wkeWindowFeatures
    x As Long
    y As Long
    width As Long
    height As Long

    menuBarVisible As Boolean
    statusBarVisible As Boolean
    toolBarVisible As Boolean
    locationBarVisible As Boolean
    scrollbarsVisible As Boolean
    resizable As Boolean
    fullscreen As Boolean
End Type

Public Enum wkeConsoleLevel
    wkeLevelDebug = 4
    wkeLevelLog = 1
    wkeLevelInfo = 5
    wkeLevelWarning = 2
    wkeLevelError = 3
    wkeLevelRevokedError = 6
    wkeLevelLast = 5
End Enum

Public Type wkeMediaLoadInfo
    size As Long
    width As Long
    height As Long
    duration As Double
End Type
