//btAjouterQui
Form:C1466.action:="AJOUTER"

//charger à vide
Form:C1466.qui:=New object:C1471("ID"; 0; "Nom"; ""; "Genre"; ""; "Pays"; ""; "AnneeNaiss"; 0; "AnneeDeces"; 0)
Form:C1466.role_es:=New collection:C1472

//visibilité des boutons de navigation
visibleBtNavig

//page détail
Form:C1466.page:=2  // noter le n° de page
FORM GOTO PAGE:C247(Form:C1466.page)
