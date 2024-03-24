//%attributes = {}
//initStorageValueLists  
//objectif: 
// - initialiser les listes de valeurs des écran (Régie des créances)
var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity
var $quoi_es : cs:C1710.QuoiSelection
var $quoi_e : cs:C1710.QuoiEntity
var $domaineQui_c : Collection
var $domaineQuoi_c : Collection
$domaineQuiListe_t:=ds:C1482.Parametre.query("Nom = :1"; "domaineQui").first().Niv1
$domaineQui_c:=Split string:C1554($domaineQuiListe_t; ";")
$domaineQuoiListe_t:=ds:C1482.Parametre.query("Nom = :1"; "domaineQuoi").first().Niv1
$domaineQuoi_c:=Split string:C1554($domaineQuoiListe_t; ";")

Use (Storage:C1525)
	Storage:C1525.domaineQui:=$domaineQui_c.copy(ck shared:K85:29)
	Storage:C1525.domaineQuoi:=$domaineQuoi_c.copy(ck shared:K85:29)
End use 

$stockQuoi_c:=New collection:C1472
For each ($domaineQuoi_t; $domaineQuoi_c)
	If ($domaineQuoi_t#"")
		$stockQuoiListe_t:=ds:C1482.Parametre.query("Nom = :1 and Niv1 = :2"; "stockQuoi"; $domaineQuoi_t).first().Niv2
		$stockQuoiTmp_c:=Split string:C1554($stockQuoiListe_t; ";")
		//$stockQuoi_c.push(New object("type"; $domaineQuoi_t; "values"; New collection($stockQuoiTmp_c)))
		$stockQuoi_c.push(New object:C1471("type"; $domaineQuoi_t; "values"; $stockQuoiTmp_c))
	End if 
End for each 
Use (Storage:C1525)
	Storage:C1525.stockQuoi:=$stockQuoi_c.copy(ck shared:K85:29)
End use 


//Liste Hierarchique GenreQuoi
var hlGenreQuoi; $hSousListeN1 : Integer
var $i : Integer
hlGenreQuoi:=New list:C375
$genreQuoi_c:=New collection:C1472()
$es1:=ds:C1482.Parametre.query("Nom = :1 AND Niv1 = :2"; "GenreQuoi"; "")
If ($es1.length=0)
	return 
End if 
$hSousListeN1:=New list:C375
$e1:=$es1.first()
$c1:=Split string:C1554($es1.first().Niv2; ";")
For each ($t1; $c1)
	$es2:=ds:C1482.Parametre.query("Nom = :1 AND Niv1 = :2"; $e1.Nom; $t1)
	If ($es2.length>0)
		$c2:=Split string:C1554($es2.first().Niv2; ";")
		$hSousListeN1:=New list:C375
		For each ($t2; $c2)
			$i+=1
			$genreQuoi_c.push(New object:C1471("ID"; $i; "Niv0"; $t1; "Niv1"; $t2))
			APPEND TO LIST:C376($hSousListeN1; $t2; $i)
		End for each 
		$i+=1
		$genreQuoi_c.push(New object:C1471("ID"; $i; "Niv0"; $t1; "Niv1"; ""))
		APPEND TO LIST:C376(hlGenreQuoi; $t1; $i; $hSousListeN1; True:C214)
	End if 
End for each 
// Forcer la hauteur de ligne minimale à 14 Pts
SET LIST PROPERTIES:C387(hlGenreQuoi; 0; 0; 14)

Use (Storage:C1525)
	Storage:C1525.genreQuoi:=$genreQuoi_c.copy(ck shared:K85:29)
End use 
