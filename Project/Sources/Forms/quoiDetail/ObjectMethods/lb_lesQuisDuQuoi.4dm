//lb_lesQuisDuQuoi
var $pourSelectionner : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.roleSel_e)

If ($pourSelectionner)
	$form_o:=New object:C1471
	$form_o.page:=1
	$form_o.action:="MODIFIER"
	$form_o.role_e:=Form:C1466.roleSel_e
	$form_o.role_es:=Form:C1466.role_es
	$form_o.posRoleSel_i:=Form:C1466.posRoleSel_i
	
	dialoguer("roleDetail"; $form_o)
	
End if 
