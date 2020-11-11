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