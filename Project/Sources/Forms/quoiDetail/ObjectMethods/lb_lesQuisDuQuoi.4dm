//lb_lesQuisDuQuoi
var $pourSelectionner_b : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.roleSel_e)

If ($pourSelectionner_b)
	$form_o:=New object:C1471
	$form_o.page:=1
	$form_o.action:="MODIFIER"
	$form_o.role_e:=Form:C1466.roleSel_e
	$form_o.role_es:=Form:C1466.role_es
	$form_o.posRoleSel_i:=Form:C1466.posRoleSel_i
	
	dialoguer("roleDetailDuQuoi"; $form_o)
	Form:C1466.role_es:=Form:C1466.role_es
	
End if 
