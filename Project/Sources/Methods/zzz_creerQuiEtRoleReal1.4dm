//%attributes = {}
//zzz_ModifDeMasse_Quoi
$execAvecMaj_b:=True:C214
var $quoi_es : cs:C1710.QuoiSelection
var $quoi_e : cs:C1710.QuoiEntity
var $nbrMaj_i : Integer
var $nbrLus_i : Integer
var $nbrSel_i : Integer
var $real_c : Collection

$real_c:=New collection:C1472()
$quoi_es:=ds:C1482.Quoi.all().orderBy("Date")

For each ($quoi_e; $quoi_es)
	
	$nbrLus_i:=$nbrLus_i+1
	
	If ($quoi_e.Real>"")
		$nbrSel_i:=$nbrSel_i+1
		$o:=New object:C1471()
		$o.real:=$quoi_e.Real
		$real_c.push($o)
	End if 
	
End for each 

$realFullName_c:=$real_c.distinct("real")
$txt:=""
For each ($fullName; $realFullName_c)
	$pos:=Position:C15(" "; $fullName)
	If ($pos>0)
		$prenom:=Substring:C12($fullName; 1; $pos)
		$nom:=Substring:C12($fullName; $pos+1; 999)
	Else 
		$prenom:=""
		$nom:=$fullName
	End if 
	$txt+=$fullName+Char:C90(Tab:K15:37)+$nom+Char:C90(Tab:K15:37)+$prenom+Char:C90(Carriage return:K15:38)
End for each 

SET TEXT TO PASTEBOARD:C523($txt)
//TRACE
ALERT:C41("Maj "+String:C10($nbrMaj_i)+", Lus "+String:C10($nbrLus_i)+", Sel "+String:C10($nbrSel_i)+" cf presse papier")
