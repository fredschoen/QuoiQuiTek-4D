//%attributes = {}
//zzz_ModifDeMasse_Quoi
$execAvecMaj_b:=True:C214
var $quoi_es : cs:C1710.QuoiSelection
var $quoi_e : cs:C1710.QuoiEntity
var $nbrMaj_i : Integer
var $nbrLus_i : Integer

$quoi_es:=ds:C1482.Quoi.all().orderBy("Date")

For each ($quoi_e; $quoi_es)
	
	$nbrLus_i:=$nbrLus_i+1
	
	If ($quoi_e.Real>"")
		
		Replace string:C233($quoi_e.Real; "jean ")
		$o:=$quoi_e.save()
		
		If ($o.success)
			$nbrMaj_i:=$nbrMaj_i+1
		Else 
			ALERT:C41("KO save")
			TRACE:C157
		End if 
		
	End if 
End for each 

ALERT:C41("ok "+String:C10($nbrMaj_i)+" sur "+String:C10($nbrLus_i))
