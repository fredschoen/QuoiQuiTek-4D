//lb_quiListe
var $pourSelectionner_b : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.quiSel_e)

If ($pourSelectionner_b)
	
	$form_o:=New object:C1471
	$form_o.page:=1
	$form_o.action:="MODIFIER"
	$form_o.qui_es:=Form:C1466.qui_es
	$form_o.posQuiSel_i:=Form:C1466.posQuiSel_i
	$form_o.utilisationListe:=Form:C1466.utilisationListe
	Case of 
		: ($form_o.utilisationListe="AJOUTER_ROLE")
			$form_o.quoiID_ajouterRole:=Form:C1466.quoiID_ajouterRole  //pour AJOUTER_ROLE
		: ($form_o.utilisationListe="AJOUTER_POSTE")
			$form_o.quiGroupeID_ajouterPoste:=Form:C1466.quiGroupeID_ajouterPoste  //pour AJOUTER_POSTE
	End case 
	
	$form_o.quiDropped_b:=False:C215
	dialoguer("quiDetail"; $form_o)
	If ($form_o.quiDropped_b)
		Form:C1466.qui_es:=Form:C1466.qui_es.query("Nom > :1"; " ")  // pour prendre en compte les "supprimer"
	End if 
End if 
