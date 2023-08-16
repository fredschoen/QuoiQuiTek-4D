//btAjouterRole
var $form_o : Object

If (Form:C1466.action="AJOUTER")
	//MESSAGE("avant d'ajouter un role, veuillez sauvegarder ce ...") // KO
	Form:C1466.message:="avant d'ajouter un role, veuillez sauvegarder ce nouvel qui"
	
Else 
	afficherQuoiListe("AJOUTER_ROLE"; Form:C1466.qui_e.ID)
	//raffraichir l'écran
	$form_o:=Form:C1466
	$form_o:=charger_unQui($form_o)
	Form:C1466:=$form_o
	
End if 