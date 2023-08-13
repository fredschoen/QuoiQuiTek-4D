//%attributes = {}
// charger_lesQuis
C_TEXT:C284($texteQuery)
$texteQuery:=_f_traduireArgQuery("FullName"; "texte"; Form:C1466.critereQuiListe.FullName)
$texteQuery:=$texteQuery+_f_traduireArgQuery("Genre"; "texte"; Form:C1466.critereQuiListe.Genre; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Pays"; "texte"; Form:C1466.critereQuiListe.Pays; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("AnneeNaiss"; "texte"; Form:C1466.critereQuiListe.DateNaiss; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("AnneeDeces"; "texte"; Form:C1466.critereQuiListe.DateDeces; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Domaine"; "texte"; Form:C1466.critereQuiListe.Domaine; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Style"; "texte"; Form:C1466.critereQuiListe.Style; Length:C16($texteQuery))

C_OBJECT:C1216($liste)
If ($texteQuery>"")
	
	//cas particulier du Fullname (avec apostrophe)
	If (Form:C1466.critereQuiListe.FullName>"")
		C_TEXT:C284($operateurCritereFullName; $valeurCritereFullName)
		Case of 
			: ((Substring:C12(Form:C1466.critereQuiListe.FullName; 1; 2)="<=")\
				 | (Substring:C12(Form:C1466.critereQuiListe.FullName; 1; 2)=">="))
				$operateurCritereFullName:=Substring:C12(Form:C1466.critereQuiListe.FullName; 1; 2)
				$valeurCritereFullName:=Substring:C12(Form:C1466.critereQuiListe.FullName; 3; Length:C16(Form:C1466.critereQuiListe.FullName))
				
			: ((Substring:C12(Form:C1466.critereQuiListe.FullName; 1; 1)="=")\
				 | (Substring:C12(Form:C1466.critereQuiListe.FullName; 1; 1)=">")\
				 | (Substring:C12(Form:C1466.critereQuiListe.FullName; 1; 1)="<")\
				 | (Substring:C12(Form:C1466.critereQuiListe.FullName; 1; 1)="#")\
				)
				$operateurCritereFullName:=Substring:C12(Form:C1466.critereQuiListe.FullName; 1; 1)
				$valeurCritereFullName:=Substring:C12(Form:C1466.critereQuiListe.FullName; 2; Length:C16(Form:C1466.critereQuiListe.FullName))
				
			Else 
				$operateurCritereFullName:="="
				$valeurCritereFullName:=Form:C1466.critereQuiListe.FullName
				
		End case 
		
		If ($operateurCritereFullName="=")
			//encadrer le critère texte (début et fin)
			//(sans le "'" ... KO <= $valeurCritereNom:="'"+$valeurCritereNom+"@'"
			$valeurCritereFullName:=$valeurCritereFullName+"@"
		End if 
		
		$liste:=ds:C1482.Qui.query($texteQuery; $valeurCritereFullName)
	Else 
		$liste:=ds:C1482.Qui.query($texteQuery)
	End if 
	
Else 
	$liste:=ds:C1482.Qui.all()
End if 

Form:C1466.qui_es:=$liste.orderBy("FullName")
