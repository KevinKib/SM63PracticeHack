# SM63PracticeHack

## Commands

* ### char [mario|luigi|toggle]
Allows to switch characters.
The "toggle" option switches to Luigi if Mario is the current character, and vice-versa.

* ### lives [number]
Sets a certain number of lives to the life counter.

* ### water [refill|half|empty|number] 

Sets a certain amount of water to the player. Water count goes from 0 to 10000.

**refill**: Fills the water, to the value 10000.

**half**: Half fills the water, to the value 5000.

**empty**: Empties the water, to the value 0.

**number**: Any number between 0 and 10000.

* ### health [refill|empty|death|number]

Sets a certain amount of health to the player. Health count goes from 0 to 8.

**refill**: Heals the player, to the value 8.

**empty**: Almost kills the player, to the value 1.

**death**: Kills the player by setting health to the value 0

**number**: Any number between 0 and 8.

* ### fludd [all|H|R|T|none]

Manages the current nozzles that the player has access to.

**all**: Gives all nozzles to the player.

**H**: Toggles the hover nozzle for the player.

**R**: Toggles the rocket nozzle for the player.

**T**: Toggles the turbo nozzle for the player.

**none**: Removes every nozzle of the player.

* ### star [number] [boolean]

Manages the state of a specific star.

**number**: Identifier of the star, between 1 and 64.

**boolean**: Either true or false, to set the state of the star, or nothing to toggle its state.

* ### starcoin [number] [boolean]

Manages the state of a specific star coin.

**number**: Identifier of the star coin, between 1 and 64.

**boolean**: Either true or false, to set the state of the star coin, or nothing to toggle its state.

* ### bowserkey [number] [boolean]

Manages the state of a specific bowser key.

**number**: Identifier of the bowser key, between 1 and 3.

**boolean**: Either true or false, to set the state of the bowser key, or nothing to toggle its state.

(Does not work)

* ### timer [start|stop|reset]

Manages the state of the timer.

**start**: Starts the timer.

**stop**: Stops the timer.

**reset**: Resets the timer; makes it automatically start on the next loading zone.

* ### file [complete|essentials|empty]

Setups a file setting.

**complete**: Setups a 100% file.

**essentials**: Setups a "race" file, which is a file with all storyline stars obtained. Can be used to do 100% ILs.

**empty**: Setups an empty file.


* ### warp [name] [coordinates]

Warps the player to a specific section.

**name**: Name of that specific section. A list of the sections available will be added soon.

**coordinates**: Coordinates of the starting location of the player (4 parameters). Exact signification of those parameters is unknown yet (some might refer to the camera x and y position).

* ### individuallevel [world]
[Not implemented]

* ### koopashell

Sends to the KoopaShell console written by Jhynjhiruu. Allows to modify pretty much every variable of the game. Documentation of the KoopaShell module will get here soon.

