//btCopier
var $e : cs:C1710.QuoiEntity
$t:=""
For each ($e; Form:C1466.quoi_es)
	$t+=$e.Nom+Char:C90(Tab:K15:37)
	$t+=$e.Domaine+Char:C90(Tab:K15:37)
	$t+=$e.Genre+Char:C90(Tab:K15:37)
	$t+=$e.Pays+Char:C90(Tab:K15:37)
	$t+=$e.Stock+Char:C90(Tab:K15:37)
	$t+=$e.Date+Char:C90(Tab:K15:37)
	$t+=Char:C90(Carriage return:K15:38)
End for each 
SET TEXT TO PASTEBOARD:C523($t)
ALERT:C41("cf. presse-papier")