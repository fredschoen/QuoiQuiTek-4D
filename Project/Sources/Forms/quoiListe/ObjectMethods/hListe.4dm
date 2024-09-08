// quoiListe.hListe
//
$form_o:=New object:C1471
$form_o.domaine_t:=Form:C1466.critereQuoiListe.Domaine
dialoguer("hierListe"; $form_o)
If ($form_o.Niv0#Null:C1517)
	Form:C1466.critereQuoiListe.Genre:=$form_o.Niv0
End if 
If ($form_o.Niv1#Null:C1517)
	Form:C1466.critereQuoiListe.Pays:=$form_o.Niv1
End if 
