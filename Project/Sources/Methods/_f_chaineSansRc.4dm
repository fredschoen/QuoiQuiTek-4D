//%attributes = {}
//$1; $txt_t: text
//$0; $txt_t traduit sans rc ni tab : text
var $1; $0; $txt_t : Text
$txt_t:=$1
$txt_t:=Replace string:C233($txt_t; Char:C90(Carriage return:K15:38); "|"; *)
$txt_t:=Replace string:C233($txt_t; Char:C90(Tab:K15:37); "^"; *)
$0:=$txt_t