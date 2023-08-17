//%attributes = {}
//charger_unRole

//se déplacer dans la liste box de page  1
Form:C1466.posRoleSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.role_es.length; Form:C1466.posRoleSel_i)

// après mise à jour du "Form.eleCou...Pos", blanchir "Form.action" (car utilisé dans déplacement pg2 et pg3)
Form:C1466.action:="MODIFIER"

If (Form:C1466.posRoleSel_i>0)
	//les info sur le role sélectionné: pour affichage détail
	//-role
	Form:C1466.role_e:=Form:C1466.role_es[Form:C1466.posRoleSel_i-1]  //si position=1, alors indice=0
	//-dépendances du role
	Form:C1466.qui_e:=Form:C1466.role_e.qui
	Form:C1466.quoi_e:=Form:C1466.role_e.quoi
	Form:C1466.rolesDuQui_es:=Form:C1466.qui_e.roles.orderBy("quoi.Date")
	Form:C1466.rolesDuQuoi_es:=Form:C1466.quoi_e.roles.orderBy("qui.DateNaiss")
	Form:C1466.message:="Info sur le role de '"+Form:C1466.qui_e.FullName+"'"+" dans '"+Form:C1466.quoi_e.Nom+"'"
End if 
