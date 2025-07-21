//%attributes = {}
//zzz_ModifDeMasse_Quoi
$execAvecMaj_b:=True:C214
var $quoi_es : cs:C1710.QuoiSelection
var $quoi_e : cs:C1710.QuoiEntity
var $nbrMaj_i : Integer
var $nbrLus_i : Integer

$quoi_es:=ds:C1482.Quoi.all().orderBy("Date")

For each ($quoi_e; $quoi_es)
	
	$l:=Length:C16($quoi_e.Date)
	Case of 
		: ($l=4)
			$quoi_e.Date_AAAA:=Num:C11($quoi_e.Date)
		: ($l=5)
			$quoi_e.Date_AAAA:=Num:C11($quoi_e.Date)
		: ($l=7)
			$quoi_e.Date_AAAA:=Num:C11(Substring:C12($quoi_e.Date; 1; 4))
			$quoi_e.Date_MM:=Num:C11(Substring:C12($quoi_e.Date; 6; 2))
		: ($l=10)
			$quoi_e.Date_AAAA:=Num:C11(Substring:C12($quoi_e.Date; 1; 4))
			$quoi_e.Date_MM:=Num:C11(Substring:C12($quoi_e.Date; 6; 2))
			$quoi_e.Date_JJ:=Num:C11(Substring:C12($quoi_e.Date; 9; 2))
	End case 
	
	Case of 
		: ($quoi_e.Date_JJ>0)
			$quoi_e.Date:=String:C10($quoi_e.Date_AAAA; "0000")+"-"+String:C10($quoi_e.Date_MM; "00")+"-"+String:C10($quoi_e.Date_JJ; "00")
		: ($quoi_e.Date_MM>0)
			$quoi_e.Date:=String:C10($quoi_e.Date_AAAA; "0000")+"-"+String:C10($quoi_e.Date_MM; "00")
		: ($quoi_e.Date_JJ>0)
			$quoi_e.Date:=String:C10($quoi_e.Date_AAAA; "0000")
		Else 
			$quoi_e.Date:=""
	End case 
	
	$o:=$quoi_e.save()
	
	If ($o.success)
		$nbrMaj_i:=$nbrMaj_i+1
	Else 
		ALERT:C41("KO save")
		TRACE:C157
	End if 
	
	$nbrLus_i:=$nbrLus_i+1
	
End for each 

ALERT:C41("ok "+String:C10($nbrMaj_i)+" sur "+String:C10($nbrLus_i))
