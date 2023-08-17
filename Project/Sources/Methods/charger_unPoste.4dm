//%attributes = {}
//charger_unPoste

//se déplacer dans la liste box de page  1
Form:C1466.posPosteSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.poste_es.length; Form:C1466.posPosteSel_i)

// après mise à jour du "Form.eleCou...Pos", blanchir "Form.action" (car utilisé dans déplacement pg2 et pg3)
Form:C1466.action:="MODIFIER"

If (Form:C1466.posPosteSel_i>0)
	//les info sur le poste sélectionné: pour affichage détail
	//-poste
	Form:C1466.poste_e:=Form:C1466.poste_es[Form:C1466.posPosteSel_i-1]  //si position=1, alors indice=0
	//-dépendances du poste
	Form:C1466.qui_e:=Form:C1466.poste_e.qui
	Form:C1466.groupe_e:=Form:C1466.poste_e.groupe
	Form:C1466.message:="Info sur le poste de '"+Form:C1466.qui_e.FullName+"'"+" dans '"+Form:C1466.groupe_e.Nom+"'"
End if 
