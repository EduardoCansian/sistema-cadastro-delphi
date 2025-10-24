unit teste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Unit2;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    BtnMultiplicar: TButton;
    BtnDividir: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtnSomar: TButton;
    BtnSubtrair: TButton;
    Panel5: TPanel;
    BtnLimpar: TButton;
    Label1: TLabel;
    BtnTela: TButton;
    Panel4: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    MemoCal: TMemo;
    Label2: TLabel;
    procedure BtnSomarClick(Sender: TObject);
    procedure BtnSubtrairClick(Sender: TObject);
    procedure BtnMultiplicarClick(Sender: TObject);
    procedure BtnDividirClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnTelaClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    fnum1: double;
    fnum2: double;
    procedure MensagemErro;
  public
    { Public declarations }
    property num1: double read fnum1;
    property num2: double read fnum2;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtnSomarClick(Sender: TObject);  // Botão de Somar
var resultado: double;
begin
     MensagemErro;

     fnum1 := StrToFloatDef(Edit1.Text, 0);   //Convertendo a variável para valor
     fnum2 := StrToFloat(Edit2.Text);

     resultado := num1 + num2;      //Calculando a soma

     //memoCal.Clear;
     memoCal.Lines.Add(FloatToStr(fnum1) + ' + ' + FloatToStr(fnum2) + ' = ' + FloatToStr(resultado));


end;

procedure TForm1.BtnSubtrairClick(Sender: TObject); // Botão de Subtrair
var  resultado: double;
begin
     MensagemErro;

     fnum1 := StrToFloat(Edit1.Text);   // Convertendo a variável para valor
     fnum2 := StrToFloat(Edit2.Text);
     resultado := num1 - num2;          // Calculando a subtração

     memoCal.Lines.Add(FloatToStr(fnum1) + ' - ' + FloatToStr(fnum2) + ' = ' + FloatToStr(resultado));


end;

procedure TForm1.BtnTelaClick(Sender: TObject);    // Botão para trocar para outra tela
begin
    try
       Application.CreateForm(TForm2, Form2);     // Create form da outra tela
       form2.ShowModal
    finally

        freeandnil(form2);         // Destrói a segunda tela criada

    end;

end;

             // Função para pular para o próximo campo usando a tecla Enter
procedure TForm1.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    begin
    if Key = 13 then begin

      Edit2.SetFocus;

    end;
end;

procedure TForm1.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
    if not (Key in ['0'..'9', #8]) then abort   //Impedindo o usuário de inserir caracteres não numéricos
end;

// Botão para limpar os campos dos dois números após realizar um cálculo
procedure TForm1.BtnLimparClick(Sender: TObject);
begin
    Edit1.Text := '';      //Atribuindo vazio para o campo
    Edit2.Text := '';      //Atribuindo vazio para o campo
    MemoCal.Lines.Clear;

    Edit1.SetFocus;        //Voltando para o primeiro campo após o botão de limpar
end;

procedure TForm1.BtnMultiplicarClick(Sender: TObject);  // Botão de Multiplicar
var  resultado: double;
begin
     MensagemErro;

     fnum1 := StrToFloat(Edit1.Text);    // Convertendo a variável para valor
     fnum2 := StrToFloat(Edit2.Text);

     resultado := num1 * num2;           // Calculando a multiplicação

     memoCal.Lines.Add(FloatToStr(fnum1) + ' X ' + FloatToStr(fnum2) + ' = ' + FloatToStr(resultado));

end;

procedure TForm1.BtnDividirClick(Sender: TObject);  // Botão de Dividir
var resultado: double;
begin
     MensagemErro;
     fnum1 := StrToFloat(Edit1.Text);      // Convertendo a variável para valor
     fnum2 := StrToFloat(Edit2.Text);
        
    if (num1 <= 0) or (num2 <=0) then begin
       raise Exception.Create('Não é possível dividir por zero.');  // Lançando exceção quando tentar dividir por 0
    end;
                
    resultado := num1 / num2;    // Calculando a divisão

    memoCal.Lines.Add(FloatToStr(fnum1) + '/' + FloatToStr(fnum2) + ' = ' + FloatToStr(resultado));

end;

procedure TForm1.MensagemErro;
begin
     if (Edit1.Text = '') and (Edit2.Text = '') then begin  // Verificando se ambos os campos estiverem vazios
        raise Exception.Create('Por favor, digite dois números para realizar o cálculo.');
     end
     else if (Edit1.Text = '') or (Edit2.Text = '') then begin   // Verificando se um dos campos estiverem vazios
        raise Exception.Create('Por favor, digite mais um número para realizar o cálculo.');
     end;
end;

end.
