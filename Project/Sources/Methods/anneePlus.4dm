//%attributes = {}
//anneePlus

var $annee_i : Integer

//ajuter 1 an au critère
$annee_i:=Num:C11(Form:C1466.critereQuoiListe.Annee)+1
If (Length:C16(Form:C1466.critereQuoiListe.Annee)>4)
	//+ 1 sur l'année uniquement, mois inchangé
	Form:C1466.critereQuoiListe.Annee:=String:C10($annee_i)+Substring:C12(Form:C1466.critereQuoiListe.Annee; 5; Length:C16(Form:C1466.critereQuoiListe.Annee))
Else 
	//+ 1 sur la valeur numérique (siècle, décade..)
	Form:C1466.critereQuoiListe.Annee:=String:C10($annee_i)
End if 
//charger
charger_lesQuois

// pour test: *
//LISTBOX SORT COLUMNS(*; "quoiListe_LB"; (2); >)
