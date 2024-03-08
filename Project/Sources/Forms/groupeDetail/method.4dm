//formulaire groupeDetail
var $form_o : Object
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		If (Undefined:C82(Form:C1466.utilisationListe))
			Form:C1466.utilisationListe:=""
		End if 
		
		charger_unGroupe
		
		//visibilité des boutons de navigation
		visibleBtNavig(Num:C11(Form:C1466.groupe_es.length))
		
	: (Form event code:C388=On Unload:K2:2)
		CONFIRM:C162("sortir du détail du quoi ?")
		If (OK=1)
			//"escape" sur page 1 =>sortir de l'écran
			//idem btQuitter
			Form:C1466.page:=0
			CANCEL:C270
		End if 
		
End case 