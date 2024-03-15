//ld_domaineQuoi
If (Form event code:C388=On Load:K2:1)
	OBJECT Get pointer:C1124->:=New object:C1471()
	OBJECT Get pointer:C1124->values:=Storage:C1525.domaineQuoi
	OBJECT Get pointer:C1124->index:=0  // 0 <=> ""
End if 

If (Form event code:C388=On Data Change:K2:15)
	Form:C1466.quoi_e.Domaine:=OBJECT Get pointer:C1124->currentValue
	//mettre à jour les listes de valeurs dépendante du domaine: Stock
	//1. stock
	//1.1. liste complète 
	$storageStockQuoi_o:=Storage:C1525.stockQuoi.query("type is :1"; Form:C1466.quoi_e.Domaine)[0]
	$storageStockQuoiValues_c:=$storageStockQuoi_o.values
	OBJECT Get pointer:C1124(Object named:K67:5; "ld_stockQuoi")->values:=$storageStockQuoiValues_c
	//1.2. position dans la liste
	$i:=Storage:C1525.stockQuoi.indexOf(Form:C1466.quoi_e.Domaine)
	If ($i=-1)
		//valeur non trouvée dans la liste déroulante
		OBJECT Get pointer:C1124(Object named:K67:5; "ld_stockQuoi")->index:=-1
		OBJECT Get pointer:C1124(Object named:K67:5; "ld_stockQuoi")->currentValue:=Form:C1466.quoi_e.Stock
	Else 
		//valeur trouvée dans la liste déroulante
		OBJECT Get pointer:C1124(Object named:K67:5; "ld_stockQuoi")->index:=$i
	End if 
	
	
	
End if 
