unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Samples.Spin, numedit, strutils, Vcl.Mask;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BtnAvan�ar: TButton;
    EditEmail: TEdit;
    EditCpf: TEdit;
    Panel4: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel12: TPanel;
    EditRua: TEdit;
    EditBairro: TEdit;
    ComboBoxUF: TComboBox;
    EditCidade: TEdit;
    NumberEdit1: TNumberEdit;
    Panel13: TPanel;
    Panel11: TPanel;
    Panel14: TPanel;
    BtnAdd: TButton;
    BtnLimpar: TButton;
    Label17: TLabel;
    Label19: TLabel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Memo1: TMemo;
    Panel7: TPanel;
    Label18: TLabel;
    EditNome: TEdit;
    EditTel: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel24: TPanel;
    Label10: TLabel;
    ComboBoxEscol: TComboBox;
    Panel25: TPanel;
    Label11: TLabel;
    ComboBoxEC: TComboBox;
    Panel32: TPanel;
    Label12: TLabel;
    ComboBoxA: TComboBox;
    ComboBoxD: TComboBox;
    ComboBoxM: TComboBox;
    Panel33: TPanel;
    Label16: TLabel;
    EditSenha: TEdit;
    BtnCarregar: TButton;
    procedure BtnAvan�arClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EditNomeKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxEscolKeyPress(Sender: TObject; var Key: Char);
    procedure ComboBoxUFKeyPress(Sender: TObject; var Key: Char);
    procedure EditNomeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure EditTelKeyPress(Sender: TObject; var Key: Char);
    procedure EditEmailKeyPress(Sender: TObject; var Key: Char);
    function SuprimeMascara (pFone : String) : String;
    function FormataFone (pFone : String) : String;
    function FormataCelular (pCelular : String) : String;
    function FormataCpf (pCpf: String) : String;
    function SuprimeChar (pTexto : String) : String;
    procedure BtnCarregarClick(Sender: TObject);
  private
    { Private declarations }
    nome : String;         //Declarando as vari�veis de cadastro
    telefone: String;
    cpf: String;
    email: String;
    escol: String;
    estadocivil: String;
    dia: String;
    mes: String;
    ano: String;
    senha : String;
    rua: String;
    bairro: String;
    num: String;
    cidade: String;
    uf: String;
    data: TDateTime;
    nomeArquivo: String;       //Declarando o nome do arquivo que armazenar� os dados
    Procedure LimparCampos;    //Declarando a fun��o LimparCampos
    Procedure ListarDados;     //Declarando a fun��o ListarDados
    var
Numero : String;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

Procedure TForm2.BtnAvan�arClick(Sender: TObject);   //Bot�o para concluir o cadastro do usu�rio
Begin

     //Atribuindo o valor das vari�veis aos seus campos
     nome:= EditNome.Text;
     telefone:= EditTel.Text;
     email:= (EditEmail.Text);
     cpf:= EditCpf.Text;
     escol:= ComboBoxEscol.Text;
     estadocivil:= ComboBoxEC.Text;
     dia:= ComboBoxD.Text;
     mes:= ComboBoxM.Text;
     ano:= ComboBoxA.Text;
     senha:= EditSenha.Text;
     rua:= EditRua.Text;
     bairro:= EditBairro.Text;
     cidade:= EditCidade.Text;
     num:= NumberEdit1.Text;
     uf:= ComboBoxUF.Text;

                                  //Verificando se todos os campos do cadastro est�o preenchidos
     If (trim(EditNome.Text) = '') Or (trim(EditTel.Text) = '') Or (trim(EditEmail.Text) = '') Or (trim(EditCpf.Text) = '')
     Or (trim(ComboBoxEscol.Text) = '') Or (trim(ComboBoxEC.Text) = '') Or (trim(ComboBoxD.Text) = '')
     Or (trim(ComboBoxM.Text) = '') Or (trim(ComboBoxA.Text) = '') Or (trim(EditSenha.Text) = '')
     Or (trim(EditRua.Text) = '') Or (trim(EditBairro.Text) = '') Or (trim(EditCidade.Text) = '')
     Or (NumberEdit1.Text = '') Or (ComboBoxUF.Text = '') Then Begin
                                  //Mensagem de erro a ser exibida
         Raise Exception.Create('Por favor, preencha todos os campos para realizar o cadastro.');
     End;
         showmessage('Seus dados foram cadastrados com sucesso!');        //Mensagem de sucesso
