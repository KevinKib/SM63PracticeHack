# This Python script aims to generate a frame6.as file that will then
# be imported into JPEXS Free Flash Decompiler by copy-pasting.
# More information in the README.md file.

import os
import pyperclip

# Constants
FILE_NAME = "./src/frame6.as"
SCRIPT_FOLDER = "./src/classes"
CODES_FOLDER = "./src/classes/codes"
SCRIPT_MAIN = "Main.as"
SCRIPT_OVERWRITES = "Overwrites.as"

# Script
print("start frame6 generation")
open(FILE_NAME, "w").close()
compiled_script = open(FILE_NAME, "a")
clipboard_text = ""

script_list = os.listdir(SCRIPT_FOLDER)

# move overwrites script to the first
script_list.insert(0, script_list.pop(script_list.index(SCRIPT_OVERWRITES)))

# move main script to the end
script_list.append(script_list.pop(script_list.index(SCRIPT_MAIN)))

# generate frame6

# scripts
for script_name in script_list:
    if script_name.endswith(".as"):
        script_file = open(SCRIPT_FOLDER + "/" + script_name, "r")
        script_text = script_file.read() + "\n"
        clipboard_text += script_text
        compiled_script.write(script_text)
        print(script_name + " has been written into frame6.")

# codes
codes_number = 0
codes_list = os.listdir(CODES_FOLDER)
for codes_name in codes_list:
    if codes_name.endswith(".as"):
        codes_file = open(CODES_FOLDER + "/" + codes_name, "r")
        codes_text = codes_file.read() + "\n"
        clipboard_text += codes_text
        compiled_script.write(codes_text)
        codes_number += 1

print(str(codes_number) + " codes have been added.")

compiled_script.close()
pyperclip.copy(clipboard_text)
print("frame6 has been generated.")