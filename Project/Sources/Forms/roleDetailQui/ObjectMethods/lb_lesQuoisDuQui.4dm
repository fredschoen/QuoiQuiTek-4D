//lb_lesQuoisDuQui
var $pourSelectionner_b : Boolean
var $role_es : cs:C1710.RoleSelection
var $form_o : Object

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.rolesDuQuiSel_e)

If ($pourSelectionner_b)
	$form_o:=New object:C1471()
	$form_o.action:="MODIFIER"
	$form_o.page:=1
	$form_o.role_e:=Form:C1466.rolesDuQuiSel_e
	$form_o.role_es:=Form:C1466.rolesDuQui_es
	$form_o.posRoleSel_i:=Form:C1466.posRolesDuQui_i
	
	dialoguer("roleDetailQuoi"; $form_o)
End if 
