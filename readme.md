<h1>YARATORIUM: An easy yara labo</h1>

throwable directory is meant to containt a compilation of public yara rules that are throuwable outside VirusTotal, since most of public yaras are defined for VT

yarale throws all yaras from a specific location, against a specified location or current dir if none is given

<h2> Yaralizer </h2>

yaralizer will allow you to create quick and basic yara rules based on a text file with strings, or a quick template to start working on your yara rule


<p>~$ yaralizer.py --help</p>
<p><br></p>
<p>usage: yaralizer.py [-h] [-f STRINGS_FILE | -p N_STR] [-d] [-n RULE_NAME]</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [-m MODS] [-all | -any | -some N_OF_THEM]</p>
<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [-o RULE_FILE | -nofile]</p>
<p><br></p>
<p>Create quick yara rules. Either -f or -p options are required.</p>
<p><br></p>
<p>optional arguments:</p>
<p>&nbsp; -h, --help &nbsp; &nbsp; &nbsp; show this help message and exit</p>
<p>&nbsp; -f STRINGS_FILE &nbsp;Specify a file with strings in every line which will be used to build the yara rule.</p>
<p>&nbsp; -p N_STR &nbsp; &nbsp; &nbsp; &nbsp; Create an empty yara rule template with n_str strings.</p>
<p>&nbsp; -d &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Delete strings_file after creation of yara rule. (Only useful with [-f strings_file] option.)</p>
<p>&nbsp; -n RULE_NAME &nbsp; &nbsp; Give a specific name for the yara rule inside the file. Default [strings_file]_rule.)</p>
<p>&nbsp; -m MODS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Add yara modifiers for the strings, separated by comma (ascii, wide, nocase...). If &quot;def&quot; is given as value, use the following flags: ascii wide nocase.</p>
<p>&nbsp; -all &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Select &quot;any of them&quot; as contition. This will be the default option if none given.</p>
<p>&nbsp; -any &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Select &quot;all of them&quot; as condition.</p>
<p>&nbsp; -some N_OF_THEM &nbsp;Select &quot;n_of_them of them&quot; as condition.</p>
<p>&nbsp; -o RULE_FILE &nbsp; &nbsp; Output file name. Default [strings_file]_yaralized.yar)</p>
<p>&nbsp; -nofile &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Do not generate a file. Print the rule instead.</p>
<p><br></p>
<p>Examples of use:</p>
<p><span style="white-space:pre;">&nbsp; &nbsp;&nbsp;</span>yaralizer.py -f my_strings_file</p>
<p><span style="white-space:pre;">&nbsp; &nbsp;&nbsp;</span>yaralizer.py -f my_strings.txt -d -all -o my_yara.yar</p>
<p><span style="white-space:pre;">&nbsp; &nbsp;&nbsp;</span>yaralizer.py -f my_strings.txt -some 3</p>
<p><span style="white-space:pre;">&nbsp; &nbsp;&nbsp;</span>yaralizer.py -p 5 -m base64,base64wide</p>
<p><span style="white-space:pre;">&nbsp; &nbsp;&nbsp;</span>yaralizer.py -p 8 -any -o my_yara.yar</p>
<p><span style="white-space:pre;">&nbsp; &nbsp;&nbsp;</span>yaralizer.py -p 5 -some 3 -n my_rule -o my_yara.yar</p>
  
<p></p>

For example, for the given the following text file:

<img src=example_pics/scr1.png>

Yaralizer could create a yara rule like this:

<img src=example_pics/scr2.png>

