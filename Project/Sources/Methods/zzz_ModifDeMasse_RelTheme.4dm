//%attributes = {}
var $relTheme_es : cs:C1710.RelThemeSelection
var $relTheme_e : cs:C1710.RelThemeEntity
var $nbrLus_i; $nbrMaj_i : Integer
var $execAvecMaj_b; $majEnreg_b : Boolean

$execAvecMaj_b:=False:C215

$relTheme_es:=ds:C1482.RelTheme.all().orderBy("ID")
For each ($relTheme_e; $relTheme_es)
	$nbrLus_i:=$nbrLus_i+1
	$majEnreg_b:=False:C215
	
	If (Length:C16($relTheme_e.CreatTS)=0)
		$Old:=$relTheme_e.CreatTS
		$relTheme_e.CreatTS:=Substring:C12(Timestamp:C1445; 1; 19)
		If ($Old#$relTheme_e.CreatTS)
			$majEnreg_b:=True:C214
		End if 
	End if 
	
	If (Length:C16($relTheme_e.ModifTS)=0)
		$Old:=$relTheme_e.ModifTS
		$relTheme_e.ModifTS:=Substring:C12(Timestamp:C1445; 1; 19)
		If ($Old#$relTheme_e.ModifTS)
			$majEnreg_b:=True:C214
		End if 
	End if 
	
	If ($majEnreg_b)
		$nbrMaj_i:=$nbrMaj_i+1
		If ($execAvecMaj_b)
			$o:=$relTheme_e.save()
			If (Not:C34($o.success))
				ALERT:C41("ko")
				TRACE:C157  // pour étude erreur
			End if 
		End if 
	End if 
	
End for each 

ALERT:C41("ok. Lus="+String:C10($nbrLus_i)+" ; Maj="+String:C10($nbrMaj_i))
