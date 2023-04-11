//%attributes = {}
//_anneeDeDateText
//$1: quoi.Annee: Texte : "aaaa-mm-jj"
//$0: année: Integer
var $1; annee_t : Text
var $0; annee_i : Integer
$annee_t:=$1
If (Length:C16($annee_t)>=4)
	$annee_i:=Num:C11(Substring:C12($annee_t; 1; 4))
Else 
	$annee_i:=0
End if 
//résultat
$0:=$annee_i
