//%attributes = {}
// supprimerGroupe
C_OBJECT:C1216($status)
$status:=Form:C1466.groupe_e.drop()
If ($status.success)
	ALERT:C41("Groupe supprimé")
End if 
