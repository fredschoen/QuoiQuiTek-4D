//%attributes = {}
// sauverRoleNouveau

C_OBJECT:C1216($status; $enreg)
$enreg:=ds:C1482.Role.new()
$enreg.ID_Quoi:=Form:C1466.eleCouQuoi.ID
$enreg.ID_Qui:=Form:C1466.eleCouQui.ID
$status:=$enreg.save()

If ($status.success)
	
	ALERT:C41("Role ajouté")
	
Else 
	
	ALERT:C41("ajout role ko")
	
End if 
