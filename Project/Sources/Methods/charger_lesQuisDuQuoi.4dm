//%attributes = {}
// charger_lesQuisDuQuoi : liste des roles du quoi 
//$1: quoi: object
//$0: lesQuisDuQuoi: collection
var $1 : Object
var $0 : Collection

var $quoi : Object
var $role_es : 4D:C1709.EntitySelection
var $role_e : 4D:C1709.Entity
var $qui_es : 4D:C1709.EntitySelection
var $qui_e : 4D:C1709.Entity
var $qui_ele : Object
var $unRoleDeQuoi : Object
var $lesQuisDuQuoi : Collection
var $lesQuisDuQuoiTrie : Collection
var $ageQui : Integer
var $anneeQuoi : Integer

//recherche des roles du quoi
$quoi:=$1
$role_es:=ds:C1482.Role.query("ID_Quoi=:1"; $quoi.ID)

//liste des roles du quoi
$lesQuisDuQuoi:=New collection:C1472
For each ($role_e; $role_es)
	$qui_es:=ds:C1482.Qui.query("ID=:1"; $role_e.ID_Qui)
	$qui_e:=$qui_es.first()
	$anneeQuoi:=_anneeDeDateText($quoi.Annee)
	If (($anneeQuoi=0) | ($qui_e.AnneeNaiss=0))
		$ageQui:=0
	Else 
		$ageQui:=$anneeQuoi-$qui_e.AnneeNaiss
	End if 
	
	$unRoleDeQuoi:=New object:C1471("AgeQuiDuQuoi"; $ageQui; "DescrRole"; $role_e.Descr; \
		"qui"; $qui_e.toObject("Nom,AnneeNaiss,Genre,Pays,AnneeDeces,Photo"))
	$lesQuisDuQuoi.push($unRoleDeQuoi)
End for each 

//tri par age
$lesQuisDuQuoiTrie:=New collection:C1472
$lesQuisDuQuoiTrie:=$lesQuisDuQuoi.orderBy("AgeQuiDuQuoi asc")

//sortie
$0:=$lesQuisDuQuoiTrie