//bAddTheme
If (Form event code:C388=On Clicked:K2:4)
	If (Form:C1466.relThemeSel_es.length=0)
		ALERT:C41("sélectionnez au moins 1 thème")
		return 
	End if 
	CONFIRM:C162("OK pour supprimer "+String:C10(Form:C1466.relThemeSel_es.length)+" thème(s) de ce qui ?")
	If (ok=0)
		return 
	End if 
	
	Form:C1466.relThemeSel_es.drop()
	//KO: Form.relTheme_es:=Form.qui_e.relThemes.orderBy("theme.Nom")
	Form:C1466.relTheme_es:=ds:C1482.RelTheme.query("ID_Qui = :1"; Form:C1466.qui_e.ID).orderBy("theme.Nom")
	
End if 

