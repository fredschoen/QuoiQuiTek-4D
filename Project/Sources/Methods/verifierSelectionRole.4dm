//%attributes = {}
//verifierSelectionRole
//$1 critère et valeur de sélection
//$2 valeur à vérifier
//$3 état de la sélection
//$0 nouvel état de la sélection

var $0; $encoreSelectionne : Boolean
var $1; $critereSaisi : Text
var $2; $valeurStockee : Text
var $3; $dejaSelectionne : Boolean

$critereSaisi:=$1
$valeurStockee:=$2
$dejaSelectionne:=$3

///////////////////////////////
var $operateurCritere; $valeurCritere : Text
var $lenValeurCritere : Integer
var $lenValeurStockee : Integer
var $go : Boolean

//init
$go:=True:C214

//report du precedant résultat
$encoreSelectionne:=$dejaSelectionne

//inutile de verifier plus loin si la sélection est déjà rejetée
If (Not:C34($encoreSelectionne))
	$go:=False:C215
End if 

//inutile de verifier si le condition traitée n'a pas été saisie
If ($go)
	$go:=(Length:C16($critereSaisi)>0)  //continuer si critère saisi
End if 

//déterminer si le condition traitée est vraie ou fausse
If ($go)
	
	//1.séparer opérateur et valeur du critere
	Case of 
		: ((Substring:C12($critereSaisi; 1; 2)="<=")\
			 | (Substring:C12($critereSaisi; 1; 2)=">="))
			$operateurCritere:=Substring:C12($critereSaisi; 1; 2)
			$valeurCritere:=Substring:C12($critereSaisi; 3; Length:C16($critereSaisi))
			
		: ((Substring:C12($critereSaisi; 1; 1)="=")\
			 | (Substring:C12($critereSaisi; 1; 1)=">")\
			 | (Substring:C12($critereSaisi; 1; 1)="<")\
			 | (Substring:C12($critereSaisi; 1; 1)="#"))
			
			$operateurCritere:=Substring:C12($critereSaisi; 1; 1)
			$valeurCritere:=Substring:C12($critereSaisi; 2; Length:C16($critereSaisi))
			
		Else 
			$operateurCritere:="="
			$valeurCritere:=$critereSaisi
			
	End case 
	
	//2. évaluer la condition
	$lenValeurCritere:=Length:C16($valeurCritere)
	$lenValeurStockee:=Length:C16($valeurStockee)
	
	Case of 
		: ($operateurCritere="=")
			If ($lenValeurCritere>$lenValeurStockee)
				$encoreSelectionne:=False:C215
			Else 
				$encoreSelectionne:=(Substring:C12($valeurStockee; 1; $lenValeurCritere)=$ValeurCritere)
			End if 
		: ($operateurCritere=">=")
			$encoreSelectionne:=($valeurStockee>=$valeurCritere)
		: ($operateurCritere="<=")
			$encoreSelectionne:=($valeurStockee<=$valeurCritere)
		: ($operateurCritere=">")
			$encoreSelectionne:=($valeurStockee>$valeurCritere)
		: ($operateurCritere="<")
			$encoreSelectionne:=($valeurStockee<$valeurCritere)
			
	End case 
	
End if 

// sortie
$0:=$encoreSelectionne