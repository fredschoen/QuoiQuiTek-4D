//%attributes = {}
// exportAllData
//

var $fileName_t : Text
var $exportFile_f : 4D:C1709.File
var $tableName_t; $fieldName_t; $fieldValue_t; $fileContent_t : Text
var $tableNumber_i; $fieldNumber_i : Integer

$exportFolder_fd:=Folder:C1567(fk resources folder:K87:11).folder("export")
If (Not:C34($exportFolder_fd.exists))
	$exportFolder_fd.create()
End if 

For ($tableNumber_i; 1; Get last table number:C254)
	If (Is table number valid:C999($tableNumber_i))
		$fileContent_t:=""
		$tableName_t:=Table name:C256($tableNumber_i)
		//1ère ligne = nom de la table + liste des champs
		$fileContent_t+=$tableName_t
		$fileContent_t+=Char:C90(Tab:K15:37)
		//liste des champs
		For ($fieldNumber_i; 1; Get last field number:C255($tableNumber_i))
			If (Is field number valid:C1000($tableNumber_i; $fieldNumber_i))
				$fileContent_t+=Field name:C257($tableNumber_i; $fieldNumber_i)
				$fileContent_t+=Char:C90(Tab:K15:37)
			End if 
		End for 
		
		//valeur des champs: n lignes (une pas enreg)
		$es:=ds:C1482[$tableName_t].all()
		For each ($e; $es)
			$fileContent_t+=Char:C90(Carriage return:K15:38)
			$fileContent_t+=$tableName_t
			For ($fieldNumber_i; 1; Get last field number:C255($tableNumber_i))
				If (Is field number valid:C1000($tableNumber_i; $fieldNumber_i))
					$fieldName_t:=Field name:C257($tableNumber_i; $fieldNumber_i)
					$fieldType_t:=ds:C1482[$tableName_t][$fieldName_t].type  //="number"
					$fieldValue_t:=String:C10($e[$fieldName_t])
					If ($fieldType_t="string")
						$fieldValue_t:=Replace string:C233($fieldValue_t; Char:C90(Carriage return:K15:38); "|")
						$fieldValue_t:=Replace string:C233($fieldValue_t; Char:C90(Line feed:K15:40); "|")
						$fieldValue_t:=Replace string:C233($fieldValue_t; Char:C90(Tab:K15:37); "^")
					End if 
					
					$fileContent_t+=Char:C90(Tab:K15:37)
					$fileContent_t+=String:C10($fieldValue_t)
				End if 
			End for 
		End for each 
		
		$fileName_t:=$tableName_t+".txt"
		
		$exportFile_f:=$exportFolder_fd.file($fileName_t)
		$exportFile_f.setText($fileContent_t)
		
	End if 
End for 

SHOW ON DISK:C922($exportFile_f.platformPath)
