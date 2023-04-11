//btSupprimerRole
CONFIRM:C162("supprimer le role ?")
If (OK=1)
	supprimerRole
	charger_unQuoi
	atteindrePageDetail
End if 
