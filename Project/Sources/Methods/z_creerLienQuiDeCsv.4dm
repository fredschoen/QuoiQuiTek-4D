//%attributes = {}

$maj:=True:C214
$domaine:="ECR"
$descr:="Ecrivain"

C_TEXT:C284($texte; $nom; $nomFic; $tab; $rc)
C_LONGINT:C283($pos; $ID_Max)
C_OBJECT:C1216($status; $enregAjout)
C_TEXT:C284($nomlog; $texteLog)

var $qui_es : cs:C1710.QuiSelection
var $qui_e : cs:C1710.QuiEntity
var $quoi_es : cs:C1710.QuoiSelection
var $quoi_e : cs:C1710.QuoiEntity
var $nbrCreQui; $nbrCreRole : Integer

$rc:=Char:C90(Carriage return:K15:38)
$tab:=Char:C90(Tab:K15:37)
$nomFic:=Folder:C1567(fk resources folder:K87:11).platformPath+"ImportNomLIVR1.csv"

C_LONGINT:C283($nbreEnregImport)
$nbreEnregImport:=0

CONFIRM:C162("OK pour import QUI ?"+Char:C90(Carriage return:K15:38)+$nomFic)

If (OK=1)
	C_TIME:C306(vDoc)
	C_TEXT:C284(vData)
	vDoc:=Open document:C264($nomFic; "TEXT"; Read mode:K24:5)
End if 
If (OK=1)
	
	Repeat 
		
		RECEIVE PACKET:C104(vDoc; $fullNameOld; $tab)
		
		//tester fin de fichier
		If (OK=1)
			RECEIVE PACKET:C104(vDoc; $nom1; $tab)
			RECEIVE PACKET:C104(vDoc; $nom2; $tab)
			RECEIVE PACKET:C104(vDoc; $type; $tab)
			//champs de fin de la ligne : =>rc
			RECEIVE PACKET:C104(vDoc; vData; "\n")
			$fullNameOld:=Substring:C12($fullNameOld; 1; Length:C16($fullNameOld)-1)
			$nom1:=Substring:C12($nom1; 1; Length:C16($nom1)-1)
			$nom2:=Substring:C12($nom2; 1; Length:C16($nom2)-1)
			//If ($nom2="")
			//$fullNameNew:=$nom1
			//Else 
			//$fullNameNew:=$nom2+" "+$nom1
			//End if 
			$fullNameNew:=$fullNameOld
			
			If ($type="e")
				$qui_es:=ds:C1482.Qui.query("FullName = :1"; $fullNameNew)
				Case of 
					: ($qui_es.length=0)
						$nbrCreQui:=$nbrCreQui+1
						$qui_e:=ds:C1482.Qui.new()
						$qui_e.Nom:=$fullNameNew
						$qui_e.Domaine:=$domaine
						If ($maj)
							$status_o:=$qui_e.save()
							If (Not:C34($status_o.success))
								ALERT:C41($status_o.statusText)
								TRACE:C157
							End if 
						End if 
					: ($qui_es.length=1)
						$qui_e:=$qui_es.first()
					Else 
						TRACE:C157
				End case 
				
				$quoi_es:=ds:C1482.Quoi.query("Nom= :1"; $fullNameOld+"@")
				For each ($quoi_e; $quoi_es)
					If ($quoi_e.roles.length=0)
						$nbrCreRole:=$nbrCreRole+1
						$role_e:=ds:C1482.Role.new()
						$role_e.ID_Qui:=$qui_e.ID
						$role_e.ID_Quoi:=$quoi_e.ID
						$role_e.Descr:=$descr
						
						If ($maj)
							$status_o:=$role_e.save()
							If (Not:C34($status_o.success))
								ALERT:C41($status_o.statusText)
								TRACE:C157
							End if 
						End if 
						
					End if 
				End for each 
				
			End if 
			
		End if 
	Until (OK=0)
	
	CLOSE DOCUMENT:C267(vDoc)  // Fermer le document 
	
	ALERT:C41("ok $nbrCreQui="+String:C10($nbrCreQui)+" $nbrCreRole="+String:C10($nbrCreRole))
	
End if 