End;

Procedure TForm2.BtnLimparClick(Sender: TObject);  //Bot�o para limpar os campos do cadastro
Begin
     If messageDlg ('Deseja realmente limpar os dados inseridos nos campos?', mtConfirmation, [mbYes , mbNo], 0) = mrYes
     Then Begin
               LimparCampos;         //Chamando a fun��o LimparCampos
               showmessage('Os campos foram limpados.');     //Mensagem de �xito
     End
     Else Begin
               showmessage('A��o cancelada!');    //Mensagem de cancelamento
     End;
End;

Function TForm2.SuprimeMascara (pFone: String) : String;    //Fun��o para remover caracteres especiais
Begin
    Result := StringReplace(pFone, '(', '', [rfReplaceAll]);
    Result := StringReplace(pFone, ')', '', [rfReplaceAll]);
    Result := StringReplace(pFone, '-', '', [rfReplaceAll]);
    Result := StringReplace(pFone, ' ', '', [rfReplaceAll]);
End;

Function TForm2.FormataFone (pFone: String) : String;       //Fun��o para formatar o n�mero de telefone
Begin
    Result := SuprimeMascara(pFone);
    Result := '(0' + Copy(Result, Length(Result) - 9, 2) + ')' +
              Copy(Result, Length(Result) - 7, 4) + '-' +
              Copy(Result, Length(Result) - 3, 4);
End;

Function TForm2.FormataCelular (pCelular: String) : String;  {//Fun��o para formatar o n�mero de celular inserido
                                                                incrementando par�nteses, 0 e um '-'}
Begin
    Result := '(0' + Copy(pCelular, 1, 2) + ')' +
              Copy(pCelular, 3, 5) + '-' +
              Copy(pCelular, 8, 4);
End;

Function TForm2.FormataCpf (pCpf: String) : String;  //Fun��o para formatar o CPF acrescentando '.' e '-'
Begin

     Result := Copy(pCpf, 1, 3) + '.' +
              Copy(pCpf, 4, 3) + '.' +
              Copy(pCpf, 5, 3) + '-' +
              Copy(pCpf, 6, 2);

End;

Procedure TForm2.BtnAddClick(Sender: TObject);  //Bot�o de adicionar cadastro ao painel e a um arquivo .txt

