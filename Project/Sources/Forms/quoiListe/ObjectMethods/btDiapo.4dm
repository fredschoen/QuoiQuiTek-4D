//btDiapo
var $pourSelectionner_b : Boolean

//par défaut, sélection de la 1ère entity de la sélection
If (Form:C1466.quoiSel_e=Null:C1517)
	If (Form:C1466.quoi_es=Null:C1517)
		return 
	End if 
	If (Form:C1466.quoiSel_es.length=0)
		return 
	End if 
	Form:C1466.quoiSel_e:=Form:C1466.quoi_es.first()
End if 
If (Form:C1466.posQuoiSel_i<1)
	Form:C1466.posQuoiSel_i:=1
End if 

//trier la liste
trier_QuoiListe

//nouvelle fenetre
$form_o:=New object:C1471
$form_o.action:="MODIFIER"
$form_o.page:=1
$form_o.quoi_es:=Form:C1466.quoi_es
$form_o.posQuoiSel_i:=Form:C1466.posQuoiSel_i

dialoguer("quoiDetailDiapo"; $form_o)

