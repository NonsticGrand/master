unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus;

type

  { TPz59 }

  TPz59 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    FSaveAs: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem6: TMenuItem;
    fOpenDialog: TOpenDialog;
    Rezults: TMemo;
    Run: TButton;
    Coor_X: TEdit;
    Coor_Y: TEdit;
    Coordinate_X: TLabel;
    Coordinate_Y: TLabel;
    fSaveDialog: TSaveDialog;
    procedure FSaveAsClick(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure RunClick(Sender: TObject);
  private

  public

  end;

var
  Pz59: TPz59;
  fFilePath:string = '';

implementation

{$R *.lfm}

{ TPz59 }

procedure TPz59.RunClick(Sender: TObject);
var
  x, y, r: real;

begin
  x:=StrToFloat(Coor_X.text);
  y:=StrToFloat(Coor_Y.Text);
  r := sqrt(x * x + y * y);
  if r <= 1 then
  begin
    if r >= 0.5 then
      Rezults.Append('При х='+FloatToStr(x)+'и y='+FloatToStr(y)+' Точка принадлежит выделенному промежутку')
    else
      Rezults.Append('При х='+FloatToStr(x)+'и y='+FloatToStr(y)+' Точка не принадлежит выделенному промежутку');
  end
  else
    Rezults.Append('При х='+FloatToStr(x)+'и y='+FloatToStr(y)+' Точка не принадлежит выделенному промежутку');
end;

procedure TPz59.MenuItem1Click(Sender: TObject);
var s,s1:string;
f1:text;
begin
if fOpenDialog.Execute then
begin
fFilePath:=fOpenDialog.FileName;
AssignFile(f1,fFilePath);
reset(f1);
readln(f1,s);
readln(f1,s1);
Coor_X.Text:=s;
Coor_Y.Text:=s1;
closeFile(f1);
end;
end;

procedure TPz59.FSaveAsClick(Sender: TObject);
begin
  if fFilePath='' then fsavedialog.FileName:='Новый документ.txt'
else fsavedialog.FileName:=fFilePath;

if fSaveDialog.Execute then
begin

if extractfileext(fSaveDialog.FileName)='' then
fFilePath:=fSaveDialog.FileName+'.txt'
else fFilePath:=fSaveDialog.FileName;

Rezults.Lines.SaveToFile(fFilePath);
end;
end;

procedure TPz59.MenuItem2Click(Sender: TObject);
begin
 if fFilePath='' then FSaveAs.Click
else Rezults.Lines.SaveToFile(fFilePath);
end;

procedure TPz59.MenuItem4Click(Sender: TObject);
begin
  ShowMessage('Давыдов Никита'+#13#10+#13#10+'Задача №59(б)'+#13#10+'Даны действительные числа x, y. Определить, принадлежит ли точка с координатами x, y '+#13#10+'заштрихованной части плоскости в промежутке между окружностями'+#13#10+'радиусом 0.5 и 1'+#13#10+#13#10+'http://bgu-chita.ru/zadachnik/Glava02/index02.htm#z59');
end;

procedure TPz59.MenuItem6Click(Sender: TObject);
begin
  Close;
end;

end.

