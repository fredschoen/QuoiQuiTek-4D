//%attributes = {}
//charger_LesRoles
var $role_es : 4D:C1709.EntitySelection
var $role_e : 4D:C1709.Entity
var $age : Integer
var $anneeQuoi : Integer
var $liste : Collection
var $toto : Object
Form:C1466.roleListe:=New collection:C1472
var $quiAjout : Object
var $quoiAjout : Object
var $go : Boolean
var $selection : Boolean

$go:=True:C214

var $role_es : cs:C1710.RoleSelection
var $role_e : cs:C1710.RoleEntity
$role_es:=ds:C1482.Role.all()

For each ($role_e; $role_es)
	$anneeQuoi:=_anneeDeDateText($role_e.quoi.Annee)
	
	If (($role_e.qui.AnneeNaiss=0) | ($anneeQuoi=0))
		$age:=0
	Else 
		$age:=$anneeQuoi-$role_e.qui.AnneeNaiss
	End if 
	
	$toto:=New object:C1471("ID"; $role_e.ID; "Age"; $age; "Descr"; $role_e.Descr; \
		"qui"; $role_e.qui.toObject(""); \
		"quoi"; $role_e.quoi.toObject(""))
	
	$selection:=True:C214
	$selection:=verifierSelectionRole(Form:C1466.critereRoleListe.Nom; $toto.qui.Nom; $selection)
	$selection:=verifierSelectionRole(Form:C1466.critereRoleListe.Genre; $toto.qui.Genre; $selection)
	$selection:=verifierSelectionRole(Form:C1466.critereRoleListe.Age; String:C10($toto.Age; "00"); $selection)
	If ($selection)
		Form:C1466.roleListe.push($toto)
	End if 
	
	
End for each 
