unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Unit4;

type

  { TPz59 }

  TPz59 = class(TForm)                      //Класс формы
    MainMenu1: TMainMenu;                   //Ниже идут поля этого класса
    MenuItem1: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    fOpenDialog: TOpenDialog;
    MenuItem7: TMenuItem;
    Rezults: TMemo;
    Run: TButton;
    Coor_X: TEdit;
    Coor_Y: TEdit;
    Coordinate_X: TLabel;
    Coordinate_Y: TLabel;
    fSaveDialog: TSaveDialog;                           //Поля класса заканчиваются
    procedure MenuItem3Click(Sender: TObject);          //Объявление методов данного класса
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure RunClick(Sender: TObject);                //Объявление методов заканчивается
  private

  public

  end;

var
  Pz59: TPz59;
  fFilePath:string = '';

implementation                                            //Ниже находятся объявления методов класса
                                                          //В имени метода указывается имя класса
{$R *.lfm}

{ TPz59 }

procedure TPz59.RunClick(Sender: TObject);
var  x,y:real;
     s:string;
begin
x:=StrToFloat(Pz59.Coor_X.text);
y:=StrToFloat(Pz59.Coor_Y.Text);
calculation(x,y,s);
Rezults.Append(s);
end;


procedure TPz59.MenuItem3Click(Sender: TObject);
var  s,s1:string;
begin
  if not Pz59.fOpenDialog.Execute then exit;
  if Pz59.fOpenDialog.Execute then
  begin
  fFilePath:=fOpenDialog.FileName;
  open(fFilePath,s,s1);
  Coor_X.Text:=s;
  Coor_Y.Text:=s1;
  end;
end;

procedure TPz59.MenuItem4Click(Sender: TObject);
begin
  ShowMessage('Давыдов Никита'+#13#10+#13#10+'Задача №59(б)'+#13#10+'Даны действительные числа x, y. Определить, принадлежит ли точка с координатами x, y '+#13#10+'заштрихованной части плоскости в промежутке между окружностями'+#13#10+'радиусом 0.5 и 1'+#13#10+#13#10+'http://bgu-chita.ru/zadachnik/Glava02/index02.htm#z59');
end;

procedure TPz59.MenuItem5Click(Sender: TObject);
begin
  if not Pz59.fOpenDialog.Execute then exit;
  if fFilePath='' then Pz59.MenuItem7.Click
  else Pz59.Rezults.Lines.SaveToFile(fFilePath);
end;

procedure TPz59.MenuItem6Click(Sender: TObject);
begin
  Close;
end;

procedure TPz59.MenuItem7Click(Sender: TObject);
begin
  if not Pz59.fOpenDialog.Execute then exit;
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

end.


