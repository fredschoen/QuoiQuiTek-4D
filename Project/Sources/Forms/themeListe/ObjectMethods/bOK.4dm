//bOK
If (Form event code:C388=On Clicked:K2:4)
	
	If (Not:C34((Undefined:C82(Form:C1466.ID_Theme))))
		If (Form:C1466.theme_e=Null:C1517)
			ALERT:C41("selectionnez un thème")
			return 
		Else 
			Form:C1466.ID_Theme:=Form:C1466.theme_e.ID
		End if 
	End if 
	Form:C1466.page:=0  // 0 = quitter pour "dialoguer"
	
	ACCEPT:C269
	
End if 
