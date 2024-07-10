// quiDetail.cNomTheme

If (Form event code:C388=On Data Change:K2:15)
	$o:=Form:C1466.relTheme_e.theme.save()
	ASSERT:C1129($o.success; "écriture ko")
End if 
