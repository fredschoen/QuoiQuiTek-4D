//lb_lesQuoisDuQui
var $pourSelectionner : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.roleQuoiSel_e)

If ($pourSelectionner)
	$form_o:=New object:C1471()
	$form_o.action:="MODIFIER"
	$form_o.page:=1
	$form_o.quoi_e:=Form:C1466.roleQuoiSel_e.quoi
	$form_o.quoi_es:=Form:C1466.quoi_es
	dialoguer("quoiDetail"; $form_o)
End if 
