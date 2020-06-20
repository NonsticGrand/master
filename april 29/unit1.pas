unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus, Grids,Unit2;

type

  { TPz1 }

  TPz1 = class(TForm)                                   //Класс формы
    Men: TMainMenu;                                     //Ниже представлены поля
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    FSaveAs: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    fOpenDialog: TOpenDialog;
    Run: TButton;
    Edit1: TEdit;
    Number: TLabel;
    fSaveDialog: TSaveDialog;
    TSG: TStringGrid;
    procedure Button1Click(Sender: TObject);                 //Начало объявления методов
    procedure FormCreate(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure FSaveAsClick(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure RezultsChange(Sender: TObject);                //Конец объявления методов
  private

  public

  end;

var
  Pz1: TPz1;   f,a: real; n:integer;
  fFilePath:string = '';

implementation                                                   //ниже представлено определение методов
                                                                 //В имени метода указывается имя класса
{$R *.lfm}

{ TPz1 }

procedure TPz1.FormCreate(Sender: TObject);
begin
  n:=1;
  TSG.ColCount:=3;//столбцы(X)
  TSG.RowCount:=2;//строки(Y)
end;

procedure TPz1.Button1Click(Sender: TObject);
begin
  a:=StrToFloat(Edit1.Text);
  Calculate(a,f);
  TSG.Cells[1,n]:=FloatToStr(n);
  TSG.Cells[1,n]:=FloatToStr(a);
  TSG.Cells[2,n]:=FloatToStr(f);
  TSG.RowCount:=n+2;
  n:=n+1;
end;



procedure TPz1.MenuItem1Click(Sender: TObject);
var s:string;
  f1:text;
begin
 if fOpenDialog.Execute then
     begin
         fFilePath:=fOpenDialog.FileName;
         AssignFile(f1,fFilePath);
         reset(f1);
         readln(f1,s);
         Edit1.Text:=s;
         closeFile(f1);
     end;
end;

procedure TPz1.MenuItem2Click(Sender: TObject);
begin
 if fFilePath='' then FSaveAs.Click
else  save_otv(a,f,fFilePath);
end;

procedure TPz1.FSaveAsClick(Sender: TObject);
var s:string;
begin
  if fFilePath='' then fsavedialog.FileName:='Новый документ.txt'
  else fsavedialog.FileName:=fFilePath;

     if fSaveDialog.Execute then
       begin

         if extractfileext(fSaveDialog.FileName)='' then
            fFilePath:=fSaveDialog.FileName+'.txt'
        else fFilePath:=fSaveDialog.FileName;

        save_otv(a,f,fFilePath);
       end;
end;

procedure TPz1.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TPz1.MenuItem5Click(Sender: TObject);
begin
 ShowMessage('Давыдов Никита'+#13#10+#13#10+'Задача №57в'+#13#10+'Дано действительное число a. Вычислить f(a), если:'+#13#10+'(x^2+4*x+5) при x<=2'+#13#10+'1/(x^2+4*x+5) в противном случае'+#13#10+#13#10+'http://bgu-chita.ru/zadachnik/Glava02/index02.htm#z57');
end;

procedure TPz1.RezultsChange(Sender: TObject);
begin

end;

end.

