object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 543
  ClientWidth = 823
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 823
    Height = 225
    Align = alTop
    BevelOuter = bvLowered
    Color = clScrollBar
    ParentBackground = False
    TabOrder = 0
    object Panel2: TPanel
      AlignWithMargins = True
      Left = 26
      Top = 21
      Width = 772
      Height = 193
      Margins.Left = 25
      Margins.Top = 20
      Margins.Right = 1
      Margins.Bottom = 10
      Align = alLeft
      BevelOuter = bvNone
      Color = clMoneyGreen
      ParentBackground = False
      TabOrder = 0
      object Panel3: TPanel
        Left = 0
        Top = 43
        Width = 772
        Height = 150
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        ExplicitTop = 42
        ExplicitHeight = 151
        object Panel16: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 80
          Width = 766
          Height = 67
          Margins.Top = 8
          Align = alBottom
          BevelOuter = bvLowered
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          ExplicitTop = 81
          object Panel22: TPanel
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 185
            Height = 59
            Align = alLeft
            TabOrder = 0
            object Label3: TLabel
              Left = 4
              Top = 8
              Width = 98
              Height = 13
              Caption = 'TELEFONE/CELULAR'
            end
            object EditTel: TEdit
              AlignWithMargins = True
              Left = 4
              Top = 25
              Width = 173
              Height = 21
              Margins.Top = 24
              Margins.Right = 7
              Margins.Bottom = 12
              Align = alClient
              Color = clMenu
              TabOrder = 0
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditTelKeyPress
            end
          end
          object Panel23: TPanel
            AlignWithMargins = True
            Left = 195
            Top = 4
            Width = 122
            Height = 59
            Align = alLeft
            TabOrder = 1
            object Label4: TLabel
              Left = 8
              Top = 8
              Width = 19
              Height = 13
              Caption = 'CPF'
            end
            object EditCpf: TEdit
              AlignWithMargins = True
              Left = 8
              Top = 25
              Width = 106
              Height = 21
              Margins.Left = 7
              Margins.Top = 24
              Margins.Right = 7
              Margins.Bottom = 12
              Align = alClient
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 11
              ParentFont = False
              TabOrder = 0
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditTelKeyPress
              ExplicitHeight = 24
            end
          end
          object Panel32: TPanel
            Left = 320
            Top = 1
            Width = 249
            Height = 65
            Align = alLeft
            TabOrder = 2
            object Label12: TLabel
              Left = 8
              Top = 11
              Width = 112
              Height = 13
              Caption = 'DATA DE NASCIMENTO'
            end
            object ComboBoxA: TComboBox
              AlignWithMargins = True
              Left = 155
              Top = 28
              Width = 81
              Height = 24
              Margins.Top = 27
              Margins.Right = 12
              Align = alClient
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 4
              ParentFont = False
              TabOrder = 2
              TextHint = 'ANO'
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditTelKeyPress
            end
            object ComboBoxD: TComboBox
              AlignWithMargins = True
              Left = 8
              Top = 28
              Width = 44
              Height = 24
              Margins.Left = 7
              Margins.Top = 27
              Align = alLeft
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 2
              ParentFont = False
              TabOrder = 0
              TextHint = 'DIA'
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditTelKeyPress
              Items.Strings = (
                '01'
                '02'
                '03'
                '04'
                '05'
                '06'
                '07'
                '08'
                '09'
                '10'
                '11'
                '12'
                '13'
                '14'
                '15'
                '16'
                '17'
                '18'
                '19'
                '20'
                '21'
                '22'
                '23'
                '24'
                '25'
                '26'
                '27'
                '28'
                '29'
                '30'
                '31')
            end
            object ComboBoxM: TComboBox
              AlignWithMargins = True
              Left = 59
              Top = 28
              Width = 90
              Height = 24
              Cursor = crHandPoint
              Margins.Left = 4
              Margins.Top = 27
              Align = alLeft
              Style = csDropDownList
              CharCase = ecUpperCase
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              TextHint = 'M'#202'S'
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditNomeKeyPress
              Items.Strings = (
                'JANEIRO'
                'FEVEREIRO'
                'MAR'#199'O'
                'ABRIL'
                'MAIO'
                'JUNHO'
                'JULHO'
                'AGOSTO'
                'SETEMBRO'
                'OUTUBRO'
                'NOVEMBRO'
                'DEZEMBRO')
            end
          end
          object Panel33: TPanel
            AlignWithMargins = True
            Left = 572
            Top = 4
            Width = 190
            Height = 59
            Align = alClient
            TabOrder = 3
            object Label16: TLabel
              Left = 4
              Top = 8
              Width = 85
              Height = 13
              Caption = 'CRIE UMA SENHA'
            end
            object EditSenha: TEdit
              AlignWithMargins = True
              Left = 4
              Top = 25
              Width = 178
              Height = 21
              Margins.Top = 24
              Margins.Right = 7
              Margins.Bottom = 12
              Align = alClient
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditEmailKeyPress
              ExplicitHeight = 24
            end
          end
        end
        object Panel31: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 766
          Height = 79
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel21: TPanel
            AlignWithMargins = True
            Left = 262
            Top = 4
            Width = 210
            Height = 71
            Align = alLeft
            TabOrder = 1
            object Label2: TLabel
              Left = 4
              Top = 10
              Width = 30
              Height = 13
              Caption = 'EMAIL'
            end
            object EditEmail: TEdit
              AlignWithMargins = True
              Left = 4
              Top = 27
              Width = 198
              Height = 21
              Margins.Top = 26
              Margins.Right = 7
              Margins.Bottom = 22
              Align = alClient
              CharCase = ecUpperCase
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditEmailKeyPress
              ExplicitHeight = 24
            end
          end
          object Panel15: TPanel
            AlignWithMargins = True
            Left = 4
            Top = 6
            Width = 252
            Height = 69
            Margins.Top = 5
            Align = alLeft
            Color = clWhite
            ParentBackground = False
            TabOrder = 0
            object Label1: TLabel
              Left = 4
              Top = 8
              Width = 86
              Height = 13
              Caption = 'NOME COMPLETO'
            end
            object EditNome: TEdit
              AlignWithMargins = True
              Left = 4
              Top = 25
              Width = 240
              Height = 21
              Margins.Top = 24
              Margins.Right = 7
              Margins.Bottom = 22
              Align = alClient
              CharCase = ecUpperCase
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditNomeKeyPress
              ExplicitHeight = 24
            end
          end
          object Panel24: TPanel
            AlignWithMargins = True
            Left = 478
            Top = 4
            Width = 154
            Height = 71
            Align = alLeft
            TabOrder = 2
            object Label10: TLabel
              Left = 9
              Top = 10
              Width = 77
              Height = 13
              Caption = 'ESCOLARIDADE'
            end
            object ComboBoxEscol: TComboBox
              AlignWithMargins = True
              Left = 9
              Top = 26
              Width = 137
              Height = 24
              Cursor = crHandPoint
              Margins.Left = 8
              Margins.Top = 25
              Margins.Right = 7
              Margins.Bottom = 18
              Align = alClient
              Style = csDropDownList
              CharCase = ecUpperCase
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditNomeKeyPress
              Items.Strings = (
                'ENSINO FUNDAMENTAL COMPLETO'
                'ENSINO FUDAMENTAL INCOMPLETO'
                'ENSINO M'#201'DIO COMPLETO'
                'ENSINO M'#201'DIO INCOMPLETO'
                'GRADUA'#199#195'O'
                'P'#211'S-GRADUA'#199#195'O'
                'MESTRADO'
                'DOUTORADO')
            end
          end
          object Panel25: TPanel
            AlignWithMargins = True
            Left = 638
            Top = 4
            Width = 124
            Height = 71
            Align = alClient
            TabOrder = 3
            object Label11: TLabel
              Left = 14
              Top = 10
              Width = 69
              Height = 13
              Caption = 'ESTADO CIVIL'
            end
            object ComboBoxEC: TComboBox
              AlignWithMargins = True
              Left = 14
              Top = 26
              Width = 102
              Height = 24
              Cursor = crHandPoint
              Margins.Left = 13
              Margins.Top = 25
              Margins.Right = 7
              Margins.Bottom = 18
              Align = alClient
              Style = csDropDownList
              CharCase = ecUpperCase
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditNomeKeyPress
              Items.Strings = (
                'CASADO(A)'
                'DIVORCIADO(A)'
                'SEPARADO(A)'
                'SOLTEIRO(A)'
                'VI'#218'VO(A)')
            end
          end
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 772
        Height = 43
        Align = alTop
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Label18: TLabel
          AlignWithMargins = True
          Left = 16
          Top = 13
          Width = 133
          Height = 26
          Margins.Left = 15
          Margins.Top = 12
          Align = alLeft
          Caption = 'DADOS PESSOAIS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          ExplicitHeight = 19
        end
      end
    end
  end
  object Panel4: TPanel
    Left = 0
    Top = 0
    Width = 823
    Height = 41
    Align = alTop
    Caption = 'CADASTRO'
    Color = clGradientInactiveCaption
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
  end
  object Panel9: TPanel
    Left = 0
    Top = 266
    Width = 823
    Height = 277
    Align = alClient
    BevelOuter = bvNone
    Color = clGray
    ParentBackground = False
    TabOrder = 1
    object BtnAvançar: TButton
      AlignWithMargins = True
      Left = 25
      Top = 240
      Width = 84
      Height = 30
      Cursor = crHandPoint
      Margins.Left = 25
      Margins.Top = 7
      Margins.Bottom = 7
      Align = alLeft
      Caption = 'Avan'#231'ar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = BtnAvançarClick
    end
    object Panel13: TPanel
      Left = 0
      Top = 0
      Width = 823
      Height = 233
      Align = alTop
      BevelOuter = bvNone
      Color = clBtnShadow
      ParentBackground = False
      TabOrder = 0
      object Panel10: TPanel
        AlignWithMargins = True
        Left = 25
        Top = 15
        Width = 407
        Height = 188
        Margins.Left = 25
        Margins.Top = 15
        Margins.Bottom = 30
        Align = alLeft
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 407
          Height = 41
          Align = alTop
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object Label17: TLabel
            AlignWithMargins = True
            Left = 17
            Top = 13
            Width = 81
            Height = 24
            Margins.Left = 16
            Margins.Top = 12
            Align = alLeft
            Caption = 'ENDERE'#199'O'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitHeight = 19
          end
        end
        object Panel19: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 46
          Width = 401
          Height = 63
          Margins.Top = 5
          Align = alTop
          BevelOuter = bvLowered
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object Panel26: TPanel
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 273
            Height = 55
            Align = alLeft
            TabOrder = 0
            object Label5: TLabel
              Left = 5
              Top = 9
              Width = 21
              Height = 13
              Caption = 'RUA'
            end
            object EditRua: TEdit
              AlignWithMargins = True
              Left = 5
              Top = 25
              Width = 248
              Height = 21
              Margins.Left = 4
              Margins.Top = 24
              Margins.Right = 19
              Margins.Bottom = 8
              Align = alClient
              CharCase = ecUpperCase
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditNomeKeyPress
              ExplicitHeight = 24
            end
          end
          object Panel27: TPanel
            AlignWithMargins = True
            Left = 283
            Top = 4
            Width = 57
            Height = 55
            Align = alLeft
            TabOrder = 1
            object Label6: TLabel
              Left = 4
              Top = 9
              Width = 43
              Height = 13
              Caption = 'N'#218'MERO'
            end
            object NumberEdit1: TNumberEdit
              AlignWithMargins = True
              Left = 4
              Top = 25
              Width = 49
              Height = 21
              Margins.Top = 24
              Margins.Bottom = 8
              EntryRequired = longintvalue
              Color = clMenu
              Align = alClient
              DisplayFormat = '0'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = EditNomeKeyDown
            end
          end
          object Panel28: TPanel
            AlignWithMargins = True
            Left = 346
            Top = 4
            Width = 51
            Height = 55
            Align = alClient
            TabOrder = 2
            object Label7: TLabel
              Left = 4
              Top = 5
              Width = 13
              Height = 13
              Caption = 'UF'
            end
            object ComboBoxUF: TComboBox
              AlignWithMargins = True
              Left = 4
              Top = 22
              Width = 42
              Height = 24
              Cursor = crHandPoint
              Margins.Top = 21
              Margins.Right = 4
              Margins.Bottom = 5
              Align = alClient
              Style = csDropDownList
              CharCase = ecUpperCase
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              MaxLength = 2
              ParentFont = False
              TabOrder = 0
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = ComboBoxUFKeyPress
              Items.Strings = (
                'AC'
                'AL'
                'AP'
                'AM'
                'BA'
                'CE'
                'DF'
                'ES'
                'GO'
                'MA'
                'MT'
                'MS'
                'MG'
                'PA'
                'PB'
                'PR'
                'PE'
                'PI'
                'RJ'
                'RN'
                'RS'
                'RO'
                'RR'
                'SC'
                'SP'
                'SE'
                'TO')
            end
          end
        end
        object Panel20: TPanel
          AlignWithMargins = True
          Left = 3
          Top = 119
          Width = 401
          Height = 66
          Align = alBottom
          BevelOuter = bvLowered
          Color = clWhite
          ParentBackground = False
          TabOrder = 2
          object Panel29: TPanel
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 165
            Height = 58
            Align = alLeft
            TabOrder = 0
            object Label8: TLabel
              Left = 5
              Top = 6
              Width = 39
              Height = 13
              Caption = 'BAIRRO'
            end
            object EditBairro: TEdit
              AlignWithMargins = True
              Left = 5
              Top = 25
              Width = 140
              Height = 21
              Margins.Left = 4
              Margins.Top = 24
              Margins.Right = 19
              Margins.Bottom = 11
              Align = alClient
              CharCase = ecUpperCase
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditNomeKeyPress
              ExplicitHeight = 24
            end
          end
          object Panel30: TPanel
            AlignWithMargins = True
            Left = 175
            Top = 4
            Width = 222
            Height = 58
            Align = alClient
            TabOrder = 1
            object Label9: TLabel
              Left = 5
              Top = 6
              Width = 38
              Height = 13
              Caption = 'CIDADE'
            end
            object EditCidade: TEdit
              AlignWithMargins = True
              Left = 5
              Top = 25
              Width = 197
              Height = 21
              Margins.Left = 4
              Margins.Top = 24
              Margins.Right = 19
              Margins.Bottom = 11
              Align = alClient
              CharCase = ecUpperCase
              Color = clMenu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              OnKeyDown = EditNomeKeyDown
              OnKeyPress = EditNomeKeyPress
              ExplicitHeight = 24
            end
          end
        end
      end
      object Panel11: TPanel
        AlignWithMargins = True
        Left = 453
        Top = 15
        Width = 345
        Height = 188
        Margins.Left = 18
        Margins.Top = 15
        Margins.Right = 25
        Margins.Bottom = 30
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        object Panel14: TPanel
          Left = 0
          Top = 0
          Width = 345
          Height = 40
          Align = alTop
          Color = clMoneyGreen
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
          object Label19: TLabel
            AlignWithMargins = True
            Left = 16
            Top = 13
            Width = 141
            Height = 23
            Margins.Left = 15
            Margins.Top = 12
            Align = alLeft
            Caption = #218'LTIMO REGISTRO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            ExplicitHeight = 19
          end
        end
        object Memo1: TMemo
          AlignWithMargins = True
          Left = 3
          Top = 43
          Width = 342
          Height = 142
          Margins.Right = 0
          Align = alClient
          BevelOuter = bvNone
          Color = clGrayText
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Lines.Strings = (
            '')
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object BtnLimpar: TButton
        Left = 722
        Top = 206
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Margins.Top = 80
        Caption = 'Limpar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = BtnLimparClick
      end
      object BtnAdd: TButton
        Left = 616
        Top = 206
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Caption = 'Adicionar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = BtnAddClick
      end
    end
    object BtnCarregar: TButton
      Left = 675
      Top = 239
      Width = 92
      Height = 31
      Cursor = crHandPoint
      Caption = 'Carregar'
      TabOrder = 2
      OnClick = BtnCarregarClick
    end
  end
end
