{-----------------------------------------------------------------------------
The contents of this file are subject to the Mozilla Public License
Version 1.1 (the "License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at
http://www.mozilla.org/MPL/MPL-1.1.html

Software distributed under the License is distributed on an "AS IS" basis,
WITHOUT WARRANTY OF ANY KIND, either expressed or implied. See the License for
the specific language governing rights and limitations under the License.

The Original Code is: JvDBComb.PAS, released on 2002-07-04.

The Initial Developers of the Original Code are: Fedor Koshevnikov, Igor Pavluk and Serge Korolev
Copyright (c) 1997, 1998 Fedor Koshevnikov, Igor Pavluk and Serge Korolev
Copyright (c) 2001,2002 SGB Software          
All Rights Reserved.

Last Modified: 2002-07-04

You may retrieve the latest version of this file at the Project JEDI's JVCL home page,
located at http://jvcl.sourceforge.net

Known Issues:
-----------------------------------------------------------------------------}
{$A+,B-,C+,D+,E-,F-,G+,H+,I+,J+,K-,L+,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y+,Z1}
{$I JEDI.INC}


unit JvDBComb;


interface

uses Windows, DbCtrls,
{$IFDEF Delphi6_Up}
 VDBConsts,
{$ENDIF}
  Messages, Menus, Graphics, Classes, Controls, DB,
  {$IFNDEF Delphi3_Up} DBTables, {$ENDIF} StdCtrls, DBConsts;

type

{ TJvCustomDBComboBox }

  TJvCustomDBComboBox = class(TCustomComboBox)
  private
    FDataLink: TFieldDataLink;
{$IFDEF WIN32}
    FPaintControl: TPaintControl;
{$ENDIF}
    procedure DataChange(Sender: TObject);
    procedure EditingChange(Sender: TObject);
    function GetDataField: string;
    function GetDataSource: TDataSource;
    function GetField: TField;
    function GetReadOnly: Boolean;
    procedure SetDataField(const Value: string);
    procedure SetDataSource(Value: TDataSource);
    procedure SetEditReadOnly;
    procedure SetReadOnly(Value: Boolean);
    procedure UpdateData(Sender: TObject);
    function GetComboText: string; virtual;
    procedure SetComboText(const Value: string); virtual;
    procedure CMExit(var Message: TCMExit); message CM_EXIT;
{$IFDEF WIN32}
    procedure CMGetDataLink(var Message: TMessage); message CM_GETDATALINK;
    procedure WMPaint(var Message: TWMPaint); message WM_PAINT;
{$ELSE}
    function GetStyle: TComboBoxStyle;
{$ENDIF}
  protected
{$IFNDEF RX_D6}
    procedure SetItems(const Value: TStrings);
{$ELSE}
    procedure SetItems(const Value: TStrings); override;
{$ENDIF}

    procedure Change; override;
    procedure Click; override;
    procedure ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
      ComboProc: Pointer); override;
    procedure CreateWnd; override;
    procedure DropDown; override;
    function GetPaintText: string; virtual;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure KeyPress(var Key: Char); override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent;
      Operation: TOperation); override;
    procedure SetStyle(Value: TComboBoxStyle); {$IFDEF WIN32} override {$ELSE} virtual {$ENDIF};
    procedure WndProc(var Message: TMessage); override;
    property ComboText: string read GetComboText write SetComboText;
{$IFNDEF WIN32}
    property Style: TComboBoxStyle read GetStyle write SetStyle default csDropDown;
{$ENDIF WIN32}
    property DataField: string read GetDataField write SetDataField;
    property DataSource: TDataSource read GetDataSource write SetDataSource;
    property ReadOnly: Boolean read GetReadOnly write SetReadOnly default False;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
{$IFDEF Delphi4_Up}
    function ExecuteAction(Action: TBasicAction): Boolean; override;
    function UpdateAction(Action: TBasicAction): Boolean; override;
    function UseRightToLeftAlignment: Boolean; override;
{$ENDIF}
    property Field: TField read GetField;
    property Items write SetItems;
    property Text;
  end;

