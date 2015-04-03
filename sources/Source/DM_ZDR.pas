unit DM_ZDR;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  TDMZDR = class(TDataModule)
    QZDR1A_: TQuery;
    QZDR1A_Code_emp: TIntegerField;
    QZDR1A_V_rok: TSmallintField;
    QZDR1A_V_mesiac: TSmallintField;
    QZDR1A_Typ: TSmallintField;
    QZDR1A_X1: TCurrencyField;
    QZDR1A_X2: TCurrencyField;
    QZDR1A_X3: TCurrencyField;
    DS_ZDR1A: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMZDR: TDMZDR;

implementation

{$R *.DFM}

end.
