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
    BtnAvançar: TButton;
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
    procedure BtnAvançarClick(Sender: TObject);
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
    nome : String;         //Declarando as variáveis de cadastro
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
    nomeArquivo: String;       //Declarando o nome do arquivo que armazenará os dados
    Procedure LimparCampos;    //Declarando a função LimparCampos
    Procedure ListarDados;     //Declarando a função ListarDados
    var
Numero : String;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

Procedure TForm2.BtnAvançarClick(Sender: TObject);   //Botão para concluir o cadastro do usuário
Begin

     //Atribuindo o valor das variáveis aos seus campos
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

                                  //Verificando se todos os campos do cadastro estão preenchidos
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

Procedure TForm2.BtnLimparClick(Sender: TObject);  //Botão para limpar os campos do cadastro
Begin
     If messageDlg ('Deseja realmente limpar os dados inseridos nos campos?', mtConfirmation, [mbYes , mbNo], 0) = mrYes
     Then Begin
               LimparCampos;         //Chamando a função LimparCampos
               showmessage('Os campos foram limpados.');     //Mensagem de êxito
     End
     Else Begin
               showmessage('Ação cancelada!');    //Mensagem de cancelamento
     End;
End;

Function TForm2.SuprimeMascara (pFone: String) : String;    //Função para remover caracteres especiais
Begin
    Result := StringReplace(pFone, '(', '', [rfReplaceAll]);
    Result := StringReplace(pFone, ')', '', [rfReplaceAll]);
    Result := StringReplace(pFone, '-', '', [rfReplaceAll]);
    Result := StringReplace(pFone, ' ', '', [rfReplaceAll]);
End;

Function TForm2.FormataFone (pFone: String) : String;       //Função para formatar o número de telefone
Begin
    Result := SuprimeMascara(pFone);
    Result := '(0' + Copy(Result, Length(Result) - 9, 2) + ')' +
              Copy(Result, Length(Result) - 7, 4) + '-' +
              Copy(Result, Length(Result) - 3, 4);
End;

Function TForm2.FormataCelular (pCelular: String) : String;  {//Função para formatar o número de celular inserido
                                                                incrementando parênteses, 0 e um '-'}
Begin
    Result := '(0' + Copy(pCelular, 1, 2) + ')' +
              Copy(pCelular, 3, 5) + '-' +
              Copy(pCelular, 8, 4);
End;

Function TForm2.FormataCpf (pCpf: String) : String;  //Função para formatar o CPF acrescentando '.' e '-'
Begin

     Result := Copy(pCpf, 1, 3) + '.' +
              Copy(pCpf, 4, 3) + '.' +
              Copy(pCpf, 5, 3) + '-' +
              Copy(pCpf, 6, 2);

End;

Procedure TForm2.BtnAddClick(Sender: TObject);  //Botão de adicionar cadastro ao painel e a um arquivo .txt

