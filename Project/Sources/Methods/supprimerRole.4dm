//%attributes = {}
// supprimerRole
C_OBJECT:C1216($status; $enregListe; $enreg)
$enregListe:=ds:C1482.Role.query("ID=:1"; Form:C1466.role.ID)
$enreg:=$enregListe.first()
$status:=$enreg.drop()
If ($status.success)
	
	ALERT:C41("Role supprimé")
End if 
