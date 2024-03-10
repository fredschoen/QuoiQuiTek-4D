//themeListe
If (Form event code:C388=On Load:K2:1)
	If (Undefined:C82(Form:C1466.theme_es))
		Form:C1466.theme_es:=ds:C1482.Theme.all().orderBy("Nom")
	End if 
	OBJECT SET VISIBLE:C603(*; "bSelTheme"; Not:C34((Undefined:C82(Form:C1466.ID_Theme))))
	OBJECT SET VISIBLE:C603(*; "bAnnul"; Not:C34((Undefined:C82(Form:C1466.ID_Theme))))
	
End if 
If (Form event code:C388=On Unload:K2:2)
	Form:C1466.page:=0
End if 
