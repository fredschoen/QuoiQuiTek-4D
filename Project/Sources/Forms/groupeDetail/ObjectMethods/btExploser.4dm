//btAjouterRole
var $roleGroupe_e : cs:C1710.RoleEntity
var $roleQui_e : cs:C1710.RoleEntity
var $poste_e : cs:C1710.PosteEntity
CONFIRM:C162("exploser les roles du quoi")
If (OK=1)
	For each ($poste_e; Form:C1466.groupe_e.postes)
		CONFIRM:C162("exploser les roles sur '"+$poste_e.qui.FullName+"' ?")
		If (OK=1)
			For each ($roleGroupe_e; Form:C1466.groupe_e.roles)
				$roleQui_e:=ds:C1482.Role.new()
				$roleQui_e.ID_Qui:=$poste_e.qui.ID
				$roleQui_e.ID_Quoi:=$roleGroupe_e.quoi.ID
				$status_o:=$roleQui_e.save()
				If (Not:C34($status_o.success))
					ALERT:C41($status_o.statusText)
					TRACE:C157
				End if 
			End for each 
		End if 
		
	End for each 
	
End if 

