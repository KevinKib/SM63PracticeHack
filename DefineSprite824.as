// OG Code
if((_root._quality == "BEST" || _root._quality == "HIGH") && _root.AutoQuality == true)
{
   _root.Qualitynum--;
}
qn = _root.Qualitynum;
qn2 = 0;
_root._quality = _root.QualityArray[qn];
time = getTimer();


// Seka code

frtxt = _root.Timer.getDisplay();


i = 1;
code = 0;
input = 0;
_root.ILTimerCurrentMenu = 0;
text_currentTime = "";
text_1 = "";
text_2 = "";
KEY_REPEAT_DELAY = 5;
MENU_OPEN_LENGTH = 150;
enterCode = function()
{
   input = -1;
   if(_root.Key1())
   {
      input = 1;
   }
   else if(_root.Key2())
   {
      input = 2;
   }
   else if(_root.Key3())
   {
      input = 3;
   }
   else if(_root.Key4())
   {
      input = 4;
   }
   else if(_root.Key5())
   {
      input = 5;
   }
   else if(_root.Key6())
   {
      input = 6;
   }
   else if(_root.Key7())
   {
      input = 7;
   }
   else if(_root.Key8())
   {
      input = 8;
   }
   else if(_root.Key9())
   {
      input = 9;
   }
   else if(_root.Key0())
   {
      input = 0;
   }
   else if(_root.KeyBackspace())
   {
      input = 11;
   }
   else if(_root.KeyEnter())
   {
      input = 12;
   }
   else if(_root.KeyStar())
   {
      input = 13;
   }
   if(input == 11)
   {
      code = Math.floor(code / 10);
   }
   else if(input >= 0 && input <= 9)
   {
      code = code * 10 + input;
   }
   else if(input == 12)
   {
      codeValidated = true;
   }
   else if(input == 13)
   {
      code = _root.LatestCode;
      codeValidated = true;
   }
   if(input != -1)
   {
      _root.ILTimerAvoidRepeat = KEY_REPEAT_DELAY;
      _root.ILTimerMenuDelay = MENU_OPEN_LENGTH;
   }
};
gotoMenu = function(nbMenu)
{
   if(nbMenu == 0)
   {
      _root.ILTimerMenuDelay = 0;
   }
   else
   {
      _root.ILTimerMenuDelay = MENU_OPEN_LENGTH;
   }
   _root.ILTimerCurrentMenu = nbMenu;
};

saveState = function()
{
   i = 1;
   while(i <= 64)
   {
      _root.Save_Star[i] = _root.Star[i];
      i++;
   }
   i = 1;
   while(i <= 64)
   {
      _root.Save_StarCoin[i] = _root.StarCoin[i];
      i++;
   }
   i = 1;
   while(i <= 12)
   {
      _root.Save_FluddArray[i] = _root.FluddArray[i];
      i++;
   }
};
loadState = function()
{
   i = 1;
   while(i <= 64)
   {
      _root.Star[i] = _root.Save_Star[i];
      i++;
   }
   _root.CalculateStars();
   i = 1;
   while(i <= 64)
   {
      _root.StarCoin[i] = _root.Save_StarCoin[i];
      i++;
   }
   _root.CalculateStarCoins();
   i = 1;
   while(i <= 12)
   {
      _root.FluddArray[i] = _root.Save_FluddArray[i];
      i++;
   }
};


class CodeManager {
	
	private var codeList;
	
	// Constructor.
	public function CodeManager() {
		this.codeList = new Array();
	}
	
	// Adds a new code to the code list.
	public function add(code) {
		this.codeList.push(code);
	}
	
	// Executes a specific code.
	public function execute(code) {
		for (var i = 0; i < this.codeList.length; i++) {
			this.codeList[i].execute(code);
		}
	}
	
}

class Code {
	
	// Identifier of the code
	private var index;
	
	// Function sent as a callback that will be executed
	private var func;
	
	// Constructor
	public function Code(index, func) {
		this.index = index;
		this.func = func;
	}
	
	
	// Executes the code, if the index is valid.
	public function execute(i) {
		if (this.index == i) {
			this.func();
		}
	}
	
	// Executes the code, no matter what.
	private function executeImmediate() {
		this.func();
	}

}

