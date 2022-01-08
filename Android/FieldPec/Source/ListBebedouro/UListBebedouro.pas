unit UListBebedouro;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.Controls.Presentation,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, UFrameBebedouro;

type
  TfrmListBebedouro = class(TForm)
    Rectangle1: TRectangle;
    layPrincipal: TLayout;
    RecLista: TRectangle;
    layListCards: TLayout;
    Layout9: TLayout;
    btnSelecionar: TRectangle;
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
    edtNomeF: TEdit;
    ClearEditButton2: TClearEditButton;
    SearchEditButton1: TSearchEditButton;
    Lsbrl: TLayout;
    lblLista: TLabel;
    btnCloseAll: TImage;
    Layout3: TLayout;
    lblTotalRegistro: TLabel;
    StyleBook1: TStyleBook;
    Layout10: TLayout;
    btnBuscar: TRectangle;
    Layout11: TLayout;
    Label3: TLabel;
    Image1: TImage;
    procedure btnSelecionarMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnSelecionarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure SearchEditButton1Click(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnCloseAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    oDataSet   : TFDQuery;
    FFrame     : TFrameBebedouro;
    vNomeBebedouro,vIdBebedouro,vUltimaLimpeza : string;
    procedure FrameMouseDown(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure FrameMouseUp(Sender: TObject; Button: TMouseButton;
     Shift: TShiftState; X, Y: Single);
    procedure GeraListaCards(vFiltro:string);
    procedure DestroiFrames;
    procedure ItemClick(Sender: TObject);

end;

var
  frmListBebedouro: TfrmListBebedouro;

implementation

{$R *.fmx}

uses UDmDB;

procedure TfrmListBebedouro.FrameMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 0.5;
end;

procedure TfrmListBebedouro.FrameMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  TFrame(sender).Opacity := 1;
end;

procedure TfrmListBebedouro.GeraListaCards(vFiltro: string);
var
  item: TListBoxItem;
begin
   if ListaCards=nil then
    FreeAndNil(ListaCards);
   DestroiFrames;
   ListaCards        := TListBox.Create(self);
   ListaCards.Parent := layListCards;
   ListaCards.Align  := TAlignLayout.Client;

   dmDB.AbreBebedouro(dmdb.vIdPropriedade,vFiltro);
   dmDB.BEBEDOURO.First;
     while not dmDB.BEBEDOURO.eof do
     begin
      ListaCards.BeginUpdate;
      item := TListBoxItem.Create(self);
      FFrame := TFrameBebedouro.Create(self);
      FFrame.Name:= 'Item_'+dmDB.BEBEDOUROID.AsString;

      FFrame.Parent          := item;
      FFrame.Align           := TAlignLayout.Client;
      FFrame.HitTest         := false;
      FFrame.Opacity         := 1;

      item.HitTest           := true;
      item.Height            := 160;
      item.Margins.Left      := 10;
      item.Margins.Right     := 10;
      item.Margins.Top       := 10;
      item.Margins.Bottom    := 10;
      item.OnClick           := ItemClick;
      item.OnMouseDown       := FrameMouseDown;
      item.OnMouseUp         := FrameMouseUp;
      item.Tag               := dmDB.BEBEDOUROID.AsInteger;
      item.TagString         := dmDB.BEBEDOUROPasto.AsString;
      item.Hint              := dmDB.BEBEDOUROULTIMA_LIMPEZA.AsString;

      FFrame.lblBEBEDOURO.Text      := dmDB.BEBEDOUROPasto.AsString;
      FFrame.lblBEBEDOURO.TagString := dmDB.BEBEDOUROID.AsString;
      FFrame.lblUltimaLimpeza.Text  := dmDB.BEBEDOUROULTIMA_LIMPEZA.AsString;
      FFrame.lblFrequencia.Text     := dmDB.BEBEDOUROFREQ_LIMPEZA.AsString;

      item.Parent                      := ListaCards;

      ListaCards.EndUpdate;
      dmDB.BEBEDOURO.Next;
     end;
     lblTotalRegistro.Text := intToStr(ListaCards.Items.Count);
end;

procedure TfrmListBebedouro.ItemClick(Sender: TObject);
begin
 vIdBebedouro             := intToStr(TListBoxItem(sender).Tag);
 vNomeBebedouro           := TListBoxItem(sender).TagString;
 vUltimaLimpeza           := TListBoxItem(sender).Hint;
 TListBoxItem(sender).IsSelected := true;
end;

procedure TfrmListBebedouro.SearchEditButton1Click(Sender: TObject);
var
 vFiltro:string;
begin
 if edtNomeF.Text.Length>0 then
  vFiltro := vFiltro+' and pasto like '+QuotedStr('%'+edtNomeF.Text+'%');
 GeraListaCards(vFiltro);
end;

procedure TfrmListBebedouro.btnCloseAllClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListBebedouro.btnSelecionarClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmListBebedouro.btnSelecionarMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 1;
end;

procedure TfrmListBebedouro.btnSelecionarMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     TRectangle(sender).Opacity := 0.5;
end;


procedure TfrmListBebedouro.DestroiFrames;
var
  i : Integer;
begin
  for i := ComponentCount - 1 downto 0 do
  begin
   If (Components[i] is TFrame) then
     TFrame(Components[i]).Destroy;
  end;
end;

end.
