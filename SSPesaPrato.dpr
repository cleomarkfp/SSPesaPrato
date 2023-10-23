program SSPesaPrato;

uses
  Forms, Windows,
  DmdDatabase in '..\ssfacil\DmdDatabase.pas' {DmDatabase: TDataModule},
  UEscolhe_Filial in '..\ssfacil\UEscolhe_Filial.pas' {frmEscolhe_Filial},
  rsDBUtils in '..\rslib\nova\rsDBUtils.pas',
  LogProvider in '..\logs\src\LogProvider.pas',
  LogTypes in '..\logs\src\LogTypes.pas',
  Classe.CalcularRateio in '..\SSNFCe\Classes\Classe.CalcularRateio.pas',
  uImpFiscal_Elgin in '..\SSNFCe\uImpFiscal_Elgin.pas',
  TelaAutenticaUsuario in '..\SSNFCe\TelaAutenticaUsuario.pas' {FormTelaAutenticaUsuario},
  UPesarPrato in 'UPesarPrato.pas' {frmPesarPrato},
  uComandaR in '..\SSNFCe\uComandaR.pas' {fComandaR},
  uDmCupomFiscal in '..\SSNFCe\uDmCupomFiscal.pas' {dmCupomFiscal: TDataModule},
  uImpFiscal_Bematech in '..\SSNFCe\uImpFiscal_Bematech.pas',
  uImpFiscal_Daruma in '..\SSNFCe\uImpFiscal_Daruma.pas',
  uUtilDaruma in '..\SSNFCe\uUtilDaruma.pas',
  uUtilPadrao in '..\SSNFCe\uUtilPadrao.pas',
  uUtilBematech in '..\SSNFCe\uUtilBematech.pas',
  uCupomFiscalParcela in '..\SSNFCe\uCupomFiscalParcela.pas' {fCupomFiscalParcela},
  uCalculo_CupomFiscal in '..\SSNFCe\uCalculo_CupomFiscal.pas',
  uDmParametros in '..\SSNFCe\uDmParametros.pas' {dmParametros: TDataModule};

var
  Handle: THandle;

{$R *.res}

begin

  Handle := CreateMutex(nil,True,'frmPesarPrato');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    Application.MessageBox('Este programa já está aberto!','Atenção!', mb_Ok);
    if not IsWindowVisible(Handle) then
    begin
      ShowWindow(Handle, SW_RESTORE);
      SetForegroundWindow(Handle);
    end;
    if Handle <> 0 then
      CloseHandle(Handle);
    Exit;
  end;


  Application.Initialize;
  Application.CreateForm(TDmDatabase, DmDatabase);
  Application.CreateForm(TdmParametros, dmParametros);
  Application.CreateForm(TfrmPesarPrato, frmPesarPrato);
  Application.Run;
end.
