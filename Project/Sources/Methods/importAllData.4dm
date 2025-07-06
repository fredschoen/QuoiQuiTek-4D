//%attributes = {}
// importAllData
//
var $importFile_f : 4D:C1709.File
var $fileName_t; $fileContent_t; $line_t; $fieldName_t; $fieldType_t; $fieldValue_t : Text
var $line_c; $column_c; $columnName_c : Collection
var $lineNumber_i; $columnNumber_i; $tableNumber_i; $ID_Max_i : Integer
var $tableToSearch_p : Pointer

//confirmer
CONFIRM:C162("OK pour raz et importer tout ?"; "NON"; "OUI")
If (ok=1)
	return 
End if 

//sauvegarde
BACKUP:C887

//repertoire de l'import
$exportFolder_fd:=Folder:C1567(fk resources folder:K87:11).folder("export")
If (Not:C34($exportFolder_fd.exists))
	ALERT:C41($exportFolder_fd.platformPath+"inexistant")
	return 
End if 

For ($tableNumber_i; 1; Get last table number:C254)
	
	If (Not:C34(Is table number valid:C999($tableNumber_i)))
		continue
	End if 
	//une table
	$tableName_t:=Table name:C256($tableNumber_i)
	$fileName_t:=$tableName_t+".csv"
	
	$importFile_f:=$exportFolder_fd.file($fileName_t)
	If (Not:C34($importFile_f.exists))
		ALERT:C41($importFile_f.platformPath+" non trouvé")
		continue
	End if 
	
	ds:C1482[$tableName_t].all().drop()
	
	$fileContent_t:=$importFile_f.getText()
	
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
		
		$tableName_t:=Table name:C256($tableNumber_i)
		$e:=ds:C1482[$tableName_t].new()
		$columnNumber_i:=0
		
		For each ($column_t; $column_c)
			//un champs d'une ligne
			$columnNumber_i+=1
			If ($columnNumber_i=1)  //col 1 = nom table
				continue
			End if 
			$fieldName_t:=$columnName_c[$columnNumber_i-1]
			$fieldType_t:=ds:C1482[$tableName_t][$fieldName_t].type  //="number"
			
			Case of 
				: ($fieldType_t="number")
					$e[$fieldName_t]:=Num:C11($column_t)
				: ($fieldType_t="date")
					$e[$fieldName_t]:=Date:C102($column_t)
				Else 
					//décoder les caractères spéciaux (tab et cr)
					If ($fieldValue_t="Le Bison") & ($fieldName_t="Info")
						TRACE:C157
					End if 
					
					$fieldValue_t:=Replace string:C233($column_t; "|"; Char:C90(Carriage return:K15:38))
					$fieldValue_t:=Replace string:C233($fieldValue_t; "^"; Char:C90(Tab:K15:37))
					$e[$fieldName_t]:=$fieldValue_t
			End case 
			
		End for each 
		$o:=$e.save()
		If (Not:C34($o.success))
			ALERT:C41("save KO")
			TRACE:C157
		End if 
		
	End for each 
	
	//Maj dernier ID de la table
	$ID_Max_i:=ds:C1482[$tableName_t].all().max("ID")
	$tableToSearch_p:=Table:C252($tableNumber_i)
	SET DATABASE PARAMETER:C642($tableToSearch_p->; Table sequence number:K37:31; $ID_Max_i)
	
End for 

ALERT:C41("OK")
