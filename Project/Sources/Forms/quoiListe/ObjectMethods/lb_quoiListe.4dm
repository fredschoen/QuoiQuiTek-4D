//lb_quoiListe
var $pourSelectionner_b : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.quoiSel_e)

If ($pourSelectionner_b)
	C_LONGINT:C283($win_l)
	$win_l:=Open form window:C675("quoiDetail")
	MAXIMIZE WINDOW:C453($win_l)
	$form_o:=New object:C1471
	$form_o.action:="MODIFIER"
	$form_o.page:=1
	$form_o.quoi_es:=Form:C1466.quoi_es
	$form_o.posQuoiSel_i:=Form:C1466.posQuoiSel_i
	$form_o.utilisationListe:=Form:C1466.utilisationListe
	
	dialoguer("quoiDetail"; $form_o)
	
End if 
