//%attributes = {}
$DateNaiss:="1942"
Case of 
	: (Length:C16($DateNaiss)=8)
		$DatNaissDisplay:=Substring:C12($DateNaiss; 1; 4)+"-"+Substring:C12($DateNaiss; 5; 2)+"-"+Substring:C12($DateNaiss; 7; 2)
	: (Length:C16($DateNaiss)=6)
		$DatNaissDisplay:=Substring:C12($DateNaiss; 1; 4)+"-"+Substring:C12($DateNaiss; 5; 2)
	Else 
		$DatNaissDisplay:=$DateNaiss
End case 

ALERT:C41($DatNaissDisplay)
