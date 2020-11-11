// OG Code
if ((_root._quality == "BEST" || _root._quality == "HIGH") && _root.AutoQuality == true) {
    _root.Qualitynum--;
}
qn = _root.Qualitynum;
qn2 = 0;
_root._quality = _root.QualityArray[qn];
time = getTimer();

// Seka code

_root.event.onLoadingZone();

frtxt = "fps: unknown";
i = 1;
code = 0;
input = 0;
_root.ILTimerCurrentMenu = 0;
text_currentTime = "";
text_1 = "";
text_2 = "";
KEY_REPEAT_DELAY = 5;
MENU_OPEN_LENGTH = 150;
enterCode = function() {
    input = -1;
    if (_root.Key1()) {
        input = 1;
    } else if (_root.Key2()) {
        input = 2;
    } else if (_root.Key3()) {
        input = 3;
    } else if (_root.Key4()) {
        input = 4;
    } else if (_root.Key5()) {
        input = 5;
    } else if (_root.Key6()) {
        input = 6;
    } else if (_root.Key7()) {
        input = 7;
    } else if (_root.Key8()) {
        input = 8;
    } else if (_root.Key9()) {
        input = 9;
    } else if (_root.Key0()) {
        input = 0;
    } else if (_root.KeyBackspace()) {
        input = 11;
    } else if (_root.KeyEnter()) {
        input = 12;
    } else if (_root.KeyStar()) {
        input = 13;
    }
    if (input == 11) {
        code = Math.floor(code / 10);
    } else if (input >= 0 && input <= 9) {
        code = code * 10 + input;
    } else if (input == 12) {
        codeValidated = true;
    } else if (input == 13) {
        code = _root.LatestCode;
        codeValidated = true;
    }
    if (input != -1) {
        _root.ILTimerAvoidRepeat = KEY_REPEAT_DELAY;
        _root.ILTimerMenuDelay = MENU_OPEN_LENGTH;
    }
};
gotoMenu = function(nbMenu) {
    if (nbMenu == 0) {
        _root.ILTimerMenuDelay = 0;
    } else {
        _root.ILTimerMenuDelay = MENU_OPEN_LENGTH;
    }
    _root.ILTimerCurrentMenu = nbMenu;
};

saveState = function() {
    i = 1;
    while (i <= 64) {
        _root.Save_Star[i] = _root.Star[i];
        i++;
    }
    i = 1;
    while (i <= 64) {
        _root.Save_StarCoin[i] = _root.StarCoin[i];
        i++;
    }
    i = 1;
    while (i <= 12) {
        _root.Save_FluddArray[i] = _root.FluddArray[i];
        i++;
    }
};
loadState = function() {
    i = 1;
    while (i <= 64) {
        _root.Star[i] = _root.Save_Star[i];
        i++;
    }
    _root.CalculateStars();
    i = 1;
    while (i <= 64) {
        _root.StarCoin[i] = _root.Save_StarCoin[i];
        i++;
    }
    _root.CalculateStarCoins();
    i = 1;
    while (i <= 12) {
        _root.FluddArray[i] = _root.Save_FluddArray[i];
        i++;
    }
};



class Menu {

    public function Menu() {

    }

}

executeCode = function() {
    _root.LatestCode = code;
    code = 0;
    codeValidated = false;
    gotoMenu(0);
};

stop();
onEnterFrame = function() {
    // Triggers events that happen on each frame
    _root.event.onEachFrame();

    // FPS update
    if (_root.PauseGame == false) {
        if ((count = count + 1) >= 4) {
            if (_root._quality == "LOW") {
                _root.Qualitynum = 0;
            } else if (_root._quality == "MEDIUM") {
                _root.Qualitynum = 1;
            } else if (_root._quality == "HIGH") {
                _root.Qualitynum = 2;
            } else if (_root._quality == "BEST") {
                _root.Qualitynum = 3;
            }
            qn = _root.Qualitynum;
            diff = Math.round(10000 / (getTimer() - time) * count) / 10;
            time = getTimer();
            count = 0;
            if (diff < 10) {
                frtxt = "fps: 0" + diff;
            } else {
                frtxt = "fps: " + diff;
            }
            if (Math.round(diff) == diff) {
                frtxt = frtxt + ".0";
            }
            if (diff / 32 < 0.7) {
                qn2--;
            } else if (diff / 32 > 0.9) {
                qn2++;
            }
            if (qn2 > 30) {
                qn2 = 0;
                qn = Math.min(qn + 1, 3);
            } else if (qn2 < -15) {
                qn2 = 0;
                qn = Math.max(qn - 1, 0);
            }
            if (_root.AutoQuality == true) {
                if (_root._quality !== _root.QualityArray[qn]) {
                    _root._quality = _root.QualityArray[qn];
                }
                _root.Qualitynum = qn;
            }
        }
    } else if ((count = count + 1) >= 4) {
        diff = Math.round(10000 / (getTimer() - time) * count) / 10;
        time = getTimer();
        count = 0;
        if (diff < 10) {
            frtxt = "fps: 0" + diff;
        } else {
            frtxt = "fps: " + diff;
        }
        if (Math.round(diff) == diff) {
            frtxt = frtxt + ".0";
        }
    }
}

