//btSupprimerRole
CONFIRM:C162("supprimer le role ?")
If (OK=1)
	supprimerRole
	atteindrePageDetail
	charger_unQui
End if 