//%attributes = {}
var $groupe_e : cs:C1710.GroupeEntity
var $quoi_es : cs:C1710.QuoiSelection
var $quoi_e : cs:C1710.QuoiEntity
var $role_e : cs:C1710.RoleEntity
var $status_o : Object

$groupe_e:=ds:C1482.Groupe.query("Nom = :1"; "Rolling Stones").first()
$quoi_es:=ds:C1482.Quoi.query("Nom = :1"; "Rolling Stones /@")

For each ($quoi_e; $quoi_es)
	$role_e:=ds:C1482.Role.new()
	$role_e.ID_Groupe:=$groupe_e.ID
	$role_e.ID_Quoi:=$quoi_e.ID
	$role_e.Descr:="Artiste"
	
	If (True:C214)
		$status_o:=$role_e.save()
		If (Not:C34($status_o.success))
			ALERT:C41($status_o.statusText)
			TRACE:C157
		End if 
	End if 
	
End for each 
ALERT:C41("ok")