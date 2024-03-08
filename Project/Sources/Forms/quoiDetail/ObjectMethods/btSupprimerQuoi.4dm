//btSupprimerQuoi
CONFIRM:C162("supprimer le Quoi ?")
If (OK=1)
	supprimerQuoi
	Form:C1466.quoiDropped_b:=True:C214
	ACCEPT:C269
End if 