//%attributes = {}
// charger_LesQuois

C_TEXT:C284($texteQuery)

If (Form:C1466.critereQuoiListe.Nom>"")
	$texteQuery:="Nom=:1"
Else 
	$texteQuery:=""
End if 

$texteQuery:=_f_traduireArgQuery("Nom"; "texte"; Form:C1466.critereQuoiListe.Nom)
$texteQuery:=$texteQuery+_f_traduireArgQuery("Genre"; "texte"; Form:C1466.critereQuoiListe.Genre; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Pays"; "texte"; Form:C1466.critereQuoiListe.Pays; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Stock"; "texte"; Form:C1466.critereQuoiListe.Stock; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Real"; "texte"; Form:C1466.critereQuoiListe.Real; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Annee"; "texte"; Form:C1466.critereQuoiListe.Annee; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("DateDernVisu"; "texte"; Form:C1466.critereQuoiListe.DateDernVisu; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Domaine"; "texte"; Form:C1466.critereQuoiListe.Domaine; Length:C16($texteQuery))
$texteQuery:=$texteQuery+_f_traduireArgQuery("Qualif"; "texte"; Form:C1466.critereQuoiListe.Qualif; Length:C16($texteQuery))

C_OBJECT:C1216($liste)
If ($texteQuery>"")
	//$liste:=ds.Quoi.query($texteQuery).orderBy("Nom")
	If (Form:C1466.critereQuoiListe.Nom>"")
		//$liste:=ds.Quoi.query($texteQuery; Form.critereQuoiListe.Nom+"@").orderBy("Nom")
		
		//TODO: créer une fonction avec une sortie = tableau de 2 TEXTE (et urbaniser avec "_f_traduireArgQuery")
		C_TEXT:C284($operateurCritereNom; $valeurCritereNom)
		Case of 
			: ((Substring:C12(Form:C1466.critereQuoiListe.Nom; 1; 2)="<=")\
				 | (Substring:C12(Form:C1466.critereQuoiListe.Nom; 1; 2)=">="))
				$operateurCritereNom:=Substring:C12(Form:C1466.critereQuoiListe.Nom; 1; 2)
				$valeurCritereNom:=Substring:C12(Form:C1466.critereQuoiListe.Nom; 3; Length:C16(Form:C1466.critereQuoiListe.Nom))
				
			: ((Substring:C12(Form:C1466.critereQuoiListe.Nom; 1; 1)="=")\
				 | (Substring:C12(Form:C1466.critereQuoiListe.Nom; 1; 1)=">")\
				 | (Substring:C12(Form:C1466.critereQuoiListe.Nom; 1; 1)="<")\
				 | (Substring:C12(Form:C1466.critereQuoiListe.Nom; 1; 1)="#")\
				)
				$operateurCritereNom:=Substring:C12(Form:C1466.critereQuoiListe.Nom; 1; 1)
				$valeurCritereNom:=Substring:C12(Form:C1466.critereQuoiListe.Nom; 2; Length:C16(Form:C1466.critereQuoiListe.Nom))
				
			Else 
				$operateurCritereNom:="="
				$valeurCritereNom:=Form:C1466.critereQuoiListe.Nom
				
		End case 
		
		If ($operateurCritereNom="=")
			//encadrer le critère texte (début et fin)
			//(sans le "'" ... KO <= $valeurCritereNom:="'"+$valeurCritereNom+"@'"
			$valeurCritereNom:=$valeurCritereNom+"@"
		End if 
		
		$liste:=ds:C1482.Quoi.query($texteQuery; $valeurCritereNom).orderBy("Nom")
	Else 
		$liste:=ds:C1482.Quoi.query($texteQuery).orderBy("Nom").orderBy("Nom")
	End if 
	
Else 
	$liste:=ds:C1482.Quoi.all().orderBy("Nom")
End if 


Form:C1466.quoiListe:=$liste
// pour test: LISTBOX TRIER COLONNES(*; "quoiListe_LB"; (2); >)