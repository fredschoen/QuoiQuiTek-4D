//%attributes = {}
//naviguer_unRoleDeQuoi

//se déplacer dans la liste box de page  1
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

Form:C1466.action:="MODIFIER"
