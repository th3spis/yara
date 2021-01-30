rule findBadIcoInclude
{
    strings:
        $st1 = "@include "
		$st2 = ".\\151c\\157"
		$st3 = ".i\\143o"
		$st4 = ".ico"
		$st5 = "\\056\\151\\143\\157"
		$st6 = "\\056\\151\\143o"
		$st7 = "\\056\\151co"
		$st8 = "\\056ico"
		$st9 = "\\056i\\143o"	
		$st10 = "\\056i\\143\\157"
		$st11 = "\\056ic\\157"
		$st12 = "\\056\\151c\\157"
		$st13 = ".\\151co"
		$st14 = ".\\151\\143o"
		$st15 = ".\\151\\143\\157"
		$st16 = ".ic\\157"
		$st17 = ".i\\143\\157"
    condition:
        $st1 and ($st2 or $st3 or $st4 or $st5 or $st6 or $st7 or $st8 or $st9 or $st10 or $st11 or $st12 or $st13 or $st14 or $st15 or $st16 or $st17 or $st18)
}

