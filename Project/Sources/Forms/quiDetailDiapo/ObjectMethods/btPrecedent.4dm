//btPrecedent
Form:C1466.action:="PRECEDENT"
//se déplacer dans la liste
Form:C1466.posQuiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.qui_es.length; Form:C1466.posQuiSel_i)
//charger
charger_unQui()


If (Form:C1466.filtrePhoto_b)
	While (Form:C1466.photoQui_i=Null:C1517)
		Form:C1466.posQuiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.qui_es.length; Form:C1466.posQuiSel_i)
		//charger
		charger_unQui()
	End while 
End if 
