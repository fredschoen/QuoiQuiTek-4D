//%attributes = {}
//sauverRole

var $status_o : Object
var $1; $role_e : cs:C1710.RoleEntity
var $2; $photoRole_i : Picture
$role_e:=$1
$photoRole_i:=$2

$status_o:=$role_e.save()
If ($status_o.success)
	ALERT:C41("role modifié")
	Form:C1466.action:="MODIFIER"  // inutile: pour role on est toujours en "modifier"
	
	//ajouter, modifier ou supprimer le fichier photo
	$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"r"+String:C10($role_e.ID; "0000000")+".png"
	If (Picture size:C356($photoRole_i)>0)
		WRITE PICTURE FILE:C680($x; $photoRole_i)
		If (OK=0)
			ALERT:C41("échec WRITE PICTURE FILE")
			TRACE:C157
		End if 
	Else 
		//abandon de la photo
		If (Test path name:C476($x)=Is a document:K24:1)
			DELETE DOCUMENT:C159($x)
		End if 
	End if 
	
Else 
	ALERT:C41("sauvegarde role ko")
	TRACE:C157
End if 
