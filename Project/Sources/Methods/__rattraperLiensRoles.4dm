//%attributes = {}
var $role_es : cs:C1710.RoleSelection
var $role_e : cs:C1710.RoleEntity
var $qui_e : cs:C1710.QuiEntity
var $quoi_e : cs:C1710.QuoiEntity

$role_es:=ds:C1482.Role.all()

For each ($role_e; $role_es)
	If (Undefined:C82($role_e.qui))
		TRACE:C157
		//pour rattraper le KO!!
		$qui_e:=ds:C1482.Quoi.new()
		$qui_e.ID:=$role_e.ID_Qui
		$qui_e.Nom:="qui ajouté car absent"
		$status:=$qui_e.save()
	End if 
	
	If (Undefined:C82($role_e.quoi))
		TRACE:C157
		//pour rattraper le KO!!
		$quoi_e:=ds:C1482.Quoi.new()
		$quoi_e.ID:=$role_e.ID_Quoi
		$quoi_e.Nom:="quoi ajouté car absent"
		$status:=$quoi_e.save()
	End if 
	
End for each 