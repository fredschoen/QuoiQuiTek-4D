//%attributes = {}
//charger_lesRoles
var $age : Integer
var $anneeQuoi : Integer
var $liste : Collection
var $toto : Object
Form:C1466.role_es:=New collection:C1472
var $quiAjout : Object
var $quoiAjout : Object
var $go : Boolean
var $selection : Boolean

$go:=True:C214

var $role_es : cs:C1710.RoleSelection
var $role_e : cs:C1710.RoleEntity
$role_es:=ds:C1482.Role.all()

For each ($role_e; $role_es)
	
	$selection:=True:C214
	$selection:=verifierSelectionRole(Form:C1466.critere.role_es.Nom; $role_e.qui.Nom; $selection)
	$selection:=verifierSelectionRole(Form:C1466.critere.role_es.Genre; $role_e.qui.Genre; $selection)
	$selection:=verifierSelectionRole(Form:C1466.critere.role_es.Age; String:C10($role_e.Age; "00"); $selection)
	If ($selection)
		Form:C1466.role_es.push($role_e)
	End if 
	
	
End for each 
