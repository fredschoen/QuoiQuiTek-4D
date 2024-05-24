//%attributes = {}
//mBtCopier
var $txt : Text
$txt:=Replace string:C233(Form:C1466.message; "' dans '"; " ")
$txt:=Replace string:C233($txt; "Info sur '"; " ")
$txt:=Replace string:C233($txt; "'"; "")
SET TEXT TO PASTEBOARD:C523($txt)
