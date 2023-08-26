//%attributes = {}
var $qui_e : cs:C1710.QuiEntity
var $quoi_es : cs:C1710.QuoiSelection
var $quoi_e : cs:C1710.QuoiEntity
var $role_e : cs:C1710.RoleEntity
var $status_o : Object

$qui_e:=ds:C1482.Qui.query("FullName = :1"; "Hawley Richard").first()
$quoi_es:=ds:C1482.Quoi.query("Nom = :1"; "Richard Hawley @")

For each ($quoi_e; $quoi_es)
	$role_e:=ds:C1482.Role.new()
	$role_e.ID_Qui:=$qui_e.ID
	$role_e.ID_Quoi:=$quoi_e.ID
	$role_e.Descr:="Artiste"
	If (False:C215)
		$status_o:=$role_e.save()
		If (Not:C34($status_o.success))
			ALERT:C41($status_o.statusText)
			TRACE:C157
		End if 
	End if 
	
End for each 
ALERT:C41("ok")