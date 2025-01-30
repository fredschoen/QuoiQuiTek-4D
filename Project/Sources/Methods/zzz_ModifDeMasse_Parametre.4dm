//%attributes = {}
var $parametre_es : cs:C1710.ParametreSelection
var $parametre_e : cs:C1710.ParametreEntity
var $nbrLus_i; $nbrMaj_i : Integer
var $execAvecMaj_b; $majEnreg_b : Boolean

$execAvecMaj_b:=False:C215

$parametre_es:=ds:C1482.Parametre.all().orderBy("ID")
For each ($parametre_e; $parametre_es)
	$nbrLus_i:=$nbrLus_i+1
	$majEnreg_b:=False:C215
	
	If (Length:C16($parametre_e.CreatTS)=0)
		$Old:=$parametre_e.CreatTS
		$parametre_e.CreatTS:=Substring:C12(Timestamp:C1445; 1; 19)
		If ($Old#$parametre_e.CreatTS)
			$majEnreg_b:=True:C214
		End if 
	End if 
	
	If (Length:C16($parametre_e.ModifTS)=0)
		$Old:=$parametre_e.ModifTS
		$parametre_e.ModifTS:=Substring:C12(Timestamp:C1445; 1; 19)
		If ($Old#$parametre_e.ModifTS)
			$majEnreg_b:=True:C214
		End if 
	End if 
	
	If ($majEnreg_b)
		$nbrMaj_i:=$nbrMaj_i+1
		If ($execAvecMaj_b)
			$o:=$parametre_e.save()
			If (Not:C34($o.success))
				ALERT:C41("ko")
				TRACE:C157  // pour étude erreur
			End if 
		End if 
	End if 
	
End for each 

ALERT:C41("ok. Lus="+String:C10($nbrLus_i)+" ; Maj="+String:C10($nbrMaj_i))
