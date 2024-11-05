// roleListe.bDatePlus
//

If (Length:C16(Form:C1466.critereRole.DateO)>0)  //si on annee 9999 saisie
	//modifier critere
	Form:C1466.critereRole.DateO:=String:C10(Num:C11(Form:C1466.critereRole.DateO)+1; "0000")
	
	//charger
	charger_LesRoles
End if 
