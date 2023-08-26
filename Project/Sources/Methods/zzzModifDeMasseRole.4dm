//%attributes = {}
//zzz_ModifDeMasse_Role
$maj:=True:C214
var $role_es : cs:C1710.RoleSelection
var $role_e : cs:C1710.RoleEntity
var $i : Integer
var $j : Integer
$role_es:=ds:C1482.Role.query("CreatTS =:1"; "2023-08-21T18:51@")
For each ($role_e; $role_es)
	If (True:C214)
		
		If ($maj)
			$status:=$role_e.drop()
		End if 
		$i:=$i+1
	End if 
	
	$j:=$j+1
	
End for each 
ALERT:C41("ok "+String:C10($i)+" sur "+String:C10($j))