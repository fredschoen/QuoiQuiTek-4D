//formulaire roleDetail
Case of 
		//mark: on load
	: (Form event code:C388=On Load:K2:1)
		
		If (Undefined:C82(Form:C1466.utilisationListe))
			Form:C1466.utilisationListe:=""
		End if 
		
		charger_unRole
		//visibilité des boutons de navigation
		visibleBtNavig(Num:C11(Form:C1466.role_es.length))
		
		//mark: on unload
	: (Form event code:C388=On Unload:K2:2)
		CONFIRM:C162("sortir du détail du role ?")
		If (OK=1)
			//"escape" sur page 1 =>sortir de l'écran
			//idem btQuitter
			Form:C1466.page:=0
			CANCEL:C270
		End if 
		
		//mark: on timer
	: (Form event code:C388=On Timer:K2:25)
		//suivant
		Form:C1466.action:="SUIVANT"
		charger_unRole()
		//attendre
		SET TIMER:C645(Form:C1466.ticksDiapo_i)
		
End case 