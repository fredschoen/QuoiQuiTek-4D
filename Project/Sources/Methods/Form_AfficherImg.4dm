//%attributes = {}
If (Form:C1466.compteur=-1)
	Form:C1466.compteur:=Form:C1466.file_c.length-1
End if 
If (Form:C1466.compteur>=Form:C1466.file_c.length)
	Form:C1466.compteur:=0
End if 
$file_f:=Form:C1466.file_c[Form:C1466.compteur]
READ PICTURE FILE:C678($file_f.platformPath; $img)
TRANSFORM PICTURE:C988($img; Scale:K61:2; 4; 4)
Form:C1466.img:=$img
Form:C1466.nomImg:=$file_f.platformPath
WA OPEN URL:C1020(*; "WebZone"; "file://"+$file_f.path)
