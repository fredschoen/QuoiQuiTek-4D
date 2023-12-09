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
$domaineQui_t:=ds:C1482.Parametre.query("Nom = :1"; "domaineQui").first().Niv1
$domaineQui_c:=Split string:C1554($domaineQui_t; ";")
$domaineQuoi_t:=ds:C1482.Parametre.query("Nom = :1"; "domaineQuoi").first().Niv1
$domaineQuoi_c:=Split string:C1554($domaineQuoi_t; ";")

Use (Storage:C1525)
	Storage:C1525.domaineQui:=$domaineQui_c.copy(ck shared:K85:29)
	Storage:C1525.domaineQuoi:=$domaineQuoi_c.copy(ck shared:K85:29)
End use 
