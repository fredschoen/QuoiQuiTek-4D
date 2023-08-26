//%attributes = {}
var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity
var $nbrLus; $nbrMaj : Integer
var $maj; $go : Boolean

$maj:=False:C215

$qui_es:=ds:C1482.Qui.all()
For each ($qui_e; $qui_es)
	$nbrLus:=$nbrLus+1
	$go:=False:C215
	
	If (Substring:C12($qui_e.Info; 1; 3)=" / ")
		$qui_e.Info:=Substring:C12($qui_e.Info; 4; 999)
		$go:=True:C214
	End if 
	
	
	If ($go)
		$nbrMaj:=$nbrMaj+1
		If ($maj)
			$o:=$qui_e.save()
			If (Not:C34($o.success))
				ALERT:C41("ko")
				TRACE:C157  // pour étude erreur
				
			End if 
		End if 
	End if 
End for each 

ALERT:C41("ok "+String:C10($nbrLus)+" ; "+String:C10($nbrMaj))
