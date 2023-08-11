//%attributes = {}
//charger_unRoleDeQuoi

//les info sur le Role sélectionné: pour affichage détail
C_LONGINT:C283($ind)
$ind:=Form:C1466.posRoleSel_i-1  //l'index commence à 0 , la position à 1
Form:C1466.role:=Form:C1466.role_es[$ind].role

//Form.qui:=Form.role_es[$ind].qui  //TODO: pas bon , simplifier (2 fois "qui")
$qui_es:=ds:C1482.Qui.query("ID=:1"; Form:C1466.role_es[$ind].qui.ID)
$qui_e:=$qui_es.first()
Form:C1466.qui:=$qui_e

Form:C1466.quoiDeQui:=charger_lesQuoisDuQui(Form:C1466.qui)

