This page documentates every existing command, and how to use them.

### Savestates

<details>
<summary>savestate</summary>

> Creates a new savestate, that can be loaded in the future using the **loadstate** command.

A savestate saves in-game data, such as the amount of health and water, current held stars and star coins, nozzles currently available, currently held nozzle, etc.

**Syntax :** savestate / ss [name]

* **name** : Name of the savestate.

***
</details>

<details>
<summary>loadstate</summary>

> Loads a previously created savestate.

**Syntax :** loadstate / ls [name]

* **name** : Name of the savestate.

</details>

***

### Tools

<details>
<summary>timer</summary>

> Manages the state of the timer.

**Syntax :** timer / t [start|stop|reset]

* **start**: Starts the timer.

* **stop**: Stops the timer.

* **reset**: Resets the timer; makes it automatically start on the next loading zone.

***
</details>


<details>
<summary>warp</summary>

> Warps the player to a specific section.

**Syntax :** warp / w [name] [playerX] [playerY] [cameraX] [cameraY]

* **name**: Name of that specific section. A list of the sections is available [here](https://docs.google.com/spreadsheets/d/1FLYArXZ4g_c7-L8tu4j_GyHaQ-BDFCvdqIluxmHcKkU/edit#gid=559521057).

* **coordinates**: Coordinates of the starting location of the player (4 parameters).

***
</details>

<details>
<summary>individuallevel</summary>

> Starts an individual level.

**Syntax :** individuallevel / il [world] [type]

* **world**: Name of the world in which the individual level will be played. Can be chosen between these : bob - sl - ssl - hmc - bm - wdw - lll - ttm - ttc - rr - sotm - jrb - tidal - sots - ff - thwc - coe - mm - gos - eotmk - b1reds - b2reds - b3reds

* **type**: The type of individual level that will be performed.
Can be either:
- **100 / all** : Starts a world from scratch. Collect every star and star coin from the world.
- **allstars** : Collect every star from the world.
- **allstarcoins** : Collect every star coin from the world.
- **star** : Collect one specific from the world. Number of the star has to be precised right after. Example : "il bob star 4"
- **starcoin** : Collect one specific star coin from the world. Number of the star has to be precised right after. Example : "il ssl starcoin 2"
- **nms** : Collect a certain amount of stars and star coins from the world. Example : "il ssl nms 2 1" means that you need to collect 2 stars and 1 star coin in SSL for the timer to end.


</details>

***

### Ingame data

<details>
<summary>char</summary>

> Allows to switch characters.

**Syntax** : char [mario|luigi|toggle]

The "toggle" option switches to Luigi if Mario is the current character, and vice-versa.

***
</details>



<details>
<summary>lives</summary>

> Sets a certain number of lives to the life counter.

**Syntax** : lives [number|infinite]

Writing 'lives infinite' will prevent Mario from ever game-overing.

***
</details>

<details>
<summary>health</summary>

> Sets a certain amount of health to the player. Health count goes from 0 to 8.

**Syntax :** health [refill|empty|death|number]

* **refill**: Heals the player, to the value 8.

* **empty**: Almost kills the player, to the value 1.

* **death**: Kills the player by setting health to the value 0

* **number**: Any number between 0 and 8.

***
</details>

<details>
<summary>water</summary>

> Sets a certain amount of water to the player. Water count goes from 0 to 10000.

**Syntax :** water [refill|half|empty|number]

* **refill**: Fills the water, to the value 10000.

* **half**: Half fills the water, to the value 5000.

* **empty**: Empties the water, to the value 0.

* **number**: Any number between 0 and 10000.

***
</details>

<details>
<summary>fludd</summary>

> Manages the current nozzles that the player has access to.

**Syntax :** fludd [all|H|R|T|none]

* **all**: Gives all nozzles to the player.

* **H**: Toggles the hover nozzle for the player.

* **R**: Toggles the rocket nozzle for the player.

* **T**: Toggles the turbo nozzle for the player.

* **none**: Removes every nozzle of the player.

***
</details>

<details>
<summary>nozzle</summary>

> Sets the saved nozzles in a specific world.

**Syntax :** nozzle [world] [nozzle] [bool]

* **world**: Name of the world. Can be chosen between these : all - bob - sl - ssl - hmc - bm - wdw - lll - ttm - ttc - rr - sotm - jrb - tidal - sots - ff - thwc - coe - mm - gos - eotmk

* **nozzle**: Name of the nozzle that will be changed. Can be either : all, h, r, t, none.

* **bool**: Future state of the chosen nozzles. Can be either true or false.

***
</details>

<details>
<summary>cap</summary>

> Sets the state of the caps the player currently has.

**Syntax :** cap [type|none] [boolean] [time]

* **type**: Cap type. Can be either : invisible - invincible - metal - wing.

* **none**: This option resets all player caps.

* **boolean**: True or false.

* **time**: Decides for how long the cap will be enabled.

</details>

***

### File data

<details>
<summary>file</summary>

> Setups a file setting.

**Syntax :** file / f [complete|essentials|empty]

* **complete**: Setups a 100% file.

* **essentials**: Setups a "race" file, which is a file with all storyline stars obtained. Can be used to do 100% ILs.

* **empty**: Setups an empty file.

***
</details>

<details>
<summary>star</summary>

> Manages the state of a specific star.

**Syntax :** star / s [number] [boolean]

* **number**: Identifier of the star, between 1 and 64.

* **boolean**: Either true or false, to set the state of the star, or nothing to toggle its state.

***
</details>


<details>
<summary>starcoin</summary>

> Manages the state of a specific star coin.

**Syntax :** starcoin / sc [number] [boolean]

* **number**: Identifier of the star coin, between 1 and 64.

* **boolean**: Either true or false, to set the state of the star coin, or nothing to toggle its state.

***
</details>


<details>
<summary>bowserkey</summary>

> Manages the state of a specific bowser key.

**Syntax:** bowserkey / bk [number] [boolean]

* **number**: Identifier of the bowser key, between 1 and 3.

* **boolean**: Either true or false, to set the state of the bowser key, or nothing to toggle its state.

***
</details>

<details>
<summary>worldstar</summary>

> Sets the state of the stars in a specific world.

**Syntax :** worldstar / ws [world] [bool] [number]

* **world**: Name of the world. Can be chosen between these : bob - sl - ssl - hmc - bm - wdw - lll - ttm - ttc - rr - sotm - jrb - tidal - sots - ff - thwc - coe - mm - gos - eotmk

* **bool**: Future state of the chosen stars. Can be either true or false.

* **number** (Falcultative) Number of one specific star that can be chosen. For example, "ws bob true 1" gives the first star of BoB, which is the king bob-omb star.

***
</details>


<details>
<summary>worldstarcoin</summary>

> Sets the state of the star coins in a specific world.

**Syntax :** worldstarcoin / wsc

* **world**: Name of the world. Can be chosen between these : bob - sl - ssl - hmc - bm - wdw - lll - ttm - ttc - rr - sotm - jrb - tidal - sots - ff - thwc - coe - mm - gos - eotmk

* **bool**: Future state of the chosen star coins. Can be either true or false.

* **number** (Falcultative) Number of one specific star coin that can be chosen. Refer to worldstar to see an example of use.

</details>

***

### Display

<details>
<summary>showcollision</summary>

> Makes collision visible as bright boxes.

**Syntax :** showcollision / shc [on|off]

***
</details>

<details>
<summary>addwatch</summary>

> Adds a variable to the memory watch.

**Syntax :** addwatch / watch / aw [name]

* **name**: Name of the variable to watch for.

***
</details>
<details>
<summary>removewatch</summary>

> Removes a variable from the watch.

**Syntax :** removewatch / rw [name]

* **name**: Name of the variable to remove from the watch.

</details>

***

### Other

<details>
<summary>last</summary>

> Re-executes the last command that was executed.

**Syntax :** last / l

***
</details>

<details>
<summary>levelname</summary>

> Returns the identifier of the current level the player is standing in.

**Syntax :** levelname / ln

***
</details>

<details>
<summary>position</summary>

> Returns the current position of the player.

**Syntax :** position / pos

***
</details>

<details>
<summary>latestwarpposition</summary>

> Returns the latest position the player has warped into.

**Syntax :** latestwarpposition / lwp

***
</details>
