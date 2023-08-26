//%attributes = {}
//charger_unPoste

//se déplacer dans la liste box de page  1
Form:C1466.posPosteSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.poste_es.length; Form:C1466.posPosteSel_i)

If (Form:C1466.posPosteSel_i>0)
	//les info sur le poste sélectionné: pour affichage détail
	//-poste
	Form:C1466.poste_e:=Form:C1466.poste_es[Form:C1466.posPosteSel_i-1]  //si position=1, alors indice=0
	//-dépendances du poste
	Form:C1466.qui_e:=Form:C1466.poste_e.qui
	Form:C1466.groupe_e:=Form:C1466.poste_e.groupe
	Form:C1466.role_es:=Form:C1466.qui_e.roles.orderBy("quoi.Date desc")
	Form:C1466.message:="Info sur le poste de '"+Form:C1466.qui_e.FullName+"'"+" dans '"+Form:C1466.groupe_e.Nom+"'"
End if 