class Utils {
	
	// Sets the state of every star coin.
	public static function setStarCoins(bool)
	{
	   i = 1;
	   while(i <= 64)
	   {
		  _root.StarCoin[i] = bool;
		  i++;
	   }
	   _root.CalculateStarCoins();
	}
	
	// Sets the state of every star.
	public static function setStars(bool)
	{
	   i = 1;
	   while(i <= 64)
	   {
		  _root.Star[i] = bool;
		  i++;
	   }
	   _root.CalculateStars();
	}
	
	// Sets the state of every bowser key.
	public static function setBowserKeys(bool)
	{
	   _root.BowserKey1 = bool;
	   _root.BowserKey2 = bool;
	   _root.BowserKey3 = bool;
	}
	
	// Sets the state of one specific bowser key.
	public static function setBowserKey(number, bool) {
		switch(number) {
			case 1:
				_root.BowserKey1 = bool;
				break;
			case 2:
				_root.BowserKey2 = bool;
				break;
			case 3:
				_root.BowserKey3 = bool;
				break;
		
		}
	}
	
	// Sets the state of the current saved fludd nozzles.
	public static function setSaveFludd(bool)
	{
	   _root.SaveFluddH = bool;
	   _root.SaveFluddR = bool;
	   _root.SaveFluddT = bool;
	}
	
	// Sets the state of every fludd stored in levels.
	public static function setFluddArray(bool)
	{
		_root.FluddArray = ["",
		["", bool, bool, bool],
		["", bool, bool, bool],
		["", bool, bool, bool],
		["", bool, bool, bool],
		["", bool, bool, bool],
		["", bool, bool, bool],
		["", bool, bool, bool],
		["", bool, bool, bool],
		["", bool, bool, bool],
		["", bool, bool, bool],
		["",bool,bool,bool]];
	}
	
	// Sets the state of the fludd in one specific playing level.
	public static function setFludd(playingLevel, bool) {
		
		if (playingLevel < 1) playingLevel = 1;
		if (playingLevel > 11) playingLevel = 11;
		
		_root.FluddArray[playingLevel][1] = bool;
		_root.FluddArray[playingLevel][2] = bool;
		_root.FluddArray[playingLevel][3] = bool;
	}
	
	
	
	
}

var codeManager = new CodeManager();
codeManager.add(new Code(101, function() {
	Utils.setStars(true);
	Utils.setStarCoins(true);
	Utils.setBowserKeys(true);
	Utils.setFluddArray(true);
}));

codeManager.add(new Code(102, function() {
	Utils.setStars(false);
	Utils.setStarCoins(false);
	Utils.setBowserKeys(true);
	Utils.setFluddArray(false);
	_root.Star[39] = true;
	_root.Star[41] = true;
	_root.Star[50] = true;
	_root.Star[51] = true;
	_root.CalculateStars();
}));

codeManager.add(new Code(103, function() {
	Utils.setStars(false);
	Utils.setStarCoins(false);
	Utils.setBowserKeys(false);
	Utils.setFluddArray(false);
}));

codeManager.add(new Code(201, function() {
	//Utils.saveState();
}));

codeManager.add(new Code(211, function() {
	//Utils.loadState();
}));

codeManager.add(new Code(311, function() {
	Utils.setStars(true);
}));

codeManager.add(new Code(312, function() {
	Utils.setStarCoins(true);
}));

codeManager.add(new Code(313, function() {
	Utils.setBowserKeys(true);
}));

codeManager.add(new Code(314, function() {
	Utils.setSaveFluddArray(true);
}));

codeManager.add(new Code(321, function() {
	Utils.setStars(false);
}));

codeManager.add(new Code(322, function() {
	Utils.setStarCoins(false);
}));

codeManager.add(new Code(323, function() {
	Utils.setBowserKeys(false);
}));

codeManager.add(new Code(324, function() {
	Utils.setSaveFludd(false);
	Utils.setFluddArray(false);
	_root.RestartFludd();
	_root.Fluddpow = "";
}));

codeManager.add(new Code(401, function() {
	Utils.setSaveFludd(true);
}));

codeManager.add(new Code(411, function() {
	_root.SaveFluddH = !_root.SaveFluddH;
}));