Begin
Numero := EditTel.Text;
cpf := EditCpf.Text;
data := Now;
                // Se os campos de cadastro n�o forem preenchidos, exbir� uma mensagem de erro
     If (EditNome.Text = '') Or (EditTel.Text = '') Or (EditEmail.Text = '') Or (EditCpf.Text = '')
        Or (ComboBoxEscol.Text = '') Or (ComboBoxEC.Text = '') Or (ComboBoxD.Text = '') Or (ComboBoxM.Text = '')
        Or (ComboBoxA.Text = '') Or (EditSenha.Text = '') Or (EditRua.Text = '') Or (EditBairro.Text = '') Or (EditCidade.Text = '')
        Or (NumberEdit1.Text = '') Or (ComboBoxUF.Text = '') Then Begin
        Raise Exception.Create('Por favor, preencha os campos obrigat�rios para adicionar este cadastro.');
     End
                //Valida��o da data de nascimento do usu�rio
     Else If (ComboBoxD.Text > '31') Or
             ((ComboBoxA.Text > '2007') Or (ComboBoxA.Text < '1940')) Or
             (Not MatchStr(ComboBoxM.Text,['JANEIRO','FEVEREIRO','MAR�O', 'ABRIL', 'MAIO', 'JUNHO', 'JULHO', 'AGOSTO',
                                           'SETEMBRO', 'OUTUBRO', 'NOVEMBRO', 'DEZEMBRO'])) Then Begin
        ComboBoxD.SetFocus;    //Ap�s o erro, o cursor retornar� ao campo 'Dia'
        Raise Exception.Create('Data de nascimento inv�lida! Por favor, tente novamente!');
     End

     //Verificando se o n�mero de telefone possui 10 d�gitos ou se o n�mero de celular possui 11 d�gitos
     Else If (Length (SuprimeMascara(Numero)) <> 10) And (Length (SuprimeMascara(Numero)) <> 11) Then Begin
         EditTel.SetFocus;        //Ap�s o erro, o cursor retornar� ao campo 'Telefone'
         Raise Exception.Create('N�mero de telefone/celular inv�lido! Por favor, tente novamente!');
     End

     Else If (Length(EditSenha.Text) < 6) Then Begin
         EditSenha.SetFocus;
         Raise Exception.Create('A senha deve conter  6 ou mais d�gitos.');

     End
                //Verificando se o CPF possui possui 11 d�gitos
     Else If (Length(EditCpf.Text) < 11) Then Begin
         EditCpf.SetFocus;
         Raise Exception.Create('Cpf inv�lido! Por favor, tente novamente!');
     End        //Verificando se o n�mero de endere�o possui mais de 4 d�gitos
     Else If (Length(NumberEdit1.Text) > 4) Then Begin
         NumberEdit1.SetFocus;    //Ap�s o erro, o cursor retornar� ao campo 'N�mero'
         Raise Exception.Create('N�mero de endere�o inv�lido! Por favor, tente novamente!');
     End
                //Validando o campo de Email
     Else If (Not AnsiEndsText('@GMAIL.COM', UpperCase(EditEmail.Text))) And   //'AnsiEnds' verifica se termina com determinada string
             (Not AnsiEndsText('@HOTMAIL.COM', UpperCase(EditEmail.Text))) And
             (Not AnsiEndsText ('@OUTLOOK.COM', UpperCase(EditEmail.Text))) And
             (Not AnsiEndsText ('@YAHOO.COM', UpperCase(EditEmail.Text))) Then Begin

        EditEmail.SetFocus;          //Antes da mensagem de erro ser exibida, retornar� ao campo 'Email'
        Raise Exception.Create('Endere�o de email inv�lido. Por favor, tente novamente!');  //Mensagem de erro
     End

                //Verificando se o campo 'ESCOLARIDADE' ser� preenchido com as op��es solicitadas
     Else If Not MatchStr(ComboBoxEscol.Text,['ENSINO FUNDAMENTAL COMPLETO', 'ENSINO FUDAMENTAL INCOMPLETO',
                                              'ENSINO M�DIO COMPLETO', 'ENSINO M�DIO INCOMPLETO', 'GRADUA��O',
                                              'P�S-GRADUA��O', 'MESTRADO', 'DOUTORADO']) Then Begin

         ComboBoxEscol.SetFocus;     //Antes da mensagem de erro ser exibida, retornar� ao campo 'Escolaridade'
         Raise Exception.Create('Escolaridade inv�lida! Por favor, tente novamente!');   //Mensagem de erro

     End
                //Verificando se o campo 'ESTADO CIVIL' ser� preenchido com as op��es solicitadas
     else If Not MatchStr (ComboBoxEC.Text, ['CASADO(A)','DIVORCIADO(A)', 'SEPARADO(A)', 'SOLTEIRO(A)', 'VI�VO(A)'])
                                            Then Begin

         ComboBoxEC.SetFocus;        //Antes da mensagem de erro ser exibida, retornar� ao campo 'Estado civil'
         Raise Exception.Create('Estado civil inv�lido! Por favor, tente novamente!');   //Mensagem de erro
     End
                //Verificando se o campo UF ser� preenchido com as op��es solicitadas
     Else If Not MatchStr (ComboBoxUF.Text, ['AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS',
                                        'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC',
                                        'SP', 'SE', 'TO']) Then Begin

         ComboBoxUF.SetFocus;        //Antes da mensagem de erro ser exibida, retornar� ao campo 'UF'
         Raise Exception.Create('Unidade Federativa (UF) inv�lida! Por favor, tente novamente.'); //Mensagem de erro

     End;


               //Implementando caixa de confirma��o de cadastro para o usu�rio
     If messageDlg('Deseja realmente adicionar este cadastro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then Begin
               //Caso o usu�rio confirme o cadastro e preencha todos os campos,
               //uma lista com os dados inseridos ser� criada
        nomeArquivo:= StringReplace(EditNome.Text, ' ', '_', [rfReplaceAll]) + '.txt';

        If FileExists(nomeArquivo) Then Begin
            If messageDlg('J� existe um cadastro com este nome de usu�rio. Deseja atualizar os dados?',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes Then Begin

               ListarDados;   //Chamando a fun��o para exibir os dados cadastrados

               //Enviando os dados para o arquivo txt com o nome personalizado
               Memo1.Lines.SaveToFile(ExtractFilePath(application.ExeName) + nomeArquivo);
               showmessage('Atualiza��o com sucesso! Os dados foram atualizados em '+ nomeArquivo); //Mensagem de �xito

            End
            Else Begin
               showmessage('Opera��o cancelada.')   //Caso o usu�rio n�o deseje atualizar os dados de cadastro
            End;

        End
               //Caso o nome de usu�rio n�o seja igual a um j� cadastrado, ele ser� adicionado normalmente
        Else Begin

               ListarDados;   //Fun��o para exibir a lista de dados cadastrados

               //Usando a propriedade 'SaveToFile' para salvar os dados em arquivo .txt
               Memo1.Lines.SaveToFile(ExtractFilePath(application.ExeName) + nomeArquivo);
               //Mensagem de �xito ap�s o cadastro
               showmessage('Cadastro conclu�do! Os dados foram salvos em '+ nomeArquivo);

        End;

     End

     Else Begin     //Caso o usu�rio escolha n�o cadastrar as informa��es
        showmessage('Cadastro cancelado!');
     End;
End;

Procedure TForm2.BtnCarregarClick(Sender: TObject);
Var
arquivo: TStringList;
linha : String;
posicao: integer;
I : integer;
Begin

    If FileExists(nomeArquivo) Then Begin
         arquivo := TStringList.Create;
        Try
            arquivo.LoadFromFile(nomeArquivo);

            linha := arquivo.Strings[4];

            posicao := Pos(':', linha);

            If posicao > 0 Then Begin
                cpf := Trim(Copy(linha, posicao + 1, Length(linha)));


                EditCpf.Text := cpf;

            End;

        Finally
        arquivo.Free;
        End;

    End
    Else Begin
        Raise Exception.Create('Arquivo N�o Encontrado');
    End;


     //if FileExists(nomeArquivo) then begin
     //    Memo1.Lines.LoadFromFile(nomeArquivo);

     //       if Memo1.Lines.Count >= 15 then begin

      //         EditNome.Text:= memo1.Lines[1];
      //       EditTel.Text:= memo1.Lines[2];
      //         EditEmail.Text:= memo1.Lines[3];
      //         EditCpf.Text:= memo1.Lines[4];
      //         ComboBoxEscol.Text:= memo1.Lines[5];
      //         ComboBoxEC.Text:= memo1.Lines[6];
      //         ComboBoxD.Text:= memo1.Lines[7];
      //         ComboBoxM.Text:= memo1.Lines[8];
      //         ComboBoxA.Text:= memo1.Lines[9];
      //         EditSenha.Text := memo1.Lines[10];
       //        EditRua.Text:= memo1.Lines[12];
      //         EditBairro.Text:= memo1.Lines[13];
      //         EditCidade.Text:= memo1.Lines[14];
      //         NumberEdit1.Text:= memo1.Lines[15];
       //        ComboBoxUF.Text:= memo1.Lines[16];

      //      end
      //      else begin

      //      end;

     //end;

End;


Procedure TForm2.ComboBoxEscolKeyPress(Sender: TObject; var Key: Char);
Begin
                //Definindo quais caracteres ser�o aceitos no campo 'Escolaridade'
   If Not (Key in ['a'..'z', ' ', #13, #8]) Then abort
End;

Procedure TForm2.ComboBoxUFKeyPress(Sender: TObject; var Key: Char);
Begin           //Definindo quais caracteres ser�o aceitos no campo 'UF'
   If Not (Key in ['a'..'z', #13, #8]) Then abort

End;
                //Definindo quais caracteres ser�o aceitos no campo 'Email'
Procedure TForm2.EditEmailKeyPress(Sender: TObject; var Key: Char);
Begin
   If Not (Key in ['a'..'z', '0'.. '9', '@', '.', '_', '-', #13, #8]) Then abort

End;

Procedure TForm2.EditNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
                  //Quando a tecla 13 (Enter) for pressionada, avan�ar� para o campo Telefone
   If Key = 13 Then Begin

      If (TEdit(Sender).Text = '') or (TComboBox(Sender).Text = '') Then   //Verificando se os campos forem vazios
        Raise Exception.Create('Por favor, preencha este campo obrigat�rio!'); //Se forem vazios ir� exibir uma mensagem

      PostMessage(Self.Handle, WM_NEXTDLGCTL,0,0)   //Ap�s digitar "Enter" o cursor ir� para o prox�mo campo ativo

   End

End;

Procedure TForm2.EditNomeKeyPress(Sender: TObject; var Key: Char);
Begin

   If (Key = ' ') And (TEdit(Sender).Text = '') Then
   Key := #0;

   If (Key = ' ') And (Length(TEdit(Sender).Text) > 0) Then
   If TEdit(Sender).Text[Length(TEdit(Sender).Text)] = ' ' Then
   Key := #0;

       //Definindo quais caracteres ser�o aceitos no campo 'Nome'
   If Not (Key in ['a'..'z', 'A'..'Z' ,' ',  '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�', '�' ,
   #13, #8]) Then abort;

End;

Procedure TForm2.EditTelKeyPress(Sender: TObject; var Key: Char);
Begin
   //Definindo quais caracteres ser�o aceitos no campo Telefone
   if not (Key in ['0'..'9', '(', ')', '-', #13, #8]) Then abort  //'then abort' impedir� a inser��o de outro caractere
End;

Procedure TForm2.FormShow(Sender: TObject);
Var
i: integer;     //Declarando vari�vel de repeti��o
Begin

     For I := 1940 to 2007 Do Begin        //La�o de repeti��o para exibir os anos no campo
         ComboBoxA.Items.Add(i.ToString);  //Convertendo os n�meros para string
     End;

End;

Function TForm2.SuprimeChar (pTexto : String) : String;
Var
i: integer;
Begin
    For i := 1 to Length(pTexto) Do Begin
      If (pTexto[i] >= '0') And (pTexto[i] <= '9') Then Begin
        Result := Result + pTexto[i];
      End;

    End;

End;

Procedure TForm2.LimparCampos;   //Fun��o para limpar todos os campos de cadastro
Begin
         EditNome.Text:= '';
         EditTel.Text:= '';
         EditEmail.Text:= '';
         EditCpf.Text:= '';
         ComboBoxEscol.Text:= '';
         ComboBoxEC.Text:= '';
         ComboBoxD.Text:= '';
         ComboBoxM.Text:= '';
         ComboBoxA.Text:= '';
         EditSenha.Text := '';
         EditRua.Text:= '';
         EditBairro.Text:= '';
         EditCidade.Text:= '';
         NumberEdit1.Text:= '';
         ComboBoxUF.Text:= '';
         ComboBoxEscol.ItemIndex:= -1;
         ComboBoxEC.ItemIndex:= -1;       //Usando o 'ComboBox.ItemIndex:= -1' para limpar os dados do Combo Box
         ComboBoxM.ItemIndex:= -1;
         ComboBoxUF.ItemIndex:= -1;
         EditNome.SetFocus;               //Usando o SetFocus para retornar ao campo 'Nome' ap�s limpar
End;

Procedure TForm2.ListarDados;    //Fun��o para listar todos os dados cadastrados e exibi-los
Begin
     If Length (SuprimeMascara(Numero)) = 10 Then Begin    //Caso o n�mero de telefone seja igual a 10
         memo1.Lines.Clear;
         memo1.Lines.Add('Data de Cria��o: '+ DateTimeToStr(data));
         memo1.Lines.Add('----------DADOS PESSOAIS----------');
         memo1.Lines.Add('NOME: ' + EditNome.Text);
         memo1.Lines.Add('TELEFONE: ' + FormataFone(Numero));
         memo1.Lines.Add('EMAIL: ' + EditEmail.Text);
         memo1.Lines.Add('CPF: ' + FormataCpf(cpf));
         memo1.Lines.Add('ESCOLARIDADE: ' + ComboBoxEscol.Text);
         memo1.Lines.Add('ESTADO CIVIL: ' + ComboBoxEC.Text);
         memo1.Lines.Add('DATA DE NASCIMENTO: ' + ComboBoxD.Text + ' DE ' + ComboBoxM.Text
          + ' DE ' + ComboBoxA.Text);
         memo1.Lines.Add('SENHA: ' + EditSenha.Text);
         memo1.Lines.Add('----------ENDERE�O----------');
         memo1.Lines.Add('RUA: ' + EditRua.Text);
         memo1.Lines.Add('BAIRRO: ' + EditBairro.Text);
         memo1.Lines.Add('CIDADE: ' + EditCidade.Text);
         memo1.Lines.Add('N�MERO: ' + NumberEdit1.Text);
         memo1.Lines.Add('UF: ' + ComboBoxUF.Text);
     End

     Else If Length (SuprimeMascara(Numero)) = 11 Then Begin    //Caso o n�mero de celular seja igual a 11
         memo1.Lines.Clear;
         memo1.Lines.Add('Data de Cria��o: '+ DateTimeToStr(data));
         memo1.Lines.Add('--------------DADOS PESSOAIS');
         memo1.Lines.Add('NOME: ' + EditNome.Text);
         memo1.Lines.Add('N�MERO DE CELULAR: ' + FormataCelular(Numero));
         memo1.Lines.Add('EMAIL: ' + EditEmail.Text);
         memo1.Lines.Add('CPF: ' + FormataCpf(cpf));
         memo1.Lines.Add('ESCOLARIDADE: ' + ComboBoxEscol.Text);
         memo1.Lines.Add('ESTADO CIVIL: ' + ComboBoxEC.Text);
         memo1.Lines.Add('DATA DE NASCIMENTO: ' + ComboBoxD.Text + ' DE ' + ComboBoxM.Text
         + ' DE ' + ComboBoxA.Text);
         memo1.Lines.Add('SENHA: ' + EditSenha.Text);
         memo1.Lines.Add('--------------ENDERE�O');
         memo1.Lines.Add('RUA: ' + EditRua.Text);
         memo1.Lines.Add('BAIRRO: ' + EditBairro.Text);
         memo1.Lines.Add('CIDADE: ' + EditCidade.Text);
         memo1.Lines.Add('N�MERO: ' + NumberEdit1.Text);
         memo1.Lines.Add('UF: ' + ComboBoxUF.Text);
     End

End;

End.
