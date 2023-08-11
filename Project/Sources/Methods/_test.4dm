//%attributes = {}
//charger_lesRoles
var $age : Integer
var $anneeQuoi : Integer
var $liste : Collection
var $toto : Object
var $quiAjout : Object
var $quoiAjout : Object
var $go : Boolean
var $selection : Boolean

$go:=True:C214

var $role_es : cs:C1710.RoleSelection
var $role_e : cs:C1710.RoleEntity
$role_es:=ds:C1482.Role.all()

For each ($role_e; $role_es)
	
	$x:=$role_e.getAge()
End for each 
