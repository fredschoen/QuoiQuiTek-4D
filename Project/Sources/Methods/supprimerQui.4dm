//%attributes = {}
// supprimerQui
C_OBJECT:C1216($status; $enregListe; $enreg)


$enregListe:=ds:C1482.Qui.query("ID=:1"; Form:C1466.qui.ID)
$enreg:=$enregListe.first()
$status:=$enreg.drop()
If ($status.success)
	
	ALERT:C41("Enreg Qui supprimé")
End if 
