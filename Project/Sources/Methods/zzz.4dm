//%attributes = {}
$x:="écoucou/coucou"
$i:=Position:C15("/"; $x)
$y:=Change string:C234($x; "_"; Position:C15("/"; $x))  // vtResult gets "ACME"

