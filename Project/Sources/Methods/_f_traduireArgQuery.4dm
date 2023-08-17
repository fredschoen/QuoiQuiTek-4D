//%attributes = {}
//_f_traduireArgQuery
C_TEXT:C284($0; $1; $2; $3; $tmp)
C_LONGINT:C283($4)

C_TEXT:C284($nomCritere; $typeCritere; $operateurCritere; $valeurCritere; $valeurSaisie; $critereTraduitPourQuery)
C_LONGINT:C283($tailleQuery)
$nomCritere:=$1
$typeCritere:=$2
$valeurSaisie:=$3
$tailleQuery:=$4
$i:=Length:C16($valeurSaisie)
If ($i=0)
	$critereTraduitPourQuery:=""
Else 
	
	Case of 
		: ((Substring:C12($valeurSaisie; 1; 2)="<=")\
			 | (Substring:C12($valeurSaisie; 1; 2)=">="))
			$operateurCritere:=Substring:C12($valeurSaisie; 1; 2)
			$valeurCritere:=Substring:C12($valeurSaisie; 3; Length:C16($valeurSaisie))
			
		: ((Substring:C12($valeurSaisie; 1; 1)="=")\
			 | (Substring:C12($valeurSaisie; 1; 1)=">")\
			 | (Substring:C12($valeurSaisie; 1; 1)="<")\
			 | (Substring:C12($valeurSaisie; 1; 1)="#"))
			
			$operateurCritere:=Substring:C12($valeurSaisie; 1; 1)
			$valeurCritere:=Substring:C12($valeurSaisie; 2; Length:C16($valeurSaisie))
			
		Else 
			$operateurCritere:="="
			$valeurCritere:=$valeurSaisie
			
	End case 
	
	If ($typeCritere="texte")
		//encadrer le critère texte (début et fin)
		$valeurCritere:="'"+$valeurCritere+"@'"
	Else 
		//numerique: 0 par defaut
		C_LONGINT:C283($Annee)
		$Annee:=Num:C11($valeurCritere)
		$valeurCritere:=String:C10($Annee)
	End if 
	
	//separateur d'argument de la phrase du query
	C_TEXT:C284($separateur)
	If ($tailleQuery=0)
		$separateur:=""
	Else 
		$separateur:=" and "
	End if 
	
	
	// pour nom, laisserD gérer l' injection (cf. l'apostrophe)
	
	If ((($nomCritere="FullName") | ($nomCritere="Nom")) & ($valeurCritere>""))  //m30128
		$valeurCritere:=":1"
	End if 
	
	//assembler
	//et finir l'argument par un " " (pour l'argument suivant)
	$critereTraduitPourQuery:=$separateur+$nomCritere+$operateurCritere+$valeurCritere+" "
End if 



$0:=$critereTraduitPourQuery