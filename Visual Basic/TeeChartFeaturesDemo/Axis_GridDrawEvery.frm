VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Axis_GridDrawEvery 
   BorderStyle     =   0  'None
   Caption         =   "Form2"
   ClientHeight    =   6915
   ClientLeft      =   3480
   ClientTop       =   3390
   ClientWidth     =   11505
   LinkTopic       =   "Form2"
   ScaleHeight     =   6915
   ScaleWidth      =   11505
   ShowInTaskbar   =   0   'False
   Begin VB.VScrollBar VScroll1 
      Height          =   285
      Left            =   3510
      Max             =   1
      Min             =   5000
      TabIndex        =   6
      Top             =   1230
      Value           =   1
      Width           =   225
   End
   Begin VB.TextBox Text2 
      Height          =   285
      Left            =   3120
      TabIndex        =   5
      Text            =   "1"
      Top             =   1230
      Width           =   405
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      ItemData        =   "Axis_GridDrawEvery.frx":0000
      Left            =   480
      List            =   "Axis_GridDrawEvery.frx":000A
      Style           =   2  'Dropdown List
      TabIndex        =   2
      Top             =   1200
      Width           =   1365
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5295
      Left            =   0
      TabIndex        =   1
      Top             =   1620
      Width           =   11505
      Base64          =   $"Axis_GridDrawEvery.frx":001C
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   1095
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Axis_GridDrawEvery.frx":0844
      Top             =   0
      Width           =   11460
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      Caption         =   "Draw every:"
      Height          =   195
      Left            =   2190
      TabIndex        =   4
      Top             =   1260
      Width           =   855
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "Axis:"
      Height          =   195
      Left            =   90
      TabIndex        =   3
      Top             =   1260
      Width           =   330
   End
End
Attribute VB_Name = "Axis_GridDrawEvery"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Combo1_Change()
  Select Case Combo1.ListIndex
    Case 0: Text2.Text = Str(TChart1.Axis.Left.Grid.DrawEvery)
    Case 1: Text2.Text = Str(TChart1.Axis.Bottom.Grid.DrawEvery)
  End Select
End Sub

Private Sub Combo1_Click()
  Combo1_Change
End Sub

Private Sub Form_Load()
  Combo1.ListIndex = 0
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub

Private Sub Text2_Change()
  Text2_Confirm
End Sub

Private Sub Text2_Confirm()
  If Not IsNumeric(Text2.Text) Then
    KeepFocus = True
    MsgBox "Please insert a numeric value", , "Draw every"
  Else
    If (val(Text2.Text) > 5000 Or val(Text2.Text) < 1) Then
      KeepFocus = True
      MsgBox "Please insert a value between 1 and 5000", , "Draw every"
    Else
      Select Case Combo1.ListIndex
        Case 0: TChart1.Axis.Left.Grid.DrawEvery = val(Text2.Text)
        Case 1: TChart1.Axis.Bottom.Grid.DrawEvery = val(Text2.Text)
      End Select
      VScroll1.Value = val(Text2.Text)
    End If
  End If
End Sub

Private Sub VScroll1_Change()
  VScroll1_Scroll
End Sub

Private Sub VScroll1_Scroll()
  Text2.Text = Str$(VScroll1.Value)
  Text2_Confirm
End Sub
