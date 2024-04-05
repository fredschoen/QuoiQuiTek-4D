//%attributes = {}
//initStorage
Use (Storage:C1525)
	Storage:C1525.param:=New shared object:C1526()
End use 

Use (Storage:C1525.param)
	Storage:C1525.param.dossierPhotos_t:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12
End use 

initStorageValueLists()