//%attributes = {}
//charger_unRoleDeQui

//les info sur le Role sélectionné: pour affichage détail
C_LONGINT:C283($ind)
$ind:=Form:C1466.eleCouRolePos-1  //l'index commence à 0 , la position à 1
Form:C1466.quoi:=Form:C1466.roleListe[$ind].quoi
Form:C1466.role:=Form:C1466.roleListe[$ind].role

Form:C1466.quiDeQuoi:=charger_lesRolesDeQuoi(Form:C1466.quoi)


