//%attributes = {}
//sauverPoste

C_OBJECT:C1216($status)
$status:=Form:C1466.poste_e.save()
If ($status.success)
	ALERT:C41("poste modifié")
Else 
	ALERT:C41("sauvegarde poste ko")
	TRACE:C157
End if 
