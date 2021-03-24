rule findBadIcoInclude
{
    strings:
        $inc = "@include "
	$st0 = ".\\151c\\157"
	$st1 = ".i\\143o"
	$st2 = ".ico"
	$st3 = "\\056\\151\\143\\157"
	$st4 = "\\056\\151\\143o"
	$st5 = "\\056\\151co"
	$st6 = "\\056ico"
	$st7 = "\\056i\\143o"	
	$st8 = "\\056i\\143\\157"
	$st9 = "\\056ic\\157"
	$st10 = "\\056\\151c\\157"
	$st11 = ".\\151co"
	$st12 = ".\\151\\143o"
	$st13 = ".\\151\\143\\157"
	$st14 = ".ic\\157"
	$st15 = ".i\\143\\157"
    condition:
        $inc and $st*
}


rule badInclude
{
    strings:
        $st1 = /\/\*([0-9a-zA-Z]{4,6})\*\/\n\n@include.*\n\n\/\*([0-9a-zA-Z]{4,6})\*\//
    condition:
        $st1
}
/*
example match
		/*5e4ef*/

		@include "\057v\141r\057w\167w\057n\165m\142e\1621\066.\143o\155/\167p\055c\157n\164e\156t\057u\160l\157a\144s\057s\151m\055w\160-\165p\154o\141d\163/\0563\062e\0711\065b\070.\151c\157";

		/*5e4ef*/
*/
