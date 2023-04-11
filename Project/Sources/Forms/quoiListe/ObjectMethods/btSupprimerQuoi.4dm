//btSupprimerQuoi
CONFIRM:C162("supprimer le Quoi ?")
If (OK=1)
	supprimerQuoi
	charger_lesQuois
	atteindrePageListe
End if 