//%attributes = {}
//_f_TransfoDateQui_Edit
$x:=Replace string:C233($1; "-"; "")
$i:=8-Length:C16($x)
If ($i>0)
	$x:=$x+Substring:C12("          "; 1; $i)
End if 

$0:=$x
