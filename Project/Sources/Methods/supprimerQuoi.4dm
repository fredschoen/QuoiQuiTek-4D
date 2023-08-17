//%attributes = {}
// supprimerQuoi
C_OBJECT:C1216($status)
$status:=Form:C1466.quoi_e.drop()
If ($status.success)
	ALERT:C41("Quoi supprimé")
End if 
