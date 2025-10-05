//%attributes = {}
//zzz_ModifDeMasse_Quoi
$execAvecMaj_b:=True:C214
var $quoi_es : cs:C1710.QuoiSelection
var $quoi_e : cs:C1710.QuoiEntity
var $nbrMaj_i : Integer
var $nbrLus_i : Integer
var $nbrSel_i : Integer
var $real_c : Collection

$real_c:=New collection:C1472()
$quoi_es:=ds:C1482.Quoi.query("Real > :1"; "").orderBy("Real")

For each ($quoi_e; $quoi_es)
	
	$nbrLus_i:=$nbrLus_i+1
	
	If ($quoi_e.Real>"")
		$fullName:=$quoi_e.Real
		$nbrSel_i:=$nbrSel_i+1
		$pos:=Position:C15(" "; $fullName)
		$fullName:=$quoi_e.Real
		If ($pos>0)
			$prenom:=Substring:C12($fullName; 1; $pos-1)
			$nom:=Substring:C12($fullName; $pos+1; 999)
		Else 
			$prenom:=""
			$nom:=$fullName
		End if 
		
		//lire ou créer qui
		var $Qui_e : cs:C1710.QuiEntity
		var $Role_e : cs:C1710.RoleEntity
		
		ds:C1482.startTransaction()
		$qui_es:=ds:C1482.Qui.query("FullName = :1"; $fullName)
		If ($qui_es.length=0)
			$Qui_e:=ds:C1482.Qui.new()
			$qui_e.Nom:=$nom
			$qui_e.FullName:=$fullName
			$qui_e.Prenom:=$prenom
			$qui_e.Domaine:=$quoi_e.Domaine
			$Qui_e.Info:=$quoi_e.Nom
			$status_o:=$qui_e.save()
			If (Not:C34($status_o.success))
				ALERT:C41($status_o.statusText)
				TRACE:C157
			End if 
		Else 
			$Qui_e:=$qui_es.first()
		End if 
		
		//creer role
		$role_e:=ds:C1482.Role.new()
		$role_e.ID_Qui:=$qui_e.ID
		$role_e.ID_Quoi:=$quoi_e.ID
		$role_e.Descr:="réalisateur"
		$status_o:=$role_e.save()
		If (Not:C34($status_o.success))
			ALERT:C41($status_o.statusText)
			TRACE:C157
		End if 
		
	End if 
	ds:C1482.validateTransaction()
	
End for each 

ALERT:C41("Lus "+String:C10($nbrLus_i)+", Sel "+String:C10($nbrSel_i))
