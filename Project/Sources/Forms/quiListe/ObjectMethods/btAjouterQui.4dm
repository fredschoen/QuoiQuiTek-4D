//btAjouterQui

$form_o:=New object:C1471()
$form_o.page:=1
$form_o.action:="AJOUTER"
$form_o.qui_e:=ds:C1482.Qui.new()
$form_o.qui_es:=New collection:C1472
$form_o.posQuiSel_i:=0
$form_o.utilisationListe:=Form:C1466.utilisationListe
$form_o.quoiID_ajouterRole:=Form:C1466.quoiID_ajouterRole
dialoguer("quiDetail"; $form_o)
