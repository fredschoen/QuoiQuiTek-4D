//%attributes = {}
//zzz_ModifDeMasse_Role
$execAvecMaj_b:=True:C214
var $role_es : cs:C1710.RoleSelection
var $role_e : cs:C1710.RoleEntity
var $nbrMaj_i : Integer
var $nbrLus_i : Integer
//$role_es:=ds.Role.query("CreatTS =:1"; "2023-08-21T18:51@")
$role_es:=ds:C1482.Role.all()

For each ($role_e; $role_es)
	$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"r"+String:C10($role_e.ID; "0000000")+".png"
	
	$nbrLus_i:=$nbrLus_i+1
	
End for each 
ALERT:C41("ok "+String:C10($nbrMaj_i)+" sur "+String:C10($nbrLus_i))