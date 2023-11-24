//%attributes = {}
var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity
var $nbrLus_i; $nbrMaj_i : Integer
var $execAvecMaj_b; $majEnreg_b : Boolean
var $fileOld : 4D:C1709.File
var $fileNew : 4D:C1709.File
var $folder : 4D:C1709.Folder
var $collection : Collection
TRACE:C157

$execAvecMaj_b:=True:C214

$qui_es:=ds:C1482.Qui.all().orderBy("ID")
For each ($qui_e; $qui_es)
	$nbrLus_i:=$nbrLus_i+1
	$majEnreg_b:=False:C215
	
	$fileNameOld:=Folder:C1567(fk data folder:K87:12).path+"Photos/i"+String:C10($qui_e.ID; "0000000")+".png"
	$folderName:=Folder:C1567(fk data folder:K87:12).path+"Photos/Qui/i"+String:C10($qui_e.ID; "0000000")
	
	$fileOld:=File:C1566($fileNameOld)
	If ($fileOld.exists)
		If ($execAvecMaj_b)
			//$file.rename($fileNameNew)
			$folder:=Folder:C1567($folderName)
			If ($folder.exists)
			Else 
				$ok:=$folder.create()
				If ($ok)
					$fileOld.copyTo($folder; $qui_e.FullName+".png")
				Else 
					TRACE:C157
				End if 
			End if 
			
		End if 
		//$qui_e.NomFicPhoto:=$fileNameNew
		$majEnreg_b:=True:C214
	End if 
	
	If ($majEnreg_b)
		$nbrMaj_i:=$nbrMaj_i+1
		If ($execAvecMaj_b)
			$o:=$qui_e.save()
			If (Not:C34($o.success))
				ALERT:C41("ko")
				TRACE:C157  // pour étude erreur
			End if 
		End if 
	End if 
	
End for each 

ALERT:C41("ok "+String:C10($nbrLus_i)+" ; "+String:C10($nbrMaj_i))
