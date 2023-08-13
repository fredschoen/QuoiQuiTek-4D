//%attributes = {}
//changer les quis

var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity
$qui_es:=ds:C1482.Qui.query("AnneeNaiss > 0 and DateNaiss < :1"; "0").orderBy("Nom")

For each ($qui_e; $qui_es)
	
	$qui_e.DateNaiss:=String:C10($qui_e.AnneeNaiss)
	//$status:=$qui_e.save()
	//If ($status.success)
	//Else 
	//ALERT("sauvegarde role ko")
	//TRACE
	//End if 
	
End for each 
ALERT:C41("ok")
