var $pourSelectionner_b : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.roleSel_e)

If ($pourSelectionner_b)
	
	$form_o:=New object:C1471
	$form_o.page:=1
	$form_o.action:="MODIFIER"
	$form_o.role_es:=Form:C1466.role_es
	$form_o.posRoleSel_i:=Form:C1466.posRoleSel_i
	$form_o.roleDropped_b:=False:C215
	dialoguer("roleDetail"; $form_o)
	If ($form_o.roleDropped_b)
		Form:C1466.role_es:=Form:C1466.role_es.query("Descr > :1"; " ")  // pour prendre en compte les "supprimer"
	End if 
End if 
