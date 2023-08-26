//btSupprimerQuoi
CONFIRM:C162("supprimer le Quoi ?")
If (OK=1)
	supprimerQuoi
	charger_LesQuois
	ACCEPT:C269
End if 