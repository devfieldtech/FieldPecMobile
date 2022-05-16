unit ULeituraCocho;

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
    ,Soap.EncdDecd,UFrameLeituraCocho,UFrameLoteLeitura, FMX.Memo.Types,
  View.WebCharts, FMX.WebBrowser,Charts.Types, FMX.TMSBaseControl,
  FMX.TMSTrackBar,uCombobox;

type
  TfrmLeituraCocho = class(TForm)
    StyleBook1: TStyleBook;
    tbPrincipal: TTabControl;
    tbilista: TTabItem;
    tbiCad: TTabItem;
    Rectangle1: TRectangle;
    layPrincipal: TLayout;
    RecLista: TRectangle;
    layListCards: TLayout;
    Layout9: TLayout;
    btnLeitura: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image4: TImage;
    ListaCards: TListBox;
    Layout1: TLayout;
    Rectangle3: TRectangle;
    Layout2: TLayout;
    Layout4: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Rectangle4: TRectangle;
    edtCurralF: TEdit;
    ClearEditButton2: TClearEditButton;
    Layout5: TLayout;
    Layout8: TLayout;
    Label1: TLabel;
    Rectangle2: TRectangle;
    edtdataf: TDateEdit;
    Layout10: TLayout;
    btnBuscar: TRectangle;
    Layout11: TLayout;
    Label3: TLabel;
    Image1: TImage;
    Lsbrl: TLayout;
    lblLista: TLabel;
    btnCloseAll: TImage;
    Layout3: TLayout;
    lblTotalRegistro: TLabel;
    Rectangle5: TRectangle;
    Layout12: TLayout;
    Layout16: TLayout;
    Rectangle8: TRectangle;
    Layout17: TLayout;
    Layout18: TLayout;
    Layout21: TLayout;
    Layout22: TLayout;
    Label7: TLabel;
    Rectangle10: TRectangle;
    edtdata: TDateEdit;
    Layout25: TLayout;
    Label9: TLabel;
    Image5: TImage;
    layDadosLotes: TLayout;
    Layout19: TLayout;
    Label6: TLabel;
    Layout26: TLayout;
    layBtnLista: TLayout;
    btnHabilitaSync: TRectangle;
    Image16: TImage;
    Label32: TLabel;
    btnExcluiItem: TRectangle;
    Image6: TImage;
    lblExcluir: TLabel;
    LocationSensor1: TLocationSensor;
    GestureManager1: TGestureManager;
    Rectangle9: TRectangle;
    Rectangle11: TRectangle;
    layListaCardsLotes: TLayout;
    ListaCardsLotes: TListBox;
    laycharts: TLayout;
    WebCharts1: TWebCharts;
    tbCharts: TTabControl;
    tbiLeitura: TTabItem;
    tbiConsumo: TTabItem;
    WebBrowser1: TWebBrowser;
    WebBrowser2: TWebBrowser;
    Layout13: TLayout;
    layNota: TLayout;
    Nota: TLabel;
    cbxNota: TRoundRect;
    Image2: TImage;
    lblNota: TLabel;
    Layout23: TLayout;
    btnConfirmar: TRectangle;
    Layout24: TLayout;
    Label8: TLabel;
    Image3: TImage;
    Layout14: TLayout;
    Layout15: TLayout;
    Label5: TLabel;
    Rectangle6: TRectangle;
    edtLinhaFiltro: TEdit;
    SearchEditButton1: TSearchEditButton;
    Layout20: TLayout;
    btnBuscaFiltro: TRectangle;
    Layout32: TLayout;
    Label10: TLabel;
    Image7: TImage;
    procedure btnLeituraMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnLeituraMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnCloseAllClick(Sender: TObject);
    procedure btnLeituraClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExcluiItemClick(Sender: TObject);
    procedure cbxNotaClick(Sender: TObject);
    procedure edtdataClosePicker(Sender: TObject);
    procedure btnBuscaFiltroClick(Sender: TObject);
  private
    {$IFDEF ANDROID}
    Location: TLocationCoord2D;
    FGeocoder: TGeocoder;
    Access_Fine_Location, Access_Coarse_Location : string;
    PermissaoCamera, PermissaoReadStorage, PermissaoWriteStorage : string;
     procedure LocationPermissionRequestResult
                (Sender: TObject; const APermissions: TArray<string>;
                const AGrantResults: TArray<TPermissionStatus>);
     procedure DisplayRationale(Sender: TObject;
              const APermissions: TArray<string>; const APostRationaleProc: TProc);
    {$ENDIF}
  public
    c          : TCustomCombo;
    FFrame     : TFrameLeituraCocho;
    FFrameLote : TFrameLoteLeitura;
    vIdLeitura,vIdBebedouro,vFlagSync,vIdLote,vIdCurral,vAjuste : string;
    vListBoxIdex:single;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraListaCards(vFiltro:string);
    procedure GeraGrafico(IdLote: string);
    procedure GeraListaCardLotes(vFiltro: string);
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);
    procedure ItemLoteClick(Sender: TObject);
    procedure FrameGesture(Sender: TObject;
     const EventInfo: TGestureEventInfo; var Handled: Boolean);
    {$IFDEF ANDROID}
     procedure ItemNotaClick(Sender: TObject; const Point: TPointF);
    {$ENDIF}
    {$IFDEF MSWINDOWS}
     procedure ItemNotaClick(Sender: TObject);
    {$ENDIF}
    procedure GeraComboNotas;

