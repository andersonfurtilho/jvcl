object JvColorCircleForm: TJvColorCircleForm
  Left = 198
  Top = 103
  BorderStyle = bsDialog
  Caption = 'Color circle configurations'
  ClientHeight = 631
  ClientWidth = 990
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object BevelOld: TBevel
    Left = 47
    Top = 55
    Width = 131
    Height = 131
  end
  object LabelOld: TLabel
    Left = 48
    Top = 40
    Width = 19
    Height = 13
    Caption = 'Old:'
  end
  object LabelNew: TLabel
    Left = 200
    Top = 40
    Width = 25
    Height = 13
    Caption = 'New:'
  end
  object LabelColorSpace: TLabel
    Left = 128
    Top = 2
    Width = 61
    Height = 13
    Caption = '&Color Space:'
    FocusControl = ColorSpaceCombo
  end
  object ImageNew: TImage
    Left = 200
    Top = 56
    Width = 129
    Height = 129
  end
  object ImageOld: TImage
    Left = 48
    Top = 56
    Width = 129
    Height = 129
  end
  object BevelNew: TBevel
    Left = 199
    Top = 55
    Width = 131
    Height = 131
  end
  object PanelGraphics: TPanel
    Left = 384
    Top = 8
    Width = 601
    Height = 617
    BevelInner = bvRaised
    BevelOuter = bvLowered
    Caption = 'PanelGraphics'
    TabOrder = 5
    object LabelAxisSettings: TLabel
      Left = 232
      Top = 18
      Width = 63
      Height = 13
      Caption = 'A&xis Settings:'
      FocusControl = JvColorAxisConfigCombo
    end
    object JvColorCircle: TJvColorCircle
      Left = 96
      Top = 80
      Width = 497
      Height = 501
      FullColor = 16808352
      AxisConfig = acYZX
      TabOrder = 1
      OnColorChange = JvColorCircleColorChange
      OnColorSpaceChange = JvColorCircleColorSpaceChange
      RedColor = 32536576
      GreenColor = 32536656
      BlueColor = 32536736
      Styles = [crShowLines, crShowRed, crShowGreen, crShowBlue]
      CrossSize = 10
      CrossCenter = 3
      CrossStyle.Width = 3
      LineWidth = 0
      RedTrackBar = JvFullColorTrackBarRed
      GreenTrackBar = JvFullColorTrackBarGreen
      BlueTrackBar = JvFullColorTrackBarBlue
      CommonTrackBar = JvFullColorTrackBarCommon
      OnRedColorChange = JvColorCircleRedColorChange
      OnGreenColorChange = JvColorCircleGreenColorChange
      OnBlueColorChange = JvColorCircleBlueColorChange
    end
    object JvFullColorTrackBarCommon: TJvFullColorTrackBar
      Left = 40
      Top = 72
      Width = 20
      Height = 261
      FullColor = 16808352
      AxisConfig = acYZX
      TabOrder = 2
      ArrowColor = clBlack
      ArrowWidth = 10
      ArrowPosition = 0
      ColorOrientation = 1
      Orientation = trVertical
      BarWidth = 10
      FullColorDrawing = True
    end
    object JvFullColorTrackBarBlue: TJvFullColorTrackBar
      Left = 72
      Top = 352
      Width = 20
      Height = 261
      FullColor = 32536736
      AxisConfig = acYZX
      TabOrder = 5
      ArrowColor = clBlue
      ArrowWidth = 10
      ArrowPosition = 0
      ColorOrientation = 1
      Orientation = trVertical
      BarWidth = 10
      FullColorDrawing = True
    end
    object JvFullColorTrackBarGreen: TJvFullColorTrackBar
      Left = 40
      Top = 352
      Width = 20
      Height = 261
      FullColor = 32536656
      AxisConfig = acYZX
      TabOrder = 4
      ArrowColor = clLime
      ArrowWidth = 10
      ArrowPosition = 0
      ColorOrientation = 1
      Orientation = trVertical
      BarWidth = 10
      FullColorDrawing = True
    end
    object JvFullColorTrackBarRed: TJvFullColorTrackBar
      Left = 8
      Top = 352
      Width = 20
      Height = 261
      FullColor = 32536576
      AxisConfig = acYZX
      TabOrder = 3
      ArrowColor = clRed
      ArrowWidth = 10
      ArrowPosition = 0
      ColorOrientation = 1
      Orientation = trVertical
      BarWidth = 10
      FullColorDrawing = True
    end
    object JvColorAxisConfigCombo: TJvColorAxisConfigCombo
      Left = 232
      Top = 32
      Width = 257
      Height = 21
      Selected = acYZX
      ColorID = 1
      ItemHeight = 13
      TabOrder = 0
      OnChange = JvColorAxisConfigComboChange
    end
  end
  object PanelCommonSettings: TPanel
    Left = 8
    Top = 200
    Width = 361
    Height = 113
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 2
    object LabelComAxis0: TLabel
      Left = 80
      Top = 16
      Width = 72
      Height = 13
      Caption = 'LabelComAxis0'
    end
    object LabelComAxis1: TLabel
      Left = 176
      Top = 16
      Width = 72
      Height = 13
      Caption = 'LabelComAxis1'
    end
    object LabelComAxis2: TLabel
      Left = 272
      Top = 16
      Width = 72
      Height = 13
      Caption = 'LabelComAxis2'
    end
    object LabelCommon: TLabel
      Left = 20
      Top = 48
      Width = 44
      Height = 13
      Caption = 'C&ommon:'
      FocusControl = SpinEditComAxis0
    end
    object SpinEditComAxis0: TSpinEdit
      Tag = 48
      Left = 80
      Top = 48
      Width = 57
      Height = 22
      Enabled = False
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      OnChange = SpinEditSettingsValueChange
    end
    object SpinEditComAxis1: TSpinEdit
      Tag = 49
      Left = 176
      Top = 48
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
      OnChange = SpinEditSettingsValueChange
    end
    object SpinEditComAxis2: TSpinEdit
      Tag = 50
      Left = 272
      Top = 48
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
      OnChange = SpinEditSettingsValueChange
    end
    object CheckBoxCom0: TCheckBox
      Tag = 48
      Left = 72
      Top = 80
      Width = 89
      Height = 17
      Caption = 'CheckBoxCom0'
      TabOrder = 3
      OnClick = CheckBoxSettingsClick
    end
    object CheckBoxCom1: TCheckBox
      Tag = 49
      Left = 168
      Top = 80
      Width = 89
      Height = 17
      Caption = 'CheckBoxCom1'
      TabOrder = 4
      OnClick = CheckBoxSettingsClick
    end
    object CheckBoxCom2: TCheckBox
      Tag = 50
      Left = 264
      Top = 80
      Width = 89
      Height = 17
      Caption = 'CheckBoxCom2'
      TabOrder = 5
      OnClick = CheckBoxSettingsClick
    end
  end
  object PanelAxisSettings: TPanel
    Left = 8
    Top = 328
    Width = 361
    Height = 257
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 4
    object LabelAxis0: TLabel
      Left = 80
      Top = 16
      Width = 51
      Height = 13
      Caption = 'LabelAxis0'
    end
    object LabelAxis1: TLabel
      Left = 176
      Top = 16
      Width = 51
      Height = 13
      Caption = 'LabelAxis1'
    end
    object LabelAxis2: TLabel
      Left = 272
      Top = 16
      Width = 51
      Height = 13
      Caption = 'LabelAxis2'
    end
    object LabelRed: TLabel
      Left = 44
      Top = 48
      Width = 23
      Height = 13
      Alignment = taRightJustify
      BiDiMode = bdLeftToRight
      Caption = '&Red:'
      FocusControl = SpinEditRedAxis0
      ParentBiDiMode = False
    end
    object LabelGreen: TLabel
      Left = 35
      Top = 120
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = '&Green:'
      FocusControl = SpinEditGreenAxis0
    end
    object LabelBlue: TLabel
      Left = 43
      Top = 192
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = '&Blue:'
      FocusControl = SpinEditBlueAxis0
    end
    object SpinEditRedAxis0: TSpinEdit
      Left = 80
      Top = 48
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
      OnChange = SpinEditSettingsValueChange
    end
    object SpinEditGreenAxis0: TSpinEdit
      Tag = 16
      Left = 80
      Top = 120
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 6
      Value = 0
      OnChange = SpinEditSettingsValueChange
    end
    object SpinEditBlueAxis0: TSpinEdit
      Tag = 32
      Left = 80
      Top = 192
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 12
      Value = 0
      OnChange = SpinEditSettingsValueChange
    end
    object SpinEditRedAxis1: TSpinEdit
      Tag = 1
      Left = 176
      Top = 48
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 1
      Value = 0
      OnChange = SpinEditSettingsValueChange
    end
    object SpinEditRedAxis2: TSpinEdit
      Tag = 2
      Left = 272
      Top = 48
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
      OnChange = SpinEditSettingsValueChange
    end
    object SpinEditGreenAxis1: TSpinEdit
      Tag = 17
      Left = 176
      Top = 120
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 7
      Value = 0
      OnChange = SpinEditSettingsValueChange
    end
    object SpinEditGreenAxis2: TSpinEdit
      Tag = 18
      Left = 272
      Top = 120
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 8
      Value = 0
      OnChange = SpinEditSettingsValueChange
    end
    object SpinEditBlueAxis1: TSpinEdit
      Tag = 33
      Left = 176
      Top = 192
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 13
      Value = 0
      OnChange = SpinEditSettingsValueChange
    end
    object SpinEditBlueAxis2: TSpinEdit
      Tag = 34
      Left = 272
      Top = 192
      Width = 57
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 14
      Value = 0
      OnChange = SpinEditSettingsValueChange
    end
    object CheckBoxRed0: TCheckBox
      Left = 72
      Top = 80
      Width = 89
      Height = 17
      Caption = 'CheckBoxRed0'
      TabOrder = 3
      OnClick = CheckBoxSettingsClick
    end
    object CheckBoxRed1: TCheckBox
      Tag = 1
      Left = 168
      Top = 80
      Width = 89
      Height = 17
      Caption = 'CheckBoxRed1'
      TabOrder = 4
      OnClick = CheckBoxSettingsClick
    end
    object CheckBoxRed2: TCheckBox
      Tag = 2
      Left = 264
      Top = 80
      Width = 89
      Height = 17
      Caption = 'CheckBoxRed2'
      TabOrder = 5
      OnClick = CheckBoxSettingsClick
    end
    object CheckBoxGreen0: TCheckBox
      Tag = 16
      Left = 72
      Top = 152
      Width = 89
      Height = 17
      Caption = 'CheckBoxGreen0'
      TabOrder = 9
      OnClick = CheckBoxSettingsClick
    end
    object CheckBoxGreen1: TCheckBox
      Tag = 17
      Left = 168
      Top = 152
      Width = 89
      Height = 17
      Caption = 'CheckBoxGreen1'
      TabOrder = 10
      OnClick = CheckBoxSettingsClick
    end
    object CheckBoxGreen2: TCheckBox
      Tag = 18
      Left = 264
      Top = 152
      Width = 89
      Height = 17
      Caption = 'CheckBoxGreen2'
      TabOrder = 11
      OnClick = CheckBoxSettingsClick
    end
    object CheckBoxBlue0: TCheckBox
      Tag = 32
      Left = 72
      Top = 224
      Width = 89
      Height = 17
      Caption = 'CheckBoxBlue0'
      TabOrder = 15
      OnClick = CheckBoxSettingsClick
    end
    object CheckBoxBlue1: TCheckBox
      Tag = 33
      Left = 168
      Top = 224
      Width = 89
      Height = 17
      Caption = 'CheckBoxBlue1'
      TabOrder = 16
      OnClick = CheckBoxSettingsClick
    end
    object CheckBoxBlue2: TCheckBox
      Tag = 34
      Left = 264
      Top = 224
      Width = 89
      Height = 17
      Caption = 'CheckBoxBlue2'
      TabOrder = 17
      OnClick = CheckBoxSettingsClick
    end
  end
  object RadioButtonCommonSettings: TRadioButton
    Left = 16
    Top = 192
    Width = 113
    Height = 17
    Caption = 'Co&mmon Settings:'
    TabOrder = 1
    OnClick = RadioButtonAxisClick
  end
  object RadioButtonAxisSettings: TRadioButton
    Left = 16
    Top = 320
    Width = 89
    Height = 17
    Caption = '&Axis Settings:'
    TabOrder = 3
    OnClick = RadioButtonAxisClick
  end
  object ButtonGraphics: TButton
    Left = 296
    Top = 600
    Width = 73
    Height = 25
    TabOrder = 9
    OnClick = ButtonGraphicsClick
  end
  object ButtonCancel: TButton
    Left = 104
    Top = 600
    Width = 75
    Height = 25
    Caption = 'Ca&ncel'
    ModalResult = 2
    TabOrder = 7
  end
  object ButtonOK: TButton
    Left = 8
    Top = 600
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 6
  end
  object ButtonApply: TButton
    Left = 200
    Top = 600
    Width = 75
    Height = 25
    Caption = '&Apply'
    TabOrder = 8
    OnClick = ButtonApplyClick
  end
  object JvColorSpaceCombo: TJvColorSpaceCombo
    Left = 128
    Top = 16
    Width = 153
    Height = 21
    AllowVariable = False
    ColorSpaceID = 1
    ItemHeight = 13
    TabOrder = 0
    OnChange = JvColorSpaceComboChange
  end
end
