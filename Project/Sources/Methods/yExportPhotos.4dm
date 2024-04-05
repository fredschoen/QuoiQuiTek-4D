//%attributes = {}
//yExportPhotos
var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity
var $quoi_es : cs:C1710.QuoiSelection
var $quoi_e : cs:C1710.QuoiEntity
var $role_es : cs:C1710.RoleSelection
var $role_e : cs:C1710.RoleEntity

var $fileFrom : 4D:C1709.File
var $fileTo : 4D:C1709.File
var $f : 4D:C1709.File
var $folderTo : 4D:C1709.Folder
var $collection : Collection

////////////////////////////////////////////////////////////////
$folderTo:=Folder:C1567(Folder:C1567(fk desktop folder:K87:19).path+"_QuoiQuitek/Photos/Qui")
$collection:=$folderTo.files()
For each ($f; $collection)
	$x:=$f.delete()
End for each 
$qui_es:=ds:C1482.Qui.all().orderBy("ID")
For each ($qui_e; $qui_es)
	$fileFrom:=File:C1566(Folder:C1567(fk data folder:K87:12).path+"Photos/i"+String:C10($qui_e.ID; "0000000")+".png")
	
	If ($fileFrom.exists)
		$fileFrom.copyTo($folderTo; $qui_e.FullName+".png")
	End if 
End for each 

//////////////////////////////////////
$folderTo:=Folder:C1567(Folder:C1567(fk desktop folder:K87:19).path+"_QuoiQuitek/Photos/Quoi")
$collection:=$folderTo.files()
For each ($f; $collection)
	$x:=$f.delete()
End for each 
$quoi_es:=ds:C1482.Quoi.all().orderBy("ID")
For each ($quoi_e; $quoi_es)
	$fileFrom:=File:C1566(Folder:C1567(fk data folder:K87:12).path+"Photos/o"+String:C10($qui_e.ID; "0000000")+".png")
	If ($fileFrom.exists)
		$fileFrom.copyTo($folderTo; $quoi_e.Nom+".png")
	End if 
End for each 

//////////////////////////////////////
$folderTo:=Folder:C1567(Folder:C1567(fk desktop folder:K87:19).path+"_QuoiQuitek/Photos/Role")
$collection:=$folderTo.files()
For each ($f; $collection)
	$x:=$f.delete()
End for each 
$role_es:=ds:C1482.Role.all().orderBy("ID")
For each ($role_e; $role_es)
	$fileFrom:=File:C1566(Folder:C1567(fk data folder:K87:12).path+"Photos/r"+String:C10($role_e.ID; "0000000")+".png")
	If ($fileFrom.exists)
		$nomOK:=$role_e.qui.FullName+"_dans_"+$role_e.quoi.Nom+".png"
		$nomOK:=Change string:C234($nomOK; "_"; Position:C15("/"; $nomOK))
		$fileFrom.copyTo($folderTo; $nomOK)
	End if 
End for each 

/////////////////////////////////////

ALERT:C41("ok")

SHOW ON DISK:C922(Folder:C1567(fk desktop folder:K87:19).platformPath+"Photos")