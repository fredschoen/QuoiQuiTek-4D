//%attributes = {}
//////////////////////////////////////////////////////////////////
// zEXPORT_Role
//////////////////////////////////////////////////////////////////

C_TEXT:C284($texte; $nom; $nomDefaut)
C_LONGINT:C283($nbrEnrExport)
C_TIME:C306($doc; $log)
C_TEXT:C284($nomlog; $texteLog; $statutIntervention)
C_TEXT:C284($rc; $tab)

$rc:=Char:C90(Carriage return:K15:38)
$tab:=Char:C90(Tab:K15:37)
If ($1=Null:C1517)
	$nomLog:=System folder:C487(Desktop:K41:16)+"_QuoiQuitek"+Folder separator:K24:12+"log.txt"
Else 
	$nomLog:=$1+"log.txt"
End if 
$nbrEnrExport:=0
If ($1=Null:C1517)
	$nomDefaut:=System folder:C487(Desktop:K41:16)+"_QuoiQuitek"+Folder separator:K24:12+"Role2.txt"
Else 
	$nomDefaut:=$1+"Role.txt"
End if 
//$nom:=Demander("Nom du fichier à créer :"; $nomDefaut)
$nom:=$nomDefaut
CONFIRM:C162("Début création de "+$nom)

If (OK=1)
	$doc:=Create document:C266($nom; "TEXT")
	//Ouvrir document($nom;"TEXT";mode ecriture)  ` Ouvrir le document Note 
End if 

If (OK=1)
	
	$vide:=""
	// entete colonne
	$texte:=""
	$texte:=$texte+"Nom_Qui"+$tab
	$texte:=$texte+"Annee"+$tab
	$texte:=$texte+"Genre"+$tab
	$texte:=$texte+"Pays"+$tab
	$texte:=$texte+"Domaine"+$tab
	$texte:=$texte+"Descr_Role"+$tab
	$texte:=$texte+"age"+$tab
	$texte:=$texte+"Nom_Quoi"+$tab
	$texte:=$texte+"Annee"+$tab
	$texte:=$texte+"Domaine"+$tab
	$texte:=$texte+"Genre"+$tab
	$texte:=$texte+"Pays"+$tab
	$texte:=$texte+"ID_Role"+$tab
	$texte:=$texte+"ID_Qui"+$tab
	$texte:=$texte+"ID_Quoi"+$tab
	$texte:=$texte+$rc
	//ecrire entete
	SEND PACKET:C103($doc; $texte)
	
	ALL RECORDS:C47([Role:3])
	
	ORDER BY:C49([Role:3]; [Role:3]ID:1; >)
	
	C_TEXT:C284($vide; $str; $Info)
	C_LONGINT:C283($pos; $codeCar)
	
	While (Not:C34(End selection:C36([Role:3])))
		QUERY:C277([Qui:2]; [Qui:2]ID:1=[Role:3]ID_Qui:2)
		QUERY:C277([Quoi:1]; [Quoi:1]ID:1=[Role:3]ID_Quoi:3)
		
		
		
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
		$texte:=$texte+String:C10([Qui:2]FullName:2)+$tab
		$texte:=$texte+String:C10([Qui:2]DateNaiss:17)+$tab
		$texte:=$texte+String:C10([Qui:2]Genre:3)+$tab
		$texte:=$texte+String:C10([Qui:2]Pays:5)+$tab
		$texte:=$texte+String:C10([Qui:2]Domaine:8)+$tab
		
		$str:=[Role:3]Descr:4
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
		
		$texte:=$texte+"'"+String:C10($age)+$tab
		$texte:=$texte+String:C10([Quoi:1]Nom:2)+$tab
		$texte:=$texte+"'"+String:C10([Quoi:1]Date:7)+$tab
		$texte:=$texte+String:C10([Quoi:1]Domaine:8)+$tab
		$texte:=$texte+String:C10([Quoi:1]Genre:3)+$tab
		$texte:=$texte+String:C10([Quoi:1]Pays:4)+$tab
		$texte:=$texte+String:C10([Role:3]ID:1)+$tab
		$texte:=$texte+String:C10([Qui:2]ID:1)+$tab
		$texte:=$texte+String:C10([Role:3]ID_Quoi:3)+$tab
		$texte:=$texte+String:C10([Role:3]CreatTS:7)+$tab
		$texte:=$texte+String:C10([Role:3]ModifTS:8)+$tab
		$texte:=$texte+$rc
		
		SEND PACKET:C103($doc; $texte)
		$nbrEnrExport:=$nbrEnrExport+1
		
		//photo
		If (Picture size:C356([Role:3]Photo:5)>0)
			$nomFicPhoto:=System folder:C487(Desktop:K41:16)+"_QuoiQuitek"+Folder separator:K24:12+"PhotosRole"+Folder separator:K24:12+[Qui:2]FullName:2+"_"+"Role_"+String:C10([Role:3]ID:1)+"_"+[Quoi:1]Nom:2+".jpg"
			//remplacer les car ko dans nom fichier
			$nomOK:=Change string:C234($nomFicPhoto; "_"; Position:C15("/"; $nomFicPhoto))
			WRITE PICTURE FILE:C680($nomOK; [Role:3]Photo:5)
		End if 
		
		NEXT RECORD:C51([Role:3])
		
	End while 
	
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
