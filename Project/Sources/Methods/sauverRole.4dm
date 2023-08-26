//%attributes = {}
//sauverRole

C_OBJECT:C1216($status)
$status:=Form:C1466.role_e.save()
If ($status.success)
	ALERT:C41("role modifié")
	Form:C1466.action:="MODIFIER"  // inutile: pour role on est toujours en "modifier"
Else 
	ALERT:C41("sauvegarde role ko")
	TRACE:C157
End if 
