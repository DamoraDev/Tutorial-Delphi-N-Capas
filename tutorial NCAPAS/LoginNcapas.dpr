program LoginNcapas;

uses
  Vcl.Forms,
  FormLogin in 'Forms\FormLogin.pas' {Form_Login},
  classUsuario in 'clases\classUsuario.pas',
  logica_login in 'logica\logica_login.pas',
  FormApp in 'Forms\FormApp.pas' {FormAplicacion};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm_Login, Form_Login);
  Application.Run;
end.
