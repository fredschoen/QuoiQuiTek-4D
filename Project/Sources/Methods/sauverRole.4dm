//%attributes = {}
//sauverRole

C_OBJECT:C1216($status; $enregListe; $enreg)
$enregListe:=ds:C1482.Role.query("ID=:1"; Form:C1466.role_e.ID)
$enreg:=$enregListe.first()
$enreg.Descr:=Form:C1466.role_e.Descr
$enreg.Photo:=Form:C1466.role_e.Photo
$status:=$enreg.save()
If ($status.success)
	ALERT:C41("role modifié")
Else 
	ALERT:C41("sauvegarde role ko")
	TRACE:C157
End if 
