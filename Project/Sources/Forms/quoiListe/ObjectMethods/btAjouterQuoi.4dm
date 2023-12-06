//btAjouterQuoi

$form_o:=New object:C1471()
$form_o.page:=1
$form_o.action:="AJOUTER"
$form_o.utilisationListe:=Form:C1466.utilisationListe
$form_o.posQuoiSel_i:=0

dialoguer("quoiDetail"; $form_o)

If (Not:C34(Undefined:C82($form_o.addedQuoi_e)))
	If (Form:C1466.quoi_es#Null:C1517)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.copy()  // pour rendre l'entity selection "alterable"
		Form:C1466.quoi_es.add($form_o.addedQuoi_e)
	End if 
End if 