//%attributes = {}
$dom_c:=ds:C1482.Quoi.all().distinct("Domaine")
$x:=""
For each ($dom_t; $dom_c)
	
	$c:=ds:C1482.Quoi.query("Domaine = :1"; $dom_t).distinct("Stock")
	$x+=$dom_t+Char:C90(Carriage return:K15:38)
	For each ($t; $c)
		$x+=$t+";"
	End for each 
	$x+=Char:C90(Carriage return:K15:38)
	
End for each 
SET TEXT TO PASTEBOARD:C523($x)
