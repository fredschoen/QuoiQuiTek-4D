//btSupprimerQui
CONFIRM:C162("supprimer le qui?")
If (OK=1)
	supprimerQui
	Form:C1466.quiDropped_b:=True:C214
	ACCEPT:C269
End if 