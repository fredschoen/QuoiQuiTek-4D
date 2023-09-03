//%attributes = {}
// charger_lesQuis
var $qui_es : cs:C1710.QuiSelection
var $texteQuery : Text

$texteQuery:=""
$texteQuery:=$texteQuery+_f_traduireArgQuery("Nom"; "texte"; Form:C1466.critereQuiListe.Nom)
$texteQuery:=$texteQuery+_f_traduireArgQuery("Prenom"; "texte"; Form:C1466.critereQuiListe.Prenom)
$texteQuery:=$texteQuery+_f_traduireArgQuery("Genre"; "texte"; Form:C1466.critereQuiListe.Genre; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Pays"; "texte"; Form:C1466.critereQuiListe.Pays; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("DateNaiss"; "texte"; Form:C1466.critereQuiListe.DateNaiss; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("DateDeces"; "texte"; Form:C1466.critereQuiListe.DateDeces; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Domaine"; "texte"; Form:C1466.critereQuiListe.Domaine; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Style"; "texte"; Form:C1466.critereQuiListe.Style; Length:C16($texteQuery))

If ($texteQuery>"")
	
	//cas particulier du Nom (avec apostrophe)
	If (Form:C1466.critereQuiListe.Nom>"")
		C_TEXT:C284($operateurCritereFullName; $valeurCritereFullName)
		Case of 
			: ((Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 2)="<=")\
				 | (Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 2)=">="))
				$operateurCritereFullName:=Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 2)
				$valeurCritereFullName:=Substring:C12(Form:C1466.critereQuiListe.Nom; 3; Length:C16(Form:C1466.critereQuiListe.Nom))
				
			: ((Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 1)="=")\
				 | (Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 1)=">")\
				 | (Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 1)="<")\
				 | (Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 1)="#")\
				)
				$operateurCritereFullName:=Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 1)
				$valeurCritereFullName:=Substring:C12(Form:C1466.critereQuiListe.Nom; 2; Length:C16(Form:C1466.critereQuiListe.Nom))
				
			Else 
				$operateurCritereFullName:="="
				$valeurCritereFullName:=Form:C1466.critereQuiListe.Nom
				
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
