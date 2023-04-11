//%attributes = {}
//zzz_ModifDeMasse_Role
var $Role_liste : Object
var $Role_ele : Object
var $i : Integer
var $j : Integer
$Role_liste:=ds:C1482.Role.all()

For each ($Role_ele; $Role_liste)
	If ($Role_ele.Descr="MUS")
		If (True:C214)
			$status:=$Role_ele.drop()
		End if 
		$i:=$i+1
	Else 
		$j:=$j+1
		
	End if 
	
End for each 
ALERT:C41("ok "+String:C10($i)+" sur "+String:C10($j))