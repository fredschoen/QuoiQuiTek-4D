//%attributes = {}
//naviguer_unRoleDeQui
//se déplacer dans la liste box de page  1
Case of 
	: (Form:C1466.action="PREMIER")
		Form:C1466.eleCouRolePos:=1
		
	: (Form:C1466.action="PRECEDENT")
		If (Form:C1466.eleCouRolePos>1)
			Form:C1466.eleCouRolePos:=Form:C1466.eleCouRolePos-1
		Else 
			Form:C1466.eleCouRolePos:=Form:C1466.roleListe.length
		End if 
		
	: (Form:C1466.action="SUIVANT")
		If (Form:C1466.eleCouRolePos<Form:C1466.roleListe.length)
			Form:C1466.eleCouRolePos:=Form:C1466.eleCouRolePos+1
		Else 
			Form:C1466.eleCouRolePos:=1
		End if 
		
	: (Form:C1466.action="DERNIER")
		Form:C1466.eleCouRolePos:=Form:C1466.roleListe.length
		
End case 

// après mise à jour du "Form.eleCouF...Pos", blanchir "Form.action" (car utilisé dans déplacement pg2 et pg3)
Form:C1466.action:="MODIFIER"
