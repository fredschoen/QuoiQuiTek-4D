//%attributes = {}
//////////////////////////////////////////////////////////////////
// zEXPORT_Quoi
//////////////////////////////////////////////////////////////////

C_TEXT:C284($texte; $nom; $nomDefaut)
C_LONGINT:C283($nbrEnrExport)
C_TIME:C306($doc; $log)
C_TEXT:C284($nomlog; $texteLog; $statutIntervention)
C_TEXT:C284($rc; $tab)
C_LONGINT:C283($nbrEnrHorsExport)  //v2
$nbrEnrHorsExport:=0  //v2
var $Quoi_e : cs:C1710.QuoiEntity
var $Quoi_es : cs:C1710.QuoiSelection
$rc:=Char:C90(Carriage return:K15:38)
$tab:=Char:C90(Tab:K15:37)
If ($1=Null:C1517)
	$nomLog:=System folder:C487(Desktop:K41:16)+"_QuoiQuitek"+Folder separator:K24:12+"log.csv"
Else 
	$nomLog:=$1+"log.csv"
End if 
$nbrEnrExport:=0
If ($1=Null:C1517)
	$nomDefaut:=System folder:C487(Desktop:K41:16)+"_QuoiQuitek"+Folder separator:K24:12+"QUOI.csv"
Else 
	$nomDefaut:=$1+"QUOI.csv"
End if 
//$nom:=Demander("Nom du fichier à créer :"; $nomDefaut)
$nom:=$nomDefaut
CONFIRM:C162("Début création de "+$nom)

If (OK=1)
	$doc:=Create document:C266($nom; "public.utf8-plain-text")
	//Ouvrir document($nom;"TEXT";mode ecriture)  ` Ouvrir le document Note 
End if 

If (OK=1)
	
	$vide:=""
	// entete colonne
	$texte:=""
	$texte:=$texte+"ID"+$tab
	$texte:=$texte+"Nom"+$tab
	$texte:=$texte+"Annee"+$tab
	$texte:=$texte+"Domaine"+$tab
	$texte:=$texte+"Genre"+$tab
	$texte:=$texte+"Pays"+$tab
	$texte:=$texte+"Info"+$tab
	$texte:=$texte+"Qualif"+$tab
	$texte:=$texte+"Real"+$tab
	$texte:=$texte+"Prod"+$tab
	$texte:=$texte+"Stock"+$tab
	$texte:=$texte+$rc
	//ecrire entete
	SEND PACKET:C103($doc; $texte)
	
	$Quoi_es:=ds:C1482.Quoi.query("Domaine = :1"; "CINE").orderBy("Nom")
	
	C_TEXT:C284($vide; $str; $Info)
	C_LONGINT:C283($pos; $codeCar)
	
	For each ($Quoi_e; $Quoi_es)
		//init
		$Info:=""
		$pos:=0
		$codeCar:=0
		$Ref_Payeur:=0
		$nomP:=""
		$nomG:=""
		$nomO:=""
		
		
		//-- assemblage de l'enreg à écrire------------------------------ 
		$texte:=""
		$texte:=$texte+String:C10($Quoi_e.ID)+$tab
		$texte:=$texte+$Quoi_e.Nom+$tab
		$texte:=$texte+"'"+$Quoi_e.Date+$tab  //pour être pris en "text" dans excel
		$texte:=$texte+$Quoi_e.Domaine+$tab
		$texte:=$texte+$Quoi_e.Genre+$tab
		$texte:=$texte+$Quoi_e.Pays+$tab
		
		$str:=$Quoi_e.Info
		For ($pos; 1; Length:C16($str))
			$codeCar:=Character code:C91($str[[$pos]])
			Case of 
				: ($codeCar=Carriage return:K15:38)
					$str[[$pos]]:="|"
				: ($codeCar=Tab:K15:37)
					$str[[$pos]]:="^"
			End case 
		End for 
		
		$texte:=$texte+$str+$tab
		$texte:=$texte+$Quoi_e.Qualif+$tab
		$texte:=$texte+$Quoi_e.Real+$tab
		$texte:=$texte+$Quoi_e.Prod+$tab
		$texte:=$texte+$Quoi_e.Stock+$tab
		$texte:=$texte+String:C10($Quoi_e.CreatTS)+$tab
		$texte:=$texte+String:C10($Quoi_e.ModifTS)+$tab
		$texte:=$texte+String:C10($Quoi_e.CreatTS)+$tab
		$texte:=$texte+String:C10($Quoi_e.ModifTS)+$tab
		$texte:=$texte+$rc
		
		SEND PACKET:C103($doc; $texte)
		$nbrEnrExport:=$nbrEnrExport+1
		
	End for each 
	
	CLOSE DOCUMENT:C267($doc)  // Fermer le document 
	$texteLog:="Fichier "+$nom+" créé"+$rc+String:C10($nbrEnrExport)+" enreg créés (+ 1 enreg entete)"
	
	ALERT:C41($texteLog)
	
	If (Test path name:C476($nomlog)#Is a document:K24:1)
		$log:=Create document:C266($nomLog; "TEXT")
		SEND PACKET:C103($log; $rc)
		CLOSE DOCUMENT:C267($log)
	End if 
	
	$log:=Append document:C265($nomlog; "TEXT")
	
	//ecrire dans log
	SEND PACKET:C103($log; "----------------"+$rc+String:C10(Current date:C33)+" "+String:C10(Current time:C178)+":"+$rc)
	SEND PACKET:C103($log; $texteLog+$rc)
	CLOSE DOCUMENT:C267($log)  // Fermer le document 
	
End if 
