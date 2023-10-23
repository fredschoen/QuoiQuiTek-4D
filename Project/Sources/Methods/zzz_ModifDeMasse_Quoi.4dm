//%attributes = {}
//zzz_ModifDeMasse_Quoi
$execAvecMaj_b:=True:C214
var $quoi_es : cs:C1710.RoleSelection
var $quoi_e : cs:C1710.RoleEntity
var $nbrMaj_i : Integer
var $nbrLus_i : Integer
$quoi_es:=ds:C1482.Quoi.all()

For each ($quoi_e; $quoi_es)
	$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"o"+String:C10($quoi_e.ID; "0000000")+".png"
	
	If (Picture size:C356($quoi_e.Photo)>0)
		WRITE PICTURE FILE:C680($x; $quoi_e.Photo)
		$nbrMaj_i:=$nbrMaj_i+1
		//Else 
		//If (Test path name($x)=Is a document)
		//DELETE DOCUMENT($x)
		//End if 
	End if 
	
	$nbrLus_i:=$nbrLus_i+1
	
End for each 
ALERT:C41("ok "+String:C10($nbrMaj_i)+" sur "+String:C10($nbrLus_i))