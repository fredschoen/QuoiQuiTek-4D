//%attributes = {}
//visibleBtNavig
//$1; $length: integer
var $1; $length : Integer

If (Count parameters:C259>0)
	$length:=$1
Else 
	$length:=0
End if 


// boutons "suivant/preced/.." non visibles si "AJOUT" (dans page 2 "détail")
OBJECT SET VISIBLE:C603(*; "btSuivant@"; (Form:C1466.action#"AJOUTER") & ($length>1))
OBJECT SET VISIBLE:C603(*; "btPrecedent@"; (Form:C1466.action#"AJOUTER") & ($length>1))
OBJECT SET VISIBLE:C603(*; "btPremier@"; (Form:C1466.action#"AJOUTER") & ($length>1))
OBJECT SET VISIBLE:C603(*; "btDernier@"; (Form:C1466.action#"AJOUTER") & ($length>1))

//bouton supprimer
OBJECT SET VISIBLE:C603(*; "btSupprimer@"; (Form:C1466.action#"AJOUTER"))

// bouton "selectionner qui" uniquement si "ajouter role" (dans page 2 "détail")
OBJECT SET VISIBLE:C603(*; "btSelectionner@"; ((Substring:C12(Form:C1466.utilisationListe; 1; 8)="AJOUTER_") & (Form:C1466.action#"AJOUTER")))

//btAjouterRole présent dans "détail quoi" et "détail qui" : ne pas ajouter role quoi quand on ajoute role qui, 
//et inversement
OBJECT SET VISIBLE:C603(*; "btAjouterRole"; (Form:C1466.utilisationListe#"AJOUTER_ROLE"))
