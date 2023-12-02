//%attributes = {}
var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity
var $nbrLus_i; $nbrMaj_i : Integer
var $execAvecMaj_b; $majEnreg_b : Boolean
TRACE:C157

$execAvecMaj_b:=True:C214
$qui_es:=ds:C1482.Qui.all().orderBy("ID")
For each ($qui_e; $qui_es)
	$nbrLus_i:=$nbrLus_i+1
	$majEnreg_b:=False:C215
	
	//inutile: le trigger le fera //$qui_e.FullName:=$qui_e.Prenom+" "+$qui_e.Nom
	$majEnreg_b:=True:C214
	
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

ALERT:C41("ok. Lus="+String:C10($nbrLus_i)+" ; Maj="+String:C10($nbrMaj_i))
