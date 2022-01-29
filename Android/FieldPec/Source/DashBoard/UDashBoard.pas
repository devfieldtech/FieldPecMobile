unit UDashBoard;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.WebBrowser,
  View.WebCharts, FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Effects, FMX.Objects, FMX.TabControl,Charts.Types,uCombobox,FMX.Platform,
  FMX.Edit, FMX.ListBox, FMX.DateTimeCtrls;

type
  TfrmDashBoard = class(TForm)
    tbPrincipal: TTabControl;
    tbiResumo: TTabItem;
    tbiConsumo: TTabItem;
    recPst: TRectangle;
    Layout1: TLayout;
    Layout10: TLayout;
    Rectangle8: TRectangle;
    Layout11: TLayout;
    Image9: TImage;
    Layout12: TLayout;
    lbldashTotalAni: TLabel;
    Image10: TImage;
    Label8: TLabel;
    Layout13: TLayout;
    Rectangle9: TRectangle;
    Layout14: TLayout;
    Image11: TImage;
    Layout15: TLayout;
    lblDashPesoMed: TLabel;
    Label10: TLabel;
    Rectangle1: TRectangle;
    Layout2: TLayout;
    layPasto: TLayout;
    recMachoPst: TRectangle;
    Layout167: TLayout;
    Image120: TImage;
    Layout170: TLayout;
    lblPastoMacho: TLabel;
    recFemeaPst: TRectangle;
    Layout166: TLayout;
    Image121: TImage;
    Layout171: TLayout;
    lblPastoFemea: TLabel;
    VertScrollBox1: TVertScrollBox;
    WebCharts1: TWebCharts;
    WebBrowser1: TWebBrowser;
    Layout3: TLayout;
    btnCloseAll: TImage;
    Label62: TLabel;
    VertScrollBox2: TVertScrollBox;
    recDados: TRectangle;
    Layout4: TLayout;
    Layout5: TLayout;
    Rectangle3: TRectangle;
    Layout6: TLayout;
    Image1: TImage;
    Layout7: TLayout;
    lblTotalAnimais: TLabel;
    Label2: TLabel;
    Layout8: TLayout;
    Rectangle4: TRectangle;
    Layout9: TLayout;
    Image3: TImage;
    Layout16: TLayout;
    lblPesoMedio: TLabel;
    Label4: TLabel;
    WebBrowser2: TWebBrowser;
    Layout23: TLayout;
    Image6: TImage;
    TabItem1: TTabItem;
    recLocal: TRectangle;
    Layout17: TLayout;
    layNota: TLayout;
    lblLocal: TLabel;
    cbxLocal: TRoundRect;
    Image4: TImage;
    lblCurral: TLabel;
    Layout19: TLayout;
    Rectangle6: TRectangle;
    Layout20: TLayout;
    Image2: TImage;
    Layout21: TLayout;
    lblDiasMedio: TLabel;
    Label3: TLabel;
    layFiltroForn: TLayout;
    Layout22: TLayout;
    Label1: TLabel;
    Label5: TLabel;
    Layout24: TLayout;
    Rectangle2: TRectangle;
    edtFData: TDateEdit;
    layFiltroForn2: TLayout;
    Layout26: TLayout;
    Layout27: TLayout;
    Label6: TLabel;
    Label7: TLabel;
    Rectangle23: TRectangle;
    cbxTratoF: TComboBox;
    Rectangle7: TRectangle;
    edtLinhaF: TEdit;
    Rectangle5: TRectangle;
    edtRacao: TEdit;
    ClearEditButton1: TClearEditButton;
    Layout28: TLayout;
    btnBuscaFiltro: TRectangle;
    Layout32: TLayout;
    Label9: TLabel;
    Image5: TImage;
    WebBrowser3: TWebBrowser;
    Layout29: TLayout;
    Image7: TImage;
    procedure FormShow(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
    procedure cbxLocalClick(Sender: TObject);
    procedure btnBuscaFiltroMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnBuscaFiltroMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure FormResize(Sender: TObject);
    procedure edtRacaoClick(Sender: TObject);
    procedure btnBuscaFiltroClick(Sender: TObject);
  private
    { Private declarations }
  public
    vIdCurral,vIdRacao:string;
    vTabInex:integer;
    c          : TCustomCombo;
    procedure GeraCombo;
    procedure ItemLoteClick(Sender: TObject; const Point: TPointF);
    procedure ItemRacaoClick(Sender: TObject; const Point: TPointF);
    procedure GeraGrafico(IdLocal: string);
    procedure GeraComboRacao;
  end;

var
  frmDashBoard: TfrmDashBoard;

implementation

{$R *.fmx}

uses UDMDashBoard, UDmDB;

procedure TfrmDashBoard.btnBuscaFiltroClick(Sender: TObject);
var
 vData,
 vLinha,
 vTrato :string;
begin
 vData    := edtFData.Text;
 if edtLinhaF.Text.Length>0 then
  vLinha   := edtLinhaF.Text.QuotedString
 else
  vLinha   := '';
 if cbxTratoF.ItemIndex>0 then
  vTrato   := cbxTratoF.Selected.Text
 else
  vTrato   := '';
 dmDash.AbrePrevistoRealizado(
  vData,
  vIdRacao,
  vLinha,
  vTrato);

  if not dmDash.FornePrevisto.IsEmpty then
  begin
    WebCharts1
   .NewProject
   .Jumpline
   .Rows
   .&End
   .Rows
    .Title
      .Configuracoes
        .H4('&nbsp&nbsp&nbsp Fornecimento Prev x Real')
      .&End
    .&End
    .&End
    .Rows
    .&End
      .Rows
        .Tag
          .Add(
            WebCharts1
            .ContinuosProject
              .Charts
                ._ChartType(bar)
                  .Attributes
                    .Name('FornprevXReal')
                    .ColSpan(12)
                    .Options
                      .Legend
                        .display(true)
                        .position('bottom')
                        .Labels
                          .fontColorHEX('#17202A')
                        .&End
                      .&End
                    .&End
                     .Labelling
                       .Format('0.0[00]')
                       .RGBColor('0,168,243,255')
                       .FontSize(12)
                       .FontStyle('bold')
                       .FontFamily('Arial')
                     .&End
                    .DataSet
                      .BackgroundColor('51,51,0')
                      .DataSet(dmDash.FornePrevisto)
                      .textLabel('PREVISTO')
                    .&End
                    .DataSet
                      .BackgroundColor('80,140,70')
                      .DataSet(dmDash.ForneRealizado)
                      .textLabel('REALIZADO')
                    .&End
                  .&End
                .&End
              .&End
              .HTML
          )
     .&End
     .&End
//     .Rows
//    .Title
//      .Configuracoes
//        .H4('&nbsp&nbsp&nbsp Fabricação Previsto x Fabricado')
//      .&End
//    .&End
//    .&End
//    .Rows
//    .&End
//      .Rows
//        .Tag
//          .Add(
//            WebCharts1
//            .ContinuosProject
//              .Charts
//                ._ChartType(bar)
//                  .Attributes
//                    .Name('FabricadoXForn')
//                    .ColSpan(12)
//                    .Options
//                      .Legend
//                        .display(true)
//                        .position('bottom')
//                        .Labels
//                          .fontColorHEX('#17202A')
//                        .&End
//                      .&End
//                    .&End
//                     .Labelling
//                       .Format('0.0[00]')
//                       .RGBColor('0,168,243,255')
//                       .FontSize(12)
//                       .FontStyle('bold')
//                       .FontFamily('Arial')
//                     .&End
//                    .DataSet
//                      .BackgroundColor('51,51,0')
//                      .DataSet(dmDash.ForneRealizadoGeral)
//                      .textLabel('PREVISTO')
//                    .&End
//                    .DataSet
//                      .BackgroundColor('80,140,70')
//                      .DataSet(dmDash.FabricadoXForne)
//                      .textLabel('FABRICADO')
//                    .&End
//                  .&End
//                .&End
//              .&End
//              .HTML
//          )
//     .&End
//     .&End
     .WebBrowser(WebBrowser3)
     .Generated;
     WebBrowser3.Visible := true;
  end
  else
  begin
    ShowMessage('Sem dados para esse filtro!');
    WebBrowser3.Visible := false;
  end;
end;

procedure TfrmDashBoard.btnBuscaFiltroMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;

procedure TfrmDashBoard.btnBuscaFiltroMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  TRectangle(sender).Opacity := 1;
end;

procedure TfrmDashBoard.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmDashBoard.cbxLocalClick(Sender: TObject);
begin
  WebBrowser2.Visible := false;
  c.ShowMenu;
end;

procedure TfrmDashBoard.edtRacaoClick(Sender: TObject);
begin
 GeraComboRacao;
 c.ShowMenu;
 WebBrowser3.Visible := false;
end;

procedure TfrmDashBoard.ItemRacaoClick(Sender: TObject; const Point: TPointF);
begin
 c.HideMenu;
 edtRacao.Text     := c.NomeItem;
 vIdRacao          := c.CodItem;
 WebBrowser3.Visible := true;
end;

procedure TfrmDashBoard.GeraComboRacao;
begin
  c := TCustomCombo.Create(frmDashBoard);
  c.TitleMenuText := 'Escolha uma Racao';
  c.SubTitleMenuText := '';
  c.BackgroundColor := $FFF2F2F8;
  c.OnClick := ItemRacaoClick;
  dmDB.RACAO.Close;
  dmDB.RACAO.Open;
  dmDB.RACAO.First;
  while not dmDB.RACAO.Eof do
  begin
    c.AddItem(
     dmDB.RACAOID.AsString,
     dmDB.RACAOMATERIASECA.AsString,
     dmDB.RACAONOME.AsString
    );
    dmDB.RACAO.Next;
  end;
end;

procedure TfrmDashBoard.FormResize(Sender: TObject);
var
  ScreenService: IFMXScreenService;
begin
 if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then
  begin
    if ScreenService.GetScreenOrientation in [TScreenOrientation.soPortrait, TScreenOrientation.soInvertedPortrait] then
    begin
     recDados.Visible       := true;
     recLocal.Visible       := true;
     layFiltroForn.Visible  := true;
     layFiltroForn2.Visible := true;
    end
    else
     begin
      recDados.Visible      := false;
      recLocal.Visible      := false;
      layFiltroForn.Visible := false;
     layFiltroForn2.Visible := false;
     End;
  end;
end;

procedure TfrmDashBoard.FormShow(Sender: TObject);
begin
 vIdRacao                := '';
 tbPrincipal.TabPosition := TTabPosition.None;
 tbPrincipal.TabIndex    := vTabInex;
 if vTabInex=1 then
  GeraCombo;
 if vTabInex=2 then
  GeraComboRacao;
 if vTabInex=0 then
 begin
   dmDash.GeraResumo;
  if dmDash.AnimalCategoria.RecordCount>0 then
  begin
   WebCharts1
  //.BackgroundColor('#000000')
   .NewProject
     .Jumpline
     .Rows
   .&End
  // .Rows
  //.Title
  //  .Configuracoes
  //    .H4('&nbsp&nbsp&nbsp Pasto x Confinamento')
  //  .&End
  //.&End
  //.&End
  //.Rows
  //.&End
  //  .Rows
  //    .Tag
  //      .Add(
  //        WebCharts1
  //        .ContinuosProject
  //          .Charts
  //            ._ChartType(bar)
  //              .Attributes
  //                .Name('pastoxconf')
  //                .ColSpan(12)
  //                .Options
  //                  .Legend
  //                    .display(false)
  //                  .&End
  //                .&End
  //                 .Labelling
  //                   .Format('0.0[00]')
  //                   .RGBColor('0,168,243,255')
  //                   .FontSize(12)
  //                   .FontStyle('bold')
  //                   .FontFamily('Arial')
  //                 .&End
  //                .DataSet
  //                  .BackgroundColor('42,140,70')
  //                  .DataSet(dmDash.qtdCabLocal)
  //               .&End
  ////               .DataSet
  ////                  .Types('line')
  ////                  .Fill(False)
  ////                  .BorderWidth(2)
  ////                  .BorderColor('30,182,203')
  ////                  .BackgroundColor('42,130,70')
  ////                  .DataSet(dmDash.PesoMedConfPasto)
  ////               .&End
  //              .&End
  //            .&End
  //          .&End
  //          .HTML
  //      )
  // .&End
  // .&End
  .Rows
  .Title
    .Configuracoes
      .H4('&nbsp&nbsp&nbsp Animais Por Categoria')
    .&End
  .&End
  .&End
  .Rows
  .&End
    .Rows
      .Tag
        .Add(
          WebCharts1
          .ContinuosProject
            .Charts
              ._ChartType(bar)
                .Attributes
                  .Name('animalcategoria')
                  .ColSpan(12)
                  .Options
                    .Legend
                      .display(false)
                    .&End
                  .&End
                   .Labelling
                     .Format('0.0[00]')
                     .RGBColor('0,168,243,255')
                     .FontSize(12)
                     .FontStyle('bold')
                     .FontFamily('Arial')
                   .&End
                  .DataSet
                    .BackgroundColor('42,140,70')
                    .DataSet(dmDash.AnimalCategoria)
                 .&End
                .&End
              .&End
            .&End
            .HTML
        )
   .&End
   .&End
   .Rows
  .Title
    .Configuracoes
      .H4('&nbsp&nbsp&nbsp Animais Por Raça')
    .&End
  .&End
  .&End
  .Rows
  .&End
    .Rows
      .Tag
        .Add(
          WebCharts1
          .ContinuosProject
            .Charts
              ._ChartType(bar)
                .Attributes
                  .Name('animalraca')
                  .ColSpan(12)
                  .Options
                    .Legend
                      .display(false)
                    .&End
                  .&End
                   .Labelling
                     .Format('0.0[00]')
                     .RGBColor('0,168,243,255')
                     .FontSize(12)
                     .FontStyle('bold')
                     .FontFamily('Arial')
                   .&End
                  .DataSet
                    .BackgroundColor('42,140,70')
                    .DataSet(dmDash.AnimalRaca)
                 .&End
                .&End
              .&End
            .&End
            .HTML
        )
   .&End
   .&End
   .Rows
  .Title
    .Configuracoes
      .H4('&nbsp&nbsp&nbsp Animais Por Rebanho')
    .&End
  .&End
  .&End
  .Rows
  .&End
    .Rows
      .Tag
        .Add(
          WebCharts1
          .ContinuosProject
            .Charts
              ._ChartType(bar)
                .Attributes
                  .Name('animalRebanho')
                  .ColSpan(12)
                  .Options
                    .Legend
                      .display(false)
                    .&End
                  .&End
                   .Labelling
                     .Format('0.0[00]')
                     .RGBColor('0,168,243,255')
                     .FontSize(12)
                     .FontStyle('bold')
                     .FontFamily('Arial')
                   .&End
                  .DataSet
                    .BackgroundColor('42,140,70')
                    .DataSet(dmDash.AnimalRebanho)
                 .&End
                .&End
              .&End
            .&End
            .HTML
        )
   .&End
   .&End
   .WebBrowser(WebBrowser1)
   .Generated;
   WebBrowser1.Visible := true;
 end;
 end;
end;

procedure TfrmDashBoard.GeraGrafico(IdLocal: string);
var
 vWi:integer;
begin
 vWi := trunc(WebBrowser1.Height-20);
 dmDash.AbreHistConsumo(IdLocal);
 if not dmDash.HIST_CONSUMO_MN.IsEmpty then
 begin
   WebCharts1
   .NewProject
   .Jumpline
   .Rows
   .&End
   .Rows
    .Title
      .Configuracoes
        .H4('&nbsp&nbsp&nbsp Consumo Confinamento')
      .&End
    .&End
    .&End
    .Rows
    .&End
      .Rows
        .Tag
          .Add(
            WebCharts1
            .ContinuosProject
              .Charts
                ._ChartType(bar)
                  .Attributes
                    .Name('consumo')
                    .ColSpan(12)
                    .Options
                      .Legend
                        .display(true)
                        .position('bottom')
                        .Labels
                          .fontColorHEX('#17202A')
                        .&End
                      .&End
                    .&End
                     .Labelling
                       .Format('0.0[00]')
                       .RGBColor('0,168,243,255')
                       .FontSize(12)
                       .FontStyle('bold')
                       .FontFamily('Arial')
                     .&End
                    .DataSet
                      .Types('line')
                      .BackgroundColor('51,51,0')
                      .BorderColor('51,51,0')
                      .DataSet(dmDash.HIST_CONSUMO_IMSPV)
                      .textLabel('IMS PV')
                    .&End
                    .DataSet
                      .Types('line')
                      .BackgroundColor('255,255,0')
                      .BorderColor('255,255,0')
                      .DataSet(dmDash.HIST_CONSUMO_MS)
                      .textLabel('MS')
                    .&End
                    .DataSet
                      .BackgroundColor('80,140,70')
                      .DataSet(dmDash.HIST_CONSUMO_MN)
                      .textLabel('MN')
                    .&End
                  .&End
                .&End
              .&End
              .HTML
          )
     .&End
     .&End
     .WebBrowser(WebBrowser2)
     .Generated;
     WebBrowser2.Visible := true;
   end;
end;


procedure TfrmDashBoard.GeraCombo;
begin
  WebBrowser2.Visible := false;
  c := TCustomCombo.Create(frmDashBoard);
  c.TitleMenuText := 'Escolha uma Local';
  c.SubTitleMenuText := '';
  c.BackgroundColor := $FFF2F2F8;
  c.OnClick := ItemLoteClick;
  dmDash.AbreCurraisCombo;
  dmDash.CurraisCombo.First;
  while not dmDash.CurraisCombo.Eof do
  begin
    c.AddItem4(
     dmDash.CurraisCombo.FieldByName('ID_CURRAL').AsString,//cod
     dmDash.CurraisCombo.FieldByName('QTD_CAB').AsString,//descricao
     intToStr(dmDash.CurraisCombo.FieldByName('DIAS').AsInteger),//descricao2
     dmDash.CurraisCombo.FieldByName('CODIGO').AsString,//nome
     dmDash.CurraisCombo.FieldByName('MEDIA_PESO').Asfloat//descricao 1
    );
    dmDash.CurraisCombo.Next;
  end;
end;

procedure TfrmDashBoard.ItemLoteClick(Sender: TObject; const Point: TPointF);
begin
 c.HideMenu;
 lblCurral.Text        := c.NomeItem;
 vIdCurral             := c.CodItem;
 lblTotalAnimais.Text  := c.DescricaoItem;
 lblDiasMedio.Text     := c.DescricaoItem2;
 lblPesoMedio.Text     := Formatfloat('0.00',c.DescricaoItem1);
 WebBrowser2.Visible   := false;
 GeraGrafico(vIdCurral);
end;

end.
