//formulaire roleListe

Case of 
		
	: (Form event code:C388=On Unload:K2:2)
		CONFIRM:C162("sortir de cette liste des roles ?")
		If (OK=1)
			//"escape" sur page 1 =>sortir de l'écran
			//idem btQuitter
			Form:C1466.page:=0
			CANCEL:C270
		End if 
		
	: (Form event code:C388=On Load:K2:1)
		If (Undefined:C82(Form:C1466.action))
			Form:C1466.action:="INIT"
			Form:C1466.utilisationListe:=""
			Form:C1466.page:=1
		End if 
		
		//criteres d'affichage :
		Form:C1466.critereRole:=New object:C1471
		Form:C1466.critereRole.Nom:=""
		Form:C1466.critereRole.Genre:=""
		Form:C1466.critereRole.Pays:=""
		Form:C1466.critereRole.Domaine:=""
		Form:C1466.critereRole.Age:=""
		Form:C1466.critereRole.DateO:=""
		
		If (Form:C1466.action="INIT")
			// trop long à tout charger: 
			//charger_LesRoles
			Form:C1466.role_es:=Null:C1517
		End if 
End case 
