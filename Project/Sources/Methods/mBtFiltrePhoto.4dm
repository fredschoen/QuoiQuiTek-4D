//%attributes = {}
//mBtFiltrePhoto
If (Undefined:C82(Form:C1466.filtrePhoto_b))
	Form:C1466.filtrePhoto_b:=True:C214
End if 

Form:C1466.filtrePhoto_b:=(Not:C34(Form:C1466.filtrePhoto_b))

If (Form:C1466.filtrePhoto_b)
	//OBJECT SET RGB COLORS(btFiltrePhoto; Red; Green)
	OBJECT SET TITLE:C194(*; "btFiltrePhoto"; "sans (F)iltre")
Else 
	//OBJECT SET RGB COLORS(btFiltrePhoto; Green; Red)
	OBJECT SET TITLE:C194(*; "btFiltrePhoto"; "avec (F)iltre")
End if 