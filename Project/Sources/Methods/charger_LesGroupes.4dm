//%attributes = {}
// charger_LesGroupes
var $groupe_es : cs:C1710.GroupeSelection
var $texteQuery : Text

$texteQuery:=""
$texteQuery:=$texteQuery+_f_traduireArgQuery("Nom"; "texte"; Form:C1466.critereGroupeListe.Nom)

If ($texteQuery>"")
	//$liste:=ds.Groupe.query($texteQuery).orderBy("Nom")
	If (Form:C1466.critereGroupeListe.Nom>"")
		C_TEXT:C284($operateurCritereNom; $valeurCritereNom)
		Case of 
			: ((Substring:C12(Form:C1466.critereGroupeListe.Nom; 1; 2)="<=")\
				 | (Substring:C12(Form:C1466.critereGroupeListe.Nom; 1; 2)=">="))
				$operateurCritereNom:=Substring:C12(Form:C1466.critereGroupeListe.Nom; 1; 2)
				$valeurCritereNom:=Substring:C12(Form:C1466.critereGroupeListe.Nom; 3; Length:C16(Form:C1466.critereGroupeListe.Nom))
				
			: ((Substring:C12(Form:C1466.critereGroupeListe.Nom; 1; 1)="=")\
				 | (Substring:C12(Form:C1466.critereGroupeListe.Nom; 1; 1)=">")\
				 | (Substring:C12(Form:C1466.critereGroupeListe.Nom; 1; 1)="<")\
				 | (Substring:C12(Form:C1466.critereGroupeListe.Nom; 1; 1)="#")\
				)
				$operateurCritereNom:=Substring:C12(Form:C1466.critereGroupeListe.Nom; 1; 1)
				$valeurCritereNom:=Substring:C12(Form:C1466.critereGroupeListe.Nom; 2; Length:C16(Form:C1466.critereGroupeListe.Nom))
				
			Else 
				$operateurCritereNom:="="
				$valeurCritereNom:=Form:C1466.critereGroupeListe.Nom
				
		End case 
		
		If ($operateurCritereNom="=")
			//encadrer le critère texte (début et fin)
			//(sans le "'" ... KO <= $valeurCritereNom:="'"+$valeurCritereNom+"@'"
			$valeurCritereNom:=$valeurCritereNom+"@"
		End if 
		
		$groupe_es:=ds:C1482.Groupe.query($texteQuery; $valeurCritereNom)
	Else 
		$groupe_es:=ds:C1482.Groupe.query($texteQuery)
	End if 
	
Else 
	$groupe_es:=ds:C1482.Groupe.all()
End if 

Form:C1466.groupe_es:=$groupe_es.orderBy("Nom")
// pour test: LISTBOX TRIER COLONNES(*; "groupeListe_LB"; (2); >)