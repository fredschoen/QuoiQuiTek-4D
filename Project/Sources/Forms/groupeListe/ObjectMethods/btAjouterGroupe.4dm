//btAjouterGroupe

$form_o:=New object:C1471()
$form_o.page:=1
$form_o.action:="AJOUTER"
$form_o.groupe_e:=ds:C1482.Groupe.new()
$form_o.groupe_es:=New collection:C1472
$form_o.posGroupeSel_i:=0

dialoguer("groupeDetail"; $form_o)
