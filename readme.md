<h1>YARATORIUM: An easy yara labo</h1>

throwable directory is meant to containt a compilation of public yara rules that are throuwable outside VirusTotal, since most of public yaras are defined for VT

yarale throws all yaras from a specific location, against a specified location or current dir if none is given

yaralizer will allow you to create quick and basic yara rules based on a text file with strings, or a quick template to start working on your yara rule

<code>
$ yaralizer.py --help

Bad arguments:
	Either -f or -p otions are required, and none have been specified.

usage: yaralizer.py [-h] [-f STRINGS_FILE | -p N_STR] [-d] [-n RULE_NAME]
                    [-m MODS] [-all | -any | -some N_OF_THEM]
                    [-o RULE_FILE | -nofile]

Create quick yara rules. Either -f or -p options are required.

optional arguments:
  -h, --help       show this help message and exit
  -f STRINGS_FILE  Specify a file with strings in every line which will be used to build the yara rule.
  -p N_STR         Create an empty yara rule template with n_str strings.
  -d               Delete strings_file after creation of yara rule. (Only useful with [-f strings_file] option.)
  -n RULE_NAME     Give a specific name for the yara rule inside the file. Default [strings_file]_rule.)
  -m MODS          Add yara modifiers for the strings, separated by comma (ascii, wide, nocase...). If "def" is given as value, use the following flags: ascii wide nocase.
  -all             Select "any of them" as contition. This will be the default option if none given.
  -any             Select "all of them" as condition.
  -some N_OF_THEM  Select "n_of_them of them" as condition.
  -o RULE_FILE     Output file name. Default [strings_file]_yaralized.yar)
  -nofile          Do not generate a file. Print the rule instead.

Examples of use:
	yaralizer.py -f my_strings_file
	yaralizer.py -f my_strings.txt -d -all -o my_yara.yar
	yaralizer.py -f my_strings.txt -some 3
	yaralizer.py -p 5 -m base64,base64wide
	yaralizer.py -p 8 -any -o my_yara.yar
	yaralizer.py -p 5 -some 3 -n my_rule -o my_yara.yar
</code>


For example, for the given the following text file:

<img src=example_pics/scr1.png>

Yaralizer could create a yara rule like this:

<img src=example_pics/scr2.png>

