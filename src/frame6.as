// This code overwrites the functions written in frame3_3, as editing the file is impossible in FFDec
_root.gotoCourseSelect = function(level) {
    _root.Playinglevel = level;
    _root.RemoveCourse();
    _root.Restartcoins();
    _root.gotoAndStop("CourseSelect");
    _root.Transition.removeMovieClip(_root.Transition);
    _root.attachMovie("Fromwhite", "Transition", _root.getNextHighestDepth(), {_x: _root.screensizeX / 2, _y: _root.screensizeY / 2});
    _root.bgsong.stop();
    _root.bgsong = new Sound(this);
    _root.bgsong.attachSound("Star Swish");
    _root.bgsong.start(0, 1);
    _root.bgsong.setVolume(_root.BgVolume);

    // On course select
    _root.event.onCourseSelect();
};
_root.gotoMiniCourseSelect = function(level) {
    _root.Playinglevelnum = level;
    _root.Playinglevel = level + 8;
    _root.RemoveCourse();
    _root.Restartcoins();
    _root.gotoAndStop("MiniCourseSelect");
    _root.Transition.removeMovieClip(_root.Transition);
    _root.attachMovie("Fromwhite", "Transition", _root.getNextHighestDepth(), {_x: _root.screensizeX / 2, _y: _root.screensizeY / 2});
    _root.bgsong.stop();
    _root.bgsong = new Sound(this);
    _root.bgsong.attachSound("Star Swish");
    _root.bgsong.start(0, 1);
    _root.bgsong.setVolume(_root.BgVolume);

    // On mini course select
    _root.event.onMiniCourseSelect();
};
_root.changecourse = function(transition, level, a, b, c, d, e, isCommand) {
    _root.RemoveCourse();
    _root.gotoAndStop("Courseframe");
    if (e == undefined) {
        e = false;
    }
    _root.StartChar(level, a, b, c, d, 100, _root.CurrentPlayer, _root.Fluddpow, transition, e, isCommand);
    _root.onEnterFrame = function() {
        _root.CharCode();
    };
    e = false;
};
// Class that manages the warps for Beta Quest mode.
class BetaQuest {

    private var seed;
    private var rngValue;
    private var started;
    private var warpList;
    private var newWarpList;

    // Constructor of the Beta Quest class.
    public function BetaQuest() {

        this.seed = undefined;
        this.rngValue = undefined;
        this.started = false;
        this.warpList = new Array();
        this.newWarpList = new Array();
        this.initWarpList();

        this.generateWarpList();
    }

    // Generates a new warp list.
    private function generateWarpList() {
        this.newWarpList = this.shuffle(this.warpList);
    }

    // Inits the warp list, with a list of all the different warps.
    private function initWarpList() {
        this.warpList.push(

            // Course warps
            "1-1", "1-2", "1-3", "1-4", "1-5", "2-1", "2-2", "2-2A", "2-3", "2-4", "2-5", "3-1", "3-2", "3-3", "3-4", "3-5", "3-6", "3-7", "3-8", "4-1", "4-2", "4-3", "4-4", "4-5", "4-6", "4-7", "4-8", "4-9", "4-10", "4-11", "5-1", "5-2", "5-3", "5-4", "5-5", "5-6", "5-7", "5-8", "5-9", "6-1", "6-2", "6-3", "6-4", "6-5", "6-6", "6-1-2", "7-1", "7-2", "7-3", "7-4", "7-5", "7-6",

            // Bowser 3 warps
            "8-1", "8-2", "8-3", "8-4", "8-5", "8-6", "8-7", "8-8", "8-9", "8-10", "8-10-b", "8-11", "8-12", "8-13", "8-14", "8-15", "8-16", "BC-1", "BC-2", "BC-3",

            // Mini-course & CSS warps
            "8-E1-1", "8-E1-1-2", "8-E1-2", "8-E1-2-2", "8-E3-1", "8-E3-2", "8-E2-1", "8-E2-2", "8-E5-1", "8-E5-2", "8-E5-3", "8-E5-4", "9-01", "9-02", "9-03", "9-03-D", "9-03-2", "9-04", "9-05", "9-06", "9-07", "9-08", "9-10", "9-10-2", "9-11", "M1-1", "M1-2", "M2-1", "M2-2", "M3-3", "K-1", "K-2",

            // Castle warps
            "C-1", "C-2", "C-2-2", "C-3", "C-3-2", "C-4", "C-5", "C-6", "C-O", "C-7", "C-8", "C-4H", "C-9", "C-10", "C-11", "C-12", "C-13", "16SCPrize", "48SCPrize", "Mush-room", "Castle"

            );
    }

    // Shuffles an array.
    private function shuffle(array) {
        var newArray = array.slice();
        newArray.sort(this.randomSort);
        return newArray;
    }

    // Method that simulates a 1/2 chance aiming to sort arrays.
    private function randomSort(a, b) {

        var self = _root.betaQuest;

        var value;
        if (self.isSeeded())
            value = self.RNG();
        else
            value = Math.random();

        if (value < 0.5)
            return -1;
        else
            return 1;
    }

    // Method that generates a random number, based on a seed.
    private function randomSeed(seed) {
        return ((seed * 1664525) + 1013904223) % 4294967296;
    }

    // RNG function.
    private function RNG() {
        this.rngValue = this.randomSeed(this.rngValue);
        return this.rngValue / 4294967296;
    }

    // Returns the index of an element in an array.
    private function indexOf(array, value) {
        var i = 0;

        for (i = 0; i < array.length; i++) {
            if (array[i] === value) {
                return i;
            }
        }

        return -1;
    }

    // Returns the new zone the player will be warped in.
    public function getCorrespondingArea(warpArea) {
        var index = this.indexOf(this.warpList, warpArea);
        //_root.textManager.send('message', this.indexOf(this.warpList, warpArea));
        //var index = 2;
        var newWarp;

        if ((index != undefined && index != -1) && (this.started === true)) {
            newWarp = this.newWarpList[index];
        } else {
            newWarp = warpArea;
        }

        //_root.textManager.send('message', 'Warp area ' + warpArea + ' | New warp : ' + newWarp);

        var warpCoordinates = this.getWarpCoordinates(newWarp);

        return [warpCoordinates.level, warpCoordinates.x, warpCoordinates.y];
    }


    // Returns special warp coordinates, in case 0,0 isn't the ideal position.
    public function getWarpCoordinates(warp) {

        var level = warp;
        var x = 0;
        var y = 0;

        switch (warp) {
            case "16SCPrize":
                level = "C-4-SC1";
                x = 0;
                y = 0;
                break;
            case "48SCPrize":
                level = "C-4-SC1";
                x = 0;
                y = -260;
                break;
            case "Mush-room":
                level = "C-4-SC1";
                x = -674;
                y = -60;
                break;
            case "8-10":
                x = -290;
                y = 0;
                break;
            case "8-10-b":
                x = 500;
                y = -10;
                break;
            case "6-1-2":
                x = 2171;
                y = -163;
                break;
            case "9-07":
                _root.BossCheckpoint = false;
                x = 0;
                y = 0;
                break;
            case "M1-2":
                x = -1465;
                y = -320;
                break;
            case "4-5":
                x = -1300;
                y = 52.4;
                break;
            case "8-E5-1":
                x = -1693;
                y = -60;
                break;
            case "8-E5-2":
                x = 1115;
                y = 127;
                break;
            case "9-11":
                x = -560;
                y = -160;
                break;
            case "9-03-2":
                x = -270;
                y = -990;
                break;
            default:
                break;
        }

        return {level: level, x: x, y: y}
    }

