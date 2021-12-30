program PecMobile;

uses
  System.StartUpCopy,
  FMX.Forms,
  UPrincipal in '..\UPrincipal\UPrincipal.pas' {frmPrincipal},
  UFLogin in '..\UPrincipal\Frames\UFLogin.pas' {frmeLogin: TFrame},
  UFConfig in '..\UPrincipal\Frames\UFConfig.pas' {frameConfig: TFrame},
  UDmDB in '..\dmDB\UDmDB.pas' {dmdb: TDataModule},
  UdmSync in '..\dmDB\UdmSync.pas' {dmSync: TDataModule},
  UFSync in '..\UPrincipal\Frames\UFSync.pas' {FrameSync: TFrame},
  UCurrais in '..\Currais\UCurrais.pas' {frmListaCurrais},
  UFrameLista in '..\Currais\UFrameLista.pas' {FItemListaAbastecimento: TFrame},
  UAlimento in '..\Alimentos\UAlimento.pas' {frmListaAlimentos},
  UFrameListaAlimentos in '..\Alimentos\UFrameListaAlimentos.pas' {FItemListaAlimentos: TFrame},
  UListRaca in '..\RACA\UListRaca.pas' {frmListRaca},
  UFrameRaca in '..\RACA\UFrameRaca.pas' {FrameRaca: TFrame},
  UListCategoria in '..\Categoria\UListCategoria.pas' {frmListCategoria},
  UFrameCategoria in '..\Categoria\UFrameCategoria.pas' {FrameCategoria: TFrame},
  UListProdutores in '..\ListProdutores\UListProdutores.pas' {frmListProdutores},
  UFrameProdutores in '..\ListProdutores\UFrameProdutores.pas' {FrameProdutores: TFrame},
  UListRebanho in '..\ListRebanho\UListRebanho.pas' {frmListRebanho},
  UFrameRebanho in '..\ListRebanho\UFrameRebanho.pas' {FrameRebanho: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(Tdmdb, dmdb);
  Application.CreateForm(TdmSync, dmSync);
  Application.CreateForm(TfrmListaCurrais, frmListaCurrais);
  Application.CreateForm(TfrmListaAlimentos, frmListaAlimentos);
  Application.CreateForm(TfrmListRaca, frmListRaca);
  Application.CreateForm(TfrmListCategoria, frmListCategoria);
  Application.CreateForm(TfrmListProdutores, frmListProdutores);
  Application.CreateForm(TfrmListRebanho, frmListRebanho);
  Application.Run;
end.
