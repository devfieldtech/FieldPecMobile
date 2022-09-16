unit UHistSanidade;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, FMX.StdCtrls, FMX.Edit, FMX.Objects, FMX.Controls.Presentation,
  FMX.Layouts, UDmDB, UListProdutores;

type
  TfrmHistSanidade = class(TForm)
    Rectangle1: TRectangle;
    layPrincipal: TLayout;
    RecLista: TRectangle;
    layListCards: TLayout;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
    LaybtnEntrar: TLayout;
    Label4: TLabel;
    Image4: TImage;
    Layout1: TLayout;
    Rectangle3: TRectangle;
    Layout2: TLayout;
    Layout4: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Label2: TLabel;
    Label1: TLabel;
    Rectangle2: TRectangle;
    edtLocal: TEdit;
    ClearEditButton1: TClearEditButton;
    Layout11: TLayout;
    btnLerQr: TRectangle;
    Layout12: TLayout;
    Image2: TImage;
    Layout5: TLayout;
    Rectangle6: TRectangle;
    rdChip: TRadioButton;
    RdManejo: TRadioButton;
    rdSisbov: TRadioButton;
    Layout8: TLayout;
    btnBuscar: TRectangle;
    Layout10: TLayout;
    Label3: TLabel;
    Image1: TImage;
    Lsbrl: TLayout;
    lblLista: TLabel;
    btnCloseAll: TImage;
    Layout3: TLayout;
    lblTotalRegistro: TLabel;
    Lista: TListView;
    Rectangle4: TRectangle;
    edtIdentificacao: TEdit;
    ClearEditButton2: TClearEditButton;
    procedure btnLerQrClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure GerarLista;
  end;

var
  frmHistSanidade: TfrmHistSanidade;

implementation
USES UPrincipal, UnitCamera;

{$R *.fmx}

procedure TfrmHistSanidade.btnBuscarClick(Sender: TObject);
begin
 if edtIdentificacao.Text.Length=0 then
 begin
   ShowMessage('Informe uma Identificação!');
   Exit;
 end;
 GerarLista;
end;

procedure TfrmHistSanidade.GerarLista;
var
 item   : TListViewItem;
 txt    : TListItemText;
 txtH   : TListItemPurpose;
 img    : TListItemImage;
 vIDAnimal,URL,urlBomba,urlHorimetro,urlKM,vChekURL,vFiltro    : string;
 vLayout  : TLayout;
 FileSize : Int64;
begin
 if edtIdentificacao.Text.Length>0 then
 begin
   if rdSisbov.IsChecked then
    vFiltro:=vFiltro+' and identificacao_2='+edtIdentificacao.Text.QuotedString;
   if RdManejo.IsChecked then
    vFiltro:=vFiltro+' and SUBSTR(IDENTIFICACAO_2,9,6)='+edtIdentificacao.Text.QuotedString;
   if rdChip.IsChecked then
    vFiltro:=vFiltro+' and identificacao_1='+edtIdentificacao.Text.QuotedString;
 end;

 vIDAnimal := dmdb.RetornaIdAnimal(vFiltro);
 if vIDAnimal.Length<=0 then
 begin
   ShowMessage('Animal Não Encontrado!');
   Lista.Items.Clear;
   Exit;
 end;
 Lista.Items.Clear;
 dmdb.AbreSanidadeAnimal(vIDAnimal);
 if not dmDB.HIST_SANIDADE.IsEmpty then
 begin
     while not dmDB.HIST_SANIDADE.eof do
     begin
       item := Lista.Items.Add;
       with frmHistSanidade do
       begin
         with item  do
         begin
           txt      := TListItemText(Objects.FindDrawable('Text1'));
           txt.Text := dmDB.HIST_SANIDADEPRODUTO.AsString;
           txt.TagString := dmDB.HIST_SANIDADEid.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text3'));
           txt.Text := 'Dose(ML) : ';

           txt      := TListItemText(Objects.FindDrawable('Text2'));
           txt.Text := dmDB.HIST_SANIDADEDOSE_ML.AsString;

           txt      := TListItemText(Objects.FindDrawable('Text4'));
           txt.Text := 'Data Aplicação : ';

           txt      := TListItemText(Objects.FindDrawable('Text5'));
           txt.Text := dmDB.HIST_SANIDADEDATA_APLICACAO.AsString;
         end;
        dmDB.HIST_SANIDADE.Next;
       end;
     end;
 end
 else
   ShowMessage('Animal não possui Histórico Sanitário!')
end;

procedure TfrmHistSanidade.btnCloseAllClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHistSanidade.btnLerQrClick(Sender: TObject);
var
 vCod:string;
begin
 {$IFDEF Android}
  if Not Assigned(FrmCamera) then
   Application.CreateForm(TFrmCamera, FrmCamera);
  FrmCamera.ShowModal(procedure(ModalResult: TModalResult)
  begin
    vCod := FrmCamera.codigo;
    if vCod.Length>0 then
    begin
     if (vCod.Length=16) and (copy(vCod,0,1)='0') then
      edtIdentificacao.Text := copy(vCod,2,vCod.Length)
     else
      edtIdentificacao.Text := vCod;
//     GeraLista;
    end;
  end);
 {$ENDIF}
end;

procedure TfrmHistSanidade.FormShow(Sender: TObject);
begin
  Lista.Items.Clear;
  edtIdentificacao.Text :='';
end;

end.