end;

var
  frmLeituraCocho: TfrmLeituraCocho;

implementation

{$R *.fmx}

uses UDmDB, UListBebedouro, UnitCamera;

procedure TfrmLeituraCocho.FormShow(Sender: TObject);
begin
 {$IFDEF ANDROID}
  Access_Coarse_Location := JStringToString(TJManifest_permission.JavaClass.ACCESS_COARSE_LOCATION);
  Access_Fine_Location   := JStringToString(TJManifest_permission.JavaClass.ACCESS_FINE_LOCATION);
  PermissionsService.RequestPermissions([Access_Coarse_Location,
                                                       Access_Fine_Location],
                                                       LocationPermissionRequestResult,
                                                       DisplayRationale);
  PermissaoCamera       := JStringToString(TJManifest_permission.JavaClass.CAMERA);
  PermissaoReadStorage  := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  PermissaoWriteStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);

 {$ENDIF}
 GeraComboNotas;
 layBtnLista.Visible     := false;
 tbPrincipal.TabPosition := TTabPosition.None;
 tbPrincipal.ActiveTab   := tbilista;
end;

procedure TfrmLeituraCocho.FrameGesture(Sender: TObject;
  const EventInfo: TGestureEventInfo; var Handled: Boolean);
begin
  layBtnLista.Visible := true;
end;

