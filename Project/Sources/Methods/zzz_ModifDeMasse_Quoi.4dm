//%attributes = {}
//zzz_ModifDeMasse_Quoi
var $quoi_liste : Object
var $quoi_ele : Object
$quoi_liste:=ds:C1482.Quoi.all()

For each ($quoi_ele; $quoi_liste)
	If ($quoi_ele.Domaine="MUS")
		If (True:C214)
			$quoi_ele.Stock:="Disk"
			$status:=$quoi_ele.save()
			
		End if 
		
	End if 
	
End for each 
ALERT:C41("ok")