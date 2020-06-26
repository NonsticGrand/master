unit Unit2;

{$mode objfpc}{$H+}






interface
type
calcul = record
x,y:real;
end;

calcul2= array[1..128] of calcul;


Procedure Calculate(var c:calcul2; n:integer);
procedure save_otv(var c:calcul2; var filename: string; var n:integer);
Procedure open(var fFilePath: string);

implementation
uses
  Classes, SysUtils;

Procedure Calculate(var c:calcul2; n:integer);
begin
  if c[n].x > 2 then
     c[n].y:=1/(c[n].x*c[n].x+4*c[n].x+5)
     else
     c[n].y:=c[n].x*c[n].x+4*c[n].x+5;
  c[n].y:=Trunc(c[n].y);
end;

procedure save_otv(var c:calcul2; var filename: string; var n:integer);
  var
    f1: text;
    s:string;
    i:integer;
 begin
 AssignFile(f1,filename);
 append(f1);
 for i:=1 to (n-1) do
 begin
 s:='Номер опыта= '+IntToStr(i)+' Входные данные= '+FloatToStr(c[i].x)+' Результат= '+FloatToStr(c[i].y);
 Write(f1,s);
 writeln(f1);
 end;
 writeln(f1);
 closefile(f1);
 end;



Procedure open(var fFilePath,s: string);
  var
    f1:text;
  begin
           AssignFile(f1,fFilePath);
           reset(f1);
           readln(f1,s);
           closeFile(f1);
    end;


end.