procedure TfrmLeituraCocho.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmLeituraCocho.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmLeituraCocho.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;

   dmDB.AbreLeituraCocho(dmdb.vIdPropriedade,vFiltro);
   dmDB.LEITURA_COCHO.First;
   TThread.CreateAnonymousThread(procedure
   begin
    TThread.Synchronize(nil, procedure
    begin
     while not dmDB.LEITURA_COCHO.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFrameLeituraCocho.Create(self);
      FFrame.Name:= 'Item_'+dmDB.LEITURA_COCHOID.AsString;
      FFrame.Parent          := item;
      FFrame.Align           := TAlignLayout.Client;
      FFrame.HitTest         := false;
      FFrame.Opacity         := 1;

      item.HitTest           := true;
      item.Height            := 200;
      item.Margins.Left      := 10;
      item.Margins.Right     := 10;
      item.Margins.Top       := 10;
      item.Margins.Bottom    := 10;
      item.TagString         := dmDB.LEITURA_COCHOID.AsString;
      item.OnClick           := ItemClick;
      item.OnMouseDown       := FrameMouseDown;
      item.OnMouseUp         := FrameMouseUp;
      item.Touch.GestureManager      := GestureManager1;
      item.Touch.InteractiveGestures := [TInteractiveGesture.LongTap];
      item.OnGesture                 := FrameGesture;

      item.Tag               := dmDB.LEITURA_COCHOID.AsInteger;
      item.TagString         := dmDB.LEITURA_COCHOCurral.AsString;
      item.TagFloat          := dmDB.LEITURA_COCHOSYNC.AsFloat;

      FFrame.lblLote.Text           := dmDB.LEITURA_COCHOCurral.AsString;
      FFrame.lbldata.Text           := dmDB.LEITURA_COCHODATA_LEITURA.AsString;
      FFrame.lblNota.Text           := dmDB.LEITURA_COCHONOTA.AsString;
      FFrame.lblAjute.Text          := dmDB.LEITURA_COCHOAJUSTE.AsString;

      if dmDB.LEITURA_COCHOSYNC.AsInteger=0 then
      begin
        FFrame.imgSyncYes.visible := false;
        FFrame.imgSyncNo.visible  := true;
        FFrame.lblSync.Text       := 'Sincronização Pendente';
      end;
      if dmDB.LEITURA_COCHOSYNC.AsInteger=1 then
      begin
        FFrame.imgSyncYes.visible := true;
        FFrame.imgSyncNo.visible  := false;
        FFrame.lblSync.Text       := 'Sincronizado';
      end;
      item.Parent                      := ListaCards;

      ListaCards.EndUpdate;
      dmDB.LEITURA_COCHO.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
    end);
   end).Start;
end;

procedure TfrmLeituraCocho.GeraComboNotas;
begin
  c := TCustomCombo.Create(frmLeituraCocho);
  c.TitleMenuText := 'Escolha uma nota';
  c.SubTitleMenuText := '';
  c.BackgroundColor := $FFF2F2F8;
  c.OnClick := ItemNotaClick;
  dmDB.AUX_NOTAS_LEITURA.Close;
  dmDB.AUX_NOTAS_LEITURA.Open;
  dmDB.AUX_NOTAS_LEITURA.First;
  while not dmDB.AUX_NOTAS_LEITURA.Eof do
  begin
    c.AddItem(
     dmDB.AUX_NOTAS_LEITURAid.AsString,
     dmDB.AUX_NOTAS_LEITURAAJUSTE.AsString,
     dmDB.AUX_NOTAS_LEITURANOTA.AsString
    );
    dmDB.AUX_NOTAS_LEITURA.Next;
  end;
end;

procedure TfrmLeituraCocho.GeraGrafico(IdLote: string);
var
 vWi:integer;