    // Returns the new, updated, warp list.
    public function getNewWarpList() {
        return this.newWarpList;
    }

    // Activates Beta Quest.
    public function start(seed) {
        if (seed != undefined && !isNaN(Number(seed))) {
            this.setSeed(seed);
        } else {
            this.setSeed(Math.random() * 4294967296);
        }

        this.started = true;
        this.generateWarpList();
        _root.utils.warp('C-1');
        _root.timer.reset();
        _root.timer.start();
    }

    // Re-activates Beta Quest.
    public function restart(seed) {
        this.started = true;
    }

    // Deactivates Beta Quest.
    public function stop() {
        this.started = false;
    }

    // Defines a new seed.
    public function setSeed(s) {
        this.seed = s;
        this.rngValue = this.seed;
    }

    // Getter of the seed.
    public function getSeed() {
        return this.seed;
    }

    // Returns if the current BQ is seeded or not.
    public function isSeeded() {
        return (this.seed != undefined)
    }

    // Returns if BetaQuest has been started.
    public function isStarted() {
        return this.started;
    }

}
// Class that defines a code and its effects.
class Code {

    // Identifier of the code
    private var indexList;

    // Function sent as a callback that will be executed
    private var func;

    // Constructor
    public function Code(index, func) {
        this.indexList = index.split(' ');
        this.func = func;
    }

    // Executes the code, if the index is valid.
    public function execute(command) {

        var i = 0;
        var splitCommand = command.split(' ');

        for (i = 0; i < this.indexList.length; i++) {
            if (this.indexList[i] == splitCommand[0]) {
                this.func(splitCommand);
                break;
            }
        }
    }

    // Executes the code, no matter what.
    // (Should not be working)
    private function executeImmediate() {
        this.func();
    }

}
// Class that manages how codes behave overall.
class CodeManager {

    private var codeList;
    private var delay;
    private var input;
    private var currentCode;
    private var lastCode;

    private var il;

    // Constructor.
    public function CodeManager() {
        this.codeList = new Array();
        this.input = true;
        this.currentCode = "";
        this.lastCode = "";
        this.delay = 0;

        this.il = new IndividualLevel();

        this.initKeyListener();
    }

    // Creates the key listener.
    public function initKeyListener() {
        var allowedKeys = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_:/.,\\\'%;*+\" [](){}=$";
        var keyListener = new Object();
        keyListener.onKeyDown = function() {
            if (_root.codeManager.delay > 0) {
                if (_root.codeManager.getInput()) {
                    if (allowedKeys.indexOf(chr(Key.getAscii())) != -1) {
                        _root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode() + chr(Key.getAscii()));
                        _root.codeManager.resetDelay();
                    } else {
                        switch (Key.getAscii()) {
                            case 127:
                                _root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode().substring(0, _root.codeManager.getCurrentCode().length - 1));
                                break;
                            case 8:
                                _root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode().substring(0, _root.codeManager.getCurrentCode().length - 1));
                                break;
                            case 13: // Enter
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

            _root.hotkeyManager.execute(chr(Key.getAscii()));
        }
        Key.addListener(keyListener);
    }

    // Adds a new code to the code list.
    public function add(code) {
        this.codeList.push(code);
    }

    // Executes a specific code.
    public function execute(command) {
        //_root.textManager.send('message', '');
        //_root.textManager.send('message', command);
        var i = 0;
        for (i = 0; i < this.codeList.length; i = i + 1) {
            this.codeList[i].execute(command);
        }
        // To avoid infinite loops/recursion, we prevent setting the last code
        // if the last command executed was 'last'.
        // Doesn't work if the 'last' command gets an argument.

        var splitCmd = command.split(' ');

        if (splitCmd[0] != 'last' && splitCmd[0] != 'l') {
            this.lastCode = command;
        }
        _root.PauseGame = false;
    }

    // Executes the last command that was executed by the player.
    public function executeLastCode() {
        this.execute(this.lastCode);
    }

    // Defines the code that happens on each frame.
    public function onEachFrame() {
        _root.textManager.send('code', this.currentCode);

        if (_root.KeySlash()) {
            this.resetDelay();
            _root.textManager.send('message', 'Enter your command!');
            _root.PauseGame = true;
        } else if (this.delay > 0) {
            this.reduceDelay();
            if (this.delay <= 0) {
                this.currentCode = "";
                // Delay equals 0, we cancel the PauseGame effect.
                _root.textManager.send('message', "");
                _root.PauseGame = false;
            }
        }
    }


    // Getters & setters

    public function getCurrentCode() {
        return this.currentCode;
    }

    public function setCurrentCode(value) {
        this.currentCode = value;
    }

    public function getInput() {
        return this.input;
    }

    public function setInput(value) {
        this.input = value;
    }

    public function getDelay() {
        return this.delay;
    }

    public function reduceDelay() {
        this.delay = this.delay - 1;
        if (this.delay < 0)
            this.delay = 0;
    }

    public function resetDelay() {
        this.delay = 300;
    }

    public function emptyDelay() {
        this.delay = 0;
    }

    public function getIL() {
        return this.il;
    }

}
// Class that manages the code that happens on certain occurences.
class Event {

    // Triggers code that happens on each frame.
    public function onEachFrame() {
        _root.timer.onEachFrame();
        _root.codeManager.onEachFrame();
        _root.textManager.onEachFrame();

        if (_root.timer.isDisplayed()) {
            _root.textManager.send('timer', _root.timer.getDisplay());
        } else {
            _root.textManager.send('timer', "");
            _root.textManager.send('segment_timer', "");
        }


        // KoopaShell
        if (_root.KeySlash()) {
            _root.koopashellInput = true;
        }
        _root.tickCpu();
        setCollision();
    }

    // Triggers code that happens on every loading zone.
    public function onLoadingZone() {
        _root.timer.onLoadingZone();
        _root.textManager.send('message', "");

        if (_root.timer.isDisplayed()) {
            _root.textManager.send('segment_timer', _root.timer.getDisplay());
        }

    }

    // Triggers code that happens when the star is collected.
    public function onStarCollected() {
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }
    }

