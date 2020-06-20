unit Unit2;

{$mode objfpc}{$H+}

interface
Procedure Calculate(var a,f:real);
procedure save_otv(var a,f:real; var filename: string);

implementation
uses
  Classes, SysUtils, Unit1;

Procedure Calculate(var a,f:real);
begin
  if a > 2 then
     f:=1/(a*a+4*a+5)
     else
     f:=a*a+4*a+5;
  f:=Trunc(f);
end;

procedure save_otv(var a,f:real; var filename: string);
  var
    fl: text;
    s:string;
  begin
       assign(fl, filename);
       rewrite(fl);
       s:='Введённые данные: '+a+  'Ответ: ' + f;
       writeln(fl,s);
       close(fl);
  end;
end.
