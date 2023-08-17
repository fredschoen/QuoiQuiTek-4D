//lb_lesQuisDuQuoi
var $pourSelectionner_b : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.roleQuiSel_e)

If ($pourSelectionner_b)
	
	$form_o:=New object:C1471()
	$form_o.action:="MODIFIER"
	$form_o.page:=1
	$form_o.qui_e:=Form:C1466.roleQuiSel_e.qui
	
	dialoguer("quiDetail"; $form_o)
	
End if 
