//%attributes = {}
//_f_transfoDateQui_Stock
$Date_t:=Replace string:C233($1; " "; "")
Case of 
	: (Length:C16($Date_t)=8)
		$DatNaissDisplay:=Substring:C12($Date_t; 1; 4)+"-"+Substring:C12($Date_t; 5; 2)+"-"+Substring:C12($Date_t; 7; 2)
	: (Length:C16($Date_t)=6)
		$DatNaissDisplay:=Substring:C12($Date_t; 1; 4)+"-"+Substring:C12($Date_t; 5; 2)
	Else 
		$DatNaissDisplay:=$Date_t
End case 

$0:=$DatNaissDisplay