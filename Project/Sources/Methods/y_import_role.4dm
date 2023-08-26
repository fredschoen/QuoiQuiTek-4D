//%attributes = {}

// Import_Role
C_TEXT:C284($texte; $nom; $nomDefaut; $tab; $rc)
C_LONGINT:C283($pos; $ID_Max)
C_OBJECT:C1216($status; $enregAjout)
C_TEXT:C284($nomlog; $texteLog)
$rc:=Char:C90(Carriage return:K15:38)
$tab:=Char:C90(Tab:K15:37)
$nomLog:="C:\\_testFred\\log.txt"
$ID_Max:=0
$nomDefaut:="C:\\_testFred\\Roleb.txt"

C_LONGINT:C283($nbreEnregImport)
$nbreEnregImport:=0

CONFIRM:C162("OK pour import ?")

If (OK=1)
	C_TIME:C306(vDoc)
	C_TEXT:C284(vData)
	vDoc:=Open document:C264($nomDefaut; "TEXT"; Read mode:K24:5)
End if 
If (OK=1)
	
	//1er enreg = titre (ligne à passer)
	RECEIVE PACKET:C104(vDoc; vData; $rc)
	
	Repeat 
		
		RECEIVE PACKET:C104(vDoc; vData; $tab)
		
		//tester fin de fichier
		If (OK=1)
			$enregAjout:=ds:C1482.Role.new()
			$enregAjout.ID_Qui:=Num:C11(vData)
			RECEIVE PACKET:C104(vDoc; vData; $tab)
			$enregAjout.ID_Quoi:=Num:C11(vData)
			RECEIVE PACKET:C104(vDoc; vData; $tab)
			$enregAjout.Descr:=vData
			//champs de fin de la ligne : =>rc
			RECEIVE PACKET:C104(vDoc; vData; Char:C90(Carriage return:K15:38))
			
			
			//sauve
			$status:=$enregAjout.save()
			If ($status.success)
				$nbreEnregImport:=$nbreEnregImport+1
			Else 
				ALERT:C41("$enregAjout.save() KO")
				OK:=1
			End if 
		End if 
	Until (OK=0)
	
	CLOSE DOCUMENT:C267(vDoc)  // Fermer le document 
	
	$texteLog:="Fichier "+$nom+" importé."+$rc+String:C10($nbreEnregImport)+" enreg importés"
	ALERT:C41($texteLog)
	//creer le fichier log si nécessaire
	If (Test path name:C476($nomlog)#Is a document:K24:1)
		$log:=Create document:C266($nomLog; "TEXT")
		SEND PACKET:C103($log; $rc)
		CLOSE DOCUMENT:C267($log)
	End if 
	
	
	//ajouter  dans log
	$log:=Append document:C265($nomlog; "TEXT")
	If (OK=1)
		SEND PACKET:C103($log; "----------------"+$rc+String:C10(Current date:C33)+" "+String:C10(Current time:C178)+":"+$rc)
		SEND PACKET:C103($log; $texteLog+$rc)
		CLOSE DOCUMENT:C267($log)  // Fermer le document 
	End if 
	
End if 