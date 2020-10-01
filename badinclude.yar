rule badInclude
{
    strings:
        $st1 = /\/\*([0-9a-zA-Z]{4,6})\*\/\n\n@include.*\n\n\/\*([0-9a-zA-Z]{4,6})\*\//
    condition:
        $st1
}

/*
example match

///		/*5e4ef*/

///		@include "\057v\141r\057w\167w\057n\165m\142e\1621\066.\143o\155/\167p\055c\157n\164e\156t\057u\160l\157a\144s\057s\151m\055w\160-\165p\154o\141d\163/\0563\062e\0711\065b\070.\151c\157";

///		/*5e4ef*/


*/
