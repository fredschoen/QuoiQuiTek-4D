// sur ouverture

//folder des photos
$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"
If (Test path name:C476($x)#Is a folder:K24:2)
	CREATE FOLDER:C475($x)
End if 

//init
initStorage()

//accueil
afficherAccueil
