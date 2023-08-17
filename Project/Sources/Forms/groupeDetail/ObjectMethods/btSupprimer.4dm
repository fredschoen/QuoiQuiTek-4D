//btSupprimerQuoi
CONFIRM:C162("supprimer le groupe ?")
If (OK=1)
	supprimerGroupe
	charger_LesGroupes
	ACCEPT:C269
End if 