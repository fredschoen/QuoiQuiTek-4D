//btCopier
var $e : cs:C1710.QuiEntity
$t:=""
For each ($e; Form:C1466.qui_es)
	$t+=$e.Nom+" "+$e.Prenom+Char:C90(Tab:K15:37)
	$t+=$e.Genre+Char:C90(Tab:K15:37)
	$t+=$e.Pays+Char:C90(Tab:K15:37)
	$t+="'"+$e.DateNaiss+Char:C90(Tab:K15:37)
	$t+="'"+$e.DateDeces+Char:C90(Tab:K15:37)
	$t+=$e.Domaine+Char:C90(Tab:K15:37)
	$t+=$e.Style+Char:C90(Tab:K15:37)
	$t+=Char:C90(Carriage return:K15:38)
End for each 
SET TEXT TO PASTEBOARD:C523($t)
ALERT:C41("cf. presse-papier")