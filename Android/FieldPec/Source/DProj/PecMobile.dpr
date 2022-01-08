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
  UFrameRebanho in '..\ListRebanho\UFrameRebanho.pas' {FrameRebanho: TFrame},
  UFrameAnimal in '..\ListAnimal\UFrameAnimal.pas' {FrameAnimal: TFrame},
  UListAnimal in '..\ListAnimal\UListAnimal.pas' {frmListAnimal},
  UListBebedouro in '..\ListBebedouro\UListBebedouro.pas' {frmListBebedouro},
  UFrameBebedouro in '..\ListBebedouro\UFrameBebedouro.pas' {FrameBebedouro: TFrame},
  UListCocho in '..\ListCocho\UListCocho.pas' {frmListCocho},
  UFrameCocho in '..\ListCocho\UFrameCocho.pas' {FrameCocho: TFrame},
  ULimpaBebedouro in '..\LimpaBebedouro\ULimpaBebedouro.pas' {FrmLimpaBebedouro},
  UFrameLimpaBebedouro in '..\LimpaBebedouro\UFrameLimpaBebedouro.pas' {FrameLimpaBebedouro: TFrame},
  UnitCamera in '..\Leitor\UnitCamera.pas' {FrmCamera},
  UdmSyncUp in '..\dmDB\UdmSyncUp.pas' {dmSyncUp: TDataModule},
  UMovAnimal in '..\MovimentacaoAnimal\UMovAnimal.pas' {frmMovAnimal},
  UFrameMovAnimal in '..\MovimentacaoAnimal\UFrameMovAnimal.pas' {FrameMovAnimal: TFrame},
  UListMotivoMov in '..\ListMotivoMovimentacao\UListMotivoMov.pas' {frmListaMotivoMov},
  UFrameMotivoMov in '..\ListMotivoMovimentacao\UFrameMotivoMov.pas' {FrameMotivoMov: TFrame};

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
  Application.CreateForm(TfrmListAnimal, frmListAnimal);
  Application.CreateForm(TfrmListBebedouro, frmListBebedouro);
  Application.CreateForm(TfrmListCocho, frmListCocho);
  Application.CreateForm(TFrmLimpaBebedouro, FrmLimpaBebedouro);
  Application.CreateForm(TFrmCamera, FrmCamera);
  Application.CreateForm(TdmSyncUp, dmSyncUp);
  Application.CreateForm(TfrmMovAnimal, frmMovAnimal);
  Application.CreateForm(TfrmListaMotivoMov, frmListaMotivoMov);
  Application.Run;
end.
