//%attributes = {}
// charger_lesQuis
var $qui_es : cs:C1710.QuiSelection
var $texteQuery : Text

$texteQuery:=""
$texteQuery:=$texteQuery+_f_traduireArgQuery("FullName"; "texte"; Form:C1466.critereQuiListe.FullName)
$texteQuery:=$texteQuery+_f_traduireArgQuery("Genre"; "texte"; Form:C1466.critereQuiListe.Genre; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Pays"; "texte"; Form:C1466.critereQuiListe.Pays; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("DateNaiss"; "texte"; Form:C1466.critereQuiListe.DateNaiss; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("DateDeces"; "texte"; Form:C1466.critereQuiListe.DateDeces; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Domaine"; "texte"; Form:C1466.critereQuiListe.Domaine; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Style"; "texte"; Form:C1466.critereQuiListe.Style; Length:C16($texteQuery))

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
		
		$qui_es:=ds:C1482.Qui.query($texteQuery; $valeurCritereFullName)
	Else 
		$qui_es:=ds:C1482.Qui.query($texteQuery)
	End if 
	
Else 
	$qui_es:=ds:C1482.Qui.all()
End if 

Form:C1466.qui_es:=$qui_es.orderBy("FullName")
