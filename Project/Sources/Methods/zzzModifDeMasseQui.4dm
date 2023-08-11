//%attributes = {}
var $es : cs:C1710.QuiSelection
var $e : cs:C1710.QuiEntity
var $z_es : cs:C1710.zzzSelection
var $z_e : cs:C1710.zzzEntity
var $select : Boolean

$es:=ds:C1482.Qui.all()
For each ($e; $es)
	$select:=True:C214
	
	$select:=($e.Style="Mrcq")
	
	If ($select)
		$z_es:=ds:C1482.zzz.query("c2=:1"; $e.Prenom)
		$select:=($z_es.length>0)
		If (Not:C34($select))
			ALERT:C41($e.Prenom+" non trouvé")
		End if 
	End if 
	
	If ($select)
		$z_e:=$z_es.first()
	End if 
	
	
	If ($select)
		
		$e.DateNaiss:=$z_e.c1
		
		//$e.DateNaiss:=String($e.AnneeNaiss)
		
		//$i:=Position(" "; $e.FullName)
		//If ($i>0)
		//$e.Prenom:=Substring($e.FullName; 1; $i-1)
		//$e.Nom:=Substring($e.FullName; $i+1; Length($e.FullName))
		//Else 
		//$e.Nom:=$e.FullName
		//End if 
		
		$o:=$e.save()
		If (Not:C34($o.success))
			ALERT:C41("ko")
			TRACE:C157  // pour étude erreur
			
		End if 
	End if 
	
	
End for each 

ALERT:C41("ok")
