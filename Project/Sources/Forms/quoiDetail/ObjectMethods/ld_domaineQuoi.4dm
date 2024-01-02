//ld_domaineQuoi
If (Form event code:C388=On Load:K2:1)
	OBJECT Get pointer:C1124->:=New object:C1471()
	OBJECT Get pointer:C1124->values:=Storage:C1525.domaineQuoi
	OBJECT Get pointer:C1124->index:=0  // 0 <=> ""
End if 

If (Form event code:C388=On Data Change:K2:15)
	Form:C1466.quoi_e.Domaine:=OBJECT Get pointer:C1124->currentValue
	$ListeStockQuoi_selStorage:=Storage:C1525.stockQuoi.query("type is :1"; Form:C1466.quoi_e.Domaine)
	$ListeStockQuoi_tab:=$ListeStockQuoi_selStorage[0].values[0]
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_stockQuoi")->values:=$ListeStockQuoi_tab
End if 
