unit classUsuario;

interface
uses system.SysUtils,
     system.Classes;

Type Tusuario = Class
      Private
      FIDusuario:string;
      Fcontrasena:string;
      Factivo:boolean;
      Frol:string;
      Public
      property IdUsuario:string  read  FIDusuario  Write FIDusuario;
      property Contrasena:String read FContrasena write Fcontrasena;
      property Activo:boolean read Factivo write Factivo;
      property Rol:string read Frol write Frol;
      Constructor Create;
      Destructor Destroy;Override;
      Procedure Free;
End;

implementation

Procedure Tusuario.Free;
Begin
  if self<>nil then Destroy;
End;

Destructor Tusuario.Destroy;
Begin
  inherited Destroy;
End;
Constructor Tusuario.Create;
Begin
  Idusuario:='';
  Contrasena:='';
  Activo:=true;
  Rol:='roUsuario';
End;
end.
