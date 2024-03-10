//bAddTheme
var $form_o : Object
var $win_l : Integer
var $relTheme_e : cs:C1710.RelThemeEntity
If (Form event code:C388=On Clicked:K2:4)
	
	$form_o:=New object:C1471
	$form_o.ID_Theme:=0
	$form_o.action:="POUR_SELECTION"
	dialoguer("themeListe"; $form_o)
	If ($form_o.ID_Theme#0)
		$relTheme_e:=ds:C1482.RelTheme.new()
		$relTheme_e.ID_Qui:=Form:C1466.qui_e.ID
		$relTheme_e.ID_Theme:=$form_o.ID_Theme
		$o:=$relTheme_e.save()
		If (Not:C34($o.success))
			ALERT:C41("KO save RelTheme")
			TRACE:C157
		End if 
		
		Form:C1466.relTheme_es:=Form:C1466.qui_e.relThemes.orderBy("theme.Nom")
	End if 
	
End if 