codeManager.add(new Code(412, function() {
	_root.SaveFluddR = !_root.SaveFluddR;
}));

codeManager.add(new Code(413, function() {
	_root.SaveFluddT = !_root.SaveFluddT;
}));

codeManager.add(new Code(601, function() {
	_root.CharLives = 99;
}));

codeManager.add(new Code(602, function() {
	_root.CharLives = 0;
}));

codeManager.add(new Code(701, function() {
	_root.WaterAmount = _root.TotalWater;
}));

codeManager.add(new Code(711, function() {
	_root.CharHP = 8;
}));

codeManager.add(new Code(712, function() {
	_root.CharHP = 1;
}));

codeManager.add(new Code(901, function() {
	if(_root.CurrentPlayer == "Mario")
	{
		_root.CurrentPlayer = "Luigi";
	}
	else {
		_root.CurrentPlayer = "Mario";
	}
}));

executeCode = function()
{
   _root.LatestCode = code;
   code = 0;
   codeValidated = false;
   gotoMenu(0);
};

stop();
onEnterFrame = function()
{
	_root.Timer.loop();
	_root.Timer.update();
	_root.TextHint = _root.Timer.getDisplay();
	if(_root.KeySlash())
	{
		_root.koopashellInput = true;
	}
	_root.tickCpu();
	setCollision();
};



// Jhyn code
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
   trace("installed");
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
      trace(command + ", " + data);
      switch(command)
      {
         case "def":
            _root.funcs[data] = [];
            trace("func " + data + ": " + _root.funcs[data]);
            _root.mode = "func";
            break;
         case "ret":
            trace("ret to: " + _root.returnAddress);
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
               trace(_root.acc + ", " + eval(data));
            }
            else
            {
               trace("loading from array");
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
            trace(_root.acc);
            break;
         case "out":
            trace(_root.acc);
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
            trace(eval(data));
            trace(_root.arrAcc);
            _root.modeBak = _root.mode;
            _root.mode = "arr";
            break;
         case "carr":
            if(!data || data == "carr")
            {
               data = _root.acc;
            }
            set(data,_root.arrAcc);
            trace(eval(data));
            trace(_root.arrAcc);
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
                  trace("Script load failed");
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
               trace("curFunc: " + _root.curFunc);
               _root.readVar = 1;
               _root.returnAddress = _root.programCounter;
               _root.programCounter = -1;
               _root.cycleAcc(data);
               break;
            }
            trace("inval: " + command + " " + data);
            break;
      }
   };
   _root.cpu = function()
   {
      trace("doCycle " + _root.programCounter);
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
      trace("readLoc: " + _root.readLocation);
      if(_root.mode == "func")
      {
         trace("Adding " + _root.toExecute + " to " + _root.data);
         _root.funcs[_root.data].push(_root.toExecute);
         if(_root.toExecute == "ret")
         {
            trace("func " + _root.data + ": " + _root.funcs[_root.data]);
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
         trace("panic: " + _root.programCounter + ", " + _root.readLocation.length);
         panic();
         _root.doTick = false;
         trace("end");
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
   _root.allowedKeys = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_:/.,\\\'%;*+\" [](){}=";
   _root.cmd = "";
   _root.runCmd = function(data)
   {
      trace(data);
      _root.newData([data]);
      _root.koopashellInput = false;
   };
   var keyListener = new Object();
   keyListener.onKeyDown = function()
   {
      if(_root.koopashellInput)
      {
         trace(Key.getCode() + ", " + chr(Key.getCode()) + ", " + Key.getAscii() + ", " + chr(Key.getAscii()) + ", " + _root.allowedKeys.indexOf(chr(Key.getAscii())) + ", " + _root.cmd.length);
         if(_root.allowedKeys.indexOf(chr(Key.getAscii())) != -1)
         {
            _root.cmd = _root.cmd + chr(Key.getAscii());
         }
         else
         {
            switch(Key.getAscii())
            {
               case 127:
                  _root.cmd = _root.cmd.substring(0,_root.cmd.length - 1);
                  break;
               case 8:
                  _root.cmd = _root.cmd.substring(0,_root.cmd.length - 1);
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
