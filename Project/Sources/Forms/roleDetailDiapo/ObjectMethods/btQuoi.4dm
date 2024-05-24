//btQuoi
$form_o:=New object:C1471
$form_o.page:=1
$form_o.action:="MODIFIER"
$form_o.quoi_es:=ds:C1482.Quoi.query("ID = :1"; Form:C1466.role_e.ID_Quoi)
$form_o.posQuoiSel_i:=1
$form_o.utilisationListe:=""
dialoguer("quoiDetail"; $form_o)
