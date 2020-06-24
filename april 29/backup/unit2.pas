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
Procedure save(var ffilename:string);
Procedure open();
Procedure save_as_s(var ffilename:string);

implementation
uses
  Classes, SysUtils, Unit1;

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
 closefile(f1);
 end;


Procedure save(var ffilename:string);
begin
  if not Pz1.fOpenDialog.Execute then exit;
  if Pz1.fOpenDialog.Execute then
 fFilename:=Pz1.fOpenDialog.FileName;
end;


Procedure open();
  var s:string;
    f1:text;
  begin
   if not Pz1.fOpenDialog.Execute then exit;
   if Pz1.fOpenDialog.Execute then
       begin
           fFilePath:=Pz1.fOpenDialog.FileName;
           AssignFile(f1,fFilePath);
           reset(f1);
           readln(f1,s);
           Pz1.Edit1.Text:=s;
           closeFile(f1);
    end;
  end;


Procedure save_as_s(var ffilename:string);
  var s:string;
   begin
     if not Pz1.fSaveDialog.Execute then exit;
     ffilename:=Pz1.fOpenDialog.FileName;
     if ffilename='' then Pz1.fsavedialog.FileName:='Новый документ.txt'
     else Pz1.fsavedialog.FileName:=fFilePath;
        if Pz1.fSaveDialog.Execute then
          begin
            if extractfileext(Pz1.fSaveDialog.FileName)='' then
               ffilename:=Pz1.fSaveDialog.FileName+'.txt'
           else ffilename:=Pz1.fSaveDialog.FileName;
            end;
          end;
end.