{ TJvDBComboBox }

  TJvDBComboBox = class(TJvCustomDBComboBox)
  private
    FValues: TStrings;
    FEnableValues: Boolean;
    procedure SetEnableValues(Value: Boolean);
    procedure SetValues(Value: TStrings);
    procedure ValuesChanged(Sender: TObject);
  protected
    procedure SetStyle(Value: TComboBoxStyle); override;
    function GetComboText: string; override;
    function GetPaintText: string; override;
    procedure SetComboText(const Value: string); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Style; { must be published before Items }
    property Color;
    property Ctl3D;
    property DataField;
    property DataSource;
    property DragMode;
    property DragCursor;
    property DropDownCount;
    property Enabled;
    property EnableValues: Boolean read FEnableValues write SetEnableValues;
    property Font;
{$IFDEF Delphi4_Up}
    property Anchors;
    property BiDiMode;
    property Constraints;
    property DragKind;
    property ParentBiDiMode;
{$ENDIF}
{$IFDEF WIN32}
  {$IFNDEF VER90}
    property ImeMode;
    property ImeName;
  {$ENDIF}
{$ENDIF}
    property ItemHeight;
    property Items;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ReadOnly;
    property ShowHint;
    property Sorted;
    property TabOrder;
    property TabStop;
    property Values: TStrings read FValues write SetValues;
    property Visible;
    property OnChange;
    property OnClick;
    property OnDblClick;
    property OnDragDrop;
    property OnDragOver;
    property OnDrawItem;
    property OnDropDown;
    property OnEndDrag;
    property OnEnter;
    property OnExit;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMeasureItem;
{$IFDEF WIN32}
    property OnStartDrag;
{$ENDIF}
{$IFDEF Delphi5_Up}
    property OnContextPopup;
{$ENDIF}
{$IFDEF Delphi4_Up}
    property OnEndDock;
    property OnStartDock;
{$ENDIF}
  end;

implementation

uses JvDBUtils;

{ TJvCustomDBComboBox }

constructor TJvCustomDBComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
{$IFDEF WIN32}
  ControlStyle := ControlStyle + [csReplicatable];
{$ENDIF}
  FDataLink := TFieldDataLink.Create;
  FDataLink.Control := Self;
  FDataLink.OnDataChange := DataChange;
  FDataLink.OnUpdateData := UpdateData;
  FDataLink.OnEditingChange := EditingChange;
{$IFDEF WIN32}
  FPaintControl := TPaintControl.Create(Self, 'COMBOBOX');
{$ENDIF}
end;

destructor TJvCustomDBComboBox.Destroy;
begin
{$IFDEF WIN32}
  FPaintControl.Free;
{$ENDIF}
  FDataLink.OnDataChange := nil;
  FDataLink.OnUpdateData := nil;
  FDataLink.Free;
  FDataLink := nil;
  inherited Destroy;
end;

procedure TJvCustomDBComboBox.Loaded;
begin
  inherited Loaded;
  if (csDesigning in ComponentState) then DataChange(Self);
end;

procedure TJvCustomDBComboBox.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) and (FDataLink <> nil) and
    (AComponent = DataSource) then DataSource := nil;
end;

procedure TJvCustomDBComboBox.CreateWnd;
begin
  inherited CreateWnd;
  SetEditReadOnly;
end;

procedure TJvCustomDBComboBox.DataChange(Sender: TObject);
begin
  if DroppedDown then Exit;
  if FDataLink.Field <> nil then ComboText := FDataLink.Field.Text
  else if csDesigning in ComponentState then ComboText := Name
  else ComboText := '';
end;

procedure TJvCustomDBComboBox.UpdateData(Sender: TObject);
begin
  FDataLink.Field.Text := ComboText;
end;

procedure TJvCustomDBComboBox.SetComboText(const Value: string);
var
  I: Integer;
  Redraw: Boolean;