    // Triggers code that happens when the star coin is collected.
    public function onStarCoinCollected() {
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }
    }

    // Triggers code that happens when a key is collected.
    public function onKeyCollected() {
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }
    }

    // Triggers code that happens when the fake bowser door is opened.
    public function onFakeBowserStart() {
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.utils.setFlag('bt3', true);
            _root.codeManager.getIL().onStarCollected();
            _root.WaterAmount = _root.TotalWater;
        }
    }

    // Triggers code that happens when Space is finished.
    public function onSpaceEnd() {
        _root.utils.setFlag('space', true);
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }


        if (_root.utils.getCutscenes()) {
            _root.gotoAndStop("BowserBattle3");
        } else {
            _root.Fluddpow = "";
            _root.CharHP = 8;
            _root.utils.warp('8-16', 0, -350, 0, -250);
        }
    }

    // Triggers code that happens when the true bowser fight is loaded.
    public function onTrueBowserStart() {
    /*
       if (_root.codeManager.getIL().isGoing() === true) {
       _root.codeManager.getIL().onStarCollected();
       }
     */
    }

    // Triggers code that happens when the true bowser fight is terminated.
    public function onTrueBowserEnd() {
        if (_root.utils.getCutscenes()) {
            _root.gotoAndStop("Ending");
        } else {
            _root.Fluddpow = "";
            _root.CharHP = 8;
            _root.utils.warp('BC-1', 0, 0, 0, 0);
            _root.utils.setSaveFludd(true);
        }
    }

    // Triggers code that happens when the escape is finished / the game is done.
    public function onEscapeEnd() {
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }

        if (_root.utils.getCutscenes()) {
            _root.gotoAndStop("Credits");
        } else {
            _root.utils.warp('C-1', 0, 0, 0, 0);
            _root.utils.setStar(36, true);
        }
    }

    // Triggers code that happens on the course select menu.
    public function onCourseSelect() {
        _root.timer.addSecond();
    }

    // Triggers code that happens on the mini course select menu.
    public function onMiniCourseSelect() {
        this.onCourseSelect();
    }

    // Returns the warp where the door to Fake Bowser will redirect.
    public function getFakeBowserWarp() {
        var value = "8-12";
        // if (_root.utils.getFakeBowserCompleted()) {
        //     _root.textManager.send('debug', 'test');
        //     value = "8-13";
        // }
        return value;
    }

}
class HotkeyCommand {

    private var key;
    private var command;

    public function HotkeyCommand(_key, _command) {
        this.key = _key;
        this.command = _command;
    }

    public function getKey() {
        return this.key;
    }

    public function getCommand() {
        return this.command;
    }

}
class HotkeyManager {

    private var hotkeyCommandList;

    public function HotkeyManager() {
        this.hotkeyCommandList = new Array();
    }

    public function add(key, command) {
        this.remove(key);
        this.hotkeyCommandList.push(new HotkeyCommand(key, command));
    }

    public function remove(key) {
        var i = 0;

        var newArray = new Array();

        for (i = 0; i < this.hotkeyCommandList.length; i++) {
            if (key != this.hotkeyCommandList[i].getKey()) {
                newArray.push(this.hotkeyCommandList[i]);
            }
        }

        this.hotkeyCommandList = newArray.slice();
    }

    public function execute(key) {
        if (!_root.utils.isGamePaused()) {
            var i = 0;

            for (i = 0; i < this.hotkeyCommandList.length; i++) {
                if (key == this.hotkeyCommandList[i].getKey()) {
                    _root.codeManager.execute(this.hotkeyCommandList[i].getCommand());
                    break;
                }
            }
        }
    }
}
// Class that manages the start and end of individual levels.
class IndividualLevel {

    private var level;
    private var requiredStars;
    private var requiredStarCoins;
    private var requiredFlags;
    private var nbRequiredStars;
    private var nbRequiredStarCoins;

    public function IndividualLevel() {
        this.stop();
        this.requiredStars = new Array();
        this.requiredStarCoins = new Array();
        this.requiredFlags = new Array();
        this.nbRequiredStars = 0;
        this.nbRequiredStarCoins = 0;
    }

    // Getter for the required stars.
    public function isRequiredStar(index) {
        return (this.requiredStars.indexOf(index) != -1);
    }

    // Getter for the required star coins.
    public function isRequiredStarCoins(index) {
        return (this.requiredStarCoins.indexOf(index) != -1);
    }

    // Setter for the required stars.
    public function setRequiredStars(array) {
        this.requiredStars = array.slice();
    }

    // Setter for the required star coins.
    public function setRequiredStarCoins(array) {
        this.requiredStarCoins = array.slice();
    }

    // Setter for the required flags.
    public function setRequiredFlags(array) {
        this.requiredFlags = array.slice();
    }

    // Setter for the amount of required stars.
    public function setNbRequiredStars(nb) {
        this.nbRequiredStars = nb;
    }

    // Setter for the amount of required stars.
    public function setNbRequiredStarCoins(nb) {
        this.nbRequiredStarCoins = nb;
    }

    // Checks if the IL is finished.
    public function check() {

        var i = 0;
        var j = 0;

        var nbStars = 0;
        var nbStarCoins = 0;

        for (i = 0; i < this.requiredStars.length; i++) {
            var index = this.requiredStars[i];
            if (_root.utils.getStar(index) === true) {
                nbStars++;
            }
        }

        for (j = 0; j < this.requiredStarCoins.length; j++) {
            var index = this.requiredStarCoins[j];
            if (_root.utils.getStarCoin(index) === true) {
                nbStarCoins++;
            }
        }

        var bool = (nbStars >= this.nbRequiredStars) && (nbStarCoins >= this.nbRequiredStarCoins);

        return bool;
    }

    // Code that is executed when a star is collected.
    public function onStarCollected() {
        if (this.check() === true) {
            this.stop();
        }
    }

    // Starts an IL.
    public function start(level) {
        this.level = level;
        setTimeout(function() {
            _root.timer.reset();
        }, 200);
    }

    // Stops an IL.
    public function stop() {
        this.level = 'none';
        _root.timer.stop();
    }

    // Returns true if an IL is currently in the way.
    public function isGoing() {
        return (this.level != 'none');
    }

}

