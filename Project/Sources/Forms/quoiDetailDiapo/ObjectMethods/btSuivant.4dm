//btSuivant

Form:C1466.action:="SUIVANT"
//se déplacer dans la liste
Form:C1466.posQuoiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.quoi_es.length; Form:C1466.posQuoiSel_i)
//charger
charger_unQuoi()

If (Form:C1466.filtrePhoto_b)
	var $boucle_i : Integer
	$boucle_i:=0
	While (Form:C1466.photoQuoi_i=Null:C1517)
		$boucle_i+=1
		If ($boucle_i>999)
			ALERT:C41("pas de photo dans cette sélection")
			return 
		End if 
		Form:C1466.posQuoiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.quoi_es.length; Form:C1466.posQuoiSel_i)
		//charger
		charger_unQuoi()
	End while 
End if 
