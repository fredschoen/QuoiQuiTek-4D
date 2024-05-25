//btDiapo
var $pourSelectionner_b : Boolean

If (Form:C1466.quiSel_e=Null:C1517)
	If (Form:C1466.qui_es=Null:C1517)
		return 
	End if 
	If (Form:C1466.quiSel_es.length=0)
		return 
	End if 
	Form:C1466.quiSel_e:=Form:C1466.qui_es.first()
End if 
If (Form:C1466.posQuiSel_i<1)
	Form:C1466.posQuiSel_i:=1
	
End if 

//trier la liste
trier_QuiListe

//nouvelle fenetre
$form_o:=New object:C1471
$form_o.action:="MODIFIER"
$form_o.page:=1
$form_o.qui_es:=Form:C1466.qui_es
$form_o.posQuiSel_i:=Form:C1466.posQuiSel_i

dialoguer("quiDetailDiapo"; $form_o)

