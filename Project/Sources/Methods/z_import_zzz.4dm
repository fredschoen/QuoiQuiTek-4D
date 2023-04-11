//%attributes = {}
// Import_zzz
C_TEXT:C284($texte; $nom; $nomDefaut; $tab; $rc)
C_LONGINT:C283($pos; $ID_Max)
C_OBJECT:C1216($status; $enregAjout)
C_TEXT:C284($nomFic; $texteLog)
$rc:=Char:C90(Carriage return:K15:38)
$tab:=Char:C90(Tab:K15:37)

$nomFic:=System folder:C487(Desktop:K41:16)+"annivMonrocq.txt"


C_LONGINT:C283($nbreEnregImport)
$nbreEnregImport:=0

CONFIRM:C162("OK pour import"+$nomFic+" ?")

If (OK=1)
	C_TIME:C306(vDoc)
	C_TEXT:C284(vData)
	vDoc:=Open document:C264($nomFic; "TEXT"; Read mode:K24:5)
End if 

If (OK=1)
	
	
	Repeat 
		
		RECEIVE PACKET:C104(vDoc; vData; $tab)
		
		//tester fin de fichier
		If (OK=1)
			$enregAjout:=ds:C1482.zzz.new()
			$enregAjout.c1:=vData
			RECEIVE PACKET:C104(vDoc; vData; $tab)
			$enregAjout.c2:=vData
			
			$status:=$enregAjout.save()
			If ($status.success)
				$nbreEnregImport:=$nbreEnregImport+1
			Else 
				ALERT:C41("$enregAjout.save() KO")
				OK:=0
			End if 
			If (ok=1)
				//RECEIVE PACKET(vDoc; vData; Char(Carriage return))
				RECEIVE PACKET:C104(vDoc; vData; Char:C90(Line feed:K15:40))
			End if 
		End if 
	Until (OK=0)
	
	CLOSE DOCUMENT:C267(vDoc)  // Fermer le document 
End if 
ALERT:C41(String:C10($nbreEnregImport)+"enreg importés")
