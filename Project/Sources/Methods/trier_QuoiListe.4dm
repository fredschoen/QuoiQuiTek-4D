//%attributes = {}
//
Case of 
	: (eNom=1)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Nom")
	: (eNom=2)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Nom desc")
		
	: (eDomaine=1)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Domaine")
	: (eDomaine=2)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Domaine desc")
		
	: (eGenre=1)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Genre")
	: (eGenre=2)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Genre desc")
		
	: (ePays=1)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Pays")
	: (ePays=2)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Pays desc")
		
	: (eStock=1)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Stock")
	: (eStock=2)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Stock desc")
		
	: (eDate=1)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Date")
	: (eDate=2)
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Date desc")
		
	Else 
		Form:C1466.quoi_es:=Form:C1466.quoi_es.orderBy("Nom")
		eNom:=1
End case 