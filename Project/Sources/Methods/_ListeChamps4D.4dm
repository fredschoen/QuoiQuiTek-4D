//%attributes = {}

ARRAY TEXT:C222($asTables; Get last table number:C254)

For ($vlTable; Size of array:C274($asTables); 1; -1)
	If (Is table number valid:C999($vlTable))
		$asTables{$vlTable}:=Table name:C256($vlTable)
		
		ARRAY TEXT:C222($asFields; Get last field number:C255($vlTable))
		
		For ($vlField; Size of array:C274($asFields); 1; -1)
			If (Is field number valid:C1000($vlTable; $vlField))
				$asFields{$vlField}:=Field name:C257($vlTable; $vlField)
			Else 
				DELETE FROM ARRAY:C228($asFields; $vlField)
			End if 
		End for 
		
	Else 
		DELETE FROM ARRAY:C228($asTables; $vlTable)
	End if 
End for 

