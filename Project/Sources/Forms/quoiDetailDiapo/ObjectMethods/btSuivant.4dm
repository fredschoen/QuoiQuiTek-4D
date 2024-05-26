//btSuivant

Form:C1466.action:="SUIVANT"
//se déplacer dans la liste
Form:C1466.posQuoiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.quoi_es.length; Form:C1466.posQuoiSel_i)
//charger
charger_unQuoi()

If (Form:C1466.filtrePhoto_b)
	While (Form:C1466.photoQuoi_i=Null:C1517)
		Form:C1466.posQuoiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.quoi_es.length; Form:C1466.posQuoiSel_i)
		//charger
		charger_unQuoi()
	End while 
End if 
