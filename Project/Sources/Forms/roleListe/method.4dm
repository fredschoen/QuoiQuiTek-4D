//formulaire quiListe
Case of 
		
	: (Form event code:C388=On Unload:K2:2)
		Case of 
			: (Form:C1466.page=1)
				CONFIRM:C162("sortir de cette liste des roles ?")
				If (OK=1)
					//"escape" sur page 1 =>sortir de l'écran
					//idem btQuitter
					Form:C1466.page:=0
					CANCEL:C270
				End if 
			: (Form:C1466.page=2)
				//"escape" sur page 2 =>revenir à page 1 (fait dans afficherquiliste)
				Form:C1466.page:=1
			: (Form:C1466.page=3)
				//"escape" sur page 3 =>revenir à page 2
				Form:C1466.page:=2
		End case 
		
	: (Form event code:C388=On Load:K2:1)
		
		If (Form:C1466.action="INIT")
			charger_LesRoles
		End if 
		
		// aller à la page précisée
		FORM GOTO PAGE:C247(Form:C1466.page)
		//si "escape de page 3: perte elecou -> actualiser élément courant
		Form:C1466.eleCouRole:=Form:C1466.role
		
		
End case 
