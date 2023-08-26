//bAnneePlus

var $annee_i : Integer

If (Length:C16(Form:C1466.critereQuiListe.DateNaiss)>3)  //si on annee 9999 saisie
	//ajuter 1 an au critère
	$annee_i:=_anneeDeDateText(Form:C1466.critereQuiListe.DateNaiss)+1
	If (Length:C16(Form:C1466.critereQuiListe.DateNaiss)>4)
		//+ 1 sur l'année uniquement, mois inchangé
		Form:C1466.critereQuiListe.DateNaiss:=String:C10($annee_i)+Substring:C12(Form:C1466.critereQuiListe.DateNaiss; 5; Length:C16(Form:C1466.critereQuiListe.DateNaiss))
	Else 
		//+ 1 sur la valeur numérique (siècle, décade..)
		Form:C1466.critereQuiListe.DateNaiss:=String:C10($annee_i)
	End if 
	//charger
	charger_LesQuis
End if 

// pour test: *
//LISTBOX SORT COLUMNS(*; "quoiListe_LB"; (2); >)
