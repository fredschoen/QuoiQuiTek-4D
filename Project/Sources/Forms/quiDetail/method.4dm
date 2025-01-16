//formulaire quiDetail

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		If (Undefined:C82(Form:C1466.utilisationListe))
			Form:C1466.utilisationListe:=""
		End if 
		
		//en 3 étapes sinon ça coince
		charger_unQui()
		
		//visibilité des boutons de navigation
		visibleBtNavig(Form:C1466.qui_es.length)
		
	: (Form event code:C388=On Unload:K2:2)
		confirmerSortieForm("sortir du détail du qui ?")
		
End case 