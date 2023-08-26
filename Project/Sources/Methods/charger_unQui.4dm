//%attributes = {}
// charger_unQui

If (Form:C1466.posQuiSel_i>0)
	//les info sur le qui sélectionné: pour affichage détail
	Form:C1466.qui_e:=Form:C1466.qui_es[Form:C1466.posQuiSel_i-1]  //si position=1, alors indice=0
	Form:C1466.role_es:=Form:C1466.qui_e.roles
	Form:C1466.role_es:=Form:C1466.role_es.orderBy("quoi.Date desc")
	Form:C1466.message:="Info sur '"+Form:C1466.qui_e.FullName+"'"
End if 
