unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.StdCtrls, FMX.Edit, FMX.Layouts,
  FMX.Controls.Presentation, IniFiles;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    Label1: TLabel;
    Layout1: TLayout;
    Label2: TLabel;
    EditA: TEdit;
    Label3: TLabel;
    EditB: TEdit;
    ResBtn: TButton;
    MyConsole: TMemo;
    Layout2: TLayout;
    RSum: TRadioButton;
    RMinus: TRadioButton;
    RMultiply: TRadioButton;
    RDivide: TRadioButton;
    Button1: TButton;
    procedure ResBtnClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    a,b:double;
  public
    { Public declarations }
    result:double;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Form2Unit;

procedure TForm1.Button1Click(Sender: TObject);
var ini:TIniFile;
begin
try
  ini:=TIniFile.Create('c:\mynewini.ini');
  ini.WriteFloat('Options','A',a);
  ini.WriteFloat('Options','B',b);
finally
  ini.Free;
end;

end;

procedure TForm1.FormShow(Sender: TObject);
var ini:TIniFile;
begin
  ini:=TIniFile.Create('c:\mynewini.ini');
  EditA.Text:=ini.ReadFloat('Options','A',10).ToString;
  EditB.Text:=ini.ReadFloat('Options','B',10).ToString;
  ini.Free;
end;

procedure TForm1.ResBtnClick(Sender: TObject);
begin
try
  a:=StrToFloat(EditA.Text);
except on EConvertError do
begin
  ShowMessage('Wrong A!!!');
  exit;
end;

end;
  b:=double.Parse(EditB.Text);

  if RSum.IsChecked then result:=a+b
  else if RMinus.IsChecked then result:=a-b
  else if RMultiply.IsChecked then result:=a*b
  else
  begin
        if b=0 then begin
                  raise Exception.Create('Division by zero!');
                  Exit;
                end
                Else result:=a/b;
  end;

  //result:=a+b;

//  MyConsole.Lines.Add(result.ToString);
  MyConsole.Lines.Add('Result='+FloatTostr(result));

  Form2.Show;




end;

end.
