//lb_lesQuoisDuQui
var $pourSelectionner_b : Boolean
var $role_es : cs:C1710.RoleSelection
var $form_o : Object

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.roleDuQuiSel_e)

If ($pourSelectionner_b)
	$form_o:=New object:C1471()
	$form_o.action:="MODIFIER"
	$form_o.page:=1
	//1 seul quoi dans es
	$form_o.quoi_es:=ds:C1482.Quoi.query("ID = :1"; Form:C1466.roleDuQuiSel_e.quoi.ID)
	$form_o.posQuoiSel_i:=1
	
	dialoguer("quoiDetail"; $form_o)
End if 
