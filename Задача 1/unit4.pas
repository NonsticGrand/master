unit Unit4;

{$mode objfpc}{$H+}

interface
 procedure calculation;
 procedure open(var fFilePath:string);
 procedure save_as(var fFilePath:string);
 procedure save(var fFilePath:string);

 implementation
uses
  Classes, SysUtils, Unit1;


 procedure calculation;
var
  x, y, r: real;

begin
  x:=StrToFloat(Pz59.Coor_X.text);
  y:=StrToFloat(Pz59.Coor_Y.Text);
  r := sqrt(x * x + y * y);
  if r <= 1 then
  begin
    if r >= 0.5 then
      Pz59.Rezults.Append('При х='+FloatToStr(x)+'и y='+FloatToStr(y)+' Точка принадлежит выделенному промежутку')
    else
      Pz59.Rezults.Append('При х='+FloatToStr(x)+'и y='+FloatToStr(y)+' Точка не принадлежит выделенному промежутку');
  end
  else
    Pz59.Rezults.Append('При х='+FloatToStr(x)+'и y='+FloatToStr(y)+' Точка не принадлежит выделенному промежутку');
end;


  procedure open(var fFilePath:string);
   var s,s1:string;
f1:text;
begin
if not Pz59.fOpenDialog.Execute then exit;
if Pz59.fOpenDialog.Execute then
begin
fFilePath:=Pz59.fOpenDialog.FileName;
AssignFile(f1,fFilePath);
reset(f1);
readln(f1,s);
readln(f1,s1);
Pz59.Coor_X.Text:=s;
Pz59.Coor_Y.Text:=s1;
closeFile(f1);
end;
end;


  procedure save_as(var fFilePath:string);
  begin
  if not Pz59.fOpenDialog.Execute then exit;
  if fFilePath='' then Pz59.fsavedialog.FileName:='Новый документ.txt'
else Pz59.fsavedialog.FileName:=fFilePath;

if Pz59.fSaveDialog.Execute then
begin

if extractfileext(Pz59.fSaveDialog.FileName)='' then
fFilePath:=Pz59.fSaveDialog.FileName+'.txt'
else fFilePath:=Pz59.fSaveDialog.FileName;

Pz59.Rezults.Lines.SaveToFile(fFilePath);
end;
end;


   procedure save(var fFilePath:string);
   begin
 if not Pz59.fOpenDialog.Execute then exit;
 if fFilePath='' then Pz59.MenuItem7.Click
 else Pz59.Rezults.Lines.SaveToFile(fFilePath);
 end;

end.


