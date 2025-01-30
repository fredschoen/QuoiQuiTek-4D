//%attributes = {}
var $theme_es : cs:C1710.ThemeSelection
var $theme_e : cs:C1710.ThemeEntity
var $nbrLus_i; $nbrMaj_i : Integer
var $execAvecMaj_b; $majEnreg_b : Boolean

$execAvecMaj_b:=False:C215

$theme_es:=ds:C1482.Theme.all().orderBy("ID")
For each ($theme_e; $theme_es)
	$nbrLus_i:=$nbrLus_i+1
	$majEnreg_b:=False:C215
	
	If (Length:C16($theme_e.CreatTS)=0)
		$Old:=$theme_e.CreatTS
		$theme_e.CreatTS:=Substring:C12(Timestamp:C1445; 1; 19)
		If ($Old#$theme_e.CreatTS)
			$majEnreg_b:=True:C214
		End if 
	End if 
	
	If (Length:C16($theme_e.ModifTS)=0)
		$Old:=$theme_e.ModifTS
		$theme_e.ModifTS:=Substring:C12(Timestamp:C1445; 1; 19)
		If ($Old#$theme_e.ModifTS)
			$majEnreg_b:=True:C214
		End if 
	End if 
	
	If ($majEnreg_b)
		$nbrMaj_i:=$nbrMaj_i+1
		If ($execAvecMaj_b)
			$o:=$theme_e.save()
			If (Not:C34($o.success))
				ALERT:C41("ko")
				TRACE:C157  // pour étude erreur
			End if 
		End if 
	End if 
	
End for each 

ALERT:C41("ok. Lus="+String:C10($nbrLus_i)+" ; Maj="+String:C10($nbrMaj_i))
