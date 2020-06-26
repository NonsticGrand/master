unit Unit4;

{$mode objfpc}{$H+}

interface
 procedure calculation(var x:real; y:real; var s:string);
 procedure open(var fFilePath,s,s1:string);


 implementation
uses
  Classes, SysUtils;


 procedure calculation(var x:real; y:real; var s:string);
begin
  r := sqrt(x * x + y * y);
  if r <= 1 then
  begin
    if r >= 0.5 then
      s:='При х='+FloatToStr(x)+'и y='+FloatToStr(y)+' Точка принадлежит выделенному промежутку'
    else
      s:='При х='+FloatToStr(x)+'и y='+FloatToStr(y)+' Точка не принадлежит выделенному промежутку';
  end
  else
    s:='При х='+FloatToStr(x)+'и y='+FloatToStr(y)+' Точка не принадлежит выделенному промежутку';
end;


  procedure open(var fFilePath,s,s1:string);
  var
f1:text;
begin
AssignFile(f1,fFilePath);
reset(f1);
readln(f1,s);
readln(f1,s1);
closeFile(f1);
end;


end.


