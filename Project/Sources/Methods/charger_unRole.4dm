//%attributes = {}
//charger_unRole
var $anneeQuoi : Integer

//visibilité des boutons de navigation
visibleBtNavig

// en plus: ne pas afficher les boutons si la liste = 0 ou 1 element, ou si on a ajouté cet role
If ((Form:C1466.role_es.length<2)\
 | (Form:C1466.posRoleSel_i=0))
	OBJECT SET VISIBLE:C603(*; "btSuivant@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "btPrecedent@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "btPremier@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "btDernier@"; False:C215)
	
End if 

//se déplacer dans la liste box de page  1

//par défaut, on ne bouge pas
Form:C1466.posRoleSel_i:=Form:C1466.posRoleSel_i

Case of 
	: (Form:C1466.action="PREMIER")
		Form:C1466.posRoleSel_i:=1
		
	: (Form:C1466.action="PRECEDENT")
		If (Form:C1466.posRoleSel_i>1)
			Form:C1466.posRoleSel_i:=Form:C1466.posRoleSel_i-1
		Else 
			Form:C1466.posRoleSel_i:=Form:C1466.role_es.length
		End if 
		
	: (Form:C1466.action="SUIVANT")
		If (Form:C1466.posRoleSel_i<Form:C1466.role_es.length)
			Form:C1466.posRoleSel_i:=Form:C1466.posRoleSel_i+1
		Else 
			Form:C1466.posRoleSel_i:=1
		End if 
		
	: (Form:C1466.action="DERNIER")
		Form:C1466.posRoleSel_i:=Form:C1466.role_es.length
		
End case 

// après mise à jour du "Form.eleCou...Pos", blanchir "Form.action" (car utilisé dans déplacement pg2 et pg3)
Form:C1466.action:="MODIFIER"

//"Form.role_es" est vide: aucun role trouvé suivant les critères, \
du coup l'utilisateur en crée un mais la liste reste vide.... CQFD 
If ((Form:C1466.role_es.length=0)\
 | (Form:C1466.posRoleSel_i=0))
Else 
	//les info sur le role sélectionné: pour affichage détail
	C_LONGINT:C283($ind)
	$ind:=Form:C1466.posRoleSel_i-1  //si position=1, alors indice=0
	//role
	$role_es:=ds:C1482.Role.query("ID=:1"; Form:C1466.role_es[$ind].ID)
	$role_e:=$role_es.first()
	Form:C1466.role:=$role_e
	//dépendances
	Form:C1466.qui:=Form:C1466.role.qui
	Form:C1466.quoi:=Form:C1466.role.quoi
	Form:C1466.rolesDuQui_es:=Form:C1466.qui.roles
	Form:C1466.rolesDuQuoi_es:=Form:C1466.quoi.roles
End if 

//mémoriser le nouvel élément courant
Form:C1466.roleSel_e:=Form:C1466.role_es[$ind]
