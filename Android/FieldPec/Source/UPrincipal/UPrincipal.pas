unit UPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Effects,
  FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
  FMX.ActnList, System.Actions, FMX.TabControl,FireDAC.DApt, FMX.ListBox,
  FMX.Ani, FMX.ScrollBox, FMX.Memo, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope,FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, Data.DB, FireDAC.Comp.DataSet,
  FMX.TreeView,System.Net.HttpClient, FMX.Memo.Types
  {$IFDEF ANDROID}
  ,AndroidApi.helpers,AndroidApi.JNI.JavaTypes,AndroidApi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Os,Androidapi.JNIBridge,Androidapi.JNI.Telephony,Androidapi.JNI.Provider,
  FMX.Helpers.Android,FMX.Platform.Android,System.PushNotification,System.Permissions,
  FMX.VirtualKeyboard,
  {$ENDIF}
  FMX.Media,System.IOUtils, UFLogin, UFConfig, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, UFSync
 {$IFDEF MSWINDOWS}
  ,Winapi.Windows
 {$ENDIF}
  ;

type
  TfrmPrincipal = class(TForm)
    frmeLogin1: TfrmeLogin;
    RecPrincipal: TRectangle;
    RecMnu: TRectangle;
    laySuperior: TLayout;
    laySubMnu1: TLayout;
    btnConfig: TRectangle;
    Image3: TImage;
    ShadowEffect7: TShadowEffect;
    Label7: TLabel;
    btnSync: TRectangle;
    Image5: TImage;
    ShadowEffect4: TShadowEffect;
    Label6: TLabel;
    MediaPlayer1: TMediaPlayer;
    img_seta: TImage;
    StyleBook1: TStyleBook;
    Layout2: TLayout;
    btnCloseAll: TImage;
    frameConfig1: TframeConfig;
    IdHTTP1: TIdHTTP;
    lblPropriedade: TLabel;
    FrameSync1: TFrameSync;
    laySubMnuCad: TLayout;
    btnCadastros: TRectangle;
    Image1: TImage;
    ShadowEffect1: TShadowEffect;
    Label1: TLabel;
    MediaPlayer2: TMediaPlayer;
    recSubMnuCad: TRectangle;
    Layout1: TLayout;
    Layout3: TLayout;
    imgFechaMnuCad: TImage;
    Layout4: TLayout;
    btnCadCurrais: TRectangle;
    Image2: TImage;
    ShadowEffect2: TShadowEffect;
    Label2: TLabel;
    MediaPlayer3: TMediaPlayer;
    Layout5: TLayout;
    btnAlimentos: TRectangle;
    Image4: TImage;
    ShadowEffect3: TShadowEffect;
    Label3: TLabel;
    MediaPlayer4: TMediaPlayer;
    VertScrollBox1: TVertScrollBox;
    Layout6: TLayout;
    btnRaca: TRectangle;
    Image6: TImage;
    ShadowEffect5: TShadowEffect;
    Label4: TLabel;
    MediaPlayer5: TMediaPlayer;
    Layout7: TLayout;
    btnCategorias: TRectangle;
    Image7: TImage;
    ShadowEffect6: TShadowEffect;
    Label5: TLabel;
    MediaPlayer6: TMediaPlayer;
    Layout8: TLayout;
    btnProdutores: TRectangle;
    Image8: TImage;
    ShadowEffect8: TShadowEffect;
    Label8: TLabel;
    MediaPlayer7: TMediaPlayer;
    Layout9: TLayout;
    btnRebanho: TRectangle;
    Image9: TImage;
    ShadowEffect9: TShadowEffect;
    Label9: TLabel;
    MediaPlayer8: TMediaPlayer;
    procedure FormShow(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure btnConfigMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSyncMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnConfigMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSyncMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnConfigClick(Sender: TObject);
    procedure btnSyncClick(Sender: TObject);
    procedure btnCadastrosClick(Sender: TObject);
    procedure imgFechaMnuCadClick(Sender: TObject);
    procedure btnCadCurraisClick(Sender: TObject);
    procedure btnAlimentosClick(Sender: TObject);
    procedure btnRacaClick(Sender: TObject);
    procedure btnCategoriasClick(Sender: TObject);
    procedure btnProdutoresClick(Sender: TObject);
    procedure btnRebanhoClick(Sender: TObject);
  private
    { Private declarations }
  public
   vPrimeiroAcesso:Boolean;
   procedure MostraMenu;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses UDmDB, UdmSync, UCurrais, UFrameListaAlimentos, UAlimento, UFrameRaca,
  UListRaca, UFrameCategoria, UFrameLista, UListCategoria, UListProdutores,
  UListRebanho;

procedure TfrmPrincipal.MostraMenu;
begin
  btnConfig.Width          := (frmPrincipal.Width/2)-20;
  btnSync.Width            := (frmPrincipal.Width/2)-20;
end;



procedure TfrmPrincipal.btnCadCurraisClick(Sender: TObject);
begin
 frmListaCurrais:= TfrmListaCurrais.Create(nil);
 frmListaCurrais.vFiltro :='';
 frmListaCurrais.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnCategoriasClick(Sender: TObject);
begin
 frmListCategoria:= TfrmListCategoria.Create(nil);
 frmListCategoria.vFiltro :='';
 frmListCategoria.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnCloseAllClick(Sender: TObject);
begin
  MessageDlg('Deseja realmente sair do aplicativo?', System.UITypes.TMsgDlgType.mtInformation,
   [System.UITypes.TMsgDlgBtn.mbYes], 0,
   procedure(const AResult: System.UITypes.TModalResult)
   begin
//     SharedActivity.finish;
     Close;
   end);
end;

procedure TfrmPrincipal.btnConfigClick(Sender: TObject);
begin
  dmdb.qryConfig.Close;
  dmdb.qryConfig.Open;
  frameConfig1.edtIpServidor.Text    := dmdb.qryConfigIP_SERVIDOR.AsString;
  frameConfig1.edtPortaServidor.Text := dmdb.qryConfigPOTA_SERVIDOR.AsString;
  frameConfig1.Visible := true;
end;

procedure TfrmPrincipal.btnConfigMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
    TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmPrincipal.btnConfigMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
    TRectangle(sender).Opacity := 1;
end;

procedure TfrmPrincipal.btnProdutoresClick(Sender: TObject);
begin
 frmListProdutores:= TfrmListProdutores.Create(nil);
 frmListProdutores.vFiltro :='';
 frmListProdutores.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnRacaClick(Sender: TObject);
begin
 frmListRaca:= TfrmListRaca.Create(nil);
 frmListRaca.vFiltro :='';
 frmListRaca.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnRebanhoClick(Sender: TObject);
begin
 frmListRebanho:= TfrmListRebanho.Create(nil);
 frmListRebanho.vFiltro :='';
 frmListRebanho.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnAlimentosClick(Sender: TObject);
begin
 frmListaAlimentos:= TfrmListaAlimentos.Create(nil);
 frmListaAlimentos.vFiltro :='';
 frmListaAlimentos.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnCadastrosClick(Sender: TObject);
begin
 recSubMnuCad.Visible := true;
end;

procedure TfrmPrincipal.btnSyncClick(Sender: TObject);
begin
 FrameSync1.Visible := true;
end;

procedure TfrmPrincipal.btnSyncMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
    TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmPrincipal.btnSyncMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
   TRectangle(sender).Opacity := 1;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
 recSubMnuCad.Visible := false;
 RecPrincipal.Visible := false;
 dmdb.qryConfig.Close;
 dmdb.qryConfig.Open;
   if dmDB.VerificaTabelaVazia('users') then
   begin
     vPrimeiroAcesso        := true;
     dmDB.qryConfig.Edit;

     frameConfig1.Visible := true;
     frameConfig1.edtIPServidor.Text     := dmDB.qryConfigIP_SERVIDOR.AsString;
     frameConfig1.edtPortaServidor.Text  := dmDB.qryConfigPOTA_SERVIDOR.AsString;
   end
   else
   begin
     dmdb.PROPRIEDADES.Close;
     dmdb.PROPRIEDADES.Open;
     vPrimeiroAcesso           := false;
     dmDB.ReadAccess;
     if dmDB.qryConfigSalvarLogin.AsInteger=1 then
     begin
      frmeLogin1.chkSalvaSenha.IsChecked := true;
      dmDB.qryControAcces.Close;
      dmDB.qryControAcces.Open;
      if not dmDB.qryControAcces.IsEmpty then
      begin
       frmeLogin1.edtUsuario.Text := dmDB.qryControAccesUsuario.AsString;
       frmeLogin1.edtSenha.Text   := dmDB.qryControAccesSenha.AsString;
      end;
     end
     else
      frmeLogin1.chkSalvaSenha.IsChecked := false;
     frmeLogin1.Visible        := true;
     frmeLogin1.edtUsuario.SetFocus;

   end;
end;

procedure TfrmPrincipal.imgFechaMnuCadClick(Sender: TObject);
begin
 recSubMnuCad.Visible := false;
end;

end.
