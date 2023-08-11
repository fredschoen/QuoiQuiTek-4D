//formulaire quiListe
//todo: si on ne vient pas de "ajouter role dans "quoi"
//        -> rendre invisible le bouton "sélectionner qui"
Case of 
		
	: (Form event code:C388=On Unload:K2:2)
		CONFIRM:C162("sortir du détail du qui ?")
		If (OK=1)
			
			Form:C1466.page:=0
			CANCEL:C270
		End if 
		
		
	: (Form event code:C388=On Load:K2:1)
		If (Undefined:C82(Form:C1466.action))
			Form:C1466.action:="INIT"
			Form:C1466.utilisationListe:=""
			Form:C1466.page:=1
		End if 
		
		If (Form:C1466.action="INIT")
			charger_lesQuis
		End if 
		
		// aller à la page précisée
		FORM GOTO PAGE:C247(Form:C1466.page)
		//si "escape de page 3: perte elecou -> actualiser élément courant
		Form:C1466.quiSel_e:=Form:C1466.qui
		
		
End case 
