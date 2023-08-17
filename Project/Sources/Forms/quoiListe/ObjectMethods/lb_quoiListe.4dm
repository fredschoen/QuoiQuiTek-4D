//lb_quoiListe
var $pourSelectionner_b : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.quoiSel_e)

If ($pourSelectionner_b)
	$form_o:=New object:C1471
	$form_o.action:="MODIFIER"
	$form_o.page:=1
	$form_o.quoi_es:=Form:C1466.quoi_es
	$form_o.posQuoiSel_i:=Form:C1466.posQuoiSel_i
	$form_o.utilisationListe:=Form:C1466.utilisationListe
	$form_o.quiID_ajouterRole:=Form:C1466.quiID_ajouterRole  //pour AJOUTER_ROLE
	
	dialoguer("quoiDetail"; $form_o)
	
End if 
