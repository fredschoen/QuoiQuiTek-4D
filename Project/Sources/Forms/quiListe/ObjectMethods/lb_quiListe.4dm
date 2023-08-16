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
	dialoguer("quiDetail"; $form_o)
	
End if 
