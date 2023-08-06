//formulaire roleListe
Case of 
		
	: (Form event code:C388=On Unload:K2:2)
		CONFIRM:C162("sortir du détail du role ?")
		If (OK=1)
			//"escape" sur page 1 =>sortir de l'écran
			//idem btQuitter
			Form:C1466.page:=0
			CANCEL:C270
		End if 
		
End case 