unit FormLogin;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Mask,
  logica_login,
  Formapp,
  Vcl.Imaging.jpeg;

type
  TForm_Login = class(TForm)
    Login_Contrasena: TLabeledEdit;
    Login_Usuario: TLabeledEdit;
    login_imagen: TImage;
    btn_Login: TButton;
    atribucion_imagen: TLabel;
    procedure btn_LoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_Login: TForm_Login;

implementation
{$R *.dfm}

procedure TForm_Login.btn_LoginClick(Sender: TObject);
var App:TformAplicacion;
begin
 if Login(login_usuario.Text,login_contrasena.Text) = true
      then
          begin
            App := TFormAplicacion.create(application);
            App.Caption:=  App.Caption + login_usuario.Text;
            App.showmodal();

          end;
end;

end.
