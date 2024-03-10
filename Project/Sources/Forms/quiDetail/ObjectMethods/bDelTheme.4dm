//bAddTheme
If (Form event code:C388=On Clicked:K2:4)
	CONFIRM:C162("OK pour supprimer "+String:C10(Form:C1466.relThemeSel_es.length)+" thème(s) de ce qui ?")
	If (ok=0)
		return 
	End if 
	
	Form:C1466.relThemeSel_es.drop()
	Form:C1466.relTheme_es:=Form:C1466.qui_e.relThemes.orderBy("theme.Nom")
	
End if 

