unit UCurrais;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.TabControl, FMX.Layouts,
  FMX.TreeView, FMX.MultiView, System.Actions, FMX.ActnList, FMX.Ani,
  FMX.Effects, FMX.Filter.Effects, System.Rtti, FMX.Grid.Style, FMX.ScrollBox,
  FMX.Grid, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.ListBox, FMX.DateTimeCtrls,
  System.Bluetooth, System.Bluetooth.Components,System.Threading,FireDAC.Comp.Client,
  FMX.EditBox, FMX.SpinBox, FMX.Memo,IdHTTP,System.Json.writers,System.Json.Readers,System.JSON.Types,
  Rest.Json,System.JSON, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, Data.Bind.ObjectScope,
  REST.Client, IPPeerClient,REST.Types,FMX.VirtualKeyboard,FMX.Platform,
  IdHashMessageDigest,System.ImageList,
  FMX.ImgList, FMX.Media, System.Sensors, System.Sensors.Components,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.Gestures, FMX.NumberBox, FMX.ListView, FMX.MediaLibrary.Actions,FMX.Surfaces,
  FMX.StdActns
  {$IF DEFINED(iOS) or DEFINED(ANDROID)}
   ,Androidapi.JNI.Os, Androidapi.Helpers,
   Androidapi.JNI.GraphicsContentViewText,System.Permissions,FMX.DialogService
   {$ENDIF}
    ,Soap.EncdDecd,UFrameLista;

type
  TfrmListaCurrais = class(TForm)
    layPrincipal: TLayout;
    Rectangle1: TRectangle;
    RecLista: TRectangle;
    StyleBook1: TStyleBook;
    Layout1: TLayout;
    Rectangle3: TRectangle;
    Layout2: TLayout;
    Layout4: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Rectangle4: TRectangle;
    edtNomeF: TEdit;
    ClearEditButton2: TClearEditButton;
    SearchEditButton1: TSearchEditButton;
    layListCards: TLayout;
    Lsbrl: TLayout;
    btnCloseAll: TImage;
    Label1: TLabel;
    Layout3: TLayout;
    lblTotalRegistro: TLabel;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image4: TImage;
    ListaCards: TListBox;
    Layout5: TLayout;
    Rectangle6: TRectangle;
    rdConfinamento: TRadioButton;
    RdPasto: TRadioButton;
    rdTodos: TRadioButton;
    Layout10: TLayout;
    btnBuscar: TRectangle;
    Layout11: TLayout;
    Label3: TLabel;
    Image1: TImage;
    procedure btnCloseAllClick(Sender: TObject);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure ListaCardsCanFocus(Sender: TObject; var ACanFocus: Boolean);
    procedure btnSelecionarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSelecionarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnBuscarClick(Sender: TObject);
  private
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
    Shift: TShiftState; X, Y: Single);
  public
    vFiltro,vIdCurral,vNomeCurral,vTipo:string;
    FFrame: TFItemListaAbastecimento;
    procedure GeraListaCards(vFiltro:string);
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);

 end;

var
  frmListaCurrais: TfrmListaCurrais;

implementation

{$R *.fmx}

uses UDmDB;

{ TForm1 }

procedure TfrmListaCurrais.ListaCardsCanFocus(Sender: TObject;
  var ACanFocus: Boolean);
begin
 ShowMessage('oia')
end;

procedure TfrmListaCurrais.btnBuscarClick(Sender: TObject);
var
 vFiltro:string;
begin
 if rdConfinamento.IsChecked then
  vFiltro := vFiltro+'and tipo=1';
 if RdPasto.IsChecked then
  vFiltro := vFiltro+'and tipo=0';
 if edtNomeF.Text.Length>0 then
  vFiltro := vFiltro+' and codigo like '+QuotedStr('%'+edtNomeF.Text+'%');
 GeraListaCards(vFiltro);
end;

procedure TfrmListaCurrais.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListaCurrais.btnSelecionarClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListaCurrais.btnSelecionarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmListaCurrais.btnSelecionarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
    TRectangle(sender).Opacity := 1;
end;

procedure TfrmListaCurrais.DestroiFrames;
var
  i : Integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
   If (Components[i] is TFrame) then
     TFrame(Components[i]).Destroy;
  end;
end;

procedure TfrmListaCurrais.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if ListaCards=nil then
  FreeAndNil(ListaCards);
 DestroiFrames;
 edtNomeF.Text :='';
end;

procedure TfrmListaCurrais.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmListaCurrais.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmListaCurrais.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;

   dmDB.AbreCurrais(dmdb.vIdPropriedade,vFiltro);
   dmDB.CURRAIS.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     while not dmDB.CURRAIS.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFItemListaAbastecimento.Create(self);
      FFrame.Name:= 'Item_'+dmDB.CURRAISID.AsString;

      FFrame.Parent          := item;
      FFrame.Align           := TAlignLayout.Client;
      FFrame.HitTest         := false;
      FFrame.Opacity         := 1;

      item.HitTest           := true;
      item.Height            := 210;
      item.Margins.Left      := 10;
      item.Margins.Right     := 10;
      item.Margins.Top       := 10;
      item.Margins.Bottom    := 10;
      item.TagString         := dmDB.CURRAISId.AsString;
      item.OnClick           := ItemClick;
      item.OnMouseDown       := FrameMouseDown;
      item.OnMouseUp         := FrameMouseUp;
      item.Tag               := dmDB.CURRAISId.AsInteger;
      item.TagString         := dmDB.CURRAISCODIGO.AsString;
      item.TagFloat          := dmDB.CURRAISTIPO.AsFloat;

      FFrame.lblCurral.Text      := dmDB.CURRAISCODIGO.AsString;
      FFrame.lblCurral.TagString := dmDB.CURRAISId.AsString;

      FFrame.lblTipo.Text        := dmDB.CURRAISTIPOSTR.AsString;

      FFrame.lblCapacidade.Text        := dmDB.CURRAISCAPACIDADE.AsString;
      FFrame.lblCapacidade.TagString   := dmDB.CURRAISLOTACAO.AsString;

      item.Parent                      := ListaCards;

      ListaCards.EndUpdate;
      dmDB.CURRAIS.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
    end);
   end).Start;
end;

procedure TfrmListaCurrais.ItemClick(Sender: TObject);
begin
 vIdCurral          := intToStr(TListBoxItem(sender).Tag);
 vNomeCurral        := TListBoxItem(sender).TagString;
 vTipo              := FloatToStr(TListBoxItem(sender).TagFloat);
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmListaCurrais.SearchEditButton1Click(Sender: TObject);
var
 vFiltro:string;
begin
 if rdConfinamento.IsChecked then
  vFiltro := vFiltro+'and tipo=1';
 if RdPasto.IsChecked then
  vFiltro := vFiltro+'and tipo=0';
 if edtNomeF.Text.Length>0 then
  vFiltro := vFiltro+' and codigo like '+QuotedStr('%'+edtNomeF.Text+'%');
 GeraListaCards(vFiltro);
end;

end.
