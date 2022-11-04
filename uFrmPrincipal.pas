unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.PG, FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Vcl.DBCtrls,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, jpeg, Vcl.StdCtrls, Vcl.ExtCtrls, uDM, Vcl.Imaging.pngimage;

type
  TfrmPrincipal = class(TForm)
    btnCarregarImagem: TButton;
    imgTeste: TImage;
    pnlFundo: TPanel;
    pnlBotoes: TPanel;
    edtBusca: TEdit;
    procedure btnCarregarImagemClick(Sender: TObject);
    function HexStringToBin(HexStr: AnsiString): TMemoryStream;
    function BuscaImagem(tituloImagem: string): AnsiString;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}



procedure TfrmPrincipal.btnCarregarImagemClick(Sender: TObject);
var
  Stream: TMemoryStream;
  png: TPngImage;
begin
  if Trim(edtBusca.Text) = '' then
    raise Exception.Create('Preencha o campo de busca!');
  png := TPngImage.Create;
  Stream := HexStringToBin(BuscaImagem('teste'));
  try
    Stream.position := 0;
    png.LoadFromStream(Stream);
    imgTeste.Picture.Graphic := png;
    imgTeste.Proportional := True;
    imgTeste.Center := True;
  finally
    png.Destroy;
    Stream.free;
  end;
end;

function TfrmPrincipal.BuscaImagem(tituloImagem: string): AnsiString;
var
  qryImagem: TFDQuery;
begin
  Result := '';
  qryImagem := TFDQuery.Create(nil);
  try
    qryImagem.Connection := DM.Connection;
    qryImagem.Sql.Add(' SELECT TITULO, IMAGEM FROM IMAGENS ');
    qryImagem.Sql.Add(' WHERE TITULO  = :pTitulo ');
    qryImagem.ParamByName('pTitulo').Value := edtBusca.Text;
    qryImagem.Open;
    qryImagem.First;
    if not(qryImagem.RecordCount > 0) then
      raise Exception.Create('Imagem não encontrada!');
    Result := qryImagem.FieldByName('IMAGEM').AsAnsiString;
  finally
    FreeAndNil(qryImagem);
  end;
end;

function TfrmPrincipal.HexStringToBin(HexStr: AnsiString): TMemoryStream;
begin
  Result := TMemoryStream.Create;
  Result.Size := Length(HexStr) div 2;
  if Result.Size > 0 then
    HexToBin(PAnsiChar(HexStr), Result.Memory, Result.Size);
end;

end.
