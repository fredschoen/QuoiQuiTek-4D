//btAjouterRole
var $form_o : Object

If (Form:C1466.action="AJOUTER")
	//MESSAGE("avant d'ajouter un role, veuillez sauvegarder ce nouveau quoi")
	Form:C1466.message:="avant d'ajouter un role, veuillez sauvegarder ce nouveau quoi"
	
Else 
	afficherQuiListe("AJOUTER_ROLE"; Form:C1466.quoi_e.ID)
	//raffraichir l'écran détail
	$form_o:=Form:C1466
	$form_o:=charger_unQuoi($form_o)
	Form:C1466:=$form_o
End if 