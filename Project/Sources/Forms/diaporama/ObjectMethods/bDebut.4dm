var $fd : 4D:C1709.Folder
var $img : Picture
var $file_f : 4D:C1709.File
//$path:=Select folder("dossier")
//If (OK=0)
//return 
//End if 
//$fd:=Folder($path; fk platform path)
$fd:=Folder:C1567(Storage:C1525.param.dossierPhotos_t; fk platform path:K87:2)
Form:C1466.file_c:=$fd.files(fk recursive:K87:7)
Form:C1466.compteur:=0
Form_AfficherImg()