// KoopaShell
setCollision = function() {
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
if (_root.installed != true) {
    _root.installed = true;
    trace("installed");
    _root.collision = {front: true, back: true, plats: false, hurt: false, misc: false};
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
    _root.cycleAcc = function(data) {
        _root.prevAcc = _root.acc;
        _root.acc = data;
    };
    _root.interpret = function(command, data) {
        trace(command + ", " + data);
        if (!data || data == command) {
            data = _root.prevAcc;
            castData = _root.acc;
        } else {
            castData = data;
        }
        switch (command) {
            case "def":
                _root.funcs[castData] = [];
                trace("func " + castData + ": " + _root.funcs[castData]);
                _root.mode = "func";
                break;
            case "ret":
                trace("ret to: " + _root.returnAddress);
                _root.readVar = 0;
                _root.programCounter = _root.returnAddress;
                break;
            case "lda":
                if (_root.mode != "arr") {
                    _root.cycleAcc(eval(data));
                    trace(_root.acc + ", " + eval(data));
                } else {
                    trace("loading from array");
                    _root.cycleAcc(_root.arrAcc[data]);
                }
                break;
            case "sto":
                if (isNaN(data) || _root.mode != "arr") {
                    set(data, _root.acc);
                    trace(_root.acc + ", " + eval(data));
                } else {
                    _root.arrAcc[data] = _root.acc;
                }
                break;
            case "ife":
                _root.boolAcc = _root.acc == _root.prevAcc;
                break;
            case "ifn":
                _root.boolAcc = _root.acc != _root.prevAcc;
                break;
            case "ldd":
                _root.cycleAcc(castData);
                trace(_root.acc);
                break;
            case "out":
                trace(_root.acc);
                _root.textManager.send('message', _root.acc);
                _root.out = _root.acc;
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
                if (isNaN(data)) {
                    _root.cycleAcc(_root.acc + data);
                } else {
                    _root.cycleAcc(_root.acc + Number(data));
                }
                break;
            case "sub":
                _root.cycleAcc(_root.acc - data);
                break;
            case "prod":
                _root.cycleAcc(_root.acc * data);
                break;
            case "div":
                _root.cycleAcc(_root.acc / data);
                break;
            case "mod":
                _root.cycleAcc(_root.acc % data);
                break;
            case "pow":
                _root.cycleAcc(Math.pow(_root.acc, data));
                break;
            case "jit":
                trace(_root.boolAcc);
                if (_root.boolAcc) {
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
                set("_root." + castData, function() {
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
                trace(eval(castData));
                trace(_root.arrAcc);
                _root.modeBak = _root.mode;
                _root.mode = "arr";
                break;
            case "carr":
                set(castData, _root.arrAcc);
                trace(eval(castData));
                trace(_root.arrAcc);
                _root.mode = _root.modeBak;
                break;
            case "ldsr":
                loader = new LoadVars();
                loader.onData = function(content) {
                    if (content != undefined) {
                        commands = content.split("\n");
                        j = 0;
                        while (j < commands.length) {
                            commands[j] = commands[j].substring(0, commands[j].length - 1);
                            j++;
                        }
                        _root.newData(commands);
                    } else {
                        trace("Script load failed");
                    }
                };
                loader.load(castData);
                break;
            case undefined:
                panic();
                break;
            default:
                _root.cycleAcc(castData);
                if (_root.funcs[command] != undefined) {
                    _root.curFunc = _root.funcs[command];
                    trace("curFunc: " + _root.curFunc);
                    _root.readVar = 1;
                    _root.returnAddress = _root.programCounter;
                    _root.programCounter = -1;
                    break;
                }
                trace("inval: " + command + " " + castData);
                break;
        }
    };

    _root.cpu = function() {
        trace("doCycle " + _root.programCounter);
        switch (_root.readVar) {
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
        if (_root.mode == "func") {
            trace("Adding " + _root.toExecute + " to " + _root.data);
            _root.funcs[_root.data].push(_root.toExecute);
            if (_root.toExecute == "ret") {
                trace("func " + _root.data + ": " + _root.funcs[_root.data]);
                _root.mode = "exec";
            }
        } else {
            _root.command = _root.toExecute.substring(0, _root.toExecute.indexOf(" ") == -1 ? _root.toExecute.length : _root.toExecute.indexOf(" "));
            _root.data = _root.toExecute.substring(_root.toExecute.indexOf(" ") + 1);
            _root.interpret(_root.command, _root.data);
        }
        _root.programCounter++;
        if (_root.programCounter >= _root.readLocation.length) {
            trace("panic: " + _root.programCounter + ", " + _root.readLocation.length);
            panic();
            _root.doTick = false;
            trace("end");
            if (_root.queue.length != 0) {
                _root.newData(_root.queue);
                _root.queue = [];
            }
        }
    };
    _root.tickCpu = function() {
        if (_root.doTick) {
            _root.cpu();
        }
    };
    _root.newData = function(arr) {
        if (_root.doTick) {
            i = 0;
            while (i < arr.length) {
                if (arr[i] == "clr") {
                    _root.stack = [];
                    _root.readVar = 0;
                }
                _root.stack.push(arr[i]);
                i++;
            }
        } else {
            _root.stack = arr;
            _root.doTick = true;
            _root.programCounter = 0;
        }
    };
    _root.allowedKeys = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_:/.,\\\'%;*+\" [](){}<>=#~";
    _root.cmd = "";
    _root.runCmd = function(data) {
        trace(data);
        _root.newData([data]);
        _root.koopashellInput = false;
    };
    var keyListener = new Object();
    keyListener.onKeyDown = function() {
        if (_root.koopashellInput) {
            trace(Key.getCode() + ", " + chr(Key.getCode()) + ", " + Key.getAscii() + ", " + chr(Key.getAscii()) + ", " + _root.allowedKeys.indexOf(chr(Key.getAscii())) + ", " + _root.cmd.length);
            if (_root.allowedKeys.indexOf(chr(Key.getAscii())) != -1) {
                _root.cmd = _root.cmd + chr(Key.getAscii());
            } else {
                switch (Key.getAscii()) {
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
}
// Class that manages the data that a savestate holds.
class SaveState {

    private var name;

    private var char;
    private var warp;
    private var position;
    private var fludd;
    private var water;
    private var health;
    private var fluddpow;
    private var infiniteWater;
    private var infiniteHealth;
    private var caps;
    private var capTimer;

    private var starArray;
    private var starCoinArray;

    // Constructor of the SaveState class.
    public function SaveState(name) {
        this.name = name;
        this.retrieveData();
    }

    // Sets the current world data into the save state.
    public function retrieveData() {
        var i = 0;

        this.char = _root.utils.getCharacter();
        this.warp = _root.utils.getLevelName();
        this.position = _root.utils.getLatestWarpPosition();
        this.fludd = _root.utils.getSaveFludd();
        this.water = _root.utils.getWater();
        this.health = _root.utils.getHealth();
        this.fluddpow = _root.utils.getFluddPow();
        this.infiniteWater = _root.utils.isWaterInfinite();
        this.infiniteHealth = _root.utils.isHealthInfinite();
        this.caps = {invisible: _root.utils.getCap('invisible'),
                invincible: _root.utils.getCap('invincible'),
                metal: _root.utils.getCap('metal'),
                wing: _root.utils.getCap('wing')};
        this.capTimer = _root.utils.getCapTimer();

        this.starArray = new Array(64);
        this.starCoinArray = new Array(64);

        for (i = 0; i < 64; i++) {
            this.starArray[i] = _root.utils.getStar(i + 1);
            this.starCoinArray[i] = _root.utils.getStarCoin(i + 1);
        }
    }

    // Loads a save state in the game.
    public function load() {
        var i = 0;

        _root.utils.warp(this.warp, this.position[0], this.position[1], this.position[0], this.position[1]);

        _root.utils.setCharacter(this.char);
        _root.utils.setSaveFludd(this.fludd.h, this.fludd.r, this.fludd.t);
        _root.utils.setWater(this.water);
        _root.utils.setHealth(this.health);
        _root.utils.setFluddPow(this.fluddpow);
        _root.utils.setInfiniteWater(this.infiniteWater);
        _root.utils.setInfiniteHealth(this.infiniteHealth);
        _root.utils.setCapBool('invisible', this.caps.invisible);
        _root.utils.setCapBool('invincible', this.caps.invincible);
        _root.utils.setCapBool('metal', this.caps.metal);
        _root.utils.setCapBool('wing', this.caps.wing);
        _root.utils.setCapTimer(this.capTimer);
        for (i = 0; i < 64; i++) {
            _root.utils.setStar(i + 1, this.starArray[i]);
            _root.utils.setStarCoin(i + 1, this.starCoinArray[i]);
        }
    }

}
// Class that manages the behaviour of all save states and their actions.
class SaveStateManager {

    private var saveStateList;

    // Constructor of the SaveStateManager class.
    public function SaveStateManager() {
        this.saveStateList = new Array();
    }

    public function save(name) {
        var state = new SaveState(name);
        this.saveStateList.push(state);
    }

    public function load(name) {

        var state = null;
        var i = 0;

        for (i = 0; i < this.saveStateList.length; i++) {
            if (this.saveStateList[i].name == name) {
                state = this.saveStateList[i];
            }
        }

        state.load();
    }

}
// Class that manages everything related to displayed text.
class TextManager {

    // Could be coded significantly better using an array.
    private var row1;
    private var row2;
    private var row3;
    private var row4;
    private var row5;
    private var row6;

    // Manages the life cycle of a message.
    private var messageDelay;

    // Constructor
    public function TextManager() {
        this.row1 = "";
        this.row2 = "";
        this.row3 = "";
        this.row4 = "";
        this.row5 = "";
        this.row6 = "";

        this.messageDelay = 0;
    }

    // Writes a message on the console.
    private function write(row, text) {
        switch (row) {
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

    // Sends a message to the console
    // that will be written by the class on the accurate row.
    public function send(type, text) {
        var row = this.getRow(type);

        if (type == 'message') {
            this.messageDelay = this.getMessageLength();
        }

        if (row != 0) {
            this.write(row, text);
        }
    }

    // Manages every action that happens on each frame.
    public function onEachFrame() {
        if (this.messageDelay > 0) {
            this.messageDelay--;

            if (this.messageDelay == 0) {
                this.write(this.getRow('message'), "");
            }
        }
    }

    // Returns the row where a specific type of text has to be displayed.
    private function getRow(type) {
        var row = 0;

        switch (type) {
            case 'code':
                row = 1;
                break;
            case 'message':
                row = 2;
                break;
            case 'debug':
                row = 3;
                break;
            case 'timer':
                row = 4;
                break;
            case 'segment_timer':
                row = 5;
                break;
        }

        return row;
    }

    // Returns the length where a message will be displayed on screen.
    private function getMessageLength() {
        var SECONDS_DISPLAYED = 4;
        return _root.utils.getFramerate() * SECONDS_DISPLAYED;
    }

}
// Class that manages a time counter.
class TimeCounter {

    // Time variables
    private var frames;
    private var milliseconds;
    private var seconds;
    private var minutes;

    private var FRAMES_PER_SECOND;

    private var displayMode;

    // Basic constructor
    public function TimeCounter() {
        this.frames = 0;
        this.milliseconds = 0;
        this.seconds = 0;
        this.minutes = 0;

        this.FRAMES_PER_SECOND = 32;

        this.displayMode = 'regular';

    }

    // Static manual constructor
    public static function Init(m, s, ms) {
        var obj:TimeCounter = new TimeCounter();
        obj.minutes = m;
        obj.seconds = s;
        obj.milliseconds = ms;
        return obj;
    }

    // Adds a frame to the timer, and manages everything that happens next.
    public function addFrame() {
        this.frames++;
        this.milliseconds = Math.floor((this.frames / this.FRAMES_PER_SECOND) * 1000);

        if (this.frames >= this.FRAMES_PER_SECOND) {
            this.frames = 0;
            this.milliseconds = 0;
            this.addSecond();
        }
    }

    // Adds a second to the timer, and manages everything that happens next.
    public function addSecond() {
        this.seconds++;
        if (this.seconds >= 60) {
            this.seconds = 0;
            this.addMinute();
        }
    }

    // Adds a minute to the timer.
    private function addMinute() {
        this.minutes++;
    }

    // Clones the timer.
    public function clone() {
        var obj:TimeCounter = new TimeCounter();
        obj.frames = this.frames;
        obj.milliseconds = this.milliseconds;
        obj.seconds = this.seconds;
        obj.minutes = this.minutes;
        obj.displayMode = this.displayMode;
        return obj;
    }

    // Manages the state of the display mode.
    // Can be either 'regular' or 'frames'.
    public function setDisplayMode(value) {
        if (value == 'frames') {
            this.displayMode = 'frames';
        } else {
            this.displayMode = 'regular';
        }
    }

    // Returns a string displaying the current time.
    public function getDisplay() {

        var txtSeconds = this.seconds;
        if (this.seconds < 10)
            txtSeconds = "0" + txtSeconds;

        var txtMinutes = this.minutes;
        if (this.minutes < 10)
            txtMinutes = "0" + txtMinutes;

        var displayedText = null;

        switch (this.displayMode) {
            case 'regular':
                var txtMilliseconds = this.milliseconds;
                if (this.milliseconds < 10)
                    txtMilliseconds = "0" + txtMilliseconds;
                if (this.milliseconds < 100)
                    txtMilliseconds = "0" + txtMilliseconds;
                displayedText = txtMinutes + ":" + txtSeconds + "." + txtMilliseconds;
                break;
            case 'frames':
                var txtFrames = this.frames;
                if (this.frames < 10)
                    txtFrames = "0" + txtFrames;
                displayedText = txtMinutes + ":" + txtSeconds + ":" + txtFrames;
                break;
        }

        return displayedText;
    }


    //// GETTERS & SETTERS



    // Seconds setter
    public function setSeconds(value) {
        this.seconds = value;
    }

    // Minutes setter
    public function setMinutes(value) {
        this.minutes = value;
    }

    // Getter of the frame count
    public function getFrames() {
        return this.frames;
    }

    // Getter of the milliseconds
    public function getMilliseconds() {
        return this.milliseconds;
    }

    // Getter of the seconds
    public function getSeconds() {
        return this.seconds;
    }

    // Getter of the minutes
    public function getMinutes() {
        return this.minutes;
    }

}
// Class that manages a full chronometer.
class Timer {

    // Defines if the timer is displayed on screen or not.
    private var displayed;

    // Defines if the timer is going or not.
    private var started;

    // Defines if the timer will start on the next loading zone.
    private var startOnLoadingZone;

    // Tracks the real time, as it's going.
    private var realTime:TimeCounter;

    // Tracks the last update of the time.
    private var lastUpdatedTime:TimeCounter;


    // Constructor
    public function Timer() {
        this.reset();
        this.start();
        this.displayed = true;
    }

    // Resets the timer.
    public function reset() {
        this.started = false;
        this.realTime = new TimeCounter();
        this.lastUpdatedTime = new TimeCounter();
        this.startOnLoadingZone = true;
    }

    // Starts the timer.
    public function start() {
        this.started = true;
    }

    // Stops the timer.
    public function stop() {
        this.started = false;
    }

    // Updates the timer.
    public function update() {
        this.lastUpdatedTime = this.realTime.clone();
    }

    // Sets if the timer is displayed onscreen or not.
    public function setDisplay(bool) {
        this.displayed = bool;
        _root.textManager.send('segment_timer', this.getDisplay());
    }

    // Sets the display mode of the timers.
    public function setDisplayMode(value) {
        this.realTime.setDisplayMode(value);
        this.lastUpdatedTime.setDisplayMode(value);
        _root.textManager.send('segment_timer', this.getDisplay());
    }

    // Manages the code that happens on each frame.
    public function onEachFrame() {
        if (this.started == true) {
            this.realTime.addFrame();
        }
        this.update();
    }

    // Manages the code that happens when entering a loading zone.
    public function onLoadingZone() {
        if (this.startOnLoadingZone) {
            this.start();
            this.startOnLoadingZone = false;
        }
    }

    // Returns if the timer is displayed on screen or not.
    public function isDisplayed() {
        return this.displayed;
    }

    // Returns a string displaying the current time.
    public function getDisplay() {
        return this.lastUpdatedTime.getDisplay();
    }

    // Adds a second to the time.
    public function addSecond() {
        this.realTime.addSecond();
    }

}
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

}
// Defines the informations from a world
class World {

    private var index;
    private var name;
    private var fullName;
    private var startingLevel;
    private var coordinates;
    private var stars;
    private var starCoins;
    private var flags;

    public function World(index, name, fullName, startingLevel, coordinates, stars, starCoins, flags) {
        this.index = index;
        this.name = name;
        this.fullName = fullName;
        this.startingLevel = startingLevel;
        this.coordinates = coordinates;
        this.stars = stars.slice();
        this.starCoins = starCoins.slice();
        this.flags = flags.slice();
    }

    public function getIndex() {
        return this.index;
    }

    public function getName() {
        return this.name;
    }

    public function getFullName() {
        return this.fullName;
    }

    public function getStars() {
        return this.stars.slice();
    }

    public function getStarCoins() {
        return this.starCoins.slice();
    }

    public function getCoordinates() {
        return this.coordinates.slice();
    }

    public function getFlags() {
        return this.flags.slice();
    }

    public function getStartingLevel() {
        return this.startingLevel;
    }
}


NewgroundsAPI.connectMovie(8160);
_root.ILTimerCurrentMenu = 0;
_root.ILTimerMenuDelay = 0;
_root.LatestCode = 0;

_root.Save_Star = new Array();
_root.Save_StarCoin = new Array();
_root.Save_FluddArray = new Array();

_root.timer = new Timer();
_root.textManager = new TextManager();
_root.utils = new Utils();
_root.codeManager = new CodeManager();
_root.betaQuest = new BetaQuest();
_root.event = new Event();
_root.saveStateManager = new SaveStateManager();
_root.hotkeyManager = new HotkeyManager();

_root.codeManager.add(new Code('betaquest bq', function(command) {
    if (command[1] == 'stop') {
        _root.betaQuest.stop();
        _root.textManager.send('message', 'BetaQuest was stopped.');
    } else if (command[1] == 'start') {
        var seed = Number(command[2]);
        _root.betaQuest.start(seed);
        _root.textManager.send('message', 'BetaQuest was started using seed ' + _root.betaQuest.getSeed() + '.');
    } else if (command[1] == 'seed') {
        if (_root.betaQuest.isStarted()) {
            _root.textManager.send('message', 'BetaQuest is currently using seed ' + _root.betaQuest.getSeed() + '.');
        } else {
            _root.textManager.send('message', 'BetaQuest is not currently running. Last seed was ' + _root.betaQuest.getSeed() + '.');
        }
    }
}));

_root.codeManager.add(new Code('bowserkey bk', function(command) {

    if (command[2] == 'true') {
        _root.utils.setBowserKey(int(command[1]), true);
        _root.textManager.send('message', 'BowserKey #' + command[1] + ' has been set to true.');
    } else if (command[2] == 'false') {
        _root.utils.setBowserKey(int(command[1]), false);
        _root.textManager.send('message', 'BowserKey #' + command[1] + ' has been set to false.');
    } else {
        _root.utils.setBowserKey(int(command[1]));
    }

}));

_root.codeManager.add(new Code('cap', function(command) {
    var time = Number(command[3]);
    _root.utils.setCap(command[1], command[2], time);

    _root.textManager.send('message', 'Current cap updated.');
}));

_root.codeManager.add(new Code('char', function(command) {

    switch (command[1]) {
        case 'mario':
        case 'Mario':
        case 'm':
        case 'M':
            _root.CurrentPlayer = 'Mario';
            _root.textManager.send('message', 'Character switched to Mario.');
            break;
        case 'luigi':
        case 'Luigi':
        case 'l':
        case 'L':
            _root.CurrentPlayer = 'Luigi';
            _root.textManager.send('message', 'Character switched to Luigi.');
            break;
        case 'toggle':
        case '':
        case undefined:
            if (_root.CurrentPlayer == "Mario") {
                _root.CurrentPlayer = "Luigi";
                _root.textManager.send('message', 'Character switched to Luigi.');
            } else {
                _root.CurrentPlayer = "Mario";
                _root.textManager.send('message', 'Character switched to Mario.');
            }
            break;
    }

}));

_root.codeManager.add(new Code('clearhotkey clhtk', function(command) {
    var key = command[1];

    _root.hotkeyManager.remove(key);
    _root.textManager.send('message', 'The hotkey ' + key + '\'s bind was succesfully removed.');
}));

_root.codeManager.add(new Code('coin coins', function(command) {
    _root.utils.setCoinCount(Number(command[1]));
    _root.textManager.send('message', 'Coin count has been set to ' + Number(command[1]) + '.');
}));

_root.codeManager.add(new Code('cutscenes cts', function(command) {
    if (command[1] == 'on') {
        _root.utils.setCutscenes(true);
        _root.textManager.send('message', 'Cutscenes have been enabled.');
    } else if (command[1] == 'off') {
        _root.utils.setCutscenes(false);
        _root.textManager.send('message', 'Cutscenes have been disabled.');
    }
}));

_root.codeManager.add(new Code('doorwarp', function(command) {
    _root.utils.warpDoor(command[1]);
}));

_root.codeManager.add(new Code('fakebowser fb', function(command) {
    if (command[1] == 'on') {
        _root.utils.setFakeBowserCompleted(false);
        _root.textManager.send('message', 'Fake Bowser has been enabled and can be fought.');
    } else if (command[1] == 'off') {
        _root.utils.setFakeBowserCompleted(true);
        _root.textManager.send('message', 'Fake Bowser has been disabled and cannot be fought.');
    }
}));

_root.codeManager.add(new Code('file f', function(command) {

    switch (command[1]) {
        case 'complete':
        case '100':
            _root.utils.setStars(true);
            _root.utils.setStarCoins(true);
            _root.utils.setBowserKeys(true);
            _root.utils.setFluddArray(true);
            _root.textManager.send('message', 'Current file is now a 100% file.');
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
            _root.textManager.send('message', 'Current file now has every storyline star.');
            break;
        case 'empty':
            _root.utils.setStars(false);
            _root.utils.setStarCoins(false);
            _root.utils.setBowserKeys(false);
            _root.utils.setFluddArray(false);
            _root.textManager.send('message', 'Current file has been emptied.');
            break;
    }

}));

_root.codeManager.add(new Code('fludd', function(command) {

    switch (command[1]) {
        case 'all':
            _root.utils.setSaveFludd(true);
            _root.textManager.send('message', 'All FLUDD nozzles have been given to Mario.');
            break;
        case 'H':
        case 'h':
        case 'Hover':
        case 'hover':
            _root.utils.setSaveOneFludd('h', !_root.utils.getSaveFludd().h);
            _root.textManager.send('message', 'Hover FLUDD has been set to ' + _root.utils.getSaveFludd().h + '.');
            break;
        case 'R':
        case 'r':
        case 'Rocket':
        case 'rocket':
            _root.utils.setSaveOneFludd('r', !_root.utils.getSaveFludd().r);
            _root.textManager.send('message', 'Rocket FLUDD has been set to ' + _root.utils.getSaveFludd().r + '.');
            break;
        case 'T':
        case 't':
        case 'Turbo':
        case 'turbo':
            _root.utils.setSaveOneFludd('t', !_root.utils.getSaveFludd().t);
            _root.textManager.send('message', 'Turbo FLUDD has been set to ' + _root.utils.getSaveFludd().t + '.');
            break;
        case 'none':
            _root.utils.setSaveFludd(false);
            _root.utils.setFluddPow("");
            _root.textManager.send('message', 'All FLUDD nozzles have been removed from Mario.');
            break;
    }


}));

_root.codeManager.add(new Code('forcewarp fw', function(command) {

    _root.betaQuest.stop();

    // Copy of the warp code, might clean later
    var level = command[1];
    var param_1 = command[2];
    var param_2 = command[3];
    var param_3 = command[4];
    var param_4 = command[5];

    if (level != undefined) {
        if (param_1 == undefined)
            param_1 = 0;
        if (param_2 == undefined)
            param_2 = 0;
        if (param_3 == undefined)
            param_3 = 0;
        if (param_4 == undefined)
            param_4 = 0;

        _root.utils.warp(command[1], param_1, param_2, param_3, param_4);
        _root.textManager.send('message', 'Player has been warped to ' + command[1] + '.');
    }

    setTimeout(function() {
        _root.betaQuest.restart();
    }, _root.utils.getWarpTimeout());

}));

_root.codeManager.add(new Code('health', function(command) {
    if (command[1] == 'refill') {
        _root.CharHP = 8;
        _root.textManager.send('message', 'Health has been refilled.');
    } else if (command[1] == 'empty') {
        _root.CharHP = 1;
        _root.textManager.send('message', 'Health has been set to 1.');
    } else if (command[1] == 'death') {
        _root.CharHP = 0;
        _root.textManager.send('message', 'Death has been provoked.');
    } else {
        _root.CharHP = command[1];
        _root.textManager.send('message', 'Health has been set to ' + _root.CharHP + '.');
    }

    if (command[1] == 'infinite') {
        _root.utils.setHealth(8);
        _root.utils.setInfiniteHealth(true);
        _root.textManager.send('message', 'Health is now infinite.');
    } else {
        _root.utils.setInfiniteHealth(false);
        _root.textManager.send('message', 'Health is not infinite anymore.');
    }
}));

_root.codeManager.add(new Code('hotkey htk', function(command) {
    var newArray = command.slice();

    // We remove the two first parameters of the array
    // (htk [key])
    newArray.shift();
    newArray.shift();

    var key = command[1];
    var unsplitCommand = newArray.join(" ");

    _root.hotkeyManager.add(key, unsplitCommand);

    _root.textManager.send('message', 'The hotkey ' + key + ' was succesfully binded.');
}));

_root.codeManager.add(new Code('individuallevel il', function(command) {
    // This code is disgusting as a whole and needs to be fixed as soon as possible

    // IL data options
    _root.WaterAmount = _root.TotalWater;
    _root.Restartcoins();
    _root.utils.setInfiniteWater(false);
    _root.utils.setInfiniteHealth(false);

    var IL = _root.codeManager.getIL();
    var level = command[1];
    var type = command[2];
    var starnum = parseInt(command[3]);

    var existingTypes = new Array();
    existingTypes.push('all', '100', 'star', 'allstars', 'nms', 'starcoin', 'allstarcoins');
    if (existingTypes.indexOf(type) == -1) {
        _root.textManager.send('message', 'Invalid IL command.');
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
    if (type == 'allstars' || type == 'star') {
        _root.utils.setWorldStarCoins(level, true);
    } else {
        _root.utils.setWorldStarCoins(level, false);
    }

    // Clean this code pls
    IL.setRequiredStars(requiredStars);
    IL.setRequiredStarCoins(requiredStarCoins);
    IL.setRequiredFlags(emptyArray);
    IL.setNbRequiredStars(requiredStars.length);
    IL.setNbRequiredStarCoins(requiredStarCoins.length);

    switch (type) {
        case '100':
        case 'all':
            IL.setRequiredFlags(requiredFlags);
            mode = '100%';
            break;
        case 'allstars':
            IL.setRequiredStarCoins(emptyArray);
            IL.setNbRequiredStarCoins(0);
            mode = 'All Stars';
            break;
        case 'star':
            if (!isNaN(starnum) && (starnum >= 1 && starnum <= 5)) {
                var arr = new Array();
                arr.push(requiredStars[starnum - 1]);

                IL.setRequiredStars(arr);
                IL.setRequiredStarCoins(emptyArray);

                IL.setNbRequiredStars(requiredStars.length);
                IL.setNbRequiredStarCoins(requiredStarCoins.length);
                mode = 'Star ' + starnum;
            }
            break;
        case 'nms':
            var nbStars = parseInt(command[3]);
            var nbStarCoins = parseInt(command[4]);
            IL.setNbRequiredStars(nbStars);
            IL.setNbRequiredStarCoins(nbStarCoins);
            mode = 'No Major Skips : ' + nbStars + ' stars, ' + nbStarCoins + ' star coins';
            break;
        case 'allstarcoins':
            IL.setRequiredStars(emptyArray);
            IL.setNbRequiredStars(0);
            mode = 'All Star Coins';
            break;
        case 'starcoin':
            if (!isNaN(starnum) && (starnum >= 1 && starnum <= 6)) {
                var arr = new Array();
                arr.push(requiredStarCoins[starnum - 1]);
                IL.setRequiredStars(emptyArray);

                IL.setRequiredStars(emptyArray);
                IL.setRequiredStarCoins(arr);

                IL.setNbRequiredStars(requiredStars.length);
                IL.setNbRequiredStarCoins(requiredStarCoins.length);
                mode = 'Star Coin ' + starnum;
            }
            break;
        default:
            mode = 'None';
    }

    _root.utils.setWorldNozzle(level, 'all', 'false');

    // Options
    var i = 0;
    for (i = 0; i < command.length; i++) {

        switch (command[i]) {
            case '-f':
            case '-fludd':
                _root.utils.setWorldNozzle(level, 'all', 'true');
                mode = mode + ' + Fludd';
                break;
            case '-nosc':
                _root.utils.setWorldStarCoins(level, false);
                break;
            case '-sc':
                _root.utils.setWorldStarCoins(level, true);
                break;
        }
    }

    // Exceptions
    setTimeout(function() {
        if (level == 'bt3' || level == 'endgame' || level == 'b3reds' || level == 'b2reds') {
            // TODO : Check impossible-to-understand fludd bug
            _root.utils.setSaveFludd(false, true, true);
            _root.utils.setWorldNozzle('bt3', 'h', 'false');
            _root.utils.setFakeBowserCompleted(true);
        }
        if (level == 'space') {
            _root.utils.setSaveFludd(true, true, true);
        }
        if (level == 'escape') {
            _root.utils.setFluddPow("");
            _root.utils.setSaveFludd(true, true, true);
        }
    }, _root.utils.getAfterWarpTimeout());

    setTimeout(function() {
        _root.textManager.send('message', 'Current IL : ' + selectedWorld.getFullName() + ' | ' + mode);
    }, _root.utils.getAfterWarpTimeout());

    _root.utils.warp(startingLevel, posX, posY, posX, posY, false);
    IL.start(level);
}));

_root.codeManager.add(new Code('kill', function(command) {
    _root.CharHP = 0;
    _root.textManager.send('message', 'Death has been provoked.');
}))

_root.codeManager.add(new Code('last l', function(command) {
    _root.codeManager.executeLastCode();
}));

_root.codeManager.add(new Code('latestwarpposition lwp', function(command) {
    _root.textManager.send('message', _root.utils.getLevelName() + ' ' + _root.utils.getLatestWarpPositionString());
}));

_root.codeManager.add(new Code('levelname ln', function(command) {
    _root.textManager.send('message', _root.utils.getLevelName());
}));

_root.codeManager.add(new Code('lives', function(command) {
    if (command[1] == 'infinite') {
        _root.CharLives = NaN;
        _root.textManager.send('message', 'Lives are now infinite.');
    } else {
        _root.CharLives = Number(command[1]);
        _root.textManager.send('message', 'Lives have been set to ' + _root.CharLives + '.');
    }
}));

_root.codeManager.add(new Code('loadstate ls', function(command) {
    var name = command[1];
    _root.saveStateManager.load(name);

    if (command[2] == '-t') {
        _root.timer.reset();
    }
}));

_root.codeManager.add(new Code('nozzle', function(command) {
    var world = command[1];
    var nozzle = command[2];
    var bool = command[3];
    if (world === undefined || nozzle === undefined || bool === undefined) {
        _root.textManager.send('message', 'Invalid syntax.');
        return;
    }
    _root.utils.setWorldNozzle(world, nozzle, bool);
    _root.textManager.send('message', 'Saved nozzles from worlds have been updated.');
}));

_root.codeManager.add(new Code('position pos', function(command) {
    //_root.textManager.send('message', _root.utils.getPositionString() + ' | | '  + _root.Course.Char._x + ' ' + _root.Course.Char._y + ' | ' + _root.Course.FrontGFX._x + ' ' + _root.Course.FrontGFX._y + ' | ' +_root.Course.Char._X + ' ' + _root.Course.Char._Y);
    _root.textManager.send('message', _root.utils.getPositionString());
}));

_root.codeManager.add(new Code('reds red redcoins redcoin', function(command) {
    _root.utils.setRedCoinCount(Number(command[1]));
    _root.textManager.send('message', 'Red coins count has been set to ' + Number(command[1]) + '.');
}));

_root.codeManager.add(new Code('resetcoins restartcoins', function(command) {
    _root.utils.resetCoins();
    _root.textManager.send('message', 'Coins will be reset on the next loading zone.');
}));

_root.codeManager.add(new Code('savestate ss', function(command) {
    var name = command[1];
    _root.saveStateManager.save(name);
    _root.textManager.send('message', "State " + name + " saved.");
}));

_root.codeManager.add(new Code('setpos', function(command) {
    _root.utils.setPosition(command[1], command[2]);

    _root.textManager.send('message', 'Current position updated.');
}));

_root.codeManager.add(new Code('silvers silver', function(command) {
    _root.utils.setSilverStarsCount(Number(command[1]));
    _root.textManager.send('message', 'Silver stars count has been set to ' + Number(command[1]) + '.');
}));

_root.codeManager.add(new Code('star s', function(command) {

    if (isNaN(Number(command[1])) == false) {
        if (command[2] == 'true') {
            _root.utils.setStar(command[1], true);
            _root.textManager.send('message', 'Star ' + command[1] + ' has been set to true.');
        } else if (command[2] == 'false') {
            _root.utils.setStar(command[1], false);
            _root.textManager.send('message', 'Star ' + command[1] + ' has been set to false.');
        } else {
            _root.utils.setStar(command[1]);
            _root.textManager.send('message', 'Star ' + command[1] + ' has been toggled.');
        }
    } else {
        var level = command[1];
        var number = Number(command[2]);
        var bool = command[3];
        switch (bool) {
            case 'true':
                _root.utils.setWorldStars(level, true, number);
                _root.textManager.send('message', 'Star ' + number + ' from ' + level + ' has been set to true.');
                break;
            case 'false':
                _root.utils.setWorldStars(level, false, number);
                _root.textManager.send('message', 'Star ' + number + ' from ' + level + ' has been set to false.');
                break;
            default:
                _root.utils.setWorldStars(level, undefined, number);
                _root.textManager.send('message', 'Star ' + number + ' from ' + level + ' has been toggled.');
                break;
        }
    }
}));

_root.codeManager.add(new Code('starcoin sc', function(command) {

    if (isNaN(Number(command[1])) == false) {
        if (command[2] == 'true') {
            _root.utils.setStarCoin(command[1], true);
            _root.textManager.send('message', 'Star coin ' + command[1] + ' has been set to true.');
        } else if (command[2] == 'false') {
            _root.utils.setStarCoin(command[1], false);
            _root.textManager.send('message', 'Star coin ' + command[1] + ' has been set to false.');
        } else {
            _root.utils.setStarCoin(command[1]);
            _root.textManager.send('message', 'Star coin ' + command[1] + ' has been toggled.');
        }
    } else {
        var level = command[1];
        var number = Number(command[2]);
        var bool = command[3];
        switch (bool) {
            case 'true':
                _root.utils.setWorldStarCoins(level, true, number);
                _root.textManager.send('message', 'Star coin ' + number + ' from ' + level + ' has been set to true.');
                break;
            case 'false':
                _root.utils.setWorldStarCoins(level, false, number);
                _root.textManager.send('message', 'Star coin ' + number + ' from ' + level + ' has been set to false.');
                break;
            default:
                _root.utils.setWorldStarCoins(level, undefined, number);
                _root.textManager.send('message', 'Star coin ' + number + ' from ' + level + ' has been set toggled.');
        }
    }

}));

_root.codeManager.add(new Code('timer t', function(command) {

    switch (command[1]) {
        case 'start':
            _root.timer.start();
            _root.textManager.send('message', 'Timer has been started.');
            break;
        case 'stop':
            _root.timer.stop();
            _root.textManager.send('message', 'Timer has been stopped.');
            break;
        case 'reset':
            _root.timer.reset();
            _root.textManager.send('message', 'Timer has been reset. It will start on the next loading zone.');
            break;
        case 'on':
            _root.timer.setDisplay(true);
            break;
        case 'off':
            _root.timer.setDisplay(false);
            break;
        case 'frames':
            _root.timer.setDisplayMode('frames');
            _root.textManager.send('message', 'Set display mode to frames.');
            break;
        case 'milliseconds':
        case 'ms':
            _root.timer.setDisplayMode('regular');
            _root.textManager.send('message', 'Set display mode to milliseconds.');
            break;
    }

}));

_root.codeManager.add(new Code('warp w', function(command) {

    var level = command[1];
    var player_x = command[2];
    var player_y = command[3];
    var camera_x = command[4];
    var camera_y = command[5];

    if (level != undefined) {

        var definedCoordinates = (player_x != undefined && player_y != undefined);

        if (definedCoordinates) {
            if (camera_x == undefined)
                camera_x = player_x;
            if (camera_y == undefined)
                camera_y = player_y;
            _root.utils.warp(command[1], player_x, player_y, camera_x, camera_y, false);
        } else {
            _root.utils.warp(command[1], 0, 0, 0, 0, true);
        }

        setTimeout(function() {
            _root.textManager.send('message', 'Player has been warped to ' + command[1] + '.');
        }, _root.utils.getAfterWarpTimeout());

    }

}));

_root.codeManager.add(new Code('water', function(command) {
    if (command[1] == 'refill') {
        _root.WaterAmount = _root.TotalWater;
        _root.textManager.send('message', 'Water has been refilled.');
    } else if (command[1] == 'half') {
        _root.WaterAmount = 5000;
        _root.textManager.send('message', 'Water has been set to half.');
    } else if (command[1] == 'empty') {
        _root.WaterAmount = 0;
        _root.textManager.send('message', 'Water container is now empty.');
    } else {
        _root.WaterAmount = Number(command[1]);
        _root.textManager.send('message', 'Water has been set to ' + _root.WaterAmount + '.');
    }

    if (command[1] == 'infinite') {
        _root.WaterAmount = _root.TotalWater;
        _root.utils.setInfiniteWater(true);
        _root.textManager.send('message', 'Water is now infinite.');
    } else {
        _root.utils.setInfiniteWater(false);
        _root.textManager.send('message', 'Water is not infinite anymore.');
    }
}));

