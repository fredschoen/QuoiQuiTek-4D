//%attributes = {}
// sauverQuiGroupe
//$1; $ID_Qui_i:integer
//$2; $ID_Groupe_i: integer

var $1; $ID_Qui_i : Integer
var $2; $ID_Groupe_i : Integer

If (Count parameters:C259<2)
	ALERT:C41("erreur appel "+Current method name:C684())
	TRACE:C157
End if 

$ID_Qui_i:=$1
$ID_Groupe_i:=$2

var $status_o : Object
var $role_e : cs:C1710.RoleEntity

$role_e:=ds:C1482.Role.new()
$role_e.ID_Qui:=$ID_Qui_i
$role_e.ID_Groupe:=$ID_Groupe_i
$status_o:=$role_e.save()

If ($status_o.success)
	
	ALERT:C41("Role ajouté"+Char:C90(Carriage return:K15:38)+$role_e.qui.FullName+Char:C90(Carriage return:K15:38)+$role_e.groupe.Nom)
	
Else 
	
	ALERT:C41("ajout role ko")
	TRACE:C157
	
End if 
