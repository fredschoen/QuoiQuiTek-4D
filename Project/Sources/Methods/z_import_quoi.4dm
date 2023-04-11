//%attributes = {}

// Import_Quoi
C_TEXT:C284($texte; $nom; $nomDefaut; $tab; $rc)
C_LONGINT:C283($pos; $ID_Max)
C_OBJECT:C1216($status; $enregAjout)
C_TEXT:C284($nomlog; $texteLog)
$rc:=Char:C90(Carriage return:K15:38)
$tab:=Char:C90(Tab:K15:37)
$nomLog:="C:\\_testFred\\log.txt"
$ID_Max:=0
$nomDefaut:="C:\\_testFred\\Quoi.txt"

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
			$enregAjout:=ds:C1482.Quoi.new()
			$enregAjout.ID:=Num:C11(vData)
			If ($ID_Max<$enregAjout.ID)
				$ID_Max:=$enregAjout.ID
			End if 
			RECEIVE PACKET:C104(vDoc; vData; $tab)
			$enregAjout.Annee:=vData
			RECEIVE PACKET:C104(vDoc; vData; $tab)
			$enregAjout.Domaine:=vData
			RECEIVE PACKET:C104(vDoc; vData; $tab)
			$enregAjout.Genre:=vData
			RECEIVE PACKET:C104(vDoc; vData; $tab)
			$enregAjout.Pays:=vData
			RECEIVE PACKET:C104(vDoc; vData; $tab)
			$enregAjout.Nom:=vData
			RECEIVE PACKET:C104(vDoc; vData; $tab)  //ajouter pour les livres
			$enregAjout.Info:=vData  //ajouter pour les livres
			RECEIVE PACKET:C104(vDoc; vData; $tab)  //ajouter pour les livres
			$enregAjout.Stock:=vData  //ajouter pour les livres
			//champs de fin de la ligne : =>rc
			RECEIVE PACKET:C104(vDoc; vData; Char:C90(Carriage return:K15:38))
			
			////--calculer observation (avant tous les autres calculs)-----------------------------------
			//For ($pos; 1; Length(vData))
			//Case of 
			//: (vData[[$pos]]="|")
			//vData[[$pos]]:=Char(Carriage return)
			//: (vData[[$pos]]="^")
			//vData[[$pos]]:=Char(Tab)
			//Else 
			
			//End case 
			//End for 
			//$enregAjout.Observations_T:=vdata
			
			//RECEIVE PACKET(vDoc; vData; $tab)
			//$enregAjout.Quoi_Date_D:=Date(vdata)
			
			
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
	
	SET DATABASE PARAMETER:C642([Quoi:1]; Table sequence number:K37:31; $ID_Max)
	
	$texteLog:="Fichier "+$nom+" importé."+$rc+String:C10($nbreEnregImport)+" enreg importés"+$rc+"Numéro automatique table ="+String:C10($ID_Max)
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