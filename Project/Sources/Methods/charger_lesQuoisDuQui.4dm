//%attributes = {}
// charger_lesQuoisDuQui
//$1: qui: object
//$0: lesQuoisDuQui: collection

var $1 : Object
var $0 : Collection

var $qui : Object
var $role_es : 4D:C1709.EntitySelection
var $role_e : 4D:C1709.Entity
var $qui_es : 4D:C1709.EntitySelection
var $quoi_e : 4D:C1709.Entity
var $quoi_ele : Object
var $unRoleDuQoi : Object
var $lesQuoisDuQui : Collection
var $lesQuoisDuQuiTrie : Collection
var $ageQui : Integer
var $anneeQuoi : Integer

$qui:=$1

// liste des roles de l qui 
$role_es:=ds:C1482.Role.query("ID_Qui=:1"; $qui.ID)

//les info quoi de chaque role du qui
$lesQuoisDuQui:=New collection:C1472
For each ($role_e; $role_es)
	$quoi_es:=ds:C1482.Quoi.query("ID=:1"; $role_e.ID_Quoi)
	$quoi_e:=$quoi_es.first()
	$anneeQuoi:=_anneeDeDateText($quoi_e.Annee)
	
	If (($qui.AnneeNaiss=0) | ($anneeQuoi=0))
		$ageQui:=0
	Else 
		$ageQui:=$anneeQuoi-$qui.AnneeNaiss
	End if 
	
	$unRoleDeQui:=New object:C1471("AgeQuiDuQuoi"; $ageQui; "RoleDansQuoiP3"; $role_e.Descr; \
		"quoi"; $quoi_e.toObject("Nom,Annee,Genre,Pays,Prod,Real,Stock,Domaine,DateDernVisu"))
	$lesQuoisDuQui.push($unRoleDeQui)
End for each 

//tri par age
$lesQuoisDuQuiTrie:=New collection:C1472
$lesQuoisDuQuiTrie:=$lesQuoisDuQui.orderBy("AgeQuiDuQuoi asc")
$0:=$lesQuoisDuQuiTrie
