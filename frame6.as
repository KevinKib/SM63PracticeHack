// Variable definitions
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
	
	// Sets the state of a specific star coin.
	public static function setStarCoin(number, bool) {
		
		if (bool == undefined) {
			_root.StarCoin[number] = !_root.StarCoin[number];
		}
		else {
			_root.StarCoin[number] = bool;
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
	
	// Sets the state of a specific star.
	public static function setStar(number, bool) {
		if (bool == undefined) {
			_root.Star[number] = !_root.Star[number];
		}
		else {
			_root.Star[number] = bool;
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

// Class that manages everything related to displayed text.
class TextManager {
	
	private var row1;
	private var row2;
	private var row3;
	private var row4;
	private var row5;
	private var row6;

	public function TextManager() {
		this.row1 = "";
		this.row2 = "";
		this.row3 = ""; 
		this.row4 = "";
		this.row5 = "";
		this.row6 = "";
	}
	
	public function write(row, text) {
		switch(row) {
			case 1: this.row1 = text; break;
			case 2: this.row2 = text; break;
			case 3: this.row3 = text; break;
			case 4: this.row4 = text; break;
			case 5: this.row5 = text; break;
			case 6: this.row6 = text; break;
		}
		
		_root.TextHint = this.row1 + "\n"
						+ this.row2 + "\n"
						+ this.row3 + "\n"
						+ this.row4 + "\n"
						+ this.row5 + "\n" 
						+ this.row6;
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
	
	// Basic constructor
	public function TimeCounter() {
		this.frames = 0;
		this.milliseconds = 0;
		this.seconds = 0;
		this.minutes = 0;
		
		this.FRAMES_PER_SECOND = 32;
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
	private var started;
	
	// Tracks the real time, as it's going.
	private var realTime:TimeCounter;
	
	// Tracks the last update of the time.
	private var lastUpdatedTime:TimeCounter;
	
	
	// Constructor
	public function Timer() {
		this.reset();
	}
	
	// Resets the timer.
	public function reset() {
		this.started = false;
		this.realTime = new TimeCounter();
		this.lastUpdatedTime = new TimeCounter();
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
	
	
	public function loop() {
		if (this.started == true) {
			this.realTime.addFrame();
		}
	}
	
	// Returns a string displaying the current time.
	public function getDisplay() {
		return this.lastUpdatedTime.getDisplay();
	}
	
}

// Class that defines a code and its effects.
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
	public function execute(code) {
		
		var command = code.split(' ');
		
		if (this.index == command[0]) {
			this.func(command);
		}
	}
	
	// Executes the code, no matter what.
	private function executeImmediate() {
		this.func();
	}

}

// Class that manages how codes behave overall.
class CodeManager {
	
	private var codeList;
	
	// Constructor.
	public function CodeManager() {
		this.codeList = new Array();
		this.input = true;
		this.currentCode = "";
		this.delay = 2;
		
		this.initKeyListener();
		this.initCodes();
		
	}
	
	// Creates the key listener.
	public function initKeyListener() {
		var allowedKeys = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_:/.,\\\'%;*+\" [](){}=";
		var keyListener = new Object();
		keyListener.onKeyDown = function()
		{
			if (_root.codeManager.getInput()) {
				if (_root.codeManager.getDelay() == 0) {
					trace(Key.getCode() + ", " + chr(Key.getCode()) + ", " + Key.getAscii() + ", " + chr(Key.getAscii()) + ", " + _root.allowedKeys.indexOf(chr(Key.getAscii())) + ", " + _root.cmd.length);
					if(allowedKeys.indexOf(chr(Key.getAscii())) != -1)
					{
						_root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode() + chr(Key.getAscii()));
					}
					else
					{
						switch(Key.getAscii())
						{
						   case 127:
							  _root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode().substring(0,_root.codeManager.getCurrentCode().length - 1));
							  break;
						   case 8:
							  _root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode().substring(0,_root.codeManager.getCurrentCode().length - 1));
							  break;
						   case 13: // Enter
							  _root.codeManager.execute(_root.codeManager.getCurrentCode());
							  _root.codeManager.setCurrentCode("");
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
				else {
					_root.codeManager.reduceDelay();
				}
			}
		}
		Key.addListener(keyListener);
	}
	
	// Creates the codes and adds them to the code list.
	public function initCodes() {
		this.add(new Code(101, function() {
			Utils.setStars(true);
			Utils.setStarCoins(true);
			Utils.setBowserKeys(true);
			Utils.setFluddArray(true);
		}));

		this.add(new Code(102, function() {
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

		this.add(new Code(103, function() {
			Utils.setStars(false);
			Utils.setStarCoins(false);
			Utils.setBowserKeys(false);
			Utils.setFluddArray(false);
		}));

		this.add(new Code(201, function() {
			//Utils.saveState();
		}));

		this.add(new Code(211, function() {
			//Utils.loadState();
		}));

		this.add(new Code(311, function() {
			Utils.setStars(true);
		}));

		this.add(new Code(312, function() {
			Utils.setStarCoins(true);
		}));

		this.add(new Code(313, function() {
			Utils.setBowserKeys(true);
		}));

		this.add(new Code(314, function() {
			Utils.setSaveFluddArray(true);
		}));

		this.add(new Code(321, function() {
			Utils.setStars(false);
		}));

		this.add(new Code(322, function() {
			Utils.setStarCoins(false);
		}));

		this.add(new Code(323, function() {
			Utils.setBowserKeys(false);
		}));

		this.add(new Code(324, function() {
			Utils.setSaveFludd(false);
			Utils.setFluddArray(false);
			_root.RestartFludd();
			_root.Fluddpow = "";
		}));

		this.add(new Code(401, function() {
			Utils.setSaveFludd(true);
		}));
		
		this.add(new Code('bowserkey', function(command) {
			
			if (command[2] == 'true') {
				Utils.setBowserKey(command[1], true);
			}
			else if (command[2] == 'false') {
				Utils.setBowserKey(command[1], false);
			}
			else {
				Utils.setBowserKey(command[1]);
			}
			
		}));
		
		this.add(new Code('star', function(command) {
			
			if (command[2] == 'true') {
				Utils.setStar(command[1], true);
			}
			else if (command[2] == 'false') {
				Utils.setStar(command[1], false);
			}
			else {
				Utils.setStar(command[1]);
			}
			
		}));
		
		this.add(new Code('starcoin', function(command) {
			
			if (command[2] == 'true') {
				Utils.setStarCoin(command[1], true);
			}
			else if (command[2] == 'false') {
				Utils.setStarCoin(command[1], false);
			}
			else {
				Utils.setStarCoin(command[1]);
			}
			
		}));

		this.add(new Code('fludd', function(command) {
			
			switch(command[1]) {
				case 'all':
					_root.SaveFluddH = true;
					_root.SaveFluddR = true;
					_root.SaveFluddT = true;
					break;
				case 'H':
					_root.SaveFluddH = !_root.SaveFluddH;
					break;
				case 'R':
					_root.SaveFluddR = !_root.SaveFluddR;
					break;
				case 'T':
					_root.SaveFluddT = !_root.SaveFluddT;
					break;
				case 'none':
					_root.SaveFluddH = false;
					_root.SaveFluddR = false;
					_root.SaveFluddT = false;
					_root.Fluddpow = "";
					break;
			}
		}));

		this.add(new Code('lives', function(command) {
			_root.CharLives = command[1];
		}));

		this.add(new Code('water', function(command) {
			if (command[1] == 'refill') {
				_root.WaterAmount = _root.TotalWater;
			}
			else if (command[1] == 'half') {
				_root.WaterAmount = 5000;
			}
			else if (command[1] == 'empty') {
				_root.WaterAmount = 0;
			}
			else {
				_root.WaterAmount = command[1];
			}
		}));

		this.add(new Code('health', function(command) {
			if (command[1] == 'refill') {
				_root.CharHP = 8;
			}
			else if (command[1] == 'empty') {
				_root.CharHP = 1;
			}
			else if (command[1] == 'death') {
				_root.CharHP = 0;
			}
			else {
				_root.CharHP = command[1];
			}
		}));

		this.add(new Code('char', function(command) {
			
			switch(command[1]) {
				case 'mario' :
					_root.CurrentPlayer = 'Mario';
					break;
				case 'luigi' :
					_root.CurrentPlayer = 'Luigi';
					break;
				case 'toggle' :
					if(_root.CurrentPlayer == "Mario")
					{
						_root.CurrentPlayer = "Luigi";
					}
					else {
						_root.CurrentPlayer = "Mario";
					}
					break;
			}
			
			
		}));

	}
	
	// Adds a new code to the code list.
	public function add(code) {
		this.codeList.push(code);
	}
	
	// Executes a specific code.
	public function execute(code) {
		var i = 0;
		for (i = 0; i < this.codeList.length; i = i + 1) {
			this.codeList[i].execute(code);
		}
	}
	
	// Defines the code that happens on each frame.
	public function loop() {
		_root.textManager.write(2, this.currentCode);
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
		if (this.delay < 0) this.delay = 0;
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
_root.timer.start();
_root.textManager = new TextManager();
_root.codeManager = new CodeManager();
