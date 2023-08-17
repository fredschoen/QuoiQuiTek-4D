//%attributes = {}
// charger_unQui


//se déplacer dans la liste box de page  1
Form:C1466.posQuiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.qui_es.length; Form:C1466.posQuiSel_i)

// après mise à jour du "Form.eleCouPos", blanchir "Form.action" (car utilisé dans déplacement pg2 et pg3)
Form:C1466.action:="MODIFIER"

If (Form:C1466.posQuiSel_i>0)
	//les info sur le qui sélectionné: pour affichage détail
	Form:C1466.qui_e:=Form:C1466.qui_es[Form:C1466.posQuiSel_i-1]  //si position=1, alors indice=0
	Form:C1466.role_es:=Form:C1466.qui_e.roles
	Form:C1466.role_es:=Form:C1466.role_es.orderBy("quoi.Date")
	Form:C1466.message:="Info sur '"+Form:C1466.qui_e.FullName+"'"
End if 
