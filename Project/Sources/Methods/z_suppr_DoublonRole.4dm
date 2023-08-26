//%attributes = {}
var $role_es : cs:C1710.RoleSelection
var $role_e : cs:C1710.RoleEntity
var $ID_GroupePrev; $ID_QuoiPrev : Integer
var $i : Integer
$role_es:=ds:C1482.Role.query("ID_Groupe > 0")
$role_es:=$role_es.orderBy("ID_Groupe, ID_Quoi")
$ID_GroupePrev:=0
$ID_QuoiPrev:=0
For each ($role_e; $role_es)
	If ($role_e.ID_Groupe=$ID_GroupePrev) & ($role_e.ID_Quoi=$ID_QuoiPrev)
		TRACE:C157
		$role_e.drop()
		$i:=$i+1
	Else 
		$ID_GroupePrev:=$role_e.ID_Groupe
		$ID_QuoiPrev:=$role_e.ID_Quoi
	End if 
	
End for each 
ALERT:C41("OK "+String:C10($i))
