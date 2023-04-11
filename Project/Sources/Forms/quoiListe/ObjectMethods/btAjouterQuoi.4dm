//btAjouterQuoi

Form:C1466.action:="AJOUTER"
Form:C1466.quoi:=New object:C1471("Annee"; 0; "Genre"; ""; "ID"; 0; "Pays"; ""; "Prod"; ""; "Real"; ""; "Stock"; ""; "Domaine"; "DateDernVisu")
Form:C1466.roleListe:=New collection:C1472  //fred (vider la collection chargée "plus tot dans l'exec")

//Form.eleCouQuoiPos:=1  // pour éviter les pb sur eleCouQuoiPos lors de suivant/précédent en page 2
Form:C1466.eleCouQuoiPos:=0  // pour signifier que dans detailQuoi on est en AJPOUTER

//visibilité des boutons de navigation
visibleBtNavig

//page détail
Form:C1466.page:=2  // noter le n° de page
FORM GOTO PAGE:C247(Form:C1466.page)
