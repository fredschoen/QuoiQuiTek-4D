//%attributes = {}
//zzz_ModifDeMasse_Quoi
var $quoi_es : cs:C1710.QuoiSelection
var $quoi_e : cs:C1710.QuoiEntity
var $nbr_i : Integer
$quoi_es:=ds:C1482.Quoi.all()
$nbr_i:=0
For each ($quoi_e; $quoi_es)
	If ($quoi_e.Domaine="CINE")
		If ($quoi_e.Genre="Action")
			If ($quoi_e.Pays="SF")
				$nbr_i:=$nbr_i+1
				
				$quoi_e.Genre:="SF"
				$quoi_e.Pays:="US"
				If (True:C214)
					$status:=$quoi_e.save()
					If ($status.success)
					Else 
						ALERT:C41("ko")
						TRACE:C157
					End if 
				End if 
			End if 
		End if 
	End if 
	
End for each 
ALERT:C41("ok "+String:C10(($nbr_i)))