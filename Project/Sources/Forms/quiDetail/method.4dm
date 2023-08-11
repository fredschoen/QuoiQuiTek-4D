//formulaire quoiDetail
Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		Form:C1466.page:=1
		Form:C1466.quiDeQuoi:=charger_lesQuoisDuQui(Form:C1466.qui)
		
	: (Form event code:C388=On Unload:K2:2)
		CONFIRM:C162("sortir du détail du qui ?")
		If (OK=1)
			Form:C1466.page:=0
			CANCEL:C270
		End if 
		
End case 