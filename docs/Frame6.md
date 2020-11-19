# Issue
The Super Mario 63 hack developers use [JPEXS Free Flash Decompiler](https://github.com/jindrapetrik/jpexs-decompiler) to inject scripts into the game.
FFDec allows developers to directly edit scripts within the software, and then compiles those scripts. However this has several limitations:
- The FFDec editor is sometimes not practical to use, and lacks the features that a classic IDE would have.
- The FFDec editor doesn't allow us to create and manages files easily, which forces devs to inject all their code in a single file, which is limiting for code-sharing, organization, and others.

# Solution
- First, it is recommended to use another IDE (such as Visual Studio Code) to write code, and then copy-paste that code into FFDec.
- Then, in order to separate files, a Python script was written. This script links all classes & code files together in a frame6.as file, that is also copied into the clipboard. Then, we can paste in FFDec and compile the .swf.

# Python script usage

Run the command `make frame6` from the root folder.

- [python](https://www.python.org/) is required.
- [pip](https://pypi.org/project/pip/) is required to install Python depencencies.
- [pyperclip](https://pypi.org/project/pyperclip/) is required as a dependency (`pip install pyperclip`).
