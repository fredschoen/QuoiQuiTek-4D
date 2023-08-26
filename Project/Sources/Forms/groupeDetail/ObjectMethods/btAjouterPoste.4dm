//btAjouterRole

If (Form:C1466.action="AJOUTER")
	//MESSAGE("avant d'ajouter un role, veuillez sauvegarder ce nouveau quoi")
	Form:C1466.message:="avant d'ajouter un role, veuillez sauvegarder ce nouveau quoi"
	
Else 
	afficherQuiListe("AJOUTER_POSTE"; Form:C1466.groupe_e.ID)
	//raffraichir l'écran détail
	//charger_unRoleGroupe
	charger_unGroupe
End if 