
If (Form:C1466.quiDeGroupeSel_e#"")
	$form_o:=New object:C1471
	$form_o.page:=1
	$form_o.action:="MODIFIER"
	
	$form_o.qui_es:=ds:C1482.Qui.query("ID = :1"; Form:C1466.quiDeGroupeSel_e.ID)
	$form_o.posQuiSel_i:=1
	$form_o.utilisationListe:=""
	dialoguer("quiDetail"; $form_o)
End if 