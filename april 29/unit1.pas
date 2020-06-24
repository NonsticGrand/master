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
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    fOpenDialog: TOpenDialog;
    MenuItem6: TMenuItem;
    FSaveAs1: TMenuItem;
    Run: TButton;
    Edit1: TEdit;
    Number: TLabel;
    fSaveDialog: TSaveDialog;
    TSG: TStringGrid;
    procedure Button1Click(Sender: TObject);                 //Начало объявления методов
    procedure FormCreate(Sender: TObject);
    procedure FSaveAs1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);             //Конец объявления методов
  private

  public

  end;

var
  Pz1: TPz1;   n:integer; c:calcul2; a:calcul;
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

procedure TPz1.FSaveAs1Click(Sender: TObject);
 begin
   save_as_s(fFilePath);
  save_otv(c,fFilePath,n);
  end;


procedure TPz1.MenuItem2Click(Sender: TObject);
begin
  open;
end;


procedure TPz1.Button1Click(Sender: TObject);
begin
  c[n].x:=StrToFloat(Edit1.Text);
  Calculate(c,n);
  TSG.Cells[0,n]:=FloatToStr(n);
  TSG.Cells[1,n]:=FloatToStr(c[n].x);
  TSG.Cells[2,n]:=FloatToStr(c[n].y);
  TSG.RowCount:=n+2;
  n:=n+1;
end;


procedure TPz1.MenuItem6Click(Sender: TObject);
begin
 save(fFilePath);
 save_otv(c,fFilePath,n);
 end;


procedure TPz1.MenuItem4Click(Sender: TObject);
begin
  Close;
end;

procedure TPz1.MenuItem5Click(Sender: TObject);
begin
 ShowMessage('Давыдов Никита'+#13#10+#13#10+'Задача №57в'+#13#10+'Дано действительное число a. Вычислить f(a), если:'+#13#10+'(x^2+4*x+5) при x<=2'+#13#10+'1/(x^2+4*x+5) в противном случае'+#13#10+#13#10+'http://bgu-chita.ru/zadachnik/Glava02/index02.htm#z57');
end;


end.

