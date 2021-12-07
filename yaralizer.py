#!/usr/bin/python3

#YARATORIUM-yaralizer


import argparse
import os
from argparse import RawTextHelpFormatter

parser = argparse.ArgumentParser(
	description='Create quick yara rules. Either -f or -p options are required.',
	epilog='Examples of use:\n\t'
	'yaralizer.py -f my_strings_file\n\t'
	'yaralizer.py -f my_strings.txt -d -all -o my_yara.yar\n\t'
	'yaralizer.py -f my_strings.txt -some 3\n\t'
	'yaralizer.py -p 5 -m base64,base64wide\n\t'
	'yaralizer.py -p 8 -any -o my_yara.yar\n\t'
	'yaralizer.py -p 5 -some 3 -n my_rule -o my_yara.yar', formatter_class=RawTextHelpFormatter)


exclusive_1 = parser.add_mutually_exclusive_group()
exclusive_2 = parser.add_mutually_exclusive_group()
exclusive_3 = parser.add_mutually_exclusive_group()

exclusive_1.add_argument('-f', dest='strings_file', help = 'Specify a file with strings in every line which will be used to build the yara rule.')
exclusive_1.add_argument('-p', dest='n_str', type=int, help = 'Create an empty yara rule template with n_str strings.')

parser.add_argument('-d', dest='delete', help = 'Delete strings_file after creation of yara rule. (Only useful with [-f strings_file] option.)', action='store_true')
parser.add_argument('-n', dest='rule_name', help = 'Give a specific name for the yara rule inside the file. Default [strings_file]_rule.)')
parser.add_argument('-m', dest='mods', type=str, help = 'Add yara modifiers for the strings, separated by comma (ascii, wide, nocase...). If "def" is given as value, use the following flags: ascii wide nocase.')

exclusive_2.add_argument('-all', help = 'Select "any of them" as contition. This will be the default option if none given.', action='store_true')
exclusive_2.add_argument('-any', help = 'Select "all of them" as condition.', action='store_true')
exclusive_2.add_argument('-some', type=int, dest='n_of_them', help = 'Select "n_of_them of them" as condition.')

exclusive_3.add_argument('-o', dest='rule_file', help = 'Output file name. Default [strings_file]_yaralized.yar)')
exclusive_3.add_argument('-nofile', help = 'Do not generate a file. Print the rule instead.', action='store_true')


args_namespace = parser.parse_args()

#Debug prints
#print(args_namespace)
#print(args_namespace.n_str)
#print(type(args_namespace.n_str))


# At least one of those two options must be specified
if args_namespace.n_str is None and args_namespace.strings_file is None:
	print("\nBad arguments:\n\tEither -f or -p otions are required, and none have been specified.\n")
	parser.print_help()
else:

	# =============================
	# === PARSE GENERAL OPTIONS ===
	# =============================

	# Parse given yara string modifiers
	modifiers_str = ""
	if args_namespace.mods is not None:
		if args_namespace.mods == "def":
			modifiers_str = "ascii wide nocase"
		else:
			aux = args_namespace.mods.split(",")
			for mod in aux:
				modifiers_str += mod + " "

	# Parse condition option
	if args_namespace.any:
		condition_str = "any of them"
	elif args_namespace.n_of_them is not None:
		condition_str = str(args_namespace.n_of_them) +  " of them"
	else:
		condition_str = "all of them"


	# =================
	# === -f option ===
	# =================
	if args_namespace.strings_file is not None:
		str_filename = args_namespace.strings_file

		# Parse the file name for the generated yara rule file
		if args_namespace.rule_file is not None:
			rule_filename = args_namespace.rule_file
		else:
			ext = str_filename.find('.')
			if ext < 0:
				rule_filename = str_filename + '_yaralized.yar'
			else:
				rule_filename = str_filename[:ext] + '_yaralized.yar'

		# Parse rule name for the definition of the generated yara rule
		if args_namespace.rule_name is not None:
			rulename = args_namespace.rule_name
		else:
			if ext < 0:
				rulename = str_filename
			else:
				rulename = str_filename[:ext]
		
		str_n = 0

		# Read specified file containing strings
		with open(str_filename) as file:
			lines = file.readlines()

		if args_namespace.delete:
			os.remove(str_filename)

		rule_def_str = "rule " + rulename + " { \n\tstrings:\n"
		for stringo in lines:
			rule_def_str += "\t\t$st" + str(str_n) + " = \"" + stringo[:-1] + "\" "
			rule_def_str += modifiers_str
			rule_def_str += "\n"
			str_n += 1

		rule_def_str += "\tcondition:\n\t\t" + condition_str + "\n}\n"
			
		# Write final file containing the rule
		if args_namespace.nofile:
			print(rule_def_str)
		else:
			with open(rule_filename, "w") as final_file:
				final_file.write(rule_def_str)	

	# =================
	# === -p option ===
	# =================
	else:
		# Parse the file name for the generated yara rule
		if args_namespace.rule_file is not None:
			rule_filename = args_namespace.rule_file
		else:
			rule_filename = 'yaralizer.yar'

		# Parse rule name for the definition of the generated yara rule
		if args_namespace.rule_name is not None:
			rulename = args_namespace.rule_name
		else:
			rulename = "yaralizer_rule"

		rule_def_str = "rule " + rulename + " { \n\tstrings:\n"
		for n in range(0,args_namespace.n_str):
			rule_def_str += "\t\t$st" + str(n) + " = \"" + "\" "
			rule_def_str += modifiers_str
			rule_def_str += "\n"

		rule_def_str += "\tcondition:\n\t\t" + condition_str + "\n}\n"
			
		# Write final file containing the rule
		if args_namespace.nofile:
			print(rule_def_str)
		else:
			with open(rule_filename, "w") as final_file:
				final_file.write(rule_def_str)
