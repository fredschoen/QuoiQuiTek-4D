//%attributes = {}
var $nom1; $nom2; $fullName; $nomFic; $tab; $rc : Text
var $maj : Boolean
var $status : Object
var $nbreEnregLus; $nbrMajQui : Integer
var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity

$maj:=True:C214

$rc:=Char:C90(Carriage return:K15:38)
$tab:=Char:C90(Tab:K15:37)
$nomFic:=System folder:C487(Desktop:K41:16)+"_Quoiquitek"+Folder separator:K24:12+"Qui FM.csv"
$nbreEnregLus:=0

CONFIRM:C162("OK pour maj QUI ?"+Char:C90(Carriage return:K15:38)+$nomFic)

If (OK=1)
	C_TIME:C306(vDoc)
	C_TEXT:C284(vData)
	vDoc:=Open document:C264($nomFic; "TEXT"; Read mode:K24:5)
End if 

If (OK=1)
	
	Repeat 
		
		RECEIVE PACKET:C104(vDoc; $genre; $tab)
		
		//tester fin de fichier
		If (OK=1)
			RECEIVE PACKET:C104(vDoc; $nom1; $tab)
			RECEIVE PACKET:C104(vDoc; $nom2; $tab)
			RECEIVE PACKET:C104(vDoc; $fullName; $tab)
			//champs de fin de la ligne : =>rc
			RECEIVE PACKET:C104(vDoc; vData; "\n")
			
			If ($genre>"A")
				$qui_es:=ds:C1482.Qui.query("FullName = :1"; $fullName)
				Case of 
					: ($qui_es.length=1)
						$qui_e:=$qui_es.first()
						$nbrMajQui:=$nbrMajQui+1
						$qui_e.Genre:=$genre
						If ($maj)
							$status_o:=$qui_e.save()
							If (Not:C34($status_o.success))
								ALERT:C41($status_o.statusText)
								TRACE:C157
							End if 
						End if 
					Else 
				End case 
				
				
				
			End if 
			
		End if 
	Until (OK=0)
	
	CLOSE DOCUMENT:C267(vDoc)  // Fermer le document 
	
	ALERT:C41("ok $nbrCreQui="+String:C10($nbrMajQui)+" $nbrMajQui="+String:C10($nbrMajQui))
	
End if 