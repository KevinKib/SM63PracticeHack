# SM63PracticeHack

The Super Mario 63 Practice Hack revolves around the command shell, which can be opened by pressing ```/``` or ```numpad /```.

## Commands

* ### char [mario|luigi|toggle]
Allows to switch characters.
The "toggle" option switches to Luigi if Mario is the current character, and vice-versa.

* ### lives [number|infinite]
Sets a certain number of lives to the life counter.
Writing 'lives infinite' will prevent Mario from ever game-overing.

* ### water [refill|half|empty|infinite|number] 

Sets a certain amount of water to the player. Water count goes from 0 to 10000.

**refill**: Fills the water, to the value 10000.

**half**: Half fills the water, to the value 5000.

**empty**: Empties the water, to the value 0.

**infinite**: Sets the water to be infinite, always keeping it to 10000.

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

* ### cap [type] [boolean]

Gives a specific cap to the player.

**type**: The wanted type of cap. Can be either invisible, metal, invincible, wing (or wingcap).

**boolean**: Boolean that sets the state of the cap (if unspecified, will be true per default).

* ### star / s [number] [boolean]

Manages the state of a specific star.

**number**: Identifier of the star, between 1 and 64.

**boolean**: Either true or false, to set the state of the star, or nothing to toggle its state.

* ### starcoin / sc [number] [boolean]

Manages the state of a specific star coin.

**number**: Identifier of the star coin, between 1 and 64.

**boolean**: Either true or false, to set the state of the star coin, or nothing to toggle its state.

* ### bowserkey / bk [number] [boolean]

Manages the state of a specific bowser key.

**number**: Identifier of the bowser key, between 1 and 3.

**boolean**: Either true or false, to set the state of the bowser key, or nothing to toggle its state.

* ### timer / t [start|stop|reset]

Manages the state of the timer.

**start**: Starts the timer.

**stop**: Stops the timer.

**reset**: Resets the timer; makes it automatically start on the next loading zone.

* ### file / f [complete|essentials|empty]

Setups a file setting.

**complete**: Setups a 100% file.

**essentials**: Setups a "race" file, which is a file with all storyline stars obtained. Can be used to do 100% ILs.

**empty**: Setups an empty file.

* ### warp / w [name] [playerX] [playerY] [cameraX] [cameraY]

Warps the player to a specific section.

**name**: Name of that specific section. A list of the sections available will be added soon.

**coordinates**: Coordinates of the starting location of the player (4 parameters).

* ### individuallevel / il [world] [type]

Starts an individual level.

**world**: Name of the world in which the individual level will be played. Can be chosen between these : bob - sl - ssl - hmc - bm - wdw - lll - ttm - ttc - rr - sotm - jrb - tidal - sots - ff - thwc - coe - mm - gos - eotmk

**type**: The type of individual level that will be performed.
Can be either:
- **100 / all** : Starts a world from scratch. Collect every star and star coin from the world.
- **starsfludd** : Starts a world with every nozzle. Collect every star from the world.
- **starfludd / sf** : Starts a world with every nozzle. Collect one star from the world. Number of the star has to be precised right after. Example : "il bob starfludd 4"
- **stars** : From scratch. Collect every star from the world.
- **star** : From scratch. Collect one specific from the world. Number of the star has to be precised right after. Example : "il bob star 4"
- **starcoins / starcoin** : From scratch. Collect every star coin from the world.

* ### levelname / ln

Returns the identifier of the current level the player is standing in.

* ### nozzle [world] [nozzle] [bool]

Sets the saved nozzles in a specific world.

**world**: Name of the world. Can be chosen between these : all - bob - sl - ssl - hmc - bm - wdw - lll - ttm - ttc - rr - sotm - jrb - tidal - sots - ff - thwc - coe - mm - gos - eotmk

**nozzle**: Name of the nozzle that will be changed. Can be either : all, h, r, t, none.

**bool**: Future state of the chosen nozzles. Can be either true or false.

* ### worldstar ws [world] [bool] [number]

Sets the state of the stars in a specific world.

**world**: Name of the world. Can be chosen between these : bob - sl - ssl - hmc - bm - wdw - lll - ttm - ttc - rr - sotm - jrb - tidal - sots - ff - thwc - coe - mm - gos - eotmk

**bool**: Future state of the chosen stars. Can be either true or false.

**number** (Falcultative) Number of one specific star that can be chosen. For example, "ws bob true 1" gives the first star of BoB, which is the king bob-omb star.

* ### worldstarcoin wsc

Sets the state of the star coins in a specific world.

**world**: Name of the world. Can be chosen between these : bob - sl - ssl - hmc - bm - wdw - lll - ttm - ttc - rr - sotm - jrb - tidal - sots - ff - thwc - coe - mm - gos - eotmk

**bool**: Future state of the chosen star coins. Can be either true or false.

**number** (Falcultative) Number of one specific star coin that can be chosen. Refer to worldstar to see an example of use.

* ### last / l

Re-executes the last command that was executed.
Calling last after another last command doesn't create an infinite loop : instead, it executes the last command that wasn't 'last'.

## KoopaShell

The KoopaShell console written by Jhynjhiruu is fully included. It allows to modify pretty much every variable of the game.
The documentation of the KoopaShell module is available [here](https://github.com/Sekanor/SM63PracticeHack/wiki/KoopaShell-v2.0-Documentation).