begin
   vWi := trunc(WebBrowser1.Height-20);
   dmdb.AbreGraficoHistLeitura(vIdLote);
   dmdb.AbreHistConsumo(vIdLote);
   if not dmdb.HIST_LEITURA_COCHO.IsEmpty then
   begin
     WebCharts1
    .BackgroundColor('#2e353b')
    .NewProject
      .Rows
      .Tag
        .Add(
          WebCharts1
          .ContinuosProject
           .Charts
             ._ChartType(line)
              .Attributes
                .Heigth(vWi)
                .Name('Histórico de Notas')
                .ColSpan(12)
                .Options
                  .Title
                   .text('Histórico de Notas')
                   .display(false)
                   .fontColorHEX('#FFFFFF')
                  .&End
                  .Legend
                   .display(false)
                   .position('bottom')
                  .&End
                .&End
                .Labelling
                 .Format('0.0[00]')
                 .RGBColor('255,255,255,255')
                 .FontSize(12)
                 .FontStyle('bold') //normal, bold, italic
                 .FontFamily('Arial') //Open Sans, Arial, Helvetica e etc..
               .&End
               .DataSet
                  .textLabel('Consumo %MS PV')
                  .BackgroundColor('0,102,0')
                  .Fill(true)
                  .BorderWidth(2)
                  .BorderColor('0,0,0')
                  .DataSet(dmdb.HIST_LEITURA_COCHO)
               .&End
              .&End
            .&End
           .HTML
         )
        .&End
     .&End
    .WebBrowser(WebBrowser1)
    .Generated;
   end;

   if not dmdb.HIST_CONSUMO_MN.IsEmpty then
   begin
     WebCharts1
    .BackgroundColor('#2e353b')
    .NewProject
      .Rows
      .Tag
        .Add(
          WebCharts1
          .ContinuosProject
           .Charts
             ._ChartType(line)
              .Attributes
                .Heigth(vWi)
                .Name('Histórico de Consumo')
                .ColSpan(12)
                .Options
                  .Title
                   .text('Histórico de Consumo')
                   .display(false)
                   .fontColorHEX('#FFFFFF')
                  .&End
                  .Legend
                   .display(false)
                   .position('bottom')
                  .&End
                .&End
                .Labelling
                 .Format('0.0[00]')
                 .RGBColor('255,255,255,255')
                 .FontSize(12)
                 .FontStyle('bold') //normal, bold, italic
                 .FontFamily('Arial') //Open Sans, Arial, Helvetica e etc..
               .&End
               .DataSet
                  .textLabel('Consumo MS')
                  .BackgroundColor('14,209,69')
                  .Fill(true)
                  .Types('line')
                  .BorderWidth(2)
                  .BorderColor('0,0,0')
                  .DataSet(dmdb.HIST_CONSUMO_MS)
               .&End
               .DataSet
                  .textLabel('Consumo MN PV')
                  .BackgroundColor('0,102,0')
                  .Fill(true)
                  .BorderWidth(2)
                  .BorderColor('0,0,0')
                  .DataSet(dmdb.HIST_CONSUMO_MN)
               .&End
              .&End
            .&End
           .HTML
         )
        .&End
     .&End
    .WebBrowser(WebBrowser2)
    .Generated;
   end;
end;

procedure TfrmLeituraCocho.GeraListaCardLotes(vFiltro: string);
var
  item: TListBoxItem;
begin
 ListaCardsLotes.Items.Clear;
 DestroiFrames;
 if edtLinhaFiltro.Text.Length>0 then
  vFiltro := ' and substr(c.CODIGO,1 ,(INSTR(c.CODIGO,''-'')-1)) like '+
   QuotedStr('%'+edtLinhaFiltro.Text+'%')
 else
  vFiltro := '';
 dmDB.AbreLotes(dmdb.vIdPropriedade,vFiltro,FormatDateTime('yyyy-mm-dd',edtdata.Date));
 dmDB.LOTE_NUTRICIONAL.First;
 while not dmDB.LOTE_NUTRICIONAL.eof do
 begin
  ListaCards.BeginUpdate;
  item := TListBoxItem.Create(self);
  FFrameLote := TFrameLoteLeitura.Create(self);
  FFrameLote.Name:= 'Item_Lote'+dmDB.LOTE_NUTRICIONALID.AsString;
  FFrameLote.Parent          := item;
  FFrameLote.Align           := TAlignLayout.Client;
  FFrameLote.HitTest         := false;
  FFrameLote.Opacity         := 1;

  if dmDB.LOTE_NUTRICIONALUltimaNota.AsString.Length>0 then
   FFrameLote.RecBack.Fill.Color := TAlphaColorRec.Darkgreen
  else
   FFrameLote.RecBack.Fill.Color := TAlphaColorRec.White;

  item.HitTest           := true;
  item.Height            := ListaCardsLotes.Height;
  item.Width             := ListaCardsLotes.Width-40;
  item.Margins.Left      := 5;
  item.Margins.Right     := 5;
  item.Margins.Top       := 2;
  item.Margins.Bottom    := 2;
  item.TagString         := dmDB.LOTE_NUTRICIONALID.AsString;
  item.Tag               := dmDB.LOTE_NUTRICIONALID_LOCAL.AsInteger;
  item.OnClick           := ItemLoteClick;
  item.OnMouseDown       := FrameMouseDown;
  item.OnMouseUp         := FrameMouseUp;
  item.Touch.GestureManager      := GestureManager1;
  item.Touch.InteractiveGestures := [TInteractiveGesture.LongTap];
  item.OnGesture                 := FrameGesture;

  FFrameLote.lblLote.Text           := dmDB.LOTE_NUTRICIONALID.AsString;
  FFrameLote.lblDataEntrada.Text    := dmDB.LOTE_NUTRICIONALDATA_ENTRADA.AsString;
  FFrameLote.lblqtdCabeca.Text      := dmDB.LOTE_NUTRICIONALQTDE_CAB.AsString;
  FFrameLote.lblCurral.Text         := dmDB.LOTE_NUTRICIONALCurral.AsString;
  FFrameLote.lblPesoMedio.Text      := dmDB.LOTE_NUTRICIONALPESO_MEDIO.AsString;
  FFrameLote.lblNota.Text           := dmDB.LOTE_NUTRICIONALUltimaNota.AsString;
  FFrameLote.lblAjuste.Text         := dmDB.LOTE_NUTRICIONALAJUSTE.AsString;

  item.Parent                       := ListaCardsLotes;

  ListaCardsLotes.EndUpdate;
  dmDB.LOTE_NUTRICIONAL.Next;
 end;
 ListaCards.BeginUpdate;
 ListaCardsLotes.ViewportPosition := PointF(vListBoxIdex,0);
 ListaCardsLotes.EndUpdate;
