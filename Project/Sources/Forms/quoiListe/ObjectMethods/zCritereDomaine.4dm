// quoiListe.ld_domaineQuoi
//
If (Form event code:C388=On Load:K2:1)
	OBJECT Get pointer:C1124->:=New object:C1471()
	OBJECT Get pointer:C1124->values:=Storage:C1525.domaineQuoi
	OBJECT Get pointer:C1124->index:=0  // 0 <=> ""
End if 

If (Form event code:C388=On Data Change:K2:15)
	Form:C1466.critereQuoiListe.Domaine:=OBJECT Get pointer:C1124->currentValue
End if 
