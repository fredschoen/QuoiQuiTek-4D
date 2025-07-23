//%attributes = {}
// z_ImportQuiCsvAnc
//
var $quoi_e : cs:C1710.QuoiEntity
var $importFile_f : 4D:C1709.File
var $fileContent_t; $line_t; $fieldType_t; $fieldValue_t : Text
var $line_c; $column_c; $columnName_c : Collection
var $lineNumber_i; $columnNumber_i; $tableNumber_i : Integer

//repertoire de l'import
$importFile_f:=Folder:C1567(fk resources folder:K87:11).file("importAnc.csv")
If (Not:C34($importFile_f.exists))
	ALERT:C41($importFile_f.platformPath+" non trouvé")
	return 
End if 
$fileContent_t:=Replace string:C233($importFile_f.getText(); Char:C90(Line feed:K15:40); "")
$line_c:=Split string:C1554($fileContent_t; Char:C90(Carriage return:K15:38))
$lineNumber_i:=0
For each ($line_t; $line_c)
	//une ligne d'une table
	$lineNumber_i+=1
	//le dernière ligne peut être vide si retravaillée dans excel
	If (Length:C16($line_t)<2)
		continue
	End if 
	//éclater en colonnes
	$column_c:=Split string:C1554($line_t; Char:C90(Tab:K15:37))
	//mémoriser tous les noms de colonnes (=ligne 1)
	If ($lineNumber_i=1)
		$columnName_c:=$column_c
		continue
	End if 
	$quoi_e:=ds:C1482.Quoi.new()
	$quoi_e.Date_AAAA:=Num:C11($column_c[0])
	$quoi_e.Domaine:=$column_c[1]
	$quoi_e.Nom:=$column_c[2]
	//sauve
	$status:=$quoi_e.save()
	If ($status.success)
	Else 
		ALERT:C41("save() KO")
		TRACE:C157
	End if 
End for each 
ALERT:C41("ok")
