//btSuivant

Form:C1466.action:="SUIVANT"
charger_unRole

If (Form:C1466.filtrePhoto_b)
	While (Form:C1466.photoRole_i=Null:C1517)
		//charger (dont déplacer)
		charger_unRole()
	End while 
End if 
