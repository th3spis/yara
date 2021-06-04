rule macheteDropperrule
{
	strings:
		$st0 = "cmd.exe" ascii wide
		$st1 = "C:\\Users\\volde" ascii wide
		$st2 = "mscoree.dll" ascii wide
		$st3 = "Form1" ascii wide
		$st4 = "CodeDom.Compiler" ascii wide
		$vb0 = { 7F }
		$vb1 = "==^#~@" ascii
		$vb2 = "==6	P3MD" ascii
	condition:
		(all of ($st*)) or (all of ($vb*) and filesize < 400KB)
}
