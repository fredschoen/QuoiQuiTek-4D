//bDelTheme
If (Form event code:C388=On Clicked:K2:4)
	If (Form:C1466.themeSel_es.length=0)
		return 
	End if 
	
	CONFIRM:C162("OK pour supprimer "+String:C10(Form:C1466.themeSel_es.length)+" thème(s) ?")
	If (ok=0)
		return 
	End if 
	
	Form:C1466.theme_es:=Form:C1466.themeSel_es.drop()
	
End if 

