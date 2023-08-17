//btAjouterQuoi

$form_o:=New object:C1471()
$form_o.page:=1
$form_o.action:="AJOUTER"
$form_o.quoi_e:=ds:C1482.Quoi.new()
$form_o.quoi_es:=New collection:C1472
$form_o.posQuiSel_i:=0

dialoguer("quoiDetail"; $form_o)