begin
  if Value <> ComboText then begin
    if Style <> csDropDown then begin
      Redraw := (Style <> csSimple) and HandleAllocated;
      if Redraw then SendMessage(Handle, WM_SETREDRAW, 0, 0);
      try
        if Value = '' then I := -1 else I := Items.IndexOf(Value);
        ItemIndex := I;
      finally
        if Redraw then begin
          SendMessage(Handle, WM_SETREDRAW, 1, 0);
          Invalidate;
        end;
      end;
      if I >= 0 then Exit;
    end;
    if Style in [csDropDown, csSimple] then Text := Value;
  end;
end;

function TJvCustomDBComboBox.GetComboText: string;
var
  I: Integer;
begin
  if Style in [csDropDown, csSimple] then Result := Text
  else begin
    I := ItemIndex;
    if I < 0 then Result := '' else Result := Items[I];
  end;
end;

procedure TJvCustomDBComboBox.Change;
begin
  FDataLink.Edit;
  inherited Change;
  FDataLink.Modified;
end;

procedure TJvCustomDBComboBox.Click;
begin
  FDataLink.Edit;
  inherited Click;
  FDataLink.Modified;
end;

procedure TJvCustomDBComboBox.DropDown;
begin
{$IFNDEF WIN32}
  FDataLink.Edit;
{$ENDIF}
  inherited DropDown;
end;

function TJvCustomDBComboBox.GetDataSource: TDataSource;
begin
  Result := FDataLink.DataSource;
end;

procedure TJvCustomDBComboBox.SetDataSource(Value: TDataSource);
begin
{$IFDEF Delphi4_Up}
  if not (FDataLink.DataSourceFixed and (csLoading in ComponentState)) then
{$ENDIF}
    FDataLink.DataSource := Value;
{$IFDEF WIN32}
  if Value <> nil then Value.FreeNotification(Self);
{$ENDIF}
end;

function TJvCustomDBComboBox.GetDataField: string;
begin
  Result := FDataLink.FieldName;
end;

procedure TJvCustomDBComboBox.SetDataField(const Value: string);
begin
  FDataLink.FieldName := Value;
end;

function TJvCustomDBComboBox.GetReadOnly: Boolean;
begin
  Result := FDataLink.ReadOnly;
end;

procedure TJvCustomDBComboBox.SetReadOnly(Value: Boolean);
begin
  FDataLink.ReadOnly := Value;
end;

function TJvCustomDBComboBox.GetField: TField;
begin
  Result := FDataLink.Field;
end;

procedure TJvCustomDBComboBox.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);
  if Key in [VK_BACK, VK_DELETE, VK_UP, VK_DOWN, 32..255] then begin
    if not FDataLink.Edit and (Key in [VK_UP, VK_DOWN]) then
      Key := 0;
  end;
end;

