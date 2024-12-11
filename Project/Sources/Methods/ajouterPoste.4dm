//%attributes = {}
// ajouterPoste
//$1; $ID_Qui_i:integer
//$2; $ID_QuiGroupe_i: integer

var $1; $ID_Qui_i : Integer
var $2; $ID_QuiGroupe_i : Integer

If (Count parameters:C259<2)
	ALERT:C41("erreur appel "+Current method name:C684())
	TRACE:C157
End if 

$ID_Qui_i:=$1
$ID_QuiGroupe_i:=$2

var $status_o : Object
var $poste_e : cs:C1710.PosteEntity

$poste_e:=ds:C1482.Poste.new()
$poste_e.ID_Qui:=$ID_Qui_i
$poste_e.ID_QuiGroupe:=$ID_QuiGroupe_i
$status_o:=$poste_e.save()

If ($status_o.success)
	ALERT:C41("Poste ajouté"+Char:C90(Carriage return:K15:38)+$poste_e.qui.FullName+Char:C90(Carriage return:K15:38)+$poste_e.groupe.Nom)
Else 
	ALERT:C41("ajout poste ko")
	TRACE:C157
End if 
