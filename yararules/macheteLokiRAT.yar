rule macheteLokiRAT
{
	strings:
		$ms0 = "WrappedSetupProgram" ascii wide
		$ms1 = "Changing the code in this way will not affect the quality of the resulting optimized code" ascii wide
		$ms2 = "C:\\ss2\\Projects\\MsiWrapper\\MsiCustomActions\\Debug\\MsiCustomActions.pdb" ascii wide
		$ms3 = "cmd.exe" ascii wide
		$rat = /\\C\+\+.visual estudio\\Projec\\Release\\Projec.pdb/ ascii wide
		$rat1 = /cmd \/NOCONSOLE \/c .{10,40}\.exe .{4,20}\\Presk/ ascii wide
	condition:
		(all of ($ms*) and filesize < 8200KB and filesize > 7900KB) or (all of ($rat*) and filesize < 10KB and filesize > 8KB)
}