// Jhyn code
/*
   setCollision = function()
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
   if(_root.installed != true)
   {
   _root.installed = true;
   _root.collision = {front:true,back:true,plats:false,hurt:false};
   _root.stack = ["out","def char","lda _root.CurrentPlayer","ldd Mario","ifn","jit 2","ldd Luigi","sto _root.CurrentPlayer","ret","def level","sto temp","ldd StarIn","aarg","lda temp","aarg","ldd 0","num","aarg","aarg","aarg","aarg","ldd true","bool","aarg","ext changecourse","carg","ret","def 411","lda _root.SaveFluddH","not","sto _root.SaveFluddH","ret","def 412","lda _root.SaveFluddR","not","sto _root.SaveFluddR","ret","def 413","lda _root.SaveFluddT","not","sto _root.SaveFluddT","ret"];
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
   _root.cycleAcc = function(data)
   {
   _root.prevAcc = _root.acc;
   _root.acc = data;
   };
   _root.interpret = function(command, data)
   {
   switch(command)
   {
   case "def":
   _root.funcs[data] = [];
   _root.mode = "func";
   break;
   case "ret":
   _root.readVar = 0;
   _root.programCounter = _root.returnAddress;
   break;
   case "lda":
   if(!data || data == "lda")
   {
   data = _root.acc;
   }
   if(isNaN(data) || _root.mode != "arr")
   {
   _root.cycleAcc(eval(data));
   }
   else
   {
   _root.cycleAcc(_root.arrAcc[data]);
   }
   break;
   case "sto":
   if(!data || data == "sto")
   {
   data = _root.prevAcc;
   }
   if(isNaN(data) || _root.mode != "arr")
   {
   set(data,_root.acc);
   }
   else
   {
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
   _root.cycleAcc(data);
   break;
   case "out":
   _root.out = _root.acc;
   break;
   case "num":
   _root.cycleAcc(Number(_root.acc));
   break;
   case "str":
   _root.cycleAcc(String(_root.acc));
   break;
   case "bool":
   _root.cycleAcc(_root.acc != "false");
   break;
   case "add":
   _root.cycleAcc(_root.prevAcc + _root.acc);
   break;
   case "sub":
   _root.cyckeAcc(_root.prevAcc - _root.acc);
   break;
   case "prod":
   _root.cycleAcc(_root.prevAcc * _root.acc);
   break;
   case "div":
   _root.cycleAcc(_root.prevAcc / _root.acc);
   break;
   case "mod":
   _root.cycleAcc(_root.prevAcc % _root.acc);
   break;
   case "pow":
   _root.cycleAcc(Math.pow(_root.prevAcc,_root.acc));
   break;
   case "jit":
   if(_root.boolAcc)
   {
   _root.programCounter = _root.programCounter + Number(data) - 1;
   }
   break;
   case "aarg":
   _root.extArgs.push(_root.acc);
   break;
   case "carg":
   _root.extArgs = [];
   break;
   case "ext":
   temp = eval(data).apply(null,_root.extArgs);
   if(temp)
   {
   _root.cycleAcc(temp);
   }
   break;
   case "map":
   set("_root." + data,function()
   {
   _root.newData([data]);
   return _root.acc;
   });
   break;
   case "not":
   _root.cycleAcc(!_root.acc);
   break;
   case "eval":
   _root.cycleAcc(eval(_root.acc));
   break;
   case "arr":
   if(!data || data == "arr")
   {
   data = _root.acc;
   }
   _root.arrAcc = eval(data).join(",").split(",");
   _root.modeBak = _root.mode;
   _root.mode = "arr";
   break;
   case "carr":
   if(!data || data == "carr")
   {
   data = _root.acc;
   }
   set(data,_root.arrAcc);
   _root.mode = _root.modeBak;
   break;
   case "ldsr":
   loader = new LoadVars();
   loader.onData = function(content)
   {
   if(content != undefined)
   {
   commands = content.split("\n");
   j = 0;
   while(j < commands.length)
   {
   commands[j] = commands[j].substring(0,commands[j].length - 1);
   j++;
   }
   _root.newData(commands);
   }
   else
   {
   }
   };
   loader.load(data);
   break;
   case undefined:
   panic();
   break;
   default:
   if(_root.funcs[command] != undefined)
   {
   _root.curFunc = _root.funcs[command];
   _root.readVar = 1;
   _root.returnAddress = _root.programCounter;
   _root.programCounter = -1;
   _root.cycleAcc(data);
   break;
   }
   break;
   }
   };
   _root.cpu = function()
   {
   switch(_root.readVar)
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
   if(_root.mode == "func")
   {
   _root.funcs[_root.data].push(_root.toExecute);
   if(_root.toExecute == "ret")
   {
   _root.mode = "exec";
   }
   }
   else
   {
   _root.command = _root.toExecute.substring(0,_root.toExecute.indexOf(" ") == -1?_root.toExecute.length:_root.toExecute.indexOf(" "));
   _root.data = _root.toExecute.substring(_root.toExecute.indexOf(" ") + 1);
   _root.interpret(_root.command,_root.data);
   }
   _root.programCounter++;
   if(_root.programCounter >= _root.readLocation.length)
   {
   panic();
   _root.doTick = false;
   if(_root.queue.length != 0)
   {
   _root.newData(_root.queue);
   _root.queue = [];
   }
   }
   };
   _root.tickCpu = function()
   {
   if(_root.doTick)
   {
   _root.cpu();
   }
   };
   _root.newData = function(arr)
   {
   if(_root.doTick)
   {
   i = 0;
   while(i < arr.length)
   {
   if(arr[i] == "clr")
   {
   _root.stack = [];
   _root.readVar = 0;
   }
   _root.stack.push(arr[i]);
   i++;
   }
   }
   else
   {
   _root.stack = arr;
   _root.doTick = true;
   _root.programCounter = 0;
   }
   };
   _root.cmd = "";
   _root.runCmd = function(data)
   {
   _root.newData([data]);
   _root.koopashellInput = false;
   };
   }
 */
