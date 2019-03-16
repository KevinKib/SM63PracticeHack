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

// Class that manages a time counter.
class TimeCounter {
	
	// Time variables
	private var frames;
	private var milliseconds;
	private var seconds;
	private var minutes;
	
	private var FRAMES_PER_SECOND;
	
	// Basic constructor
	public function TimeCounter() {
		this.frames = 0;
		this.milliseconds = 0;
		this.seconds = 0;
		this.minutes = 0;
		
		this.FRAMES_PER_SECOND = 0;
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
		
		if (this.frames >= this.FRAMES_PER_SECOND) {
			this.frames = 0;
			this.milliseconds = Math.floor((this.frames / this.FRAMES_PER_SECOND) * 1000);
			this.addSecond();
		}
	}
	
	// Adds a second to the timer, and manages everything that happens next.
	private function addSecond() {
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
		return obj;
	}
	
	// Returns a string displaying the current time.
	public function getDisplay() {
		var txtMilliseconds = this.milliseconds;
		if (this.milliseconds < 10) txtMilliseconds = "0" + txtMilliseconds;
		if (this.milliseconds < 100) txtMilliseconds = "0" + txtMilliseconds;
		trace(this.milliseconds);
		
		var txtSeconds = this.seconds;
		if (this.seconds < 10) txtSeconds = "0" + txtSeconds;
		
		var txtMinutes = this.minutes;
		if (this.minutes < 10) txtMinutes = "0" + this.minutes;
		
		return txtMinutes + ":" + txtSeconds + "." + txtMilliseconds;
		
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
	
	// Defines if the timer is going or not.
	private var start;
	
	// Tracks the real time, as it's going.
	private var realTime:TimeCounter;
	
	// Tracks the last update of the time.
	private var lastUpdatedTime:TimeCounter;
	
	
	// Constructor
	public function Timer() {
		this.start = false;
		this.realTime = new TimeCounter();
		this.lastUpdatedTime = new TimeCounter();
	}
	
	// Starts the timer.
	public function start() {
		this.start = true;
	}
	
	// Stops the timer.
	public function stop() {
		this.start = false;
	}
	
	// Updates the timer.
	public function update() {
		this.lastUpdatedTime = this.realTime.clone();
	}
	
	
	public function loop() {
		this.lastUpdatedTime.addFrame();
	}
	
	// Returns a string displaying the current time.
	public function getDisplay() {
		return this.lastUpdatedTime.getDisplay();
	}
	
}

var timer:Timer = new Timer();


count = 0;
minutes = 0;
seconds = 0;
milliseconds = 0;
frtxt = timer.getDisplay();
txtMinutes = "";
txtSeconds = "";
txtMilliseconds = "";
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
setStarCoins = function(bool)
{
   i = 1;
   while(i <= 64)
   {
      _root.StarCoin[i] = bool;
      i++;
   }
   _root.CalculateStarCoins();
};
setStars = function(bool)
{
   i = 1;
   while(i <= 64)
   {
      _root.Star[i] = bool;
      i++;
   }
   _root.CalculateStars();
};
setBowserKeys = function(bool)
{
   _root.BowserKey1 = bool;
   _root.BowserKey2 = bool;
   _root.BowserKey3 = bool;
};
setFludd = function(bool)
{
   _root.SaveFluddH = bool;
   _root.SaveFluddR = bool;
   _root.SaveFluddT = bool;
};
setFluddArray = function(bool)
{
   _root.FluddArray = ["",["",bool,bool,bool],["",bool,bool,bool],["",bool,bool,bool],["",bool,bool,bool],["",bool,bool,bool],["",bool,bool,bool],["",bool,bool,bool],["",bool,bool,bool],["",bool,bool,bool],["",bool,bool,bool],["",bool,bool,bool]];
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
executeCode = function()
{
   switch(code)
   {
      case 101:
         setStars(true);
         setStarCoins(true);
         setBowserKeys(true);
         setFluddArray(true);
         break;
      case 102:
         setStars(false);
         setStarCoins(false);
         setBowserKeys(true);
         setFluddArray(false);
         _root.Star[39] = true;
         _root.Star[41] = true;
         _root.Star[50] = true;
         _root.Star[51] = true;
         _root.CalculateStars();
         break;
      case 103:
         setStars(false);
         setStarCoins(false);
         setBowserKeys(false);
         setFluddArray(false);
         break;
      case 201:
         saveState();
         break;
      case 211:
         loadState();
         break;
      case 311:
         setStars(true);
         break;
      case 312:
         setStarCoins(true);
         break;
      case 313:
         setBowserKeys(true);
         break;
      case 314:
         setFluddArray(true);
      case 321:
         setStars(false);
         break;
      case 322:
         setStarCoins(false);
         break;
      case 323:
         setBowserKeys(false);
         break;
      case 324:
         setFludd(false);
         setFluddArray(false);
         _root.RestartFludd();
         _root.Fluddpow = "";
         break;
      case 401:
         setFludd(true);
         break;
      case 411:
         _root.SaveFluddH = !_root.SaveFluddH;
         break;
      case 412:
         _root.SaveFluddR = !_root.SaveFluddH;
         break;
      case 413:
         _root.SaveFluddT = !_root.SaveFluddH;
         break;
      case 501:
         _root.changecourse("StarIn","8-E1-1",0,0,0,0,100);
         break;
      case 511:
         _root.changecourse("StarIn","8-1",4128,-10,4128,-10);
         break;
      case 512:
         _root.changecourse("StarIn","8-2",0,0,0,0);
         break;
      case 513:
         _root.changecourse("downtransition2","8-10",500,-1450,500,-1450);
         break;
      case 514:
         _root.changecourse("uptransition2","8-10-b",500,-10,500,-10);
         break;
      case 521:
         _root.changecourse("StarIn","8-13",0,0,0,0,true);
         break;
      case 522:
         _root.changecourse("uptransition2","8-14",0,0,0,0);
         break;
      case 523:
         _root.changecourse("uptransition2","8-15",0,0,0,0);
         break;
      case 531:
         _root.changecourse("lefttransition2","BC-1",0,0,0,0);
         break;
      case 532:
         _root.changecourse("lefttransition2","BC-2",0,0,0,0);
         break;
      case 533:
         _root.changecourse("lefttransition2","BC-3",0,0,0,0);
         break;
      case 541:
         break;
      case 542:
         break;
      case 543:
         break;
      case 601:
         _root.CharLives = 99;
         break;
      case 602:
         _root.CharLives = 0;
         break;
      case 701:
         _root.WaterAmount = _root.TotalWater;
         break;
      case 702:
         _root.CharHP = 8;
         break;
      case 901:
         if(_root.CurrentPlayer == "Mario")
         {
            _root.CurrentPlayer = "Luigi";
            break;
         }
         _root.CurrentPlayer = "Mario";
         break;
   }
   _root.LatestCode = code;
   code = 0;
   codeValidated = false;
   gotoMenu(0);
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
_root.Timer_calculateSeconds = function()
{
   minutes = Math.floor(_root.ILTimerLastUpdate / (32 * 60));
   seconds = Math.floor(_root.ILTimerLastUpdate / 32) % 60;
   milliseconds = _root.ILTimerLastUpdate % 32;
   milliseconds = Math.floor(milliseconds * (1000 / 32));
   txtMinutes = minutes;
   txtSeconds = seconds;
   txtMilliseconds = milliseconds;
   if(minutes < 10)
   {
      txtMinutes = "0" + txtMinutes;
   }
   if(seconds < 10)
   {
      txtSeconds = "0" + txtSeconds;
   }
   if(milliseconds < 10)
   {
      txtMilliseconds = "00" + txtMilliseconds;
   }
   else if(milliseconds < 100)
   {
      txtMilliseconds = "0" + txtMilliseconds;
   }
};
_root.Timer_updateDisplay = function()
{
   if(_root.ILTimerState == "RUN" and _root.ILTimerUpdateMode == "ALWAYS")
   {
      _root.ILTimerLastUpdate = _root.ILTimer;
   }
   if(_root.ILTimerDispMode == "FRAMES")
   {
      _root.TextHint = _root.ILTimerLastUpdate + "\n" + text_1 + "\n" + text_2;
   }
   else
   {
      _root.Timer_calculateSeconds();
      _root.TextHint = txtMinutes + ":" + txtSeconds + "." + txtMilliseconds + "\n" + text_1 + "\n" + text_2;
   }
};
_root.Timer_addTime = function()
{
   if(_root.ILTimerState == "RUN")
   {
      _root.ILTimer = _root.ILTimer + 1;
   }
};
_root.Timer_start = function()
{
   _root.ILTimer = 0;
   _root.ILTimerLastUpdate = 0;
   _root.ILTimerState = "RUN";
   frtxt = "running";
   _root.Timer_updateDisplay();
};
_root.Timer_stop = function()
{
   _root.Timer_update();
   _root.ILTimerState = "STOP";
   if(_root.ILTimerDispMode == "FRAMES")
   {
      _root.TextHint = _root.ILTimer;
   }
   else
   {
      _root.Timer_calculateSeconds();
      _root.TextHint = txtMinutes + ":" + txtSeconds + "." + txtMilliseconds;
   }
   frtxt = "stopped";
};
_root.Timer_toggledisplay = function()
{
   if(_root.ILTimerDispMode == "NORMAL")
   {
      _root.ILTimerDispMode = "FRAMES";
   }
   else
   {
      _root.ILTimerDispMode = "NORMAL";
   }
   _root.Timer_updateDisplay();
};
_root.Timer_input = function()
{
   if(_root.ILTimerAvoidRepeat > 0)
   {
      _root.ILTimerAvoidRepeat = _root.ILTimerAvoidRepeat - 1;
   }
   if(_root.ILTimerCurrentMenu == 0)
   {
      text_1 = "";
      text_2 = "";
   }
   else
   {
      text_1 = "Enter your code ! (Press * to use the latest code)";
      text_2 = code;
   }
   if(_root.ILTimerAvoidRepeat == 0)
   {
      if(_root.ILTimerCurrentMenu == 0)
      {
         if(_root.KeyPlus())
         {
            if(_root.ILTimerState == "RUN")
            {
               _root.Timer_stop();
            }
            else
            {
               _root.Timer_start();
            }
            _root.ILTimerAvoidRepeat = KEY_REPEAT_DELAY;
         }
         if(_root.KeyMinus())
         {
            if(_root.ILTimerUpdateMode == "ALWAYS")
            {
               _root.ILTimerUpdateMode = "LOADINGZONE";
            }
            else
            {
               _root.ILTimerUpdateMode = "ALWAYS";
            }
            _root.ILTimerAvoidRepeat = KEY_REPEAT_DELAY;
         }
         if(_root.KeyStar())
         {
            gotoMenu(1);
            _root.ILTimerAvoidRepeat = KEY_REPEAT_DELAY;
         }
         if(_root.Key1())
         {
            loadState();
         }
         if(_root.Key0())
         {
            saveState();
         }
      }
      else if(_root.ILTimerCurrentMenu == 1)
      {
         codeValidated = false;
         enterCode();
         if(codeValidated)
         {
            executeCode();
         }
         _root.ILTimerMenuDelay--;
         if(_root.ILTimerMenuDelay == 0)
         {
            gotoMenu(0);
         }
      }
   }
};
_root.Timer_updateTime = function()
{
   _root.ILTimerLastUpdate = _root.ILTimer;
};
_root.Timer_update = function()
{
   _root.Timer_updateTime();
   _root.Timer_updateDisplay();
};
if(_root.ILTimerState == "STOP")
{
   _root.Timer_start();
}
_root.Timer_update();
stop();
onEnterFrame = function()
{
   _root.Timer_updateDisplay();
   _root.Timer_input();
   _root.Timer_addTime();
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
