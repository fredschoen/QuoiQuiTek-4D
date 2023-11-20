//%attributes = {}
var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity
var $nbrLus_i; $nbrMaj_i : Integer
var $execAvecMaj_b; $majEnreg_b : Boolean
var $file : 4D:C1709.File
var $folder : 4D:C1709.Folder
var $collection : Collection


TRACE:C157

$execAvecMaj_b:=False:C215

$qui_es:=ds:C1482.Qui.all().orderBy("ID")
For each ($qui_e; $qui_es)
	$nbrLus_i:=$nbrLus_i+1
	$majEnreg_b:=False:C215
	
	//If (Substring($qui_e.Info; 1; 3)=" / ")
	//$qui_e.Info:=Substring($qui_e.Info; 4; 999)
	//$majEnreg_b:=True
	//End if 
	$name1:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"i"+String:C10($qui_e.ID; "0000000")+".png"
	$name2:=Folder:C1567(fk data folder:K87:12).path+"Photos/i"+String:C10($qui_e.ID; "0000000")+".png"
	$file:=File:C1566($name2)
	//$name3:="i"+String($qui_e.ID; "0000000")+"_"+$qui_e.FullName+".png"
	$name3:=$qui_e.FullName+".png"
	If ($file.exists)
		//If ($execAvecMaj_b)
		//$file.rename($name3)
		//End if 
		$qui_e.NomFicPhoto:=$name3
		$majEnreg_b:=True:C214
	End if 
	
	
	//If (Test path name($name1)=Is a document)
	//$qui_e.NomFicPhoto:="i"+String($qui_e.ID; "0000000")+".png"
	//$majEnreg_b:=True
	//End if 
	//$folder:=Folder(Folder(fk data folder).path+"Photos/")
	
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
