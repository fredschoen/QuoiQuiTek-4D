//%attributes = {}
var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity
$qui_es:=ds:C1482.Qui.all()
For each ($qui_e; $qui_es)
	If ($qui_e.DateDeces>0) & ($qui_e.DateDeces="")
		
	End if 
	
End for each 
ALERT:C41("ok")