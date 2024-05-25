//%attributes = {}
// charger_lesQuis
var $qui_es : cs:C1710.QuiSelection
var $texteQuery : Text

$texteQuery:=""
$texteQuery:=$texteQuery+_f_traduireArgQuery("Nom"; "texte"; Form:C1466.critereQuiListe.Nom; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Prenom"; "texte"; Form:C1466.critereQuiListe.Prenom; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Genre"; "texte"; Form:C1466.critereQuiListe.Genre; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Pays"; "texte"; Form:C1466.critereQuiListe.Pays; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("DateNaiss"; "texte"; Form:C1466.critereQuiListe.DateNaiss; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("DateDeces"; "texte"; Form:C1466.critereQuiListe.DateDeces; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Domaine"; "texte"; Form:C1466.critereQuiListe.Domaine; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Style"; "texte"; Form:C1466.critereQuiListe.Style; Length:C16($texteQuery))

If ($texteQuery>"")
	
	//cas particulier du Nom (avec apostrophe)
	If (Form:C1466.critereQuiListe.Nom>"")
		C_TEXT:C284($operateurCritereNom; $valeurCritereNom)
		Case of 
			: ((Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 2)="<=")\
				 | (Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 2)=">="))
				$operateurCritereNom:=Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 2)
				$valeurCritereNom:=Substring:C12(Form:C1466.critereQuiListe.Nom; 3; Length:C16(Form:C1466.critereQuiListe.Nom))
				
			: ((Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 1)="=")\
				 | (Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 1)=">")\
				 | (Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 1)="<")\
				 | (Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 1)="#")\
				)
				$operateurCritereNom:=Substring:C12(Form:C1466.critereQuiListe.Nom; 1; 1)
				$valeurCritereNom:=Substring:C12(Form:C1466.critereQuiListe.Nom; 2; Length:C16(Form:C1466.critereQuiListe.Nom))
				
			Else 
				$operateurCritereNom:="="
				$valeurCritereNom:=Form:C1466.critereQuiListe.Nom
				
		End case 
		
		If ($operateurCritereNom="=")
			//encadrer le critère texte (début et fin)
			//(sans le "'" ... KO <= $valeurCritereNom:="'"+$valeurCritereNom+"@'"
			$valeurCritereNom:=$valeurCritereNom+"@"
		End if 
		
		$qui_es:=ds:C1482.Qui.query($texteQuery; $valeurCritereNom)
	Else 
		$qui_es:=ds:C1482.Qui.query($texteQuery)
	End if 
	
Else 
	$qui_es:=ds:C1482.Qui.all()
End if 

Form:C1466.qui_es:=$qui_es.orderBy("Nom")

//trier la liste
trier_QuiListe