//%attributes = {}
//zzz_ModifDeMasse_Quoi
var $quoi_es : cs:C1710.QuoiSelection
var $quoi_e : cs:C1710.QuoiEntity
var $nbr_i : Integer
var $txt : Text

$txt:=""
$quoi_es:=ds:C1482.Quoi.all()
$nbr_i:=0
CLEAR PASTEBOARD:C402
$nomPrev:=""
For each ($quoi_e; $quoi_es)
	$go:=True:C214
	If ($quoi_e.Domaine#"LIVR")
		$go:=False:C215
	End if 
	If ($go)
		$pos:=Position:C15(" / "; $quoi_e.Nom)
		If ($pos=0)
			$go:=False:C215
		End if 
	End if 
	
	If ($go)
		$nom:=Substring:C12($quoi_e.Nom; 1; $pos)
		If ($nom=$nomPrev)
			$go:=False:C215
		Else 
			$nomPrev:=$nom
		End if 
	End if 
	
	If ($go)
		$pos2:=Position:C15(" "; $nom)
		$txt:=$txt+$nom+Char:C90(Tab:K15:37)+Substring:C12($nom; 1; $pos2)+Char:C90(Tab:K15:37)+Substring:C12($nom; $pos2+1; 999)+Char:C90(Carriage return:K15:38)
		$nbr_i:=$nbr_i+1
		If (False:C215)
			$status:=$quoi_e.save()
			If ($status.success)
			Else 
				ALERT:C41("ko")
				TRACE:C157
			End if 
		End if 
	End if 
	
End for each 
SET TEXT TO PASTEBOARD:C523($txt)
ALERT:C41("ok "+String:C10(($nbr_i)))