end;

{$IFDEF ANDROID}
procedure TfrmLeituraCocho.ItemNotaClick(Sender: TObject; const Point: TPointF);
begin
 c.HideMenu;
 lblNota.Text     := c.NomeItem;
 vAjuste          := c.DescricaoItem;
 tbCharts.Visible := true;
end;
{$ENDIF}
{$IFDEF MSWINDOWS}
procedure TfrmLeituraCocho.ItemNotaClick(Sender: TObject);
begin
 c.HideMenu;
 lblNota.Text     := c.NomeItem;
 vAjuste          := c.DescricaoItem;
 tbCharts.Visible := true;
end;
{$ENDIF}


procedure TfrmLeituraCocho.ItemClick(Sender: TObject);
begin
 vIdLeitura          := intToStr(TListBoxItem(sender).Tag);
 vFlagSync           := FloatToStr(TListBoxItem(sender).TagFloat);
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmLeituraCocho.ItemLoteClick(Sender: TObject);
begin
 vIdLote      := TListBoxItem(sender).TagString;
 vIdCurral    := intToStr(TListBoxItem(sender).Tag);
 GeraGrafico(vIdLote);
end;
{$IFDEF ANDROID}
procedure TfrmLeituraCocho.LocationPermissionRequestResult(Sender: TObject;
  const APermissions: TArray<string>;
  const AGrantResults: TArray<TPermissionStatus>);
var
         x : integer;
begin
  if (Length(AGrantResults) = 2) and
    (AGrantResults[0] = TPermissionStatus.Granted) and
    (AGrantResults[1] = TPermissionStatus.Granted) then
  begin
    LocationSensor1.Active := true;
  end
  else
  begin
    TDialogService.ShowMessage
      ('Não é possível acessar o GPS porque o app não possui acesso');
  end;
end;
{$ENDIF}
procedure TfrmLeituraCocho.btnBuscaFiltroClick(Sender: TObject);
begin
 GeraListaCardLotes('');
end;

procedure TfrmLeituraCocho.btnBuscarClick(Sender: TObject);
var
 vFiltro:string;
begin
 vFiltro :=' and data_leitura='+FormatDateTime('yyyy-mm-dd',edtdataf.Date).QuotedString;
 if edtCurralF.Text.Length>0 then
  vFiltro := vFiltro+' and c.codito like '+QuotedStr('%'+edtCurralF.Text+'%');
 GeraListaCards(vFiltro);
end;

procedure TfrmLeituraCocho.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmLeituraCocho.btnConfirmarClick(Sender: TObject);
begin
 if vIdLote.Length=0 then
 begin
   ShowMessage('Selecione o Lote!');
   Exit;
 end;
 if lblNota.Text='Selecione a Nota' then
 begin
   ShowMessage('Selecione a Nota!');
   Exit;
 end;
 if vListBoxIdex<ListaCardsLotes.Items.Count then
  vListBoxIdex := ListaCardsLotes.ViewportPosition.X;
 dmdb.AbreLeituraCocho(dmdb.vIdPropriedade,' and lc.id_lote='+vIdLote+
  ' and lc.data_leitura='+FormatDateTime('yyyy-mm-dd',edtdata.Date).QuotedString);
 if dmdb.LEITURA_COCHO.IsEmpty then
  dmdb.LEITURA_COCHO.Insert
 else
  dmdb.LEITURA_COCHO.Edit;
 try
  dmdb.LEITURA_COCHOID_LOTE.AsString       := vIdLote;
  dmdb.LEITURA_COCHOID_CURRAL.AsString     := vIdCurral;
  dmdb.LEITURA_COCHODATA_LEITURA.AsDateTime:= edtdata.Date;
  dmdb.LEITURA_COCHONOTA.AsString          := lblNota.Text;
  dmdb.LEITURA_COCHOAJUSTE.AsString        := vAjuste;
  dmdb.LEITURA_COCHOID_USUARIO.AsString    := dmdb.vIdUser;
  dmdb.LEITURA_COCHO.ApplyUpdates(-1);
  ShowMessage('Leitura Lançada com Sucesso!');
  GeraListaCardLotes('');

 except
   on E : Exception do
    ShowMessage('Erro ao Confirmar Registro : '+E.Message);
 end;
end;

procedure TfrmLeituraCocho.btnExcluiItemClick(Sender: TObject);
begin
 layBtnLista.Visible := false;
 if vFlagSync='0' then
 begin
   MessageDlg('Deseja Realmente Deletar esse Registro?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes,
   System.UITypes.TMsgDlgBtn.mbNo
   ], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
    case AResult of
     mrYES:
     begin
       dmDB.DeletaGenerico(vIdLeitura,'LEITURA_COCHO');
       btnBuscarClick(sender);
     end;
     mrNo:
    end;
   end);
 end
 else
 begin
   ShowMessage('Registro ja Sincronizado!!');
 end;
end;

procedure TfrmLeituraCocho.btnLeituraClick(Sender: TObject);
begin
  vListBoxIdex :=0;
  dmdb.LEITURA_COCHO.Close;
  dmdb.LEITURA_COCHO.Open;
  tbPrincipal.ActiveTab := tbiCad;
end;

procedure TfrmLeituraCocho.btnLeituraMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmLeituraCocho.btnLeituraMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;

procedure TfrmLeituraCocho.cbxNotaClick(Sender: TObject);
begin
  c.ShowMenu;
  tbCharts.Visible := false;
end;

procedure TfrmLeituraCocho.DestroiFrames;
var
  i : Integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
   If (Components[i] is TFrame) then
     TFrame(Components[i]).Destroy;
  end;
end;
{$IFDEF ANDROID}
procedure TfrmLeituraCocho.DisplayRationale(Sender: TObject;
  const APermissions: TArray<string>; const APostRationaleProc: TProc);
var
  I: Integer;
  RationaleMsg: string;
begin
  for I := 0 to High(APermissions) do
  begin
    if (APermissions[I] = Access_Coarse_Location) or (APermissions[I] = Access_Fine_Location) then
      RationaleMsg := 'O app precisa de acesso ao GPS para obter sua localização'
  end;
  TDialogService.ShowMessage(RationaleMsg,
    procedure(const AResult: TModalResult)
    begin
      APostRationaleProc;
    end)
end;
{$ENDIF}
procedure TfrmLeituraCocho.edtdataClosePicker(Sender: TObject);
begin
  GeraListaCardLotes('');
end;

end.

