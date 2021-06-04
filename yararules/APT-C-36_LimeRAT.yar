rule APCT36_ReflectionAssemblyLoad
{
	strings:
		$st0 = "Reflection.Assembly" ascii wide
		$st1 = /Load\(\$.{1,10}\)\.GetType\(.{3,40}\)\.GetMethod\(.{3,15}\)\.Invoke\(.*\.exe..?,\$.{1,10}\)\)/ ascii wide nocase
	condition:
		all of ($st*) and filesize < 300KB
}


rule APCT36_LimeRAT
{
	strings:
		$name = "paisa nyanca.exe" ascii wide
		$st0 = "cmd.exe /C Y /N /D Y /T 1 & Del" ascii wide
		$st1 = "duckdns" ascii wide nocase
		$st2 = "Lime" ascii wide nocase
		$st3 = "keylogger" ascii wide nocase
		$st4 = "memoryStream" ascii wide nocase
		$st5 = "GZipStream" ascii wide nocase
		$st6 = "Base64String" ascii wide nocase
		$st7 = "RegistryKeyPermissionCheck" ascii wide nocase
		$st8 = "SearchForCam" ascii wide nocase
	condition:
		$name or (7 of ($st*))
}

