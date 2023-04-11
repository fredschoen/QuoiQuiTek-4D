//%attributes = {}
// supprimerQuoi
C_OBJECT:C1216($status; $enregListe; $enreg)
$enregListe:=ds:C1482.Quoi.query("ID=:1"; Form:C1466.quoi.ID)
$enreg:=$enregListe.first()
$status:=$enreg.drop()
If ($status.success)
	
	ALERT:C41("Quoi supprimé")
End if 
