# Setup

The Super Mario 63 Practice Hack is developed using JPEXS Free Flash Decompiler which is downloadable [here](https://github.com/jindrapetrik/jpexs-decompiler).

- Clone this repository.
- Download and install [JPEXS Free Flash Decompiler](https://github.com/jindrapetrik/jpexs-decompiler)
- Download the latest practice hack release and locate it in the `bin` folder.

# Compilation

- Edit the scripts in `src/classes` using the IDE of your choice.
- Generate a `frame6.as` file by following [this guide](https://github.com/Sekanor/SM63PracticeHack/blob/dev/docs/Frame6.md).
- Paste `frame6.as` (which has been copied into clipboard) into JPEXS FFDec.

# Code standards

Pull requests must follow the following standards in order to be accepted:
- PRs that create new commands must documentate the usage of those commands in [`Commands.md`](https://github.com/Sekanor/SM63PracticeHack/blob/dev/docs/Commands.md).
- Commands must not interact with the in-game variables themselves. The `Utils` class interacts with the game behaviour, so all commands must call methods from `_root.Utils`
rather than modifying the in-game variables manually.
- In order to centralize and organize code, avoid editing other files than `frame6.as` if it's possible to do so.
