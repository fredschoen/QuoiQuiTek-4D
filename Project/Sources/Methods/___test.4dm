//%attributes = {}
$cr:=New collection:C1472()
$c1:=ds:C1482.Quoi.all().distinct("Domaine")
For each ($t1; $c1)
	$c2:=ds:C1482.Quoi.query("Domaine = :1"; $t1).distinct("Genre")
	For each ($t2; $c2)
		$cr.push(New object:C1471("Domaine"; $t1; "Genre"; $t2))
	End for each 
End for each 

TRACE:C157

