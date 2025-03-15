//%attributes = {}
//
Case of 
	: (eNom=1)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Nom")
	: (eNom=2)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Nom desc")
		
	: (eDomaine=1)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Domaine, Genre, Pays, Nom")
	: (eDomaine=2)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Domaine desc, Genre desc, Pays desc, Nom desc")
		
	: (eGenre=1)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Genre, Pays, Nom")
	: (eGenre=2)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Genre desc, Pays desc, Nom desc")
		
	: (ePays=1)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Pays, Nom")
	: (ePays=2)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Pays desc, Nom desc")
		
	: (eStock=1)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Stock, Nom")
	: (eStock=2)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Stock desc, Nom desc")
		
	: (eDate=1)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Date, Nom")
	: (eDate=2)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Date desc, Nom desc")
		
	Else 
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Nom")
		eNom:=1
End case 