//btAjouterQui

$form_o:=New object:C1471()
$form_o.page:=1
$form_o.action:="AJOUTER"
$form_o.qui_e:=ds:C1482.Qui.new()
$form_o.qui_es:=New collection:C1472
$form_o.posQuiSel_i:=0

dialoguer("quiDetail"; $form_o)
