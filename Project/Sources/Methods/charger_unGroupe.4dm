//%attributes = {}
// charger_unGroupe
//se déplacer dans la liste box de page  1
Form:C1466.posGroupeSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.groupe_es.length; Form:C1466.posGroupeSel_i)

// après mise à jour du "Form.groupeSel_ePos", blanchir "Form.action" (car utilisé dans déplacement pg2 et pg3)
Form:C1466.action:="MODIFIER"

If (Form:C1466.posGroupeSel_i>0)
	//les info sur le groupe sélectionné: pour affichage détail
	Form:C1466.groupe_e:=Form:C1466.groupe_es[Form:C1466.posGroupeSel_i-1]  //si position=1, alors indice=0
	Form:C1466.poste_es:=Form:C1466.groupe_e.postes
	Form:C1466.roleDuGroupe_es:=Form:C1466.groupe_e.roles
	Form:C1466.message:="Info sur '"+Form:C1466.groupe_e.Nom+"'"
End if 
