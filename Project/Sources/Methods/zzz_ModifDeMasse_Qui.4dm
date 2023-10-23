//%attributes = {}
var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity
var $nbrLus_i; $nbrMaj_i : Integer
var $execAvecMaj_b; $majEnreg_b : Boolean

$execAvecMaj_b:=False:C215

$qui_es:=ds:C1482.Qui.all()
For each ($qui_e; $qui_es)
	$nbrLus_i:=$nbrLus_i+1
	$majEnreg_b:=False:C215
	
	//If (Substring($qui_e.Info; 1; 3)=" / ")
	//$qui_e.Info:=Substring($qui_e.Info; 4; 999)
	//$majEnreg_b:=True
	//End if 
	$x:=Folder:C1567(fk data folder:K87:12).platformPath+"Photos"+Folder separator:K24:12+"i"+String:C10($qui_e.ID; "0000000")+".png"
	
	If (Picture size:C356($qui_e.Photo)>0)
		WRITE PICTURE FILE:C680($x; $qui_e.Photo)
		$nbrMaj_i:=$nbrMaj_i+1
		//Else 
		//If (Test path name($x)=Is a document)
		//DELETE DOCUMENT($x)
		//End if 
	End if 
	
	
	//If ($majEnreg_b)
	//$nbrMaj:=$nbrMaj+1
	//If ($execAvecMaj_b)
	//$o:=$qui_e.save()
	//If (Not($o.success))
	//ALERT("ko")
	//TRACE  // pour étude erreur
	
	//End if 
	//End if 
	//End if 
	
End for each 

ALERT:C41("ok "+String:C10($nbrLus_i)+" ; "+String:C10($nbrMaj_i))
