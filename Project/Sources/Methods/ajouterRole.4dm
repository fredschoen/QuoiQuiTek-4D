//%attributes = {}
// ajouterRole
//$1; $ID_Acteur_i :integer
//$2; $ID_Quoi_i: integer
//$3; $utilisationListe: text
var $1; $ID_Acteur_i : Integer
var $2; $ID_Quoi_i : Integer
var $3; $utilisationListe : Text
var $role_e : cs:C1710.RoleEntity
If (Count parameters:C259<3)
	ALERT:C41("erreur appel "+Current method name:C684())
	TRACE:C157
End if 

$ID_Acteur_i:=$1
$ID_Quoi_i:=$2
$utilisationListe:=$3

var $status_o : Object
var $role_e : cs:C1710.RoleEntity

$role_e:=ds:C1482.Role.new()
$role_e.ID_Qui:=$ID_Acteur_i

$role_e.ID_Quoi:=$ID_Quoi_i
$status_o:=$role_e.save()

If ($status_o.success)
	If ($utilisationListe="AJOUTER_ROLE")
		ALERT:C41("Role ajouté"+Char:C90(Carriage return:K15:38)+$role_e.qui.FullName+Char:C90(Carriage return:K15:38)+$role_e.quoi.Nom)
	Else 
		ALERT:C41("Role ajouté"+Char:C90(Carriage return:K15:38)+$role_e.groupe.Nom+Char:C90(Carriage return:K15:38)+$role_e.quoi.Nom)
	End if 
	
	
Else 
	
	ALERT:C41("ajout role ko")
	TRACE:C157
	
End if 
