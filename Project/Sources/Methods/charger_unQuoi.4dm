//%attributes = {}
// charger_unQuoi

If (Form:C1466.posQuoiSel_i>0)
	//les info sur le quoi sélectionné: pour affichage détail
	Form:C1466.quoi_e:=Form:C1466.quoi_es[Form:C1466.posQuoiSel_i-1]  //si position=1, alors indice=0
	Form:C1466.role_es:=Form:C1466.quoi_e.roles.query("ID_Qui > 0")
	Form:C1466.roleGroupe_es:=Form:C1466.quoi_e.roles.query("ID_Groupe > 0")
	Form:C1466.message:="Info sur '"+Form:C1466.quoi_e.Nom+"'"
End if 

