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
        this.initCodes();
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

    // Creates the codes and adds them to the code list.
    public function initCodes() {

        this.add(new Code('nozzle', function(command) {
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

        this.add(new Code('doorwarp', function(command) {
            _root.utils.warpDoor(command[1]);
        }));

        this.add(new Code('position pos', function(command) {
            //_root.textManager.send('message', _root.utils.getPositionString() + ' | | '  + _root.Course.Char._x + ' ' + _root.Course.Char._y + ' | ' + _root.Course.FrontGFX._x + ' ' + _root.Course.FrontGFX._y + ' | ' +_root.Course.Char._X + ' ' + _root.Course.Char._Y);
            _root.textManager.send('message', _root.utils.getPositionString());
        }));

        this.add(new Code('latestwarpposition lwp', function(command) {
            _root.textManager.send('message', _root.utils.getLevelName() + ' ' + _root.utils.getLatestWarpPositionString());
        }));

        this.add(new Code('levelname ln', function(command) {
            _root.textManager.send('message', _root.utils.getLevelName());
        }));

        this.add(new Code('individuallevel il', function(command) {
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

        this.add(new Code('warp w', function(command) {

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

        this.add(new Code('file f', function(command) {

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

        this.add(new Code('timer t', function(command) {

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

        this.add(new Code('bowserkey bk', function(command) {

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

        this.add(new Code('star s', function(command) {

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

        this.add(new Code('starcoin sc', function(command) {

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

        this.add(new Code('fludd', function(command) {

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

        this.add(new Code('lives', function(command) {
            if (command[1] == 'infinite') {
                _root.CharLives = NaN;
                _root.textManager.send('message', 'Lives are now infinite.');
            } else {
                _root.CharLives = Number(command[1]);
                _root.textManager.send('message', 'Lives have been set to ' + _root.CharLives + '.');
            }
        }));

        this.add(new Code('water', function(command) {
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

        this.add(new Code('health', function(command) {
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

        this.add(new Code('char', function(command) {

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

        this.add(new Code('last l', function(command) {
            _root.codeManager.executeLastCode();
        }));

        this.add(new Code('cap', function(command) {
            var time = Number(command[3]);
            _root.utils.setCap(command[1], command[2], time);

            _root.textManager.send('message', 'Current cap updated.');
        }));

        this.add(new Code('betaquest bq', function(command) {
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

        this.add(new Code('forcewarp fw', function(command) {

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

        this.add(new Code('setpos', function(command) {
            _root.utils.setPosition(command[1], command[2]);

            _root.textManager.send('message', 'Current position updated.');
        }));

        this.add(new Code('savestate ss', function(command) {
            var name = command[1];
            _root.saveStateManager.save(name);
            _root.textManager.send('message', "State " + name + " saved.");
        }));

        this.add(new Code('loadstate ls', function(command) {
            var name = command[1];
            _root.saveStateManager.load(name);

            if (command[2] == '-t') {
                _root.timer.reset();
            }
        }));

        this.add(new Code('hotkey htk', function(command) {
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

        this.add(new Code('clearhotkey clhtk', function(command) {
            var key = command[1];

            _root.hotkeyManager.remove(key);
            _root.textManager.send('message', 'The hotkey ' + key + '\'s bind was succesfully removed.');
        }));

        this.add(new Code('coin coins', function(command) {
            _root.utils.setCoinCount(Number(command[1]));
            _root.textManager.send('message', 'Coin count has been set to ' + Number(command[1]) + '.');
        }));

        this.add(new Code('reds red redcoins redcoin', function(command) {
            _root.utils.setRedCoinCount(Number(command[1]));
            _root.textManager.send('message', 'Red coins count has been set to ' + Number(command[1]) + '.');
        }));

        this.add(new Code('silvers silver', function(command) {
            _root.utils.setSilverStarsCount(Number(command[1]));
            _root.textManager.send('message', 'Silver stars count has been set to ' + Number(command[1]) + '.');
        }));

        this.add(new Code('fakebowser fb', function(command) {
            if (command[1] == 'on') {
                _root.utils.setFakeBowserCompleted(false);
                _root.textManager.send('message', 'Fake Bowser has been enabled and can be fought.');
            } else if (command[1] == 'off') {
                _root.utils.setFakeBowserCompleted(true);
                _root.textManager.send('message', 'Fake Bowser has been disabled and cannot be fought.');
            }
        }));

        this.add(new Code('cutscenes cts', function(command) {
            if (command[1] == 'on') {
                _root.utils.setCutscenes(true);
                _root.textManager.send('message', 'Cutscenes have been enabled.');
            } else if (command[1] == 'off') {
                _root.utils.setCutscenes(false);
                _root.textManager.send('message', 'Cutscenes have been disabled.');
            }
        }));

        this.add(new Code('resetcoins restartcoins', function(command) {
            _root.utils.resetCoins();
            _root.textManager.send('message', 'Coins will be reset on the next loading zone.');
        }));

        this.add(new Code('kill', function(command) {
            _root.CharHP = 0;
            _root.textManager.send('message', 'Death has been provoked.');
        }))

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