//bAddTheme
var $form_o : Object
var $win_l : Integer
var $relTheme_e : cs:C1710.RelThemeEntity
If (Form event code:C388=On Clicked:K2:4)
	trace
	$form_o:=New object:C1471
	$form_o.ID_Theme:=0
	$form_o.action:="POUR_SELECTION"
	dialoguer("themeListe"; $form_o)
	If ($form_o.ID_Theme#0)
		$relTheme_e:=ds:C1482.RelTheme.new()
		$relTheme_e.ID_Quoi:=Form:C1466.quoi_e.ID
		$relTheme_e.ID_Theme:=$form_o.ID_Theme
		$o:=$relTheme_e.save()
		If (Not:C34($o.success))
			ALERT:C41("KO save RelTheme")
			TRACE:C157
		End if 
		
		//KO: le theme ajouté n'apparait pas pour : Form.relTheme_es:=Form.qui_e.relThemes.orderBy("theme.Nom")
		Form:C1466.relTheme_es:=ds:C1482.RelTheme.query("ID_Quoi = :1"; Form:C1466.quoi_e.ID).orderBy("theme.Nom")
	End if 
	
End if 
