//ld_stockQuoi
If (Form event code:C388=On Load:K2:1)
	OBJECT Get pointer:C1124->:=New object:C1471()
	OBJECT Get pointer:C1124->values:=New collection:C1472("")
	OBJECT Get pointer:C1124->index:=0  // 0 <=> ""
End if 

If (Form event code:C388=On Data Change:K2:15)
	Form:C1466.quoi_e.Stock:=OBJECT Get pointer:C1124->currentValue
End if 


