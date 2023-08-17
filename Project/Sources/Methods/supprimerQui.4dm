//%attributes = {}
// supprimerQui
C_OBJECT:C1216($status)
$status:=Form:C1466.qui_e.drop()
If ($status.success)
	ALERT:C41("Enreg Qui supprimé")
End if 
