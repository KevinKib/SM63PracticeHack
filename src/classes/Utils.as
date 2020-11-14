// Class that communicates with the IG variables
class Utils {

    private var latestWarpPosition;
    private var worldList;
    private var flags;
    private var cutscenes;

    private var waterInterval;
    private var infiniteWater;
    private var healthInterval;
    private var infiniteHealth;


    // Constructor of the Utils class.
    public function Utils() {
        this.latestWarpPosition = [0, 0, 0, 0];
        this.worldList = new Array();
        this.flags = new Array();
        this.flags.push(false, false);
        this.cutscenes = false;
        this.camLock = true;

        this.waterInterval = null;
        this.infiniteWater = false;
        this.healthInterval = null;
        this.infiniteHealth = false;

        this.initWorlds();
    }

    // Initializes the worlds.
    public function initWorlds() {
        this.worldList.push(new World(1, 'bob', 'Bom-Omb Battlefield', "C-2", [-174.1, 9.35], [1, 2, 3, 4, 5], [1, 2, 3, 4, 5, 6], []), new World(2, 'sl', "Snowman's Land", "C-2-2", [-265, 58.05], [6, 7, 8, 9, 10], [7, 8, 9, 10, 11, 12], []), new World(3, 'hmc', "Hazy Maze Cave", "C-7", [-434.45, 58.3], [11, 12, 13, 14, 15], [13, 14, 15, 16, 17, 18], []), new World(4, 'bm', "Boo's Mansion", "C-8", [332.05, -0.15], [16, 17, 18, 19, 20], [19, 20, 21, 22, 23, 24], []), new World(5, 'lll', "Lethal Lava Land", "C-10", [-339.65, 8.15], [21, 22, 23, 24, 25], [25, 26, 27, 28, 29, 30], []), new World(6, 'ttm', "Tall Tall Mountain", "C-10", [136.05, 6.75], [26, 27, 28, 29, 30], [31, 32, 33, 34, 35, 36], []), new World(7, 'rr', "Rainbow Ride", "C-12", [-675.45, -74.9], [31, 32, 33, 34, 35], [37, 38, 39, 40, 41, 42], []), new World(8, 'bt3', "Bowser Trap 3", "C-13", [1123.9, -159.05], [], [52, 53], ['bt3']), new World(9, 'ssl', "Shifting Sand Land", "C-3", [155.3, 9.35], [55, 56, 57], [43, 44, 45], []), new World(10, 'wdw', "Wet Dry World", "C-8", [551.6, -10.3], [58, 59, 60], [46, 47, 48], []), new World(11, 'ttc', "Tick Tock Clock", "C-12", [149.5, 0.65], [61, 62, 63], [49, 50, 51], []), new World(0, 'sotm', "Secret of the Mushroom", "C-1", [0, -232], [44], [59], []), new World(0, 'jrb', "Jolly Roger Bay", "C-4H", [-633.6, -429.9], [46], [], []), new World(0, 'tidal', "Tidal Isles", "C-3-2", [128.2, 10.15], [45], [60], []), new World(0, 'sots', "Secret of the Sky", "C-7", [-623, 58.5], [48], [58], []), new World(0, 'ff', "Frosty Fludd", "C-7", [277.45, 58.45], [47], [63], []), new World(0, 'thwc', "Thwomp's Castle", "C-8", [939.05, -373.75], [49], [], []), new World(0, 'coe', "Cave of Empuzzlement", "C-10", [311.05, 7.35], [52], [], []), new World(0, 'mm', "Magma Maze", "C-10", [-442.55, -724.45], [53], [55], []), new World(0, 'gos', "Galaxy of Stars", "C-12", [481.3, -74.45], [54], [], []), new World(0, 'bt1', "Bowser 1", "C-5", [-316.85, 7.25], [], [], []), new World(0, 'bt2', "Bowser 2", "C-7", [619.85, 57.35], [], [], []), new World(0, 'b1reds', "Bowser 1 Reds", "C-5", [-316.85, 7.25], [40], [56], []), new World(0, 'b2reds', "Bowser 2 Reds", "C-7", [619.85, 57.35], [42], [57], []), new World(0, 'b3reds', "Bowser 3 Reds", "C-13", [971.85, -159.2], [37], [52, 53], []), new World(0, 'space', "Space", "8-12", [0, 0], [], [54], ['space']), new World(0, 'escape', "Escape", "8-16", [0, 0], [36], [], []), new World(0, 'endgame', "Any% Endgame", "C-13", [1123.9, -159.05], [36], [], []), new World(0, 'eotmk', "Edge of the Mushroom Kingdom", "Castle", [2163.9, -233.25], [64], [64], []));
    }



