//bAgeMoins

var $annee_i : Integer

If (Length:C16(Form:C1466.critereRole.Age)>0)  //si on annee 9999 saisie
	//modifier critere
	Form:C1466.critereRole.Age:=String:C10(Num:C11(Form:C1466.critereRole.Age)-1)
	
	//charger
	charger_LesRoles
End if 
