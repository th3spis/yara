<h1>YARATORIUM: An easy yara labo</h1>

throwable directory is meant to containt a compilation of public yara rules that are throuwable outside VirusTotal, since most of public yaras are defined for VT

yarale throws all yaras from a specific location, against a specified location or current dir if none is given

yaralizer will allow you to create quick and basic yara rules based on a text file with strings, or a quick template to start working on your yara rule

<code>
<div style="white-space:pre-wrap;font-family:Monospace;color:#d8dee9;background-color:#303841;-moz-tab-size:2;tab-size:2;">	yaralizer.py -p 5 -some 3 -n my_rule -o my_yara.yar</div>
</code>


For example, for the given the following text file:

<img src=example_pics/scr1.png>

Yaralizer could create a yara rule like this:

<img src=example_pics/scr2.png>

