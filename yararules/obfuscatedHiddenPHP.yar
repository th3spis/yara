rule obfuscatedhiddenPHP
{
    strings:
        $st1 = "basename" ascii wide
	$st2 = "preg_replace" ascii wide
	$st3 = "rawurldecode" ascii wide
    condition:
        $st1 and $st2 and $st3
}
