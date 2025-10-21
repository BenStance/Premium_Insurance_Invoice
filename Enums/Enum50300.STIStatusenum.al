namespace BCEXPERTROAD.BCEXPERTROAD;

enum 50300 STIStatusenum
{
    Extensible = true;
    Caption = 'STI Status enum';


    value(0; Open)
    {
        Caption = 'Open';
    }
    value(1; Pending)
    {
        Caption = 'Pending';
    }
    value(2; Approved)
    {
        Caption = 'Approved';
    }
    value(3; Rejected)
    {
        Caption = 'Rejected';
    }

}
