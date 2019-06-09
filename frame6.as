// This code overwrites the functions written in frame3_3, as editing the file is impossible in FFDec
_root.gotoCourseSelect = function (level)
{
    _root.Playinglevel = level;
    _root.RemoveCourse();
    _root.Restartcoins();
    _root.gotoAndStop("CourseSelect");
    _root.Transition.removeMovieClip(_root.Transition);
    _root.attachMovie("Fromwhite", "Transition", _root.getNextHighestDepth(), {
        _x : _root.screensizeX  / 2, _y : _root.screensizeY  / 2
    });
    _root.bgsong.stop();
    _root.bgsong = new Sound(this);
    _root.bgsong.attachSound("Star Swish");
    _root.bgsong.start(0, 1);
    _root.bgsong.setVolume(_root.BgVolume);
    // On course select
    _root.event.onCourseSelect();
};
_root.gotoMiniCourseSelect = function (level)
{
    _root.Playinglevelnum = level;
    _root.Playinglevel = level + 8;
    _root.RemoveCourse();
    _root.Restartcoins();
    _root.gotoAndStop("MiniCourseSelect");
    _root.Transition.removeMovieClip(_root.Transition);
    _root.attachMovie("Fromwhite", "Transition", _root.getNextHighestDepth(), {
        _x : _root.screensizeX  / 2, _y : _root.screensizeY  / 2
    });
    _root.bgsong.stop();
    _root.bgsong = new Sound(this);
    _root.bgsong.attachSound("Star Swish");
    _root.bgsong.start(0, 1);
    _root.bgsong.setVolume(_root.BgVolume);
    // On mini course select
    _root.event.onMiniCourseSelect();
};
// Defines the informations from a world
class World 
{
    private var index;
    private var name;
    private var fullName;
    private var startingLevel;
    private var coordinates;
    private var stars;
    private var starCoins;
    private var flags;
    public function World(index, name, fullName, startingLevel, coordinates, stars, starCoins, flags) 
    {
        this.index = index;
        this.name = name;
        this.fullName = fullName;
        this.startingLevel = startingLevel;
        this.coordinates = coordinates;
        this.stars = stars.slice();
        this.starCoins = starCoins.slice();
        this.flags = flags.slice();
    }
    public function getIndex() 
    {
        return this.index;
    }
    public function getName() 
    {
        return this.name;
    }
    public function getFullName() 
    {
        return this.fullName;
    }
    public function getStars() 
    {
        return this.stars.slice();
    }
    public function getStarCoins() 
    {
        return this.starCoins.slice();
    }
    public function getCoordinates() 
    {
        return this.coordinates.slice();
    }
    public function getFlags() 
    {
        return this.flags.slice();
    }
    public function getStartingLevel() 
    {
        return this.startingLevel;
    }
}
// Class that communicates with the IG variables
class Utils 
{
    private var latestWarpPosition;
    private var worldList;
    private var flags;
    // Constructor of the Utils class.
    public function Utils() 
    {
        this.worldList = new Array();
        this.flags = new Array();
        this.flags.push(false, false);
        this.latestWarpPosition = [0, 0, 0, 0];
        this.worldList.push(new World(1, 'bob', 'Bom-Omb Battlefield', "C-2", [ - 174.1, 9.35], [1, 2, 
        3, 4, 5], [1, 2, 3, 4, 5, 6], []), new World(2, 'sl', "Snowman's Land", "C-2-2", [ - 265, 58.05], 
        [6, 7, 8, 9, 10], [7, 8, 9, 10, 11, 12], []), new World(3, 'hmc', "Hazy Maze Cave", "C-7", [ - 434.45, 
        58.3], [11, 12, 13, 14, 15], [13, 14, 15, 16, 17, 18], []), new World(4, 'bm', "Boo's Mansion", 
        "C-8", [332.05, - 0.15], [16, 17, 18, 19, 20], [19, 20, 21, 22, 23, 24], []), new World(5, 'lll', 
        "Lethal Lava Land", "C-10", [ - 339.65, 8.15], [21, 22, 23, 24, 25], [25, 26, 27, 28, 29, 30], 
        []), new World(6, 'ttm', "Tall Tall Mountain", "C-10", [136.05, 6.75], [26, 27, 28, 29, 30], [31, 
        32, 33, 34, 35, 36], []), new World(7, 'rr', "Rainbow Ride", "C-12", [ - 675.45, - 74.9], [31, 
        32, 33, 34, 35], [37, 38, 39, 40, 41, 42], []), new World(8, 'bt3', "Bowser Trap 3", "C-13", [1123.9, 
         - 159.05], [], [52, 53], ['bt3']), new World(9, 'ssl', "Shifting Sand Land", "C-3", [155.3, 9.35], 
        [55, 56, 57], [43, 44, 45], []), new World(10, 'wdw', "Wet Dry World", "C-8", [551.6, - 10.3], 
        [58, 59, 60], [46, 47, 48], []), new World(11, 'ttc', "Tick Tock Clock", "C-12", [149.5, 0.65 ], 
        [61, 62, 63], [49, 50, 51], []), new World(0, 'sotm', "Secret of the Mushroom", "C-1", [0, - 232], 
        [44], [59], []), new World(0, 'jrb', "Jolly Roger Bay", "C-4H", [ - 633.6, - 429.9], [46], [], 
        []), new World(0, 'tidal', "Tidal Isles", "C-3-2", [128.2, 10.15], [45], [60], []), new World(0, 
        'sots', "Secret of the Sky", "C-7", [ - 623, 58.5], [48], [58], []), new World(0, 'ff', "Frosty Fludd", 
        "C-7", [277.45, 58.45], [47], [63], []), new World(0, 'thwc', "Thwomp's Castle", "C-8", [939.05, 
         - 373.75], [49], [], []), new World(0, 'coe', "Cave of Empuzzlement", "C-10", [311.05, 7.35], 
        [53], [], []), new World(0, 'mm', "Magma Maze", "C-10", [ - 442.55, - 724.45], [52], [55], []), 
        new World(0, 'gos', "Galaxy of Stars", "C-12", [481.3, - 74.45], [54], [], []), new World(0, 'space', 
        "Space", "8-12", [0, 0], [], [54], ['space']), new World(0, 'escape', "Escape", "8-16", [0, 0], 
        [36], [], []), new World(0, 'endgame', "Any% Endgame", "C-13", [1123.9, - 159.05], [36], [], []), 
        new World(0, 'eotmk', "Edge of the Mushroom Kingdom", "Castle", [2163.9, - 233.25], [64], [64], 
        []) );
    }
    // Returns a specific world using its name.
    public function getWorld(name) 
    {
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
    // Sets stars of a certain world in a certain state.
    public function setWorldStars(name, bool, number) 
    {
        var selectedWorld = this.getWorld(name);
        var i = 0;
        if (number === undefined) 
        {
            for (i = 0; i < selectedWorld.getStars().length; i++) {
                this.setStar(selectedWorld.getStars()[i], bool);
            }
        }
        else {
            this.setStar(selectedWorld[number - 1], bool);
        }
    }
    // Sets star coins of a certain world in a certain state.
    public function setWorldStarCoins(name, bool, number) 
    {
        var selectedWorld = this.getWorld(name);
        var i = 0;
        if (number === undefined) 
        {
            for (i = 0; i < selectedWorld.getStarCoins().length; i++) {
                this.setStarCoin(selectedWorld.getStarCoins()[i], bool);
            }
        }
        else {
            this.setStarCoin(selectedWorld.getStarCoins()[number - 1], bool);
        }
    }
    // Sets the flags of a certain world in a certain state.
    public function setWorldFlags(name, bool) 
    {
        var selectedWorld = this.getWorld(name);
        var i = 0;
        for (i = 0; i < selectedWorld.getFlags().length; i++) {
            this.setFlag(selectedWorld.getFlags()[i], false);
        }
    }
    // Warps the player to a certain course.
    public function warp(title, playerX, playerY, cameraX, cameraY) 
    {
        /* This command used to glitch when executed instantly.
        To fix this problem, a timeout of 100 ms was added to execute the command.
        It, for some reason, fixed the problem. No one has any idea why it did fix it.
        First problems have been detected with a timeout of 10ms, so the default has been
        set to 100ms for now.*/
        setTimeout(function () 
        {
            _root.Restartcoins();
            _root.changecourse("StarIn", title, cameraX, cameraY, playerX, playerY, false);
        }, 100);
    }
    // Warps the player to a certain course using the door transition function.
    public function warpDoor(title) 
    {
        _root.DoorTrasition(title);
    }
    // Sets the latest warp position variables.
    public function setLatestWarpPosition(b, c, d, e) 
    {
        var lwp = new Array();
        lwp.push(b, c, d, e);
        this.latestWarpPosition = lwp.slice();
    }
    // Returns Mario's current position.
    public function getPosition() 
    {
        var pos = new Array();
        pos.push(_root.Course.Char._x - _root.Course.FrontGFX._x);
        pos.push(_root.Course.Char._y - _root.Course.FrontGFX._y);
        return pos;
    }
    // Returns Mario's current position, with a string.
    public function getPositionString() 
    {
        return this.getPosition()[0] + ' ' + this.getPosition()[1];
    }
    // Returns the latest warp position.
    public function getLatestWarpPosition() 
    {
        return this.latestWarpPosition;
    }
    // Returns the latest warp position.
    public function getLatestWarpPositionString() 
    {
        return this.latestWarpPosition[0] + ' ' + this.latestWarpPosition[1] + ' ' + this.latestWarpPosition[2] + ' ' + this.latestWarpPosition[3];
    }
    // Sets the state of every star coin.
    public function setStarCoins(bool) 
    {
        i = 1;
        while (i <= 64) {
            _root.StarCoin[i] = bool;
            i++;
        }
        _root.CalculateStarCoins();
    }
    // Sets the state of a specific star coin.
    public function setStarCoin(number, bool) 
    {
        if (bool == undefined) {
            _root.StarCoin[number] = !_root.StarCoin[number];
        }
        else {
            _root.StarCoin[number] = bool;
        }
        _root.CalculateStarCoins();
    }
    // Sets the state of every star.
    public function setStars(bool) 
    {
        i = 1;
        while (i <= 64) {
            _root.Star[i] = bool;
            i++;
        }
        _root.CalculateStars();
    }
    // Sets the state of a specific star.
    public function setStar(number, bool) 
    {
        if (bool == undefined) {
            _root.Star[number] = !_root.Star[number];
        }
        else {
            _root.Star[number] = bool;
        }
        _root.CalculateStars();
    }
    // Sets the state of every bowser key.
    public function setBowserKeys(bool) 
    {
        _root.BowserKey1 = bool;
        _root.BowserKey2 = bool;
        _root.BowserKey3 = bool;
    }
    // Sets the state of one specific bowser key.
    public function setBowserKey(number, bool) 
    {
        switch (number) 
        {
            case 1:
                if (bool == undefined) {
                    _root.BowserKey1 = !_root.BowserKey1;
                }
                else {
                    _root.BowserKey1 = bool;
                }
                break;
            case 2:
                if (bool == undefined) {
                    _root.BowserKey2 = !_root.BowserKey2;
                }
                else {
                    _root.BowserKey2 = bool;
                }
                break;
            case 3:
                if (bool == undefined) {
                    _root.BowserKey3 = !_root.BowserKey3;
                }
                else {
                    _root.BowserKey3 = bool;
                }
                break;
        }
    }
    // Sets the state of a flag, used for IL timings.
    public function setFlag(name, bool) 
    {
        switch (name) {
            case 'bt3':
                this.flags[0] = bool;
                break;
            case 'space':
                this.flags[1] = bool;
                break;
        }
    }
    // Returns the state of a flag, used for IL timings.
    public function getFlag(name, bool) 
    {
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
    // Sets the state of the current saved fludd nozzles.
    public function setSaveFludd(bool) 
    {
        _root.SaveFluddH = bool;
        _root.SaveFluddR = bool;
        _root.SaveFluddT = bool;
    }
    // Sets the state of every fludd stored in levels.
    public function setFluddArray(bool) 
    {
        _root.FluddArray = ["", ["", bool, bool, bool], ["", bool, bool, bool], ["", bool, bool, bool], 
        ["", bool, bool, bool], ["", bool, bool, bool], ["", bool, bool, bool], ["", bool, bool, bool], 
        ["", bool, bool, bool], ["", bool, bool, bool], ["", bool, bool, bool], ["", bool, bool, bool]];
    }
    // Sets the saved nozzles for a chosen world.
    public function setWorldNozzle(world, nozzle, boolText) 
    {
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
        }
        else {
            worldNb = _root.utils.getWorld(world).getIndex();
        }
        switch (nozzle) 
        {
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
        switch (boolText) 
        {
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
    public function setFludd(playingLevel, bool) 
    {
        if (playingLevel < 1) {
            playingLevel = 1;
        }
        if (playingLevel > 11) {
            playingLevel = 11;
        }
        _root.FluddArray[playingLevel][1] = bool;
        _root.FluddArray[playingLevel][2] = bool;
        _root.FluddArray[playingLevel][3] = bool;
    }
    // Returns the state of a star.
    public function getStar(index) 
    {
        return _root.Star[index];
    }
    // Returns the state of a star coin.
    public function getStarCoin(index) 
    {
        return _root.StarCoin[index];
    }
    // Returns the current level name/ID.
    public function getLevelName() 
    {
        return _root.playingcourse;
    }
    // Sets the player's current cap (invisible, invincible, wing cap or metal).
    public function setCap(cap, boolText) 
    {
        var capTime = 10000;
        this.setCapTimer(capTime);
        var bool = true;
        if (boolText == 'false') {
            bool = false;
        }
        switch (cap) 
        {
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
                this.setCapTimer( - 1);
                break;
        }
    }
    // Defines for how long the cap will be used.
    public function setCapTimer(time) 
    {
        _root.PowerTimer = time;
    }
}
// Class that manages everything related to displayed text.
class TextManager 
{
    // Could be coded significantly better using an array.
    private var row1;
    private var row2;
    private var row3;
    private var row4;
    private var row5;
    private var row6;
    public function TextManager() 
    {
        this.row1 = "";
        this.row2 = "";
        this.row3 = "";
        this.row4 = "";
        this.row5 = "";
        this.row6 = "";
    }
    public function write(row, text) 
    {
        switch (row) 
        {
            case 1:
                this.row1 = text;
                break;
            case 2:
                this.row2 = text;
                break;
            case 3:
                this.row3 = text;
                break;
            case 4:
                this.row4 = text;
                break;
            case 5:
                this.row5 = text;
                break;
            case 6:
                this.row6 = text;
                break;
        }
        _root.TextHint = this.row1 + "\n" + this.row2 + "\n" + this.row3 + "\n" + this.row4 + "\n" + this.row5 + "\n" + this.row6;
    }
}
// Class that manages the code that happens on certain occurences.
class Event 
{
    // Triggers code that happens on each frame.
    public function onEachFrame() 
    {
        _root.timer.onEachFrame();
        _root.timer.update();
        _root.codeManager.onEachFrame();
        _root.textManager.write(1, _root.timer.getDisplay());
        // KoopaShell
        if (_root.KeySlash()) {
            _root.koopashellInput = true;
        }
        _root.tickCpu();
        setCollision();
    }
    // Triggers code that happens on every loading zone.
    public function onLoadingZone() 
    {
        _root.timer.onLoadingZone();
        _root.textManager.write(4, _root.timer.getDisplay());
    }
    // Triggers code that happens when the star is collected.
    public function onStarCollected() 
    {
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }
    }
    // Triggers code that happens when the star coin is collected.
    public function onStarCoinCollected() 
    {
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }
    }
    // Triggers code that happens when the fake bowser door is opened.
    public function onFakeBowserStart() 
    {
        if (_root.codeManager.getIL().isGoing() === true) 
        {
            _root.utils.setFlag('bt3', true);
            _root.codeManager.getIL().onStarCollected();
            _root.WaterAmount = _root.TotalWater;
        }
    }
    // Triggers code that happens when Space is finished.
    public function onSpaceEnd() 
    {
        _root.utils.setFlag('space', true);
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }
        _root.Fluddpow = "";
        _root.CharHP = 8;
        _root.utils.warp('8-16', 0, - 350, 0, - 250);
    }
    // Triggers code that happens when the true bowser fight is loaded.
    public function onTrueBowserStart() 
    {
        /*
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }
        */
    }
    // Triggers code that happens when the true bowser fight is terminated.
    public function onTrueBowserEnd() 
    {
        _root.Fluddpow = "";
        _root.CharHP = 8;
        _root.utils.warp('BC-1', 0, 0, 0, 0);
        _root.utils.setSaveFludd(true);
    }
    // Triggers code that happens when the escape is finished / the game is done.
    public function onEscapeEnd() 
    {
        _root.utils.warp('C-1', 0, 0, 0, 0);
        _root.utils.setStar(36, true);
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }
    }
    // Triggers code that happens on the course select menu.
    public function onCourseSelect() 
    {
        _root.timer.addSecond();
    }
    // Triggers code that happens on the mini course select menu.
    public function onMiniCourseSelect() 
    {
        this.onCourseSelect();
    }
}
// Class that manages a time counter.
class TimeCounter 
{
    // Time variables
    private var frames;
    private var milliseconds;
    private var seconds;
    private var minutes;
    private var FRAMES_PER_SECOND;
    // Basic constructor
    public function TimeCounter() 
    {
        this.frames = 0;
        this.milliseconds = 0;
        this.seconds = 0;
        this.minutes = 0;
        this.FRAMES_PER_SECOND = 32;
    }
    // Static manual constructor
    public static function Init(m, s, ms) 
    {
        var obj : TimeCounter = new TimeCounter();
        obj.minutes = m;
        obj.seconds = s;
        obj.milliseconds = ms;
        return obj;
    }
    // Adds a frame to the timer, and manages everything that happens next.
    public function addFrame() 
    {
        this.frames++;
        this.milliseconds = Math.floor((this.frames  / this.FRAMES_PER_SECOND) * 1000);
        if (this.frames >= this.FRAMES_PER_SECOND) {
            this.frames = 0;
            this.milliseconds = 0;
            this.addSecond();
        }
    }
    // Adds a second to the timer, and manages everything that happens next.
    public function addSecond() 
    {
        this.seconds++;
        if (this.seconds >= 60) {
            this.seconds = 0;
            this.addMinute();
        }
    }
    // Adds a minute to the timer.
    private function addMinute() 
    {
        this.minutes++;
    }
    // Clones the timer.
    public function clone() 
    {
        var obj : TimeCounter = new TimeCounter();
        obj.frames = this.frames;
        obj.milliseconds = this.milliseconds;
        obj.seconds = this.seconds;
        obj.minutes = this.minutes;
        return obj;
    }
    // Returns a string displaying the current time.
    public function getDisplay() 
    {
        var txtMilliseconds = this.milliseconds;
        if (this.milliseconds < 10) {
            txtMilliseconds = "0" + txtMilliseconds;
        }
        if (this.milliseconds < 100) {
            txtMilliseconds = "0" + txtMilliseconds;
        }
        var txtSeconds = this.seconds;
        if (this.seconds < 10) {
            txtSeconds = "0" + txtSeconds;
        }
        var txtMinutes = this.minutes;
        if (this.minutes < 10) {
            txtMinutes = "0" + this.minutes;
        }
        return txtMinutes + ":" + txtSeconds + "." + txtMilliseconds;
    }
    //// GETTERS & SETTERS
    // Seconds setter
    public function setSeconds(value) 
    {
        this.seconds = value;
    }
    // Minutes setter
    public function setMinutes(value) 
    {
        this.minutes = value;
    }
    // Getter of the frame count
    public function getFrames() 
    {
        return this.frames;
    }
    // Getter of the milliseconds
    public function getMilliseconds() 
    {
        return this.milliseconds;
    }
    // Getter of the seconds
    public function getSeconds() 
    {
        return this.seconds;
    }
    // Getter of the minutes
    public function getMinutes() 
    {
        return this.minutes;
    }
}
// Class that manages a full chronometer.
class Timer 
{
    // Defines if the timer is going or not.
    private var started;
    // Defines if the timer will start on the next loading zone.
    private var startOnLoadingZone;
    // Tracks the real time, as it's going.
    private var realTime : TimeCounter;
    // Tracks the last update of the time.
    private var lastUpdatedTime : TimeCounter;
    // Constructor
    public function Timer() 
    {
        this.reset();
    }
    // Resets the timer.
    public function reset() 
    {
        this.started = false;
        this.realTime = new TimeCounter();
        this.lastUpdatedTime = new TimeCounter();
        this.startOnLoadingZone = true;
    }
    // Starts the timer.
    public function start() 
    {
        this.started = true;
    }
    // Stops the timer.
    public function stop() 
    {
        this.started = false;
    }
    // Updates the timer.
    public function update() 
    {
        this.lastUpdatedTime = this.realTime.clone();
    }
    // Manages the code that happens on each frame.
    public function onEachFrame() 
    {
        if (this.started == true) {
            this.realTime.addFrame();
        }
    }
    // Manages the code that happens when entering a loading zone.
    public function onLoadingZone() 
    {
        if (this.startOnLoadingZone) {
            this.start();
            this.startOnLoadingZone = false;
        }
    }
    // Returns a string displaying the current time.
    public function getDisplay() 
    {
        return this.lastUpdatedTime.getDisplay();
    }
    // Adds a second to the time.
    public function addSecond() 
    {
        this.realTime.addSecond();
    }
}
// Class that defines a code and its effects.
class Code 
{
    // Identifier of the code
    private var indexList;
    // Function sent as a callback that will be executed
    private var func;
    // Constructor
    public function Code(index, func) 
    {
        this.indexList = index.split(' ');
        this.func = func;
    }
    // Executes the code, if the index is valid.
    public function execute(code) 
    {
        var i = 0;
        var command = code.split(' ');
        for (i = 0; i < this.indexList.length; i++) {
            if (this.indexList[i] == command[0]) {
                this.func(command);
                break;
            }
        }
    }
    // Executes the code, no matter what.
    // (Should not be working)
    private function executeImmediate() 
    {
        this.func();
    }
}
// Class that manages how codes behave overall.
class CodeManager 
{
    private var codeList;
    private var delay;
    private var input;
    private var currentCode;
    private var lastCode;
    private var il;
    // Constructor.
    public function CodeManager() 
    {
        this.codeList = new Array();
        this.input = true;
        this.currentCode = "";
        this.lastCode = "";
        this.delay = 0;
        this.il = new IndividualLevel();
        this.initKeyListener();
        this.initCodes();
    }
    // Creates the key listener.
    public function initKeyListener() 
    {
        var allowedKeys = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_:/.,\\\'%;*+\" [](){}=";
        var keyListener = new Object();
        keyListener.onKeyDown = function () 
        {
            if (_root.codeManager.delay > 0) 
            {
                if (_root.codeManager.getInput()) 
                {
                    if (allowedKeys.indexOf(chr(Key.getAscii())) != - 1) 
                    {
                        _root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode() + chr(Key.getAscii()));
                        _root.codeManager.resetDelay();
                    }
                    else 
                    {
                        switch (Key.getAscii()) 
                        {
                            case 127:
                                _root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode().substring(0, 
                                _root.codeManager.getCurrentCode().length - 1));
                                break;
                            case 8:
                                _root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode().substring(0, 
                                _root.codeManager.getCurrentCode().length - 1));
                                break;
                            case 13:
                                // Enter
                                _root.codeManager.execute(_root.codeManager.getCurrentCode());
                                _root.codeManager.setCurrentCode("");
                                _root.codeManager.emptyDelay();
                                break;
                            case 27:
                                _root.codeManager.setCurrentCode("");
                                break;
                            case 126:
                                _root.codeManager.setCurrentCode("");
                                break;
                            case 35:
                        }
                    }
                }
            }
        }
        Key.addListener(keyListener);
    }
    // Creates the codes and adds them to the code list.
    public function initCodes() 
    {
        this.add(new Code('worldstar ws', function (command) 
        {
            var level = command[1];
            var bool = command[2];
            var number = command[3];
            switch (bool) 
            {
                case 'true':
                    _root.utils.setWorldStars(level, true, number);
                    _root.textManager.write(5, 'Stars from worlds have been updated.');
                    break;
                case 'false':
                    _root.utils.setWorldStars(level, false, number);
                    _root.textManager.write(5, 'Stars from worlds have been updated.');
                    break;
            }
        }));
        this.add(new Code('worldstarcoin wsc', function (command) 
        {
            var level = command[1];
            var bool = command[2];
            var number = command[3];
            switch (bool) 
            {
                case 'true':
                    _root.utils.setWorldStarCoins(level, true, number);
                    _root.textManager.write(5, 'Star Coins from worlds have been updated.');
                    break;
                case 'false':
                    _root.utils.setWorldStarCoins(level, false, number);
                    _root.textManager.write(5, 'Star Coins from worlds have been updated.');
                    break;
            }
        }));
        this.add(new Code('nozzle', function (command) 
        {
            var world = command[1];
            var nozzle = command[2];
            var bool = command[3];
            if (world === undefined || nozzle === undefined || bool === undefined) {
                _root.textManager.write(5, 'Invalid syntax.');
                return;
            }
            _root.utils.setWorldNozzle(world, nozzle, bool);
            _root.textManager.write(5, 'Saved nozzles from worlds have been updated.');
        }));
        this.add(new Code('doorwarp', function (command) 
        {
            _root.utils.warpDoor(command[1]);
        }));
        this.add(new Code('position pos', function (command) 
        {
            //_root.textManager.write(5, _root.utils.getPositionString() + ' | | '  + _root.Course.Char._x + ' ' + _root.Course.Char._y + ' | ' + _root.Course.FrontGFX._x + ' ' + _root.Course.FrontGFX._y + ' | ' +_root.Course.Char._X + ' ' + _root.Course.Char._Y);
            _root.textManager.write(5, _root.utils.getPositionString());
        }));
        this.add(new Code('latestwarpposition lwp', function (command) 
        {
            _root.textManager.write(5, _root.utils.getLevelName() + ' ' + _root.utils.getLatestWarpPositionString());
        }));
        this.add(new Code('levelname ln', function (command) 
        {
            _root.textManager.write(5, _root.utils.getLevelName() );
        }));
        this.add(new Code('individuallevel il', function (command) 
        {
            // Would be easier to maintain with OOP for worlds
            var IL = _root.codeManager.getIL();
            var level = command[1];
            var type = command[2];
            //var starnum = command[3];
            var starnum = parseInt(command[3]);
            var existingTypes = new Array();
            existingTypes.push('all', '100', 'starsfludd', 'stars', 'starfludd', 'star', 'starcoins', 
            'starcoin');
            if (existingTypes.indexOf(type) == - 1) {
                _root.textManager.write(5, 'Invalid IL command.');
                return;
            }
            var emptyArray = new Array();
            var mode = 'none';
            // World info
            var selectedWorld = _root.utils.getWorld(level);
            var levelTitle = selectedWorld.getName();
            var startingLevel = selectedWorld.getStartingLevel();
            var requiredStars = selectedWorld.getStars();
            var requiredStarCoins = selectedWorld.getStarCoins();
            var requiredFlags = selectedWorld.getFlags();
            var posX = selectedWorld.getCoordinates()[0];
            var posY = selectedWorld.getCoordinates()[1];
            _root.utils.setWorldStars(level, false);
            _root.utils.setWorldFlags(level, false);
            // Exception :If star coins do not matter in the goal,
            // we want them to already be collected
            if (type == 'starsfludd' || type == 'sf' || type == 'stars' || type == 'starfludd' || type == 'star') {
                _root.utils.setWorldStarCoins(level, true);
            }
            else {
                _root.utils.setWorldStarCoins(level, false);
            }
            // Exceptions
            setTimeout(function () 
            {
                if (level == 'bt3' || level == 'endgame' ) 
                {
                    _root.SaveFluddH = false;
                    _root.SaveFluddR = true;
                    _root.SaveFluddT = true;
                    _root.utils.setWorldNozzle('bt3', 'h', 'false');
                }
            }, 150);
            // Clean this code pls
            switch (type) 
            {
                case '100':
                case 'all':
                    _root.utils.setWorldNozzle(level, 'all', 'false');
                    IL.setRequiredStars(requiredStars);
                    IL.setRequiredStarCoins(requiredStarCoins);
                    IL.setRequiredFlags(requiredFlags);
                    mode = '100%';
                    break;
                case 'starsfludd':
                case 'sf':
                    _root.utils.setWorldNozzle(level, 'all', 'true');
                    IL.setRequiredStars(requiredStars);
                    IL.setRequiredStarCoins(emptyArray);
                    mode = 'All Stars with Fludd';
                    break;
                case 'stars':
                    _root.utils.setWorldNozzle(level, 'all', 'false');
                    IL.setRequiredStars(requiredStars);
                    IL.setRequiredStarCoins(emptyArray);
                    mode = 'Stars';
                    break;
                case 'starfludd':
                    if (!isNaN(starnum) && (starnum >= 1 && starnum <= 5)) 
                    {
                        _root.utils.setWorldNozzle(level, 'all', 'true');
                        var arr = new Array();
                        arr.push(requiredStars[starnum - 1]);
                        IL.setRequiredStars(arr);
                        IL.setRequiredStarCoins(emptyArray);
                        mode = 'Star ' + starnum + ' with Fludd';
                    }
                    break;
                case 'star':
                    if (!isNaN(starnum) && (starnum >= 1 && starnum <= 5)) 
                    {
                        _root.utils.setWorldNozzle(level, 'all', 'false');
                        var arr = new Array();
                        arr.push(requiredStars[starnum - 1]);
                        IL.setRequiredStars(arr);
                        IL.setRequiredStarCoins(emptyArray);
                        mode = 'Star ' + starnum;
                    }
                    break;
                case 'starcoins':
                case 'starcoin':
                    _root.utils.setWorldNozzle(level, 'all', 'false');
                    IL.setRequiredStars(emptyArray);
                    IL.setRequiredStarCoins(requiredStarCoins);
                    mode = 'Star Coins';
                    break;
                default:
                    mode = 'None';
            }
            // Water recharge
            _root.WaterAmount = _root.TotalWater;
            _root.textManager.write(5, 'Current IL : ' + selectedWorld.getFullName() + ' | ' + mode);
            _root.utils.warp(startingLevel, posX, posY, posX, posY);
            IL.start(level);
        }));
        this.add(new Code('warp w', function (command) 
        {
            var level = command[1];
            var param_1 = command[2];
            var param_2 = command[3];
            var param_3 = command[4];
            var param_4 = command[5];
            if (level != undefined) 
            {
                if (param_1 == undefined) {
                    param_1 = 0;
                }
                if (param_2 == undefined) {
                    param_2 = 0;
                }
                if (param_3 == undefined) {
                    param_3 = 0;
                }
                if (param_4 == undefined) {
                    param_4 = 0;
                }
                _root.utils.warp(command[1], param_1, param_2, param_3, param_4);
                _root.textManager.write(5, 'Player has been warped to ' + command[1] + '.');
            }
        }));
        this.add(new Code('file f', function (command) 
        {
            switch (command[1]) 
            {
                case 'complete':
                case '100':
                    _root.utils.setStars(true);
                    _root.utils.setStarCoins(true);
                    _root.utils.setBowserKeys(true);
                    _root.utils.setFluddArray(true);
                    _root.textManager.write(5, 'Current file is now a 100% file.');
                    break;
                case 'essentials':
                    _root.utils.setStars(false);
                    _root.utils.setStarCoins(false);
                    _root.utils.setBowserKeys(true);
                    _root.utils.setFluddArray(false);
                    _root.Star[39] = true;
                    _root.Star[41] = true;
                    _root.Star[50] = true;
                    _root.Star[51] = true;
                    _root.Star[36] = true;
                    _root.CalculateStars();
                    _root.textManager.write(5, 'Current file now has every storyline star.');
                    break;
                case 'empty':
                    _root.utils.setStars(false);
                    _root.utils.setStarCoins(false);
                    _root.utils.setBowserKeys(false);
                    _root.utils.setFluddArray(false);
                    _root.textManager.write(5, 'Current file has been emptied.');
                    break;
            }
        }));
        this.add(new Code('timer t', function (command) 
        {
            switch (command[1]) 
            {
                case 'start':
                    _root.timer.start();
                    _root.textManager.write(5, 'Timer has been started.');
                    break;
                case 'stop':
                    _root.timer.stop();
                    _root.textManager.write(5, 'Timer has been stopped.');
                    break;
                case 'reset':
                    _root.timer.reset();
                    _root.textManager.write(5, 'Timer has been reset. It will start on the next loading zone.');
                    break;
            }
        }));
        this.add(new Code('bowserkey bk', function (command) 
        {
            if (command[2] == 'true') 
            {
                _root.utils.setBowserKey(int (command[1]), true);
                _root.textManager.write(5, 'BowserKey #' + command[1] + ' has been set to true.');
            }
            else if (command[2] == 'false') 
            {
                _root.utils.setBowserKey(int (command[1]), false);
                _root.textManager.write(5, 'BowserKey #' + command[1] + ' has been set to false.');
            }
            else {
                _root.utils.setBowserKey(int (command[1]));
            }
        }));
        this.add(new Code('star s', function (command) 
        {
            if (command[2] == 'true') 
            {
                _root.utils.setStar(command[1], true);
                _root.textManager.write(5, 'Star #' + command[1] + ' has been set to true.');
            }
            else if (command[2] == 'false') 
            {
                _root.utils.setStar(command[1], false);
                _root.textManager.write(5, 'Star #' + command[1] + ' has been set to false.');
            }
            else {
                _root.utils.setStar(command[1]);
            }
        }));
        this.add(new Code('starcoin sc', function (command) 
        {
            if (command[2] == 'true') 
            {
                _root.utils.setStarCoin(command[1], true);
                _root.textManager.write(5, 'StarCoin #' + command[1] + ' has been set to true.');
            }
            else if (command[2] == 'false') 
            {
                _root.utils.setStarCoin(command[1], false);
                _root.textManager.write(5, 'StarCoin #' + command[1] + ' has been set to false.');
            }
            else {
                _root.utils.setStarCoin(command[1]);
            }
        }));
        this.add(new Code('fludd', function (command) 
        {
            switch (command[1]) 
            {
                case 'all':
                    _root.SaveFluddH = true;
                    _root.SaveFluddR = true;
                    _root.SaveFluddT = true;
                    _root.textManager.write(5, 'All FLUDD nozzles have been given to Mario.');
                    break;
                case 'H':
                case 'h':
                case 'Hover':
                case 'hover':
                    _root.SaveFluddH = !_root.SaveFluddH;
                    _root.textManager.write(5, 'Hover FLUDD has been set to ' + _root.SaveFluddH + '.');
                    break;
                case 'R':
                case 'r':
                case 'Rocket':
                case 'rocket':
                    _root.SaveFluddR = !_root.SaveFluddR;
                    _root.textManager.write(5, 'Rocket FLUDD has been set to ' + _root.SaveFluddR + '.');
                    break;
                case 'T':
                case 't':
                case 'Turbo':
                case 'turbo':
                    _root.SaveFluddT = !_root.SaveFluddT;
                    _root.textManager.write(5, 'Turbo FLUDD has been set to ' + _root.SaveFluddT + '.');
                    break;
                case 'none':
                    _root.SaveFluddH = false;
                    _root.SaveFluddR = false;
                    _root.SaveFluddT = false;
                    _root.Fluddpow = "";
                    _root.textManager.write(5, 'All FLUDD nozzles have been removed from Mario.');
                    break;
            }
        }));
        this.add(new Code('lives', function (command) 
        {
            if (command[1] == 'infinite') {
                _root.CharLives = NaN;
                _root.textManager.write(5, 'Lives are now infinite.');
            }
            else 
            {
                _root.CharLives = Number(command[1]);
                _root.textManager.write(5, 'Lives have been set to ' + _root.CharLives + '.');
            }
        }));
        this.add(new Code('water', function (command) 
        {
            if (command[1] == 'refill') 
            {
                _root.WaterAmount = _root.TotalWater;
                _root.textManager.write(5, 'Water has been refilled.');
            }
            else if (command[1] == 'half') {
                _root.WaterAmount = 5000;
                _root.textManager.write(5, 'Water has been set to half.');
            }
            else if (command[1] == 'empty') {
                _root.WaterAmount = 0;
                _root.textManager.write(5, 'Water container is now empty.');
            }
            else 
            {
                _root.WaterAmount = command[1];
                _root.textManager.write(5, 'Water has been set to ' + _root.WaterAmount + '.');
            }
        }));
        this.add(new Code('health', function (command) 
        {
            if (command[1] == 'refill') {
                _root.CharHP = 8;
                _root.textManager.write(5, 'Health has been refilled.');
            }
            else if (command[1] == 'empty') {
                _root.CharHP = 1;
                _root.textManager.write(5, 'Health has been set to 1.');
            }
            else if (command[1] == 'death') {
                _root.CharHP = 0;
                _root.textManager.write(5, 'Death has been provoked.');
            }
            else 
            {
                _root.CharHP = command[1];
                _root.textManager.write(5, 'Health has been set to ' + _root.CharHP + '.');
            }
        }));
        this.add(new Code('char', function (command) 
        {
            switch (command[1]) 
            {
                case 'mario' :
                case 'Mario':
                    _root.CurrentPlayer = 'Mario';
                    _root.textManager.write(5, 'Character switched to Mario.');
                    break;
                case 'luigi' :
                case 'Luigi':
                    _root.CurrentPlayer = 'Luigi';
                    _root.textManager.write(5, 'Character switched to Luigi.');
                    break;
                case 'toggle' :
                    if (_root.CurrentPlayer == "Mario") 
                    {
                        _root.CurrentPlayer = "Luigi";
                        _root.textManager.write(5, 'Character switched to Luigi.');
                    }
                    else 
                    {
                        _root.CurrentPlayer = "Mario";
                        _root.textManager.write(5, 'Character switched to Mario.');
                    }
                    break;
            }
        }));
        this.add(new Code('last', function (command) 
        {
            _root.codeManager.executeLastCode();
        }));
        this.add(new Code('cap', function (command) 
        {
            _root.utils.setCap(command[1], command[2]);
            _root.textManager.write(5, 'Current cap updated.');
        }));
        this.add(new Code('betaquest bq', function (command) 
        {
            if (command[1] == 'stop') {
                _root.betaQuest.stop();
            }
            else if (command[1] == 'start') {
                _root.betaQuest.start();
            }
        }));
        this.add(new Code('forcewarp fw', function (command) 
        {
            _root.betaQuest.stop();
            // Copy of the warp code, might clean later
            var level = command[1];
            var param_1 = command[2];
            var param_2 = command[3];
            var param_3 = command[4];
            var param_4 = command[5];
            if (level != undefined) 
            {
                if (param_1 == undefined) {
                    param_1 = 0;
                }
                if (param_2 == undefined) {
                    param_2 = 0;
                }
                if (param_3 == undefined) {
                    param_3 = 0;
                }
                if (param_4 == undefined) {
                    param_4 = 0;
                }
                _root.utils.warp(command[1], param_1, param_2, param_3, param_4);
                _root.textManager.write(5, 'Player has been warped to ' + command[1] + '.');
            }
            _root.betaQuest.start();
        }));
    }
    // Adds a new code to the code list.
    public function add(code) 
    {
        this.codeList.push(code);
    }
    // Executes a specific code.
    public function execute(code) 
    {
        _root.textManager.write(5, '');
        var i = 0;
        for (i = 0; i < this.codeList.length; i = i + 1) {
            this.codeList[i].execute(code);
        }
        // To avoid infinite loops/recursion, we prevent setting the last code
        // if the last command executed was 'last'.
        if (code != 'last') {
            this.lastCode = code;
        }
        _root.PauseGame = false;
    }
    // Executes the last command that was executed by the player.
    public function executeLastCode() 
    {
        this.execute(this.lastCode);
    }
    // Defines the code that happens on each frame.
    public function onEachFrame() 
    {
        _root.textManager.write(2, this.currentCode);
        if (_root.KeySlash()) 
        {
            this.resetDelay();
            _root.textManager.write(5, 'Enter your command!');
            _root.PauseGame = true;
        }
        else if (this.delay > 0) 
        {
            this.reduceDelay();
            if (this.delay <= 0) 
            {
                this.currentCode = "";
                // Delay equals 0, we cancel the PauseGame effect.
                _root.PauseGame = false;
            }
        }
    }
    // Getters & setters
    public function getCurrentCode() 
    {
        return this.currentCode;
    }
    public function setCurrentCode(value) 
    {
        this.currentCode = value;
    }
    public function getInput() 
    {
        return this.input;
    }
    public function setInput(value) 
    {
        this.input = value;
    }
    public function getDelay() 
    {
        return this.delay;
    }
    public function reduceDelay() 
    {
        this.delay = this.delay - 1;
        if (this.delay < 0) {
            this.delay = 0;
        }
    }
    public function resetDelay() 
    {
        this.delay = 300;
    }
    public function emptyDelay() 
    {
        this.delay = 0;
    }
    public function getIL() 
    {
        return this.il;
    }
}
// Class that manages the start and end of individual levels.
class IndividualLevel 
{
    private var level;
    private var requiredStars;
    private var requiredStarCoins;
    private var requiredFlags;
    public function IndividualLevel() 
    {
        this.stop();
        this.requiredStars = new Array();
        this.requiredStarCoins = new Array();
    }
    // Getter for the required stars.
    public function isRequiredStar(index) 
    {
        return (this.requiredStars.indexOf(index) != - 1);
    }
    // Getter for the required star coins.
    public function isRequiredStarCoins(index) 
    {
        return (this.requiredStarCoins.indexOf(index) != - 1);
    }
    // Setter for the required stars.
    public function setRequiredStars(array) 
    {
        this.requiredStars = array.slice();
    }
    // Setter for the required star coins.
    public function setRequiredStarCoins(array) 
    {
        this.requiredStarCoins = array.slice();
    }
    // Setter for the required flags.
    public function setRequiredFlags(array) 
    {
        this.requiredFlags = array.slice();
    }
    public function check() 
    {
        var bool = true;
        var i = 0;
        var j = 0;
        for (i = 0; i < this.requiredStars.length; i++) 
        {
            var index = this.requiredStars[i];
            if (_root.utils.getStar(index) === false) {
                bool = false;
                break;
            }
        }
        for (j = 0; j < this.requiredStarCoins.length; j++) 
        {
            var index = this.requiredStarCoins[j];
            if (_root.utils.getStarCoin(index) === false) {
                bool = false;
                break;
            }
        }
        return bool;
    }
    public function onStarCollected() 
    {
        if (this.check() === true) {
            this.stop();
        }
    }
    public function start(level) 
    {
        this.level = level;
        setTimeout(function () 
        {
            _root.timer.reset();
        }, 200);
    }
    public function stop() 
    {
        this.level = 'none';
        _root.timer.stop();
    }
    public function isGoing() 
    {
        return (this.level != 'none');
    }
}
// Class that manages the warps for Beta Quest mode.
class BetaQuest 
{
    private var started;
    private var warpList;
    private var newWarpList;
    public function BetaQuest() 
    {
        this.started = true;
        this.warpList = new Array();
        this.newWarpList = new Array();
        this.initWarpList();
        this.newWarpList = this.shuffle(this.warpList);
    }
    private function initWarpList() 
    {
        this.warpList.push("1-1", "1-2", "1-3", "1-4", "1-5", "2-1", "2-2", "2-2A", "2-3", "2-4", "2-5", 
        "3-1", "3-2", "3-3", "3-4", "3-5", "3-6", "3-7", "3-8", "4-1", "4-2", "4-3", "4-4", "4-5", "4-6", 
        "4-7", "4-8", "4-9", "4-10", "4-11", "5-1", "5-2", "5-3", "5-4", "5-5", "5-6", "5-7", "5-8", "5-9", 
        "6-1", "6-2", "6-3", "6-4", "6-5", "6-6", "6-1-2", "7-1", "7-2", "7-3", "7-4", "7-5", "7-6", "8-1", 
        "8-2", "8-3", "8-4", "8-5", "8-6", "8-7", "8-8", "8-9", "8-10", "8-10-b", "8-11", "8-12", "8-13", 
        "8-14", "8-15", "8-16", "BC-1", "BC-2", "BC-3", "8-E1-1", "8-E1-1-2", "8-E1-2", "8-E1-2-2", "8-E3-1", 
        "8-E3-2", "8-E2-1", "8-E2-2", "8-E5-1", "8-E5-2", "8-E5-3", "8-E5-4", "9-01", "9-02", "9-03", 
        "9-03-D", "9-04", "9-05", "9-06", "9-07", "9-08", "9-10", "9-11", "M1-1", "M1-2", "M2-1", "M2-2", 
        "M3-3", "C4-SC1", "C-1", "C-2", "C-2-2", "C-3", "C-3-2", "C-4", "C-5", "C-6", "C-O", "C-7", "C-8", 
        "C-4H", "C-9", "C-10", "C-11", "C-12", "C-13", "K-1", "K-2" );
    }
    private function shuffle(array) 
    {
        var newArray = array.slice();
        newArray.sort(this.randomSort);
        return newArray;
    }
    private function randomSort(a, b) 
    {
        if (Math.random() < 0.5) {
            return - 1;
        }
        else {
            return 1;
        }
    }
    private function indexOf(array, value) 
    {
        var index = - 1;
        var i = 0;
        for (i = 0; i < array.length; i++) {
            if (array[i] === value) {
                return i;
            }
        }
    }
    public function getCorrespondingArea(warpArea) 
    {
        var index = this.indexOf(this.warpList, warpArea);
        _root.textManager.write(5, this.indexOf(this.warpList, warpArea));
        //var index = 2;
        var newWarp;
        if (index != undefined && index != - 1 && this.started === true) {
            newWarp = this.newWarpList[index];
        }
        else {
            newWarp = warpArea;
        }
        _root.textManager.write(3, 'Warp area ' + warpArea + ' | New warp : ' + newWarp);
        return newWarp;
    }
    public function getNewWarpList() 
    {
        return this.newWarpList;
    }
    public function start() 
    {
        this.started = true;
    }
    public function stop() 
    {
        this.started = false;
    }
}
// KoopaShell
setCollision = function ()
{
    _root.Course.BackGFX._visible = _root.collision.back;
    _root.Course.FrontGFX._visible = _root.collision.front;
    _root.Course.Platforms.swapDepths(500);
    _root.Course.Platforms._visible = _root.collision.plats;
    _root.Course.BPlatforms.swapDepths(501);
    _root.Course.BPlatforms._visible = _root.collision.plats;
    _root.Course.Lava.swapDepths(502);
    _root.Course.Lava._visible = _root.collision.plats;
    _root.Course.Enemyhurt.swapDepths(503);
    _root.Course.Enemyhurt._visible = _root.collision.hurt;
};
trace("installed");
_root.collision = {
    front : true, back : true, plats : false, hurt : false, misc : false
};
//_root.stack = ["out","def char","lda _root.CurrentPlayer","ldd Mario","ifn","jit 2","ldd Luigi","sto _root.CurrentPlayer","ret","def level","sto temp","ldd StarIn","aarg","lda temp","aarg","ldd 0","num","aarg","aarg","aarg","aarg","ldd true","bool","aarg","ext changecourse","carg","ret","def 411","lda _root.SaveFluddH","not","sto _root.SaveFluddH","ret","def 412","lda _root.SaveFluddR","not","sto _root.SaveFluddR","ret","def 413","lda _root.SaveFluddT","not","sto _root.SaveFluddT","ret"];
_root.stack = ["out", "def level", "carg", "sto temp", "aarg StarIn", "lda temp", "aarg", "num 0", "aarg", "aarg", "aarg", "aarg", "bool true", "aarg", "ext changecourse", "carg", "ret", "def 411", "lda _root.SaveFluddH", "not", "sto _root.SaveFluddH", "ret", "def 412", "lda _root.SaveFluddR", "not", "sto _root.SaveFluddR", "ret", "def 413", "lda _root.SaveFluddT", "not", "sto _root.SaveFluddT", "ret"];
_root.acc = "";
_root.prevAcc = "";
_root.boolAcc = false;
_root.arrAcc = [];
_root.doTick = true;
_root.programCounter = 0;
_root.readVar = 0;
_root.funcs = {};
_root.mode = "exec";
_root.returnAddress = 0;
_root.curFunc = "";
_root.queue = [];
_root.extArgs = [];
_root.cycleAcc = function (data)
{
    _root.prevAcc = _root.acc;
    _root.acc = data;
};
_root.interpret = function (command, data)
{
    if (!data || data == command) {
        data = _root.prevAcc;
        castData = _root.acc;
    }
    else {
        castData = data;
        data = _root.acc;
    }
    trace(command + ", " + castData);
    switch (command)
    {
        case "def":
            _root.funcs[castData] = [];
            _root.mode = "func";
            break;
        case "ret":
            trace("ret to: " + _root.returnAddress);
            _root.readVar = 0;
            _root.programCounter = _root.returnAddress;
            break;
        case "lda":
            if (_root.mode != "arr") {
                _root.cycleAcc(eval(castData));
            }
            else {
                _root.cycleAcc(_root.arrAcc[castData]);
            }
            break;
        case "sto":
            if (isNaN(data) || _root.mode != "arr") {
                set(castData, data);
            }
            else {
                _root.arrAcc[castData] = data;
            }
            break;
        case "ife":
            _root.boolAcc = castData == data;
            break;
        case "ifn":
            _root.boolAcc = castData != data;
            break;
        case "ldd":
            _root.cycleAcc(castData);
            break;
        case "out":
            trace(castData);
            _root.out = castData;
            break;
        case "num":
            _root.cycleAcc(Number(castData));
            break;
        case "str":
            _root.cycleAcc(String(castData));
            break;
        case "bool":
            _root.cycleAcc(castData != "false");
            break;
        case "add":
            if (isNaN(castData)) {
                _root.cycleAcc(data + castData);
            }
            else {
                _root.cycleAcc(data + Number(castData));
            }
            break;
        case "sub":
            _root.cycleAcc(data - castData);
            break;
        case "prod":
            _root.cycleAcc(data * castData);
            break;
        case "div":
            _root.cycleAcc(data  / castData);
            break;
        case "mod":
            _root.cycleAcc(data % castData);
            break;
        case "pow":
            _root.cycleAcc(Math.pow(data, castData));
            break;
        case "jit":
            if (_root.boolAcc) 
            {
                _root.programCounter = _root.programCounter + Number(castData) - 1;
                trace("Jumping to " + _root.programCounter);
            }
            break;
        case "aarg":
            _root.extArgs.push(castData);
            break;
        case "carg":
            _root.extArgs = [];
            break;
        case "ext":
            temp = eval(castData).apply(null, _root.extArgs);
            if (temp) {
                _root.cycleAcc(temp);
            }
            break;
        case "map":
            set("_root." + castData, function () 
            {
                _root.newData([castData]);
                return _root.acc;
            });
            break;
        case "not":
            _root.cycleAcc(!castData);
            break;
        case "eval":
            _root.cycleAcc(eval(castData));
            break;
        case "arr":
            _root.arrAcc = eval(castData).join(",").split(",");
            _root.modeBak = _root.mode;
            _root.mode = "arr";
            break;
        case "carr":
            set(castData, _root.arrAcc);
            _root.mode = _root.modeBak;
            break;
        case "ldsr":
            loader = new LoadVars();
            loader.onData = function (content) 
            {
                if (content != undefined) 
                {
                    commands = content.split("\n");
                    j = 0;
                    while (j < commands.length) {
                        commands[j] = commands[j].substring(0, commands[j].length - 1);
                        j++;
                    }
                    _root.newData(commands);
                }
                else {
                    trace("Script load failed");
                }
            };
            loader.load(castData);
            break;
        case "loop":
            _root.cycleAcc(setInterval(function () 
            {
                _root.newData([castData]);
                return _root.acc;
            },
            31.25 * Number(castData)));
            break;
        case "cloop":
            clearInterval(castData);
            break;
        case undefined:
            panic();
            break;
        default:
            _root.cycleAcc(castData);
            if (_root.funcs[command] != undefined) 
            {
                _root.curFunc = _root.funcs[command];
                trace("curFunc: " + _root.curFunc);
                _root.readVar = 1;
                _root.returnAddress = _root.programCounter;
                _root.programCounter = - 1;
                break;
            }
            trace("inval: " + command + " " + castData);
            break;
    }
};
_root.cpu = function ()
{
    switch (_root.readVar)
    {
        case 0:
            _root.readLocation = _root.stack;
            break;
        case 1:
            _root.readLocation = _root.curFunc;
            break;
        case 2:
            panic();
    }
    _root.toExecute = String(_root.readLocation[_root.programCounter]);
    if (_root.mode == "func")
    {
        _root.funcs[_root.data].push(_root.toExecute);
        if (_root.toExecute == "ret") {
            _root.mode = "exec";
        }
    }
    else
    {
        _root.command = _root.toExecute.substring(0, _root.toExecute.indexOf(" ") == - 1 ? _root.toExecute.length : _root.toExecute.indexOf(" "));
        _root.data = _root.toExecute.substring(_root.toExecute.indexOf(" ") + 1);
        _root.interpret(_root.command, _root.data);
    }
    _root.programCounter++;
    if (_root.programCounter >= _root.readLocation.length)
    {
        trace("panic: " + _root.programCounter + ", " + _root.readLocation.length);
        panic();
        _root.doTick = false;
        if (_root.queue.length != 0) {
            _root.newData(_root.queue);
            _root.queue = [];
        }
    }
};
_root.tickCpu = function ()
{
    if (_root.doTick) {
        _root.cpu();
    }
};
_root.newData = function (arr)
{
    if (_root.doTick)
    {
        i = 0;
        while (i < arr.length) {
            if (arr[i] == "clr") {
                _root.stack = [];
                _root.readVar = 0;
            }
            _root.stack.push(arr[i]);
            i++;
        }
    }
    else {
        _root.stack = arr;
        _root.doTick = true;
        _root.programCounter = 0;
    }
};
_root.allowedKeys = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_:/.,\\\'%;*+\" [](){}<>=#~";
_root.cmd = "";
_root.runCmd = function (data)
{
    _root.newData([data]);
    _root.koopashellInput = false;
};
var keyListener = new Object();
keyListener.onKeyDown = function ()
{
    if (_root.koopashellInput)
    {
        trace(chr(Key.getAscii()));
        if (_root.allowedKeys.indexOf(chr(Key.getAscii())) != - 1) {
            _root.cmd = _root.cmd + chr(Key.getAscii());
        }
        else 
        {
            switch (Key.getAscii()) 
            {
                case 127:
                    _root.cmd = _root.cmd.substring(0, _root.cmd.length - 1);
                    break;
                case 8:
                    _root.cmd = _root.cmd.substring(0, _root.cmd.length - 1);
                    break;
                case 13:
                    _root.runCmd(_root.cmd);
                    _root.cmd = "";
                    break;
                case 27:
                    _root.cmd = "";
                    break;
                case 126:
                    _root.cmd = "";
                    break;
                case 35:
                    trace(_root.cmd);
            }
        }
    }
};
Key.addListener(keyListener);
NewgroundsAPI.connectMovie(8160);
_root.ILTimerCurrentMenu = 0;
_root.ILTimerMenuDelay = 0;
_root.LatestCode = 0;
_root.Save_Star = new Array();
_root.Save_StarCoin = new Array();
_root.Save_FluddArray = new Array();
_root.timer = new Timer();
_root.timer.start();
_root.textManager = new TextManager();
_root.utils = new Utils();
_root.codeManager = new CodeManager();
_root.betaQuest = new BetaQuest();
_root.event = new Event();
