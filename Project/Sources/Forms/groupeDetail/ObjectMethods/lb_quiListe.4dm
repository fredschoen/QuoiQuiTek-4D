//lb_quiListe
var $pourSelectionner_b : Boolean

$pourSelectionner_b:=_f_pourSelectionner(FORM Event:C1606.code; Form:C1466.posteSel_e)

If ($pourSelectionner_b)
	
	$form_o:=New object:C1471
	$form_o.page:=1
	$form_o.action:="MODIFIER"
	$form_o.poste_e:=Form:C1466.posteSel_e
	$form_o.poste_es:=Form:C1466.poste_es
	$form_o.posPosteSel_i:=Form:C1466.posPosteSel_i
	dialoguer("posteDetailQui"; $form_o)
	
End if 
