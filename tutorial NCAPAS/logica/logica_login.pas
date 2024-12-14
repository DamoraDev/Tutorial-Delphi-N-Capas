unit logica_login;

interface
Uses system.SysUtils,
     vcl.Dialogs,
     data.Win.ADODB;
     Function Login(IdUsuario:string;Contrasena:string):boolean;
Const CadenaConexion=
     'Provider=Microsoft.Jet.OLEDB.4.0;'
     +'Data Source=dbejemplo.mdb;';
implementation
uses classUsuario;

// esta version 1.0 no tiene encriptacion de contrase�a y unicamente trabaja con MSAccess
Function Login(IdUsuario:string;Contrasena:string):boolean;
Var cSQL:TADOQuery;
    con:TADOConnection;
    x:integer;
var Usuario:Tusuario;
    Begin
    result:=false;
    x:=0;
      try
      Usuario:=Tusuario.Create;
      usuario.IdUsuario:=Idusuario;
      Usuario.Contrasena:=Contrasena;
      usuario.Activo:=false;
      usuario.Rol:='roUsuario';
      except
        on e:exception do showmessage('Error :: '+e.Message);
      end;
      // el usuario es el que efectua el login
      try
        con:=TADOconnection.Create(nil);
        con.Connected:=false;
        con.ConnectionString:=CadenaConexion;
        cSQL:=TADOQuery.Create(nil);
        cSQL.Close;
        cSQL.Connection:=con;
        cSQL.SQL.Clear;
        cSQL.SQL.Text:='SELECT IdUsuario,Contrasena,Activo,Rol FROM Usuarios '+
        'WHERE IdUsuario ='+QuotedStr(usuario.IdUsuario)
        +'AND Contrasena='+QuotedStr(usuario.Contrasena)+
        'AND Activo=true';
        con.Connected:=true;
        cSQL.Open;
        if cSQL.Eof then ShowMessage('Usuario Y/O contrase�a incorrectos')
           else
              Begin
                ShowMessage('Bienvenido '+Usuario.IdUsuario);
                usuario.Rol:=cSQL.FieldByName('Rol').AsString;
                usuario.Activo:=cSQL.FieldByName('Activo').AsBoolean;
                result:=true;
              End;
      finally
        cSQL.Free;
        con.Free;
        usuario.Free;
      end;

    End;
end.
