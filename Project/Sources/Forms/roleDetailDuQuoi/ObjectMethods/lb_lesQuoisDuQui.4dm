//lb_lesQuoisDuQui
var $pourSelectionner_b : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.roleQuoiSel_e)

If ($pourSelectionner_b)
	$form_o:=New object:C1471()
	$form_o.action:="MODIFIER"
	$form_o.page:=1
	$form_o.quoi_e:=Form:C1466.roleQuoiSel_e.quoi
	var $role_es : cs:C1710.QuoiSelection
	$role_es.new()
	var $role_e : cs:C1710.QuoiEntity
	For each ($role_e; Form:C1466.role_es)
		$role_es.add($role_e)
	End for each 
	
	$form_o.quoi_es:=$role_es
	dialoguer("quoiDetail"; $form_o)
End if 
