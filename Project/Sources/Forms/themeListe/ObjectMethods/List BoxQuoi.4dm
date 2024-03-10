var $pourSelectionner_b : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.quiSel_e)

If ($pourSelectionner_b)
	
	$form_o:=New object:C1471
	$form_o.page:=1
	$form_o.action:="MODIFIER"
	$form_o.quoi_es:=Form:C1466.quoi_es
	$form_o.posQuoiSel_i:=Form:C1466.posQuoiSel_i
	$form_o.quoiDropped_b:=False:C215
	dialoguer("quoiDetail"; $form_o)
	If ($form_o.quoiDropped_b)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.query("Nom > :1"; " ")  // pour prendre en compte les "supprimer"
	End if 
End if 
