VERSION 5.00
Object = "{DE7847A7-A266-4AA9-AA68-16676652C9DB}#1.0#0"; "TeeChart2014.ocx"
Begin VB.Form Tool_Text3D 
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
   Begin VB.CommandButton Command1 
      Caption         =   "Edit..."
      Height          =   345
      Left            =   420
      TabIndex        =   2
      Top             =   690
      Width           =   975
   End
   Begin TeeChart.TChart TChart1 
      Align           =   2  'Align Bottom
      Height          =   5835
      Left            =   0
      TabIndex        =   1
      Top             =   1080
      Width           =   11505
      Base64          =   $"Tool_Text3D.frx":0000
   End
   Begin VB.TextBox Text1 
      BackColor       =   &H00C0FFFF&
      Height          =   585
      Left            =   0
      Locked          =   -1  'True
      MultiLine       =   -1  'True
      TabIndex        =   0
      Text            =   "Tool_Text3D.frx":056A
      Top             =   0
      Width           =   11490
   End
End
Attribute VB_Name = "Tool_Text3D"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
  TChart1.Tools.Items(1).ShowEditor
End Sub

Private Sub Form_Load()
  TChart1.Tools.Add tcText3D
  
  With TChart1.Tools.Items(1).asText3D
    .Position.X = 300
    .Position.Y = 100
    .Text = "Text3D Tool"
    .Font.Size = 44
    .Font.Bold = True
  End With
End Sub

Private Sub Text1_DblClick()
  TChart1.ShowEditor
End Sub
