//formulaire roleDetail
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		If (Undefined:C82(Form:C1466.utilisationListe))
			Form:C1466.utilisationListe:=""
		End if 
		
		charger_unPoste
		
		//visibilité des boutons de navigation
		visibleBtNavig(Num:C11(Form:C1466.poste_es.length))
		
	: (Form event code:C388=On Unload:K2:2)
		confirmerSortieForm("sortir du détail du role ?")
End case 