procedure TJvCustomDBComboBox.KeyPress(var Key: Char);
begin
  inherited KeyPress(Key);
  if (Key in [#32..#255]) and (FDataLink.Field <> nil) and
    not FDataLink.Field.IsValidChar(Key) then
  begin
    MessageBeep(0);
    Key := #0;
  end;
  case Key of
    ^H, ^V, ^X, #32..#255:
      FDataLink.Edit;
    #27:
      begin
        FDataLink.Reset;
        SelectAll;
{$IFNDEF WIN32}
        Key := #0;
{$ENDIF}
      end;
  end;
end;

procedure TJvCustomDBComboBox.EditingChange(Sender: TObject);
begin
  SetEditReadOnly;
end;

procedure TJvCustomDBComboBox.SetEditReadOnly;
begin
  if (Style in [csDropDown, csSimple]) and HandleAllocated then
    SendMessage({$IFDEF WIN32} EditHandle {$ELSE} FEditHandle {$ENDIF},
      EM_SETREADONLY, Ord(not FDataLink.Editing), 0);
end;

procedure TJvCustomDBComboBox.WndProc(var Message: TMessage);
begin
  if not (csDesigning in ComponentState) then
    case Message.Msg of
      WM_COMMAND:
        if TWMCommand(Message).NotifyCode = CBN_SELCHANGE then
          if not FDataLink.Edit then begin
            if Style <> csSimple then
              PostMessage(Handle, CB_SHOWDROPDOWN, 0, 0);
            Exit;
          end;
      CB_SHOWDROPDOWN:
        if Message.WParam <> 0 then FDataLink.Edit
        else if not FDataLink.Editing then DataChange(Self); {Restore text}
{$IFDEF WIN32}
      WM_CREATE,
      WM_WINDOWPOSCHANGED,
      CM_FONTCHANGED:
        FPaintControl.DestroyHandle;
{$ENDIF}
    end;
  inherited WndProc(Message);
end;

procedure TJvCustomDBComboBox.ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
  ComboProc: Pointer);
begin
  if not (csDesigning in ComponentState) then
    case Message.Msg of
      WM_LBUTTONDOWN:
{$IFDEF WIN32}
        if (Style = csSimple) and (ComboWnd <> EditHandle) then
{$ELSE}
        if (Style = csSimple) and (ComboWnd <> FEditHandle) then
{$ENDIF}
          if not FDataLink.Edit then Exit;
    end;
  inherited ComboWndProc(Message, ComboWnd, ComboProc);
end;

procedure TJvCustomDBComboBox.CMExit(var Message: TCMExit);
begin
  try
    FDataLink.UpdateRecord;
  except
    SelectAll;
    if CanFocus then SetFocus;
    raise;
  end;
  inherited;
end;

{$IFDEF WIN32}
procedure TJvCustomDBComboBox.CMGetDatalink(var Message: TMessage);
begin
  Message.Result := Longint(FDataLink);
end;

procedure TJvCustomDBComboBox.WMPaint(var Message: TWMPaint);
var
  S: string;
  R: TRect;
  P: TPoint;
  Child: HWND;
begin
  if csPaintCopy in ControlState then begin
    S := GetPaintText;
    if Style = csDropDown then begin
      SendMessage(FPaintControl.Handle, WM_SETTEXT, 0, Longint(PChar(S)));
      SendMessage(FPaintControl.Handle, WM_PAINT, Message.DC, 0);
      Child := GetWindow(FPaintControl.Handle, GW_CHILD);
      if Child <> 0 then begin
        Windows.GetClientRect(Child, R);
        Windows.MapWindowPoints(Child, FPaintControl.Handle, R.TopLeft, 2);
        GetWindowOrgEx(Message.DC, P);
        SetWindowOrgEx(Message.DC, P.X - R.Left, P.Y - R.Top, nil);
        IntersectClipRect(Message.DC, 0, 0, R.Right - R.Left, R.Bottom - R.Top);
        SendMessage(Child, WM_PAINT, Message.DC, 0);
      end;
    end
    else begin
      SendMessage(FPaintControl.Handle, CB_RESETCONTENT, 0, 0);
      if Items.IndexOf(S) <> -1 then begin
        SendMessage(FPaintControl.Handle, CB_ADDSTRING, 0, Longint(PChar(S)));
        SendMessage(FPaintControl.Handle, CB_SETCURSEL, 0, 0);
      end;
      SendMessage(FPaintControl.Handle, WM_PAINT, Message.DC, 0);
    end;
  end
  else inherited;
end;
{$ENDIF}

function TJvCustomDBComboBox.GetPaintText: string;
begin
  if FDataLink.Field <> nil then Result := FDataLink.Field.Text
  else Result := '';
end;

procedure TJvCustomDBComboBox.SetItems(const Value: TStrings);
begin
{$IFDEF RX_D6}
  inherited SetItems(Value);
{$ENDIF}  
  //Items.Assign(Value);
  DataChange(Self);
end;

{$IFNDEF WIN32}
function TJvCustomDBComboBox.GetStyle: TComboBoxStyle;
begin
  Result := inherited Style;
end;
{$ENDIF}

procedure TJvCustomDBComboBox.SetStyle(Value: TComboBoxStyle);
begin
{$IFDEF WIN32}
  if (Value = csSimple) and Assigned(FDatalink) and FDatalink.DatasourceFixed then
    _DBError(SNotReplicatable);
  inherited SetStyle(Value);
{$ELSE}
  if Value = csSimple then ControlStyle := ControlStyle - [csFixedHeight]
  else ControlStyle := ControlStyle + [csFixedHeight];
  inherited Style := Value;
  RecreateWnd;
{$ENDIF}
end;

{$IFDEF Delphi4_Up}
function TJvCustomDBComboBox.UseRightToLeftAlignment: Boolean;
begin
  Result := DBUseRightToLeftAlignment(Self, Field);
end;

function TJvCustomDBComboBox.ExecuteAction(Action: TBasicAction): Boolean;
begin
  Result := inherited ExecuteAction(Action) or (FDataLink <> nil) and
    FDataLink.ExecuteAction(Action);
end;

function TJvCustomDBComboBox.UpdateAction(Action: TBasicAction): Boolean;
begin
  Result := inherited UpdateAction(Action) or (FDataLink <> nil) and
    FDataLink.UpdateAction(Action);
end;
{$ENDIF}

{ TJvDBComboBox }

constructor TJvDBComboBox.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FValues := TStringList.Create;
  TStringList(FValues).OnChange := ValuesChanged;
  EnableValues := False;
end;

destructor TJvDBComboBox.Destroy;
begin
  TStringList(FValues).OnChange := nil;
  FValues.Free;
  inherited Destroy;
end;

procedure TJvDBComboBox.ValuesChanged(Sender: TObject);
begin
  if FEnableValues then DataChange(Self);
end;

function TJvDBComboBox.GetPaintText: string;
var
  I: Integer;
begin
  Result := '';
  if FDataLink.Field <> nil then begin
    if FEnableValues then begin
      I := Values.IndexOf(FDataLink.Field.Text);
      if I >= 0 then Result := Items.Strings[I]
    end
    else Result := FDataLink.Field.Text;
  end;
end;

function TJvDBComboBox.GetComboText: string;
var
  I: Integer;
begin
  if (Style in [csDropDown, csSimple]) and (not FEnableValues) then
    Result := Text
  else begin
    I := ItemIndex;
    if (I < 0) or (FEnableValues and (FValues.Count < I + 1)) then
      Result := ''
    else
      if FEnableValues then Result := FValues[I]
      else Result := Items[I];
  end;
end;

procedure TJvDBComboBox.SetComboText(const Value: string);
var
  I: Integer;
  Redraw: Boolean;
begin
  if Value <> ComboText then begin
    if Style <> csDropDown then begin
      Redraw := (Style <> csSimple) and HandleAllocated;
      if Redraw then SendMessage(Handle, WM_SETREDRAW, 0, 0);
      try
        if Value = '' then I := -1 else
          if FEnableValues then I := Values.IndexOf(Value)
          else I := Items.IndexOf(Value);
        if I >= Items.Count then I := -1;
        ItemIndex := I;
      finally
        if Redraw then begin
          SendMessage(Handle, WM_SETREDRAW, 1, 0);
          Invalidate;
        end;
      end;
      if I >= 0 then Exit;
    end;
    if Style in [csDropDown, csSimple] then Text := Value;
  end;
end;

procedure TJvDBComboBox.SetEnableValues(Value: Boolean);
begin
  if FEnableValues <> Value then begin
    if Value and (Style in [csDropDown, csSimple]) then
      Style := csDropDownList;
    FEnableValues := Value;
    DataChange(Self);
  end;
end;

procedure TJvDBComboBox.SetValues(Value: TStrings);
begin
  FValues.Assign(Value);
end;

procedure TJvDBComboBox.SetStyle(Value: TComboboxStyle);
begin
  if (Value in [csSimple, csDropDown]) and FEnableValues then
    Value := csDropDownList;
  inherited SetStyle(Value);
end;

end.
