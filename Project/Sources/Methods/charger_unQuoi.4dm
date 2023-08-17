//%attributes = {}
// charger_unQuoi

//se déplacer dans la liste box de page  1
Form:C1466.posQuoiSel_i:=_f_deplacer_curseur(Form:C1466.action; Form:C1466.quoi_es.length; Form:C1466.posQuoiSel_i)

// après mise à jour du "Form.quoiSel_ePos", blanchir "Form.action" (car utilisé dans déplacement pg2 et pg3)
Form:C1466.action:="MODIFIER"

If (Form:C1466.posQuoiSel_i>0)
	//les info sur le quoi sélectionné: pour affichage détail
	Form:C1466.quoi_e:=Form:C1466.quoi_es[Form:C1466.posQuoiSel_i-1]  //si position=1, alors indice=0
	Form:C1466.role_es:=Form:C1466.quoi_e.roles
	Form:C1466.message:="Info sur '"+Form:C1466.quoi_e.Nom+"'"
End if 

