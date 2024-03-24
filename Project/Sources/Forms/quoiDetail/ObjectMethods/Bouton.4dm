
$form_o:=New object:C1471
dialoguer("hierListe"; $form_o)
If ($form_o.Niv0#Null:C1517)
	Form:C1466.quoi_e.Genre:=$form_o.Niv0
End if 
If ($form_o.Niv1#Null:C1517)
	Form:C1466.quoi_e.Pays:=$form_o.Niv1
End if 
