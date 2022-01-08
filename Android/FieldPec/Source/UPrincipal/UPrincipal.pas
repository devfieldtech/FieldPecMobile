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
    Layout11: TLayout;
    btnBebedouro: TRectangle;
    Image11: TImage;
    ShadowEffect11: TShadowEffect;
    Label11: TLabel;
    MediaPlayer10: TMediaPlayer;
    Layout12: TLayout;
    btnCocho: TRectangle;
    Image12: TImage;
    ShadowEffect12: TShadowEffect;
    Label12: TLabel;
    MediaPlayer11: TMediaPlayer;
    Layout13: TLayout;
    btnLimpaBebedouro: TRectangle;
    Image13: TImage;
    ShadowEffect13: TShadowEffect;
    Label13: TLabel;
    RecMenuAnimais: TRectangle;
    VertScrollBox2: TVertScrollBox;
    Layout15: TLayout;
    Layout16: TLayout;
    Image15: TImage;
    Layout17: TLayout;
    MediaPlayer13: TMediaPlayer;
    Image16: TImage;
    Layout10: TLayout;
    btnBuscaAnimal: TRectangle;
    Image10: TImage;
    ShadowEffect10: TShadowEffect;
    Label10: TLabel;
    MediaPlayer9: TMediaPlayer;
    Layout14: TLayout;
    btnMovAnimal: TRectangle;
    Image14: TImage;
    ShadowEffect14: TShadowEffect;
    Label14: TLabel;
    MediaPlayer12: TMediaPlayer;
    Layout18: TLayout;
    btnAnimais: TRectangle;
    Image17: TImage;
    ShadowEffect15: TShadowEffect;
    Label15: TLabel;
    MediaPlayer14: TMediaPlayer;
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
    procedure btnBuscaAnimalClick(Sender: TObject);
    procedure btnBebedouroClick(Sender: TObject);
    procedure btnCochoClick(Sender: TObject);
    procedure btnLimpaBebedouroClick(Sender: TObject);
    procedure btnAnimaisClick(Sender: TObject);
    procedure Image15Click(Sender: TObject);
    procedure btnMovAnimalClick(Sender: TObject);
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
  UListRebanho, UFrameAnimal, UListAnimal, UFrameBebedouro, UListBebedouro,
  UFrameCocho, UListCocho, UFrameRebanho, UFrameProdutores,
  UFrameLimpaBebedouro, ULimpaBebedouro, UdmSyncUp, UListMotivoMov, UMovAnimal;

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

procedure TfrmPrincipal.btnCochoClick(Sender: TObject);
begin
 frmListCocho:= TfrmListCocho.Create(nil);
 frmListCocho.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
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

procedure TfrmPrincipal.btnLimpaBebedouroClick(Sender: TObject);
begin
 frmLimpaBebedouro:= TfrmLimpaBebedouro.Create(nil);
 frmLimpaBebedouro.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnMovAnimalClick(Sender: TObject);
begin
 frmMovAnimal:= TfrmMovAnimal.Create(nil);
 frmMovAnimal.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
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

procedure TfrmPrincipal.btnAnimaisClick(Sender: TObject);
begin
  RecMenuAnimais.Visible := true;
end;

procedure TfrmPrincipal.btnBebedouroClick(Sender: TObject);
begin
 frmListBebedouro:= TfrmListBebedouro.Create(nil);
 frmListBebedouro.ShowModal(procedure(ModalResult: TModalResult)
 begin
  recSubMnuCad.Visible := false;
 end);
end;

procedure TfrmPrincipal.btnBuscaAnimalClick(Sender: TObject);
begin
 if Not Assigned(frmListAnimal) then
   Application.CreateForm(TfrmListAnimal, frmListAnimal);
   frmListAnimal.layBtnSelecionar.Visible := false;
  frmListAnimal.ShowModal(procedure(ModalResult: TModalResult)
  begin

  end);
end;

procedure TfrmPrincipal.btnCadastrosClick(Sender: TObject);
begin
 recSubMnuCad.Visible := true;
end;

procedure TfrmPrincipal.btnSyncClick(Sender: TObject);
begin
 FrameSync1.btnEnviar.Width := (FrameSync1.Width-20)/2;
 FrameSync1.btnBaixar.Width := (FrameSync1.Width-20)/2;
 dmSyncUP.LIMPEZABEBEDOURO.Close;
 dmSyncUP.LIMPEZABEBEDOURO.Open;
 FrameSync1.lblLimpezaSync.Text :='Limpeza Bebedouro:'+intToStr(dmSyncUP.LIMPEZABEBEDOURO.RecordCount);

 dmSyncUP.MOVIMENTACAO_ANIMAL.Close;
 dmSyncUP.MOVIMENTACAO_ANIMAL.Open;
 FrameSync1.lblMovAnimal.Text :='Mov. Animal:'+intToStr(dmSyncUP.MOVIMENTACAO_ANIMAL.RecordCount);
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
 RecMenuAnimais.Visible := false;
 recSubMnuCad.Visible   := false;
 RecPrincipal.Visible   := false;
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

procedure TfrmPrincipal.Image15Click(Sender: TObject);
begin
 RecMenuAnimais.Visible := false;
end;

procedure TfrmPrincipal.imgFechaMnuCadClick(Sender: TObject);
begin
 recSubMnuCad.Visible := false;
end;

end.
