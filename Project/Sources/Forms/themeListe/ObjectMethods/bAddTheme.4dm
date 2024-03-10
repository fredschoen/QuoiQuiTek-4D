//bAddTheme
var $theme_e : cs:C1710.ThemeEntity
If (Form event code:C388=On Clicked:K2:4)
	
	$theme_e:=ds:C1482.Theme.new()
	$theme_e.Nom:="nouveau theme"
	$o:=$theme_e.save()
	If (Not:C34($o.success))
		ALERT:C41("KO save Theme")
		TRACE:C157
		return 
	End if 
	
	Form:C1466.theme_es:=ds:C1482.Theme.all()
	
End if 
