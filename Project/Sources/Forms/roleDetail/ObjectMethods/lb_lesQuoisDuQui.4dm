//lb_lesQuoisDuQui
var $pourSelectionner_b : Boolean
var $role_es : cs:C1710.RoleSelection
var $form_o : Object

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.rolesDuQuiSel_e)

If ($pourSelectionner_b)
	$form_o:=New object:C1471()
	$form_o.action:="MODIFIER"
	$form_o.page:=1
	$form_o.quoi_e:=Form:C1466.rolesDuQuiSel_e.quoi
	var $role_es : cs:C1710.RoleSelection
	$role_es:=ds:C1482.Role.query("ID = :1"; $form_o.quoi_e.ID)
	$form_o.quoi_es:=$role_es
	dialoguer("quoiDetail"; $form_o)
End if 
