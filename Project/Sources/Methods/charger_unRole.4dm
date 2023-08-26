//%attributes = {}
//charger_unRole

//se déplacer dans la liste box de page  1
Form:C1466.posRoleSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.role_es.length; Form:C1466.posRoleSel_i)

If (Form:C1466.posRoleSel_i>0)
	//les info sur le role sélectionné: pour affichage détail
	//-role
	Form:C1466.role_e:=Form:C1466.role_es[Form:C1466.posRoleSel_i-1]  //si position=1, alors indice=0
	//-dépendances du role
	Form:C1466.quoi_e:=Form:C1466.role_e.quoi
	
	If (Undefined:C82(Form:C1466.role_e.qui))  //alors in est sur un groupe
		Form:C1466.groupe_e:=Form:C1466.role_e.groupe
		Form:C1466.roleDuQuoi_es:=Form:C1466.quoi_e.roles.orderBy("groupe.Nom")
		Form:C1466.message:="'"+Form:C1466.groupe_e.Nom+"'"+" dans '"+Form:C1466.quoi_e.Nom+"'"
		FORM GOTO PAGE:C247(2)
	Else 
		FORM GOTO PAGE:C247(1)
		Form:C1466.qui_e:=Form:C1466.role_e.qui
		Form:C1466.roleDuQui_es:=Form:C1466.qui_e.roles.orderBy("quoi.Date desc")
		Form:C1466.roleDuQuoi_es:=Form:C1466.quoi_e.roles.orderBy("qui.DateNaiss")
		Form:C1466.message:="'"+Form:C1466.qui_e.FullName+"'"+" dans '"+Form:C1466.quoi_e.Nom+"'"
	End if 
	
End if 
