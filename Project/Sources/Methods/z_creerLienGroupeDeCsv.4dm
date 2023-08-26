//%attributes = {}
//z_creerLienGroupeDeCsv

$maj:=False:C215

C_TEXT:C284($texte; $nom; $nomFic; $tab; $rc)
C_LONGINT:C283($pos; $ID_Max)
C_OBJECT:C1216($status; $enregAjout)
C_TEXT:C284($nomlog; $texteLog)
var $nbrCreGroupe; $nbrCreRole : Integer

var $groupe_es : cs:C1710.GroupeSelection
var $groupe_e : cs:C1710.GroupeEntity
var $quoi_es : cs:C1710.QuoiSelection
var $quoi_e : cs:C1710.QuoiEntity
var $txt : Text
$rc:=Char:C90(Carriage return:K15:38)
$tab:=Char:C90(Tab:K15:37)
$nomFic:=Folder:C1567(fk resources folder:K87:11).platformPath+"ImportNomDeQuoi1.csv"

C_LONGINT:C283($nbreEnregImport)
$nbreEnregImport:=0

CONFIRM:C162("OK pour import groupe ? "+String:C10($maj)+Char:C90(Carriage return:K15:38)+$nomFic)

If (OK=1)
	C_TIME:C306(vDoc)
	C_TEXT:C284(vData)
	vDoc:=Open document:C264($nomFic; "TEXT"; Read mode:K24:5)
End if 
If (OK=1)
	$txt:=""
	Repeat 
		
		RECEIVE PACKET:C104(vDoc; $fullName; $tab)
		
		//tester fin de fichier
		If (OK=1)
			RECEIVE PACKET:C104(vDoc; $nom1; $tab)
			RECEIVE PACKET:C104(vDoc; $nom2; $tab)
			RECEIVE PACKET:C104(vDoc; $type; $tab)
			//champs de fin de la ligne : =>rc
			RECEIVE PACKET:C104(vDoc; vData; "\n")
			
			If ($type="g")
				$fullName:=Substring:C12($fullName; 1; Length:C16($fullName)-1)
				$groupe_es:=ds:C1482.Groupe.query("Nom = :1"; $fullName)
				Case of 
					: ($groupe_es.length=0)
						$nbrCreGroupe:=$nbrCreGroupe+1
						$groupe_e:=ds:C1482.Groupe.new()
						$groupe_e.Nom:=$fullName
						$groupe_e.Domaine:="MUS"
						$txt:=$txt+$fullName+Char:C90(Carriage return:K15:38)
						If ($maj)
							$status_o:=$groupe_e.save()
							If (Not:C34($status_o.success))
								ALERT:C41($status_o.statusText)
								TRACE:C157
							End if 
						End if 
					: ($groupe_es.length=1)
						$groupe_e:=$groupe_es.first()
					Else 
						TRACE:C157
				End case 
				
				$quoi_es:=ds:C1482.Quoi.query("Nom = :1"; $fullName+" /@")
				For each ($quoi_e; $quoi_es)
					$nbrCreRole:=$nbrCreRole+1
					$role_e:=ds:C1482.Role.new()
					$role_e.ID_Groupe:=$groupe_e.ID
					$role_e.ID_Quoi:=$quoi_e.ID
					$role_e.Descr:="Groupe"
					
					If ($maj)
						$status_o:=$role_e.save()
						If (Not:C34($status_o.success))
							ALERT:C41($status_o.statusText)
							TRACE:C157
						End if 
					End if 
					
				End for each 
				
			End if 
			
		End if 
	Until (OK=0)
	
	CLOSE DOCUMENT:C267(vDoc)  // Fermer le document 
	
	SET TEXT TO PASTEBOARD:C523($txt)
	
	ALERT:C41("ok $nbrCreGroupe="+String:C10($nbrCreGroupe)+" $nbrCreRole="+String:C10($nbrCreRole))
	
End if 