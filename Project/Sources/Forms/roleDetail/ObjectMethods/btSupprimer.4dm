//btSupprimerRole
CONFIRM:C162("supprimer le role ?")
If (OK=1)
	supprimerRole
	charger_unRole
	atteindrePageDetail
End if 
