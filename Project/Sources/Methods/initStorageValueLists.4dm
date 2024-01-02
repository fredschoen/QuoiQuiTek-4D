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
	$stockQuoiListe_t:=ds:C1482.Parametre.query("Nom = :1 and Niv1 = :2"; "stockQuoi"; $domaineQuoi_t).first().Niv2
	$stockQuoiTmp_c:=Split string:C1554($stockQuoiListe_t; ";")
	$stockQuoi_c.push(New object:C1471("type"; $domaineQuoi_t; "values"; New collection:C1472($stockQuoiTmp_c)))
	
End for each 
Use (Storage:C1525)
	Storage:C1525.stockQuoi:=$stockQuoi_c.copy(ck shared:K85:29)
End use 