Begin
Numero := EditTel.Text;
cpf := EditCpf.Text;
data := Now;
                // Se os campos de cadastro não forem preenchidos, exbirá uma mensagem de erro
     If (EditNome.Text = '') Or (EditTel.Text = '') Or (EditEmail.Text = '') Or (EditCpf.Text = '')
        Or (ComboBoxEscol.Text = '') Or (ComboBoxEC.Text = '') Or (ComboBoxD.Text = '') Or (ComboBoxM.Text = '')
        Or (ComboBoxA.Text = '') Or (EditSenha.Text = '') Or (EditRua.Text = '') Or (EditBairro.Text = '') Or (EditCidade.Text = '')
        Or (NumberEdit1.Text = '') Or (ComboBoxUF.Text = '') Then Begin
        Raise Exception.Create('Por favor, preencha os campos obrigatórios para adicionar este cadastro.');
     End
                //Validação da data de nascimento do usuário
     Else If (ComboBoxD.Text > '31') Or
             ((ComboBoxA.Text > '2007') Or (ComboBoxA.Text < '1940')) Or
             (Not MatchStr(ComboBoxM.Text,['JANEIRO','FEVEREIRO','MARÇO', 'ABRIL', 'MAIO', 'JUNHO', 'JULHO', 'AGOSTO',
                                           'SETEMBRO', 'OUTUBRO', 'NOVEMBRO', 'DEZEMBRO'])) Then Begin
        ComboBoxD.SetFocus;    //Após o erro, o cursor retornará ao campo 'Dia'
        Raise Exception.Create('Data de nascimento inválida! Por favor, tente novamente!');
     End

     //Verificando se o número de telefone possui 10 dígitos ou se o número de celular possui 11 dígitos
     Else If (Length (SuprimeMascara(Numero)) <> 10) And (Length (SuprimeMascara(Numero)) <> 11) Then Begin
         EditTel.SetFocus;        //Após o erro, o cursor retornará ao campo 'Telefone'
         Raise Exception.Create('Número de telefone/celular inválido! Por favor, tente novamente!');
     End

     Else If (Length(EditSenha.Text) < 6) Then Begin
         EditSenha.SetFocus;
         Raise Exception.Create('A senha deve conter  6 ou mais dígitos.');

     End
                //Verificando se o CPF possui possui 11 dígitos
     Else If (Length(EditCpf.Text) < 11) Then Begin
         EditCpf.SetFocus;
         Raise Exception.Create('Cpf inválido! Por favor, tente novamente!');
     End        //Verificando se o número de endereço possui mais de 4 dígitos
     Else If (Length(NumberEdit1.Text) > 4) Then Begin
         NumberEdit1.SetFocus;    //Após o erro, o cursor retornará ao campo 'Número'
         Raise Exception.Create('Número de endereço inválido! Por favor, tente novamente!');
     End
                //Validando o campo de Email
     Else If (Not AnsiEndsText('@GMAIL.COM', UpperCase(EditEmail.Text))) And   //'AnsiEnds' verifica se termina com determinada string
             (Not AnsiEndsText('@HOTMAIL.COM', UpperCase(EditEmail.Text))) And
             (Not AnsiEndsText ('@OUTLOOK.COM', UpperCase(EditEmail.Text))) And
             (Not AnsiEndsText ('@YAHOO.COM', UpperCase(EditEmail.Text))) Then Begin

        EditEmail.SetFocus;          //Antes da mensagem de erro ser exibida, retornará ao campo 'Email'
        Raise Exception.Create('Endereço de email inválido. Por favor, tente novamente!');  //Mensagem de erro
     End

                //Verificando se o campo 'ESCOLARIDADE' será preenchido com as opções solicitadas
     Else If Not MatchStr(ComboBoxEscol.Text,['ENSINO FUNDAMENTAL COMPLETO', 'ENSINO FUDAMENTAL INCOMPLETO',
                                              'ENSINO MÉDIO COMPLETO', 'ENSINO MÉDIO INCOMPLETO', 'GRADUAÇÃO',
                                              'PÓS-GRADUAÇÃO', 'MESTRADO', 'DOUTORADO']) Then Begin

         ComboBoxEscol.SetFocus;     //Antes da mensagem de erro ser exibida, retornará ao campo 'Escolaridade'
         Raise Exception.Create('Escolaridade inválida! Por favor, tente novamente!');   //Mensagem de erro

     End
                //Verificando se o campo 'ESTADO CIVIL' será preenchido com as opções solicitadas
     else If Not MatchStr (ComboBoxEC.Text, ['CASADO(A)','DIVORCIADO(A)', 'SEPARADO(A)', 'SOLTEIRO(A)', 'VIÚVO(A)'])
                                            Then Begin

         ComboBoxEC.SetFocus;        //Antes da mensagem de erro ser exibida, retornará ao campo 'Estado civil'
         Raise Exception.Create('Estado civil inválido! Por favor, tente novamente!');   //Mensagem de erro
     End
                //Verificando se o campo UF será preenchido com as opções solicitadas
     Else If Not MatchStr (ComboBoxUF.Text, ['AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS',
                                        'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC',
                                        'SP', 'SE', 'TO']) Then Begin

         ComboBoxUF.SetFocus;        //Antes da mensagem de erro ser exibida, retornará ao campo 'UF'
         Raise Exception.Create('Unidade Federativa (UF) inválida! Por favor, tente novamente.'); //Mensagem de erro

     End;


               //Implementando caixa de confirmação de cadastro para o usuário
     If messageDlg('Deseja realmente adicionar este cadastro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then Begin
               //Caso o usuário confirme o cadastro e preencha todos os campos,
               //uma lista com os dados inseridos será criada
        nomeArquivo:= StringReplace(EditNome.Text, ' ', '_', [rfReplaceAll]) + '.txt';

        If FileExists(nomeArquivo) Then Begin
            If messageDlg('Já existe um cadastro com este nome de usuário. Deseja atualizar os dados?',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes Then Begin

               ListarDados;   //Chamando a função para exibir os dados cadastrados

               //Enviando os dados para o arquivo txt com o nome personalizado
               Memo1.Lines.SaveToFile(ExtractFilePath(application.ExeName) + nomeArquivo);
               showmessage('Atualização com sucesso! Os dados foram atualizados em '+ nomeArquivo); //Mensagem de êxito

            End
            Else Begin
               showmessage('Operação cancelada.')   //Caso o usuário não deseje atualizar os dados de cadastro
            End;

        End
               //Caso o nome de usuário não seja igual a um já cadastrado, ele será adicionado normalmente
        Else Begin

               ListarDados;   //Função para exibir a lista de dados cadastrados

               //Usando a propriedade 'SaveToFile' para salvar os dados em arquivo .txt
               Memo1.Lines.SaveToFile(ExtractFilePath(application.ExeName) + nomeArquivo);
               //Mensagem de êxito após o cadastro
               showmessage('Cadastro concluído! Os dados foram salvos em '+ nomeArquivo);

        End;

     End

     Else Begin     //Caso o usuário escolha não cadastrar as informações
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
        Raise Exception.Create('Arquivo Não Encontrado');
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
                //Definindo quais caracteres serão aceitos no campo 'Escolaridade'
   If Not (Key in ['a'..'z', ' ', #13, #8]) Then abort
End;

Procedure TForm2.ComboBoxUFKeyPress(Sender: TObject; var Key: Char);
Begin           //Definindo quais caracteres serão aceitos no campo 'UF'
   If Not (Key in ['a'..'z', #13, #8]) Then abort

End;
                //Definindo quais caracteres serão aceitos no campo 'Email'
Procedure TForm2.EditEmailKeyPress(Sender: TObject; var Key: Char);
Begin
   If Not (Key in ['a'..'z', '0'.. '9', '@', '.', '_', '-', #13, #8]) Then abort

End;

Procedure TForm2.EditNomeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
Begin
                  //Quando a tecla 13 (Enter) for pressionada, avançará para o campo Telefone
   If Key = 13 Then Begin

      If (TEdit(Sender).Text = '') or (TComboBox(Sender).Text = '') Then   //Verificando se os campos forem vazios
        Raise Exception.Create('Por favor, preencha este campo obrigatório!'); //Se forem vazios irá exibir uma mensagem

      PostMessage(Self.Handle, WM_NEXTDLGCTL,0,0)   //Após digitar "Enter" o cursor irá para o proxímo campo ativo

   End

End;

Procedure TForm2.EditNomeKeyPress(Sender: TObject; var Key: Char);
Begin

   If (Key = ' ') And (TEdit(Sender).Text = '') Then
   Key := #0;

   If (Key = ' ') And (Length(TEdit(Sender).Text) > 0) Then
   If TEdit(Sender).Text[Length(TEdit(Sender).Text)] = ' ' Then
   Key := #0;

       //Definindo quais caracteres serão aceitos no campo 'Nome'
   If Not (Key in ['a'..'z', 'A'..'Z' ,' ',  'á', 'é', 'í', 'ó', 'ú', 'ã', 'õ', 'â', 'ê', 'î', 'ô', 'û' ,
   #13, #8]) Then abort;

End;

Procedure TForm2.EditTelKeyPress(Sender: TObject; var Key: Char);
Begin
   //Definindo quais caracteres serão aceitos no campo Telefone
   if not (Key in ['0'..'9', '(', ')', '-', #13, #8]) Then abort  //'then abort' impedirá a inserção de outro caractere
End;

Procedure TForm2.FormShow(Sender: TObject);
Var
i: integer;     //Declarando variável de repetição
Begin

     For I := 1940 to 2007 Do Begin        //Laço de repetição para exibir os anos no campo
         ComboBoxA.Items.Add(i.ToString);  //Convertendo os números para string
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

Procedure TForm2.LimparCampos;   //Função para limpar todos os campos de cadastro
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
         EditNome.SetFocus;               //Usando o SetFocus para retornar ao campo 'Nome' após limpar
End;

Procedure TForm2.ListarDados;    //Função para listar todos os dados cadastrados e exibi-los
Begin
     If Length (SuprimeMascara(Numero)) = 10 Then Begin    //Caso o número de telefone seja igual a 10
         memo1.Lines.Clear;
         memo1.Lines.Add('Data de Criação: '+ DateTimeToStr(data));
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
         memo1.Lines.Add('----------ENDEREÇO----------');
         memo1.Lines.Add('RUA: ' + EditRua.Text);
         memo1.Lines.Add('BAIRRO: ' + EditBairro.Text);
         memo1.Lines.Add('CIDADE: ' + EditCidade.Text);
         memo1.Lines.Add('NÚMERO: ' + NumberEdit1.Text);
         memo1.Lines.Add('UF: ' + ComboBoxUF.Text);
     End

     Else If Length (SuprimeMascara(Numero)) = 11 Then Begin    //Caso o número de celular seja igual a 11
         memo1.Lines.Clear;
         memo1.Lines.Add('Data de Criação: '+ DateTimeToStr(data));
         memo1.Lines.Add('--------------DADOS PESSOAIS');
         memo1.Lines.Add('NOME: ' + EditNome.Text);
         memo1.Lines.Add('NÚMERO DE CELULAR: ' + FormataCelular(Numero));
         memo1.Lines.Add('EMAIL: ' + EditEmail.Text);
         memo1.Lines.Add('CPF: ' + FormataCpf(cpf));
         memo1.Lines.Add('ESCOLARIDADE: ' + ComboBoxEscol.Text);
         memo1.Lines.Add('ESTADO CIVIL: ' + ComboBoxEC.Text);
         memo1.Lines.Add('DATA DE NASCIMENTO: ' + ComboBoxD.Text + ' DE ' + ComboBoxM.Text
         + ' DE ' + ComboBoxA.Text);
         memo1.Lines.Add('SENHA: ' + EditSenha.Text);
         memo1.Lines.Add('--------------ENDEREÇO');
         memo1.Lines.Add('RUA: ' + EditRua.Text);
         memo1.Lines.Add('BAIRRO: ' + EditBairro.Text);
         memo1.Lines.Add('CIDADE: ' + EditCidade.Text);
         memo1.Lines.Add('NÚMERO: ' + NumberEdit1.Text);
         memo1.Lines.Add('UF: ' + ComboBoxUF.Text);
     End

End;

End.
