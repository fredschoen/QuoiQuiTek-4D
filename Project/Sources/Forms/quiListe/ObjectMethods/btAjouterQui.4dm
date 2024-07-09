//btAjouterQui

$form_o:=New object:C1471()
$form_o.page:=1
$form_o.action:="AJOUTER"
$form_o.posQuiSel_i:=0
$form_o.utilisationListe:=Form:C1466.utilisationListe
$form_o.quoiID_ajouterRole:=Form:C1466.quoiID_ajouterRole
dialoguer("quiDetail"; $form_o)
If (Not:C34(Undefined:C82($form_o.addedQui_e)))
	If (Form:C1466.qui_es=Null:C1517)
		Form:C1466.qui_es:=ds:C1482.Qui.query("ID = :1"; $form_o.addedQui_e.ID)  // pour rendre l'entity selection "alterable"
	Else 
		Form:C1466.qui_es:=Form:C1466.qui_es.copy()  // pour rendre l'entity selection "alterable"
		Form:C1466.qui_es.add($form_o.addedQui_e)  //ajouter la nouvelle entity dans la sélection
	End if 
End if 
