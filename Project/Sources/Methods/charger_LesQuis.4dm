//%attributes = {}
// charger_LesQuis
C_TEXT:C284($texteQuery)
$texteQuery:=_f_traduireArgQuery("Nom"; "texte"; Form:C1466.critereQuiListe.Nom)
$texteQuery:=$texteQuery+_f_traduireArgQuery("Genre"; "texte"; Form:C1466.critereQuiListe.Genre; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Pays"; "texte"; Form:C1466.critereQuiListe.Pays; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("AnneeNaiss"; "nombre"; Form:C1466.critereQuiListe.AnneeNaiss; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("AnneeDeces"; "nombre"; Form:C1466.critereQuiListe.AnneeDeces; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Domaine"; "texte"; Form:C1466.critereQuiListe.Domaine; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Style"; "texte"; Form:C1466.critereQuiListe.Style; Length:C16($texteQuery))

C_OBJECT:C1216($liste)
If ($texteQuery>"")
	
	If (Form:C1466.critereQuiListe.Nom>"")
		//TODO: créer une fonction avec une sortie = tableau de 2 TEXTE (et urbaniser avec "_f_traduireArgQuery")
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
		
		$liste:=ds:C1482.Qui.query($texteQuery; $valeurCritereNom).orderBy("Nom")
	Else 
		$liste:=ds:C1482.Qui.query($texteQuery).orderBy("Nom").orderBy("Nom")
	End if 
	
Else 
	$liste:=ds:C1482.Qui.all().orderBy("Nom")
End if 

Form:C1466.quiListe:=$liste
