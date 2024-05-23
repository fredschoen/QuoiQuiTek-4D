//bDiapo
var $pourSelectionner_b : Boolean

If (Form:C1466.roleSel_e=Null:C1517)
	If (Form:C1466.role_es=Null:C1517)
		return 
	End if 
	If (Form:C1466.roleSel_es.length=0)
		return 
	End if 
	Form:C1466.roleSel_e:=Form:C1466.role_es.first()
End if 

$form_o:=New object:C1471
$form_o.action:="MODIFIER"
$form_o.page:=1
$form_o.role_es:=Form:C1466.role_es
$form_o.posRoleSel_i:=Form:C1466.posRoleSel_i

dialoguer("roleDetailDiapo"; $form_o)

