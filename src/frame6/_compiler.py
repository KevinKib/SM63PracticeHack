import os
import pyperclip

# Function that copies content into clipboard
# https://stackoverflow.com/questions/11063458/python-script-to-copy-text-to-clipboard
# def copy2clip(txt):
#     cmd='echo '+txt.strip()+'|clip'
#     return subprocess.check_call(cmd, shell=True)

# Constants
FILE_NAME = "_compiled.as"
SCRIPT_FOLDER = "./classes"
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
for script_name in script_list:
    if script_name.endswith(".as"):
        script_file = open(SCRIPT_FOLDER + "/" + script_name, "r")
        script_text = script_file.read() + "\n"
        clipboard_text += script_text
        compiled_script.write(script_text)
        print(script_name + " has been written into frame6.")

compiled_script.close()
pyperclip.copy(clipboard_text)

print("frame6 has been generated correctly.")