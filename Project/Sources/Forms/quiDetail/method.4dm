//formulaire quoiDetail

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		If (Undefined:C82(Form:C1466.utilisationListe))
			Form:C1466.utilisationListe:=""
		End if 
		
		//en 3 étapes sinon ça coince
		charger_unQui
		
		//visibilité des boutons de navigation
		visibleBtNavig
		
	: (Form event code:C388=On Unload:K2:2)
		CONFIRM:C162("sortir du détail du qui ?")
		If (OK=1)
			Form:C1466.page:=0
			CANCEL:C270
		End if 
		
End case 