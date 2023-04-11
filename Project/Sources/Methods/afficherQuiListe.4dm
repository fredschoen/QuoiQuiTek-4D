//%attributes = {}
// afficherQuiListe

C_OBJECT:C1216($form_obj)
$form_obj:=New object:C1471
$form_obj.action:="INIT"  // chargement initial
$form_obj.page:=1

//criteres d'affichage :
$form_obj.critereQuiListe:=New object:C1471
$form_obj.critereQuiListe.Nom:=""
$form_obj.critereQuiListe.Genre:=""
$form_obj.critereQuiListe.Pays:=""
$form_obj.critereQuiListe.AnneeNaiss:=""
$form_obj.critereQuiListe.AnneeDeces:=""
$form_obj.critereQuiListe.Domaine:=""
$form_obj.critereQuiListe.Style:=""

//cas où on utilise la liste quis pour ajouter un role à un quoi
If (_utilisationListe="AJOUTER_ROLE")
	If (Form:C1466.eleCouQuoi=Null:C1517)
		CONFIRM:C162("afficherquiliste: (Form.eleCouQuoi=null)")
	Else 
		$form_obj.eleCouQuoi:=New object:C1471
		$form_obj.eleCouQuoi:=Form:C1466.eleCouQuoi
	End if 
End if 

C_LONGINT:C283($win_l)
$win_l:=Open form window:C675("quiListe")

While ($form_obj.page>0)  // 0 :quitter
	DIALOG:C40("quiListe"; $form_obj)
End while 

CLOSE WINDOW:C154($win_l)
