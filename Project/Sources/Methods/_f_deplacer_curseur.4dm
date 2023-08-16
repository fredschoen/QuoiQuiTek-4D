//%attributes = {}
//_f_deplacer_curseur

//$1: $action_t
//$2: $length_i
//$3: $posCur_i
//$0: $posNew_i
var $action_t; $1 : Text
var $length_i; $2 : Integer
var $posCur_i; $3 : Integer
var $posNew_i; $0 : Integer

$action_t:=$1
$length_i:=$2
$posCur_i:=$3

Case of 
	: ($action_t="PREMIER")
		$posNew_i:=1
		
	: ($action_t="PRECEDENT")
		If ($posCur_i>1)
			$posNew_i:=$posCur_i-1
		Else 
			$posNew_i:=$length_i
		End if 
		
	: ($action_t="SUIVANT")
		If ($posCur_i<$length_i)
			$posNew_i:=$posCur_i+1
		Else 
			$posNew_i:=1
		End if 
		
	: ($action_t="DERNIER")
		$posNew_i:=$length_i
		
	Else 
		$posNew_i:=$posCur_i
End case 

$0:=$posNew_i
