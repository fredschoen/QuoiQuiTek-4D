If (Form event code:C388=On Load:K2:1)
	//Liste Hierarchique GenreQuoi
	var hlGenreQuoi; $hSousListeN1 : Integer
	var $i : Integer
	hlGenreQuoi:=New list:C375
	$genreQuoi_c:=New collection:C1472()
	$es1:=ds:C1482.Parametre.query("Nom = :1 AND Niv1 = :2"; "GenreQuoi"+Form:C1466.domaine_t; "")
	If ($es1.length=0)
		return 
	End if 
	$hSousListeN1:=New list:C375
	$e1:=$es1.first()
	$c1:=Split string:C1554($es1.first().Niv2; ";")
	For each ($t1; $c1)
		$es2:=ds:C1482.Parametre.query("Nom = :1 AND Niv1 = :2"; $e1.Nom; $t1)
		If ($es2.length>0)
			$c2:=Split string:C1554($es2.first().Niv2; ";")
			$hSousListeN1:=New list:C375
			For each ($t2; $c2)
				$i+=1
				$genreQuoi_c.push(New object:C1471("ID"; $i; "Niv0"; $t1; "Niv1"; $t2))
				APPEND TO LIST:C376($hSousListeN1; $t2; $i)
			End for each 
			$i+=1
			$genreQuoi_c.push(New object:C1471("ID"; $i; "Niv0"; $t1; "Niv1"; ""))
			APPEND TO LIST:C376(hlGenreQuoi; $t1; $i; $hSousListeN1; True:C214)
		End if 
	End for each 
	// Forcer la hauteur de ligne minimale à 14 Pts
	SET LIST PROPERTIES:C387(hlGenreQuoi; 0; 0; 14)
	Form:C1466.genreQuoi_c:=$genreQuoi_c
End if 

If (Form event code:C388=On Double Clicked:K2:5)
	$vlElementPos_i:=Selected list items:C379(hlGenreQuoi)
	If ($vlElementPos_i#0)
		// récupérer l'ID de la famille cliqué
		GET LIST ITEM:C378(hlGenreQuoi; $vlElementPos_i; $vlElementRef_i; $vsElementText_t; $vlElementSousListe; $vbElementDéploye_b)
		$x:=Storage:C1525.genreQuoi.query("ID = :1"; $vlElementRef_i)
		If ($x.length=0)
			return 
		End if 
		Form:C1466.Niv0:=Form:C1466.genreQuoi_c[$vlElementRef_i-1].Niv0
		Form:C1466.Niv1:=Form:C1466.genreQuoi_c[$vlElementRef_i-1].Niv1
		Form:C1466.page:=0  //sortir
		ACCEPT:C269
	End if 
	
End if 
