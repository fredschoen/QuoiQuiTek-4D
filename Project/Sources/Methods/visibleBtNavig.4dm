//%attributes = {}
//visibleBtNavig
// boutons "suivant/preced/.." non visibles si "AJOUT" (dans page 2 "détail")
// ... laisser (Form.utilisationListe#"AJOUTER_ROLE") parce que lors les navigations, les ..eleCou.. ne sont pas mis à jour
//      -> TODO: mettre à jour les ..eleCou lors des navgations

OBJECT SET VISIBLE:C603(*; "btSuivant@"; (Form:C1466.action#"AJOUTER") & (Form:C1466.utilisationListe#"AJOUTER_ROLE"))
OBJECT SET VISIBLE:C603(*; "btPrecedent@"; (Form:C1466.action#"AJOUTER") & (Form:C1466.utilisationListe#"AJOUTER_ROLE"))
OBJECT SET VISIBLE:C603(*; "btPremier@"; (Form:C1466.action#"AJOUTER") & (Form:C1466.utilisationListe#"AJOUTER_ROLE"))
OBJECT SET VISIBLE:C603(*; "btDernier@"; (Form:C1466.action#"AJOUTER") & (Form:C1466.utilisationListe#"AJOUTER_ROLE"))

//supprimer
OBJECT SET VISIBLE:C603(*; "btSupprimer@"; (Form:C1466.action#"AJOUTER"))

// bouton "selectionner qui" uniquement si "ajouter role" (dans page 2 "détail")
OBJECT SET VISIBLE:C603(*; "btSelectionner@"; ((Form:C1466.utilisationListe="AJOUTER_ROLE") & (Form:C1466.action#"AJOUTER")))

//btAjouterRole présent dans "détail quoi" et "détail qui" : ne pas ajouter role quoi quand on ajoute role qui, 
//et inversement
OBJECT SET VISIBLE:C603(*; "btAjouterRole"; (Form:C1466.utilisationListe#"AJOUTER_ROLE"))
