//formulaire .role_es
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
		
		If (Form:C1466.action="INIT")
			charger_LesRoles
		End if 
End case 
