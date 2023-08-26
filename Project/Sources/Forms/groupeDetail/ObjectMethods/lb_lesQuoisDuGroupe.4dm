//lb_lesQuoisDuQui
var $pourSelectionner_b : Boolean
var $role_es : cs:C1710.RoleSelection
var $form_o : Object

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.roleDuGroupeSel_e)

If ($pourSelectionner_b)
	$form_o:=New object:C1471()
	$form_o.action:="MODIFIER"
	$form_o.page:=1
	$form_o.quoi_e:=Form:C1466.roleDuGroupeSel_e.quoi
	$form_o.role_es:=Form:C1466.roleDuGroupe_es.orderBy("Descr")
	$form_o.posRoleSel_i:=Form:C1466.posRoleDuGroupeSel_i
	dialoguer("roleDetailQuoi"; $form_o)
End if 
