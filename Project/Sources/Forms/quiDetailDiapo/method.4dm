//formulaire quiDetailDiapo
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.utilisationListe:="DIAPO"
		Form:C1466.filtrePhoto_b:=False:C215
		charger_unQui()
		//visibilité des boutons de navigation
		visibleBtNavig(Num:C11(Form:C1466.qui_es.length))
		
	: (Form event code:C388=On Unload:K2:2)
		CONFIRM:C162("sortir du détail du qui ?")
		If (OK=1)
			//"escape" sur page 1 =>sortir de l'écran
			//idem btQuitter
			Form:C1466.page:=0
			CANCEL:C270
		End if 
		
End case 