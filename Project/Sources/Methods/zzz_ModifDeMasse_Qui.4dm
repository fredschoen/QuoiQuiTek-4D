//%attributes = {}
var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity
var $nbrLus_i; $nbrMaj_i : Integer
var $execAvecMaj_b; $majEnreg_b : Boolean

$execAvecMaj_b:=False:C215
$qui_es:=ds:C1482.Qui.all().orderBy("ID")
For each ($qui_e; $qui_es)
	$nbrLus_i:=$nbrLus_i+1
	$majEnreg_b:=False:C215
	
	If (Length:C16($qui_e.DateNaiss)>0)
		$Old:=$qui_e.DateNaiss
		$qui_e.DateNaiss:=Replace string:C233($qui_e.DateNaiss; "-"; "")
		If ($Old#$qui_e.DateNaiss)
			$majEnreg_b:=True:C214
		End if 
	End if 
	
	If (Length:C16($qui_e.DateDeces)>0)
		$Old:=$qui_e.DateDeces
		$qui_e.DateDeces:=Replace string:C233($qui_e.DateDeces; "-"; "")
		If ($Old#$qui_e.DateDeces)
			$majEnreg_b:=True:C214
		End if 
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

ALERT:C41("ok. Lus="+String:C10($nbrLus_i)+" ; Maj="+String:C10($nbrMaj_i))
