//%attributes = {}
//
Case of 
	: (eNom=1)
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("Nom")
	: (eNom=2)
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("Nom desc")
		
	: (eDomaine=1)
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("Domaine, Genre, Nom")
	: (eDomaine=2)
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("Domaine desc, Genre desc, Nom desc")
		
	: (eGenre=1)
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("Genre,Nom")
	: (eGenre=2)
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("Genre desc, Nom desc")
		
	: (ePays=1)
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("Pays, Nom")
	: (ePays=2)
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("Pays desc, Nom desc")
		
	: (eDateNaiss=1)
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("DateNaiss")
	: (eDateNaiss=2)
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("DateNaiss desc, Nom desc")
		
	: (eStyle=1)
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("Style, Nom")
	: (eStyle=2)
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("Style desc, Nom desc")
		
	Else 
		Form:C1466.qui_es:=Form:C1466.qui_es.orderBy("Nom")
		eNom:=1
End case 