If (Form event code:C388=On Load:K2:1)
	Form:C1466.currentSelection:=ds:C1482.Parametre.all()
End if 

If (Form event code:C388=On Unload:K2:2)
	initStorageValueLists()
	confirmerSortieForm()
End if 