    /// --- SETTERS --- ///



    // Sets stars of a certain world in a certain state.
    public function setWorldStars(name, bool, number) {
        var selectedWorld = this.getWorld(name);
        var i = 0;
        if (number === undefined) {
            for (i = 0; i < selectedWorld.getStars().length; i++) {
                this.setStar(selectedWorld.getStars()[i], bool);
            }
        } else {
            this.setStar(selectedWorld.getStars()[number - 1], bool);
        }
    }

    // Sets star coins of a certain world in a certain state.
    public function setWorldStarCoins(name, bool, number) {
        var selectedWorld = this.getWorld(name);
        var i = 0;
        if (number === undefined) {
            for (i = 0; i < selectedWorld.getStarCoins().length; i++) {
                this.setStarCoin(selectedWorld.getStarCoins()[i], bool);
            }
        } else {
            this.setStarCoin(selectedWorld.getStarCoins()[number - 1], bool);
        }
    }

    // Sets the flags of a certain world in a certain state.
    public function setWorldFlags(name, bool) {
        var selectedWorld = this.getWorld(name);
        var i = 0;
        for (i = 0; i < selectedWorld.getFlags().length; i++) {
            this.setFlag(selectedWorld.getFlags()[i], false);
        }
    }

    // Warps the player to a certain course.
    public function warp(title, playerX, playerY, cameraX, cameraY, isCommand) {
        if (isCommand == undefined) {
            isCommand = true;
        }

        setTimeout(function() {
            _root.changecourse("StarIn", title, cameraX, cameraY, playerX, playerY, undefined, isCommand);
        }, this.getWarpTimeout());

    }

    // Resets the stats of the coins. Makes all collected coins re-appear.
    public function resetCoins() {
        _root.Restartcoins();
    }


    // Warps the player to a certain course using the door transition function.
    public function warpDoor(title) {
        _root.DoorTrasition(title);
    }

    // Sets the latest warp position variables.
    public function setLatestWarpPosition(b, c, d, e) {
        var lwp = new Array();
        lwp.push(b, c, d, e);
        this.latestWarpPosition = lwp.slice();
    }

    // Sets Mario's current x position.
    public function setX(value) {
        this.setPosition(value, this.getPosition()[1]);
    }

    // Sets Mario's current y position.
    public function setY(value) {
        this.setPosition(this.getPosition()[0], y);
    }

    // Sets Mario's current position to a new value.
    public function setPosition(x, y) {
        // _root.Course.Char._x = x - (_root.Course.Char._x - _root.Course.FrontGFX._x);
        // _root.Course.Char._y = y - (_root.Course.Char._y - _root.Course.FrontGFX._y);

        this.warp(this.getLevelName(), x, y, x, y);
    }

    // Sets the state of every star coin.
    public function setStarCoins(bool) {
        i = 1;
        while (i <= 64) {
            _root.StarCoin[i] = bool;
            i++;
        }
        _root.CalculateStarCoins();
    }

    // Sets the state of a specific star coin.
    public function setStarCoin(number, bool) {
        if (bool == undefined) {
            _root.StarCoin[number] = !_root.StarCoin[number];
        } else {
            _root.StarCoin[number] = bool;
        }
        _root.CalculateStarCoins();
    }

    // Sets the state of every star.
    public function setStars(bool) {
        i = 1;
        while (i <= 64) {
            _root.Star[i] = bool;
            i++;
        }
        _root.CalculateStars();
    }

    // Sets the state of a specific star.
    public function setStar(number, bool) {
        if (bool == undefined) {
            _root.Star[number] = !_root.Star[number];
        } else {
            _root.Star[number] = bool;
        }
        _root.CalculateStars();
    }

    // Sets the state of every bowser key.
    public function setBowserKeys(bool) {
        _root.BowserKey1 = bool;
        _root.BowserKey2 = bool;
        _root.BowserKey3 = bool;
    }

    // Sets the state of one specific bowser key.
    public function setBowserKey(number, bool) {
        switch (number) {
            case 1:
                if (bool == undefined) {
                    _root.BowserKey1 = !_root.BowserKey1;
                } else {
                    _root.BowserKey1 = bool;
                }
                break;
            case 2:
                if (bool == undefined) {
                    _root.BowserKey2 = !_root.BowserKey2;
                } else {
                    _root.BowserKey2 = bool;
                }
                break;
            case 3:
                if (bool == undefined) {
                    _root.BowserKey3 = !_root.BowserKey3;
                } else {
                    _root.BowserKey3 = bool;
                }
                break;
        }
    }

    // Sets the state of a flag, used for IL timings.
    public function setFlag(name, bool) {
        switch (name) {
            case 'bt3':
                this.flags[0] = bool;
                break;
            case 'space':
                this.flags[1] = bool;
                break;
        }
    }

    /* Sets the state of the current saved fludd nozzles.
     * Usage:
     * - 1. setSaveFludd(bool)
     *
     * - 2. setSaveFludd(bool, bool, bool)
     */
    public function setSaveFludd(bool, bool2, bool3) {
        if (bool2 == undefined || bool3 == undefined) {
            // 1.
            _root.SaveFluddH = bool;
            _root.SaveFluddR = bool;
            _root.SaveFluddT = bool;
        } else {
            // 2.
            _root.SaveFluddH = bool;
            _root.SaveFluddR = bool2;
            _root.SaveFluddT = bool3;
        }

        _root.utils.setSaveOneFludd('h', bool);
        _root.utils.setSaveOneFludd('r', bool);
        _root.utils.setSaveOneFludd('t', bool);
    }

    public function setSaveOneFludd(nozzle, bool) {
        switch (nozzle) {
            case 'h':
                _root.SaveFluddH = bool;
                _root.utils.setOneFludd(_root.utils.getPlayingLevel(), 'h', bool);
                break;
            case 'r':
                _root.SaveFluddR = bool;
                _root.utils.setOneFludd(_root.utils.getPlayingLevel(), 'r', bool);
                break;
            case 't':
                _root.SaveFluddT = bool;
                _root.utils.setOneFludd(_root.utils.getPlayingLevel(), 't', bool);
                break;
        }
    }

    // Sets the state of every fludd stored in levels.
    public function setFluddArray(bool) {
        _root.FluddArray = ["",
            ["", bool, bool, bool], // BoB
            ["", bool, bool, bool], // SL
            ["", bool, bool, bool], // HMC
            ["", bool, bool, bool], // BM
            ["", bool, bool, bool], // LLL
            ["", bool, bool, bool], // TTM
            ["", bool, bool, bool], // RR
            ["", bool, bool, bool], // BT3
            ["", bool, bool, bool], // SSL
            ["", bool, bool, bool], // WDW
            ["", bool, bool, bool]]; // TTC
    }

    // Sets the current fludd the player is holding.
    public function setFluddPow(value) {
        // "" for nothing, "h" for hover, "r" for rocket and "t" for turbo.
        /*
           if (value != "" && value != "h" && value != "r" && value != "t") {
           value = "";
           }
         */
        _root.Fluddpow = value;
    }

    // Sets the saved nozzles for a chosen world.
    public function setWorldNozzle(world, nozzle, boolText) {

        var worldNb = 0;
        var nozzleNb = 3;

        var setAllWorlds = false;
        var setAllNozzles = false;

        var worlds = new Array();
        worlds.push('bob', 'sl', 'hmc', 'bm', 'lll', 'ttm', 'rr', 'bt3', 'ssl', 'wdw', 'ttc');
        var nozzles = new Array();
        nozzles.push('h', 'r', 't');

        if (world == 'all') {
            var i = 0;
            for (i = 0; i < 11; i++) {
                _root.utils.setWorldNozzle(worlds[i], nozzle, boolText);
            }
        } else {
            worldNb = _root.utils.getWorld(world).getIndex();
        }

        switch (nozzle) {
            case 'all':
                var j = 0;
                for (j = 0; j < 2; j++) {
                    _root.utils.setWorldNozzle(world, nozzles[j], boolText);
                }
                break;
            case 'h':
            case 'H':
                nozzleNb = 1;
                break;
            case 'r':
            case 'R':
                nozzleNb = 2;
                break;
            case 't':
            case 'T':
                nozzleNb = 3;
                break;
        }

        switch (boolText) {
            case 'true':
                _root.FluddArray[worldNb][nozzleNb] = true;
                break;
            case 'false':
                _root.FluddArray[worldNb][nozzleNb] = false;
                break;
            case 'toggle':
                _root.FluddArray[worldNb][nozzleNb] = !_root.FluddArray[worldNb][nozzleNb];
                break;
        }

    }

    // Sets the state of the fludd in one specific playing level.
    public function setFludd(playingLevel, bool) {

        if (playingLevel < 1)
            playingLevel = 1;
        if (playingLevel > 11)
            playingLevel = 11;

        _root.FluddArray[playingLevel][1] = bool;
        _root.FluddArray[playingLevel][2] = bool;
        _root.FluddArray[playingLevel][3] = bool;

    }

    // Sets the state of one fludd in one specific playing level.
    public function setOneFludd(playingLevel, nozzle, bool) {

        if (playingLevel < 1)
            playingLevel = 1;
        if (playingLevel > 11)
            playingLevel = 11;

        switch (nozzle) {
            case 'h':
                _root.FluddArray[playingLevel][1] = bool;
                break;
            case 'r':
                _root.FluddArray[playingLevel][2] = bool;
                break;
            case 't':
                _root.FluddArray[playingLevel][3] = bool;
                break;
        }
    }

    public function updatePlayingLevel(ln) {
        if (ln == undefined) {
            ln = this.getLevelName();
        }

        if (ln.indexOf('1-') == 0) {
            _root.Playinglevel = 1;
        } else if (ln.indexOf('2-') == 0) {
            _root.Playinglevel = 2;
        } else if (ln.indexOf('3-') == 0) {
            _root.Playinglevel = 3;
        } else if (ln.indexOf('4-') == 0) {
            _root.Playinglevel = 4;
        } else if (ln.indexOf('5-') == 0) {
            _root.Playinglevel = 5;
        } else if (ln.indexOf('6-') == 0) {
            _root.Playinglevel = 6;
        } else if (ln.indexOf('7-') == 0) {
            _root.Playinglevel = 7;
        } else if (ln.indexOf('8-') == 0) {
            _root.Playinglevel = 8;
        } else if (ln.indexOf('M1-') == 0) {
            _root.Playinglevel = 9;
        } else if (ln.indexOf('M2-') == 0) {
            _root.Playinglevel = 10;
        } else if (ln.indexOf('M3-') == 0) {
            _root.Playinglevel = 11;
        } else {
            _root.Playinglevel = 0;
        }

    }

    // Sets the player's current cap (invisible, invincible, wing cap or metal).
    public function setCapBool(cap, bool, time) {
        var boolText = 'true';
        if (bool == false) {
            boolText = 'false';
        }
        this.setCap(cap, boolText, time);
    }

    // Sets the player's current cap (invisible, invincible, wing cap or metal).
    // Uses text for the boolean variable (can be messy).
    public function setCap(cap, boolText, time) {
        if (time == undefined || isNaN(time))
            time = 10000;
        var capTime = time;
        this.setCapTimer(capTime);

        var bool = true;
        if (boolText == 'false') {
            bool = false;
        }

        switch (cap) {
            case 'invincible':
                _root.StartNewMusicAndIntroNoVar("WingCap - Intro", "WingCap - Repeat");
                _root.Invincible = bool;
                break;
            case 'invisible':
                _root.StartNewMusicAndIntroNoVar("WingCap - Intro", "WingCap - Repeat");
                _root.Invisible = bool;
                break;
            case 'metal':
                _root.StartNewMusicAndIntroNoVar("MetalCap - Intro", "MetalCap - Repeat");
                _root.Metal = bool;
                break;
            case 'wingcap':
            case 'wing':
                _root.StartNewMusicAndIntroNoVar("WingCap - Intro", "WingCap - Repeat");
                _root.WingCap = bool;
                break;
            case 'none':
                this.setCapTimer(-1);
                break;
        }
    }

    // Defines for how long the cap will be used.
    public function setCapTimer(time) {
        _root.PowerTimer = time;
    }

    // Sets the current amount of water, between 0 and 10000.
    public function setWater(value) {
        _root.WaterAmount = value;
    }

    // Sets the current amount of health.
    public function setHealth(value) {
        _root.CharHP = value;
    }

    // Sets the current character the player is using.
    public function setCharacter(character) {

        // Ensures the new character is either Mario or Luigi.
        var newCharacter = 'Mario';
        if (character == 'Luigi') {
            newCharacter = 'Luigi';
        }

        _root.CurrentPlayer = newCharacter;
    }

    // Defines if the water is infinite or not.
    public function setInfiniteWater(bool) {
        clearInterval(this.waterInterval);

        if (bool == true) {
            this.waterInterval = setInterval(function() {
                _root.WaterAmount = _root.TotalWater;
            }, 200);
        }

        this.infiniteWater = bool;
    }

    // Defines if the health is infinite or not.
    public function setInfiniteHealth(bool) {
        clearInterval(this.healthInterval);

        if (bool == true) {
            this.healthInterval = setInterval(function() {
                _root.utils.setHealth(8);
            }, 200);
        }

        this.infiniteHealth = bool;
    }

    // Sets whether cutscenes are enabled or not.
    public function setCutscenes(bool) {
        this.cutscenes = bool;
    }

    // Sets the player's coin count to a cervain value.
    public function setCoinCount(value) {
        _root.Coins = value;
    }

    // Sets the player's red coin count to a cervain value.
    public function setRedCoinCount(value) {
        _root.RedCoins = value;
    }

    // Sets the player's silver stars count to a certain value.
    public function setSilverStarsCount(value) {
        _root.SilverStars = value;
    }

    // Sets whether Fake Bowser has been completed or not.
    public function setFakeBowserCompleted(bool) {
        _root.lvl8keyE = bool;
    }

	// Sets whether the camera is edge locked or not.
	public function setCamLock(bool) {
        this.camLock = bool;
    }


    /// --- GETTERS --- ///



    // Returns a specific world using its name.
    public function getWorld(name) {
        var world;
        var i = 0;
        for (i = 0; i < _root.utils.worldList.length; i++) {
            if (this.worldList[i].getName() == name) {
                world = this.worldList[i];
                break;
            }
        }
        return world;
    }

    // Returns the state of a star.
    public function getStar(index) {
        return _root.Star[index];
    }

    // Returns the state of a star coin.
    public function getStarCoin(index) {
        return _root.StarCoin[index];
    }

    // Returns the current level name/ID.
    public function getLevelName() {
        return _root.playingcourse;
    }

    // Returns the state of a flag, used for IL timings.
    public function getFlag(name, bool) {
        var flag;
        switch (name) {
            case 'bt3':
                flag = this.flags[0];
                break;
            case 'space':
                flag = this.flags[1];
                break;
        }
        return flag;
    }

    // Returns Mario's current position.
    public function getPosition() {
        var pos = new Array();
        pos.push(_root.Course.Char._x - _root.Course.FrontGFX._x);
        pos.push(_root.Course.Char._y - _root.Course.FrontGFX._y);
        return pos;
    }

    // Returns Mario's current position, with a string.
    public function getPositionString() {
        return this.getPosition()[0] + ' ' + this.getPosition()[1];
    }

    // Returns the latest warp position.
    public function getLatestWarpPosition() {
        return this.latestWarpPosition;
    }

    // Returns the latest warp position.
    public function getLatestWarpPositionString() {
        return this.latestWarpPosition[0] + ' ' + this.latestWarpPosition[1] + ' ' + this.latestWarpPosition[2] + ' ' + this.latestWarpPosition[3];
    }

    // Returns the current state of the saved fludd.
    public function getSaveFludd() {
        return {h: _root.SaveFluddH,
                r: _root.SaveFluddR,
                t: _root.SaveFluddT}
    }

    // Returns the current amount of water.
    public function getWater() {
        return _root.WaterAmount;
    }

    // Returns the current amount of health.
    public function getHealth() {
        return _root.CharHP;
    }

    // Returns the current fludd nozzle the player is holding.
    public function getFluddPow() {
        return _root.Fluddpow;
    }

    // Returns the current character the player is using.
    public function getCharacter() {
        return _root.CurrentPlayer;
    }

    // Returns the number of the current world the player is standing in.
    public function getPlayingLevel() {
        return _root.Playinglevel;
    }

    // Returns the state of the caps held by the player.
    public function getCap(name) {
        var bool = null;

        switch (name) {
            case 'invisible':
                bool = _root.Invisible;
                break;
            case 'invincible':
                bool = _root.Invincible;
                break;
            case 'metal':
                bool = _root.Metal;
                break;
            case 'wingcap':
            case 'wing':
                bool = _root.WingCap;
                break;
        }

        return bool;
    }

    // Returns the player's current coin count.
    public function getCoinCount() {
        return _root.Coins;
    }

    // Returns the player's current coin count.
    public function getRedCoinCount() {
        return _root.RedCoins;
    }

    // Returns the player's current silver stars count.
    public function getSilverStarsCount() {
        return _root.SilverStars;
    }

    // Returns the current value of the cap timer.
    public function getCapTimer(time) {
        return _root.PowerTimer;
    }

    // Returns whether Fake Bowser has been completed or not.
    public function getFakeBowserCompleted() {
        return _root.lvl8keyE;
    }

    // Returns whether cutscenes are enabled or not.
    public function getCutscenes(bool) {
        return this.cutscenes;
    }

    // Returns the game's current framerate.
    public function getFramerate() {
        return _root.framerate;
    }

    // Returns the necessary timeout for a warp to happen.
    public function getWarpTimeout() {
        /* The warp command used to glitch when executed instantly.
           To fix this problem, a timeout of 100 ms was added to execute the command.
           It, for some reason, fixed the problem. No one has any idea why it did fix it.
           First problems have been detected with a timeout of 10ms, so the default has been
           set to 100ms for now.*/

        return 100;
    }

    // Returns the necessary timeout for an action to happen after a warp.
    public function getAfterWarpTimeout() {
        return 150;
    }

    // Returns if the water is infinite or not.
    public function isWaterInfinite() {
        return this.infiniteWater;
    }

    // Returns if the health is infinite or not.
    public function isHealthInfinite() {
        return (this.infiniteHealth);
    }

    // Returns true if the game is currently paused.
    public function isGamePaused() {
        return !_root.PauseGame;
    }

	 // Returns true if the camera is edge locked or not.
    public function isCamLocked() {
        return this.camLock;
    }
}