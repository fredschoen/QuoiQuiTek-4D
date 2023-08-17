//lb_quiListe
var $pourSelectionner_b : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.groupeSel_e)

If ($pourSelectionner_b)
	
	$form_o:=New object:C1471
	$form_o.page:=1
	$form_o.action:="MODIFIER"
	$form_o.groupe_es:=Form:C1466.groupe_es
	$form_o.posGroupeSel_i:=Form:C1466.posGroupeSel_i
	$form_o.utilisationListe:=Form:C1466.utilisationListe
	$form_o.quoiID_ajouterRole:=Form:C1466.quoiID_ajouterRole  //pour AJOUTER_ROLE
	dialoguer("groupeDetail"; $form_o)
	
End if 
