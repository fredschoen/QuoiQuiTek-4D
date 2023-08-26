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
	$selection:=verifierSelectionRole(Form:C1466.critereRole.Nom; $role_e.qui.Nom; $selection)
	$selection:=verifierSelectionRole(Form:C1466.critereRole.Genre; $role_e.qui.Genre; $selection)
	$selection:=verifierSelectionRole(Form:C1466.critereRole.Age; String:C10($role_e.getAge(); "00"); $selection)
	$selection:=verifierSelectionRole(Form:C1466.critereRole.Pays; $role_e.qui.Pays; $selection)
	$selection:=verifierSelectionRole(Form:C1466.critereRole.Domaine; $role_e.quoi.Domaine; $selection)
	$selection:=verifierSelectionRole(Form:C1466.critereRole.DateO; $role_e.quoi.Date; $selection)
	If ($selection)
		Form:C1466.role_es.push($role_e)
	End if 
	//Form.role_es:=Form.role_es.ordeBy("qui.Nom")
	Form:C1466.role_es:=Form:C1466.role_es
	
End for each 
