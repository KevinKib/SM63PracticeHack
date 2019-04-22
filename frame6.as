// Variable definitions
class Utils {
	
	private var latestWarpPosition;
	
	// Constructor of the Utils class.
	public function constructor() {
		this.latestWarpPosition = [0, 0, 0, 0];
	}
	
	// Warps the player to a certain course.
	public function warp(title, playerX, playerY, cameraX, cameraY) {
		_root.changecourse("StarIn", title, cameraX, cameraY, playerX, playerY, true);
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
		return this.latestWarpPosition[0] +  ' ' + this.latestWarpPosition[1] +  ' ' + this.latestWarpPosition[2] +  ' ' + this.latestWarpPosition[3];
	}
	
	// Sets the state of every star coin.
	public function setStarCoins(bool) {
	   i = 1;
	   while(i <= 64)
	   {
		  _root.StarCoin[i] = bool;
		  i++;
	   }
	   _root.CalculateStarCoins();
	}
	
	// Sets the state of a specific star coin.
	public function setStarCoin(number, bool) {
		
		if (bool == undefined) {
			_root.StarCoin[number] = !_root.StarCoin[number];
		}
		else {
			_root.StarCoin[number] = bool;
		}
		_root.CalculateStarCoins();
	}
	
	// Sets the state of every star.
	public function setStars(bool) {
	   i = 1;
	   while(i <= 64)
	   {
		  _root.Star[i] = bool;
		  i++;
	   }
	   _root.CalculateStars();
	}
	
	// Sets the state of a specific star.
	public function setStar(number, bool) {
		if (bool == undefined) {
			_root.Star[number] = !_root.Star[number];
		}
		else {
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
	public function setSaveFludd(bool) {
	   _root.SaveFluddH = bool;
	   _root.SaveFluddR = bool;
	   _root.SaveFluddT = bool;
	}
	
	// Sets the state of every fludd stored in levels.
	public function setFluddArray(bool) {
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
	
	public function setWorldNozzle(world, nozzle, boolText) {
		
		var worldNb = 0;
		var nozzleNb = 3;
		
		var setAllWorlds = false;
		var setAllNozzles = false;
		
		var worlds = new Array();
		worlds.push('bob', 'sl', 'hmc', 'bm', 'lll', 'ttm', 'rr', 'bt3', 'ssl', 'wdw', 'ttc');
		var nozzles = new Array();
		nozzles.push('h', 'r', 't');
		
		// World order has to be checked
		switch(world) {
			case 'bob': worldNb = 1; break;
			case 'sl':  worldNb = 2; break;
			case 'hmc': worldNb = 3; break;
			case 'bm':  worldNb = 4; break;
			case 'lll': worldNb = 5; break;
			case 'ttm': worldNb = 6; break;
			case 'rr':  worldNb = 7; break;
			case 'bt3': worldNb = 8; break;
			case 'ssl': worldNb = 9; break;
			case 'wdw': worldNb = 10; break;
			case 'ttc': worldNb = 11; break;
			case 'all': 
				var i = 0;
				for (i = 0; i < 10; i++) {
					_root.utils.setWorldNozzle(worlds[i], nozzle, boolText);
				}
				break;
		}
		
		switch(nozzle) {
			case 'all':
				var j = 0;
				for (j = 0; j < 2; j++) {
					_root.utils.setWorldNozzle(world, nozzles[j], boolText);
				}
				break;
			case 'h': case 'H': nozzleNb = 1; break;
			case 'r': case 'R': nozzleNb = 2; break;
			case 't': case 'T': nozzleNb = 3; break;
		}
		
		switch(boolText) {
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
		
		if (playingLevel < 1) playingLevel = 1;
		if (playingLevel > 11) playingLevel = 11;
		
		_root.FluddArray[playingLevel][1] = bool;
		_root.FluddArray[playingLevel][2] = bool;
		_root.FluddArray[playingLevel][3] = bool;
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

// Class that manages the code that happens on certain occurences.
class Event {
	
	// Triggers code that happens on each frame.
	public function onEachFrame() {
		_root.timer.onEachFrame();
		_root.timer.update();
		_root.codeManager.onEachFrame();
		_root.textManager.write(1,_root.timer.getDisplay());
	}
	
	// Triggers code that happens on every loading zone.
	public function onLoadingZone() {
		_root.timer.onLoadingZone();
		_root.textManager.write(4, _root.timer.getDisplay());
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
	
	// Defines if the timer will start on the next loading zone.
	private var startOnLoadingZone;
	
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
	
	// Manages the code that happens on each frame.
	public function onEachFrame() {
		if (this.started == true) {
			this.realTime.addFrame();
		}
	}
	
	// Manages the code that happens when entering a loading zone.
	public function onLoadingZone() {
		if (this.startOnLoadingZone) {
			this.start();
			this.startOnLoadingZone = false;
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
	private var indexList;
	
	// Function sent as a callback that will be executed
	private var func;
	
	// Constructor
	public function Code(index, func) {
		this.indexList = index.split(' ');
		this.func = func;
	}
	
	// Executes the code, if the index is valid.
	public function execute(code) {
		
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
	
	private var il;
	
	// Constructor.
	public function CodeManager() {
		this.codeList = new Array();
		this.input = true;
		this.currentCode = "";
		this.delay = 0;
		this.il = new IndividualLevel();
		
		this.initKeyListener();
		this.initCodes();
	}
	
	// Creates the key listener.
	public function initKeyListener() {
		var allowedKeys = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_:/.,\\\'%;*+\" [](){}=";
		var keyListener = new Object();
		keyListener.onKeyDown = function()
		{
			if (_root.codeManager.delay > 0) {
				if (_root.codeManager.getInput()) {
					trace(Key.getCode() + ", " + chr(Key.getCode()) + ", " + Key.getAscii() + ", " + chr(Key.getAscii()) + ", " + _root.allowedKeys.indexOf(chr(Key.getAscii())) + ", " + _root.cmd.length);
					if(allowedKeys.indexOf(chr(Key.getAscii())) != -1)
					{
						_root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode() + chr(Key.getAscii()));
						_root.codeManager.resetDelay();
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
	public function initCodes() {
		
		this.add(new Code(311, function() {
			_root.utils.setStars(true);
		}));

		this.add(new Code(312, function() {
			_root.utils.setStarCoins(true);
		}));

		this.add(new Code(313, function() {
			_root.utils.setBowserKeys(true);
		}));

		this.add(new Code(314, function() {
			_root.utils.setSaveFluddArray(true);
		}));

		this.add(new Code('nozzle', function(command) {
			var world = command[1];
			var nozzle = command[2];
			var bool = command[3];
			if (world === undefined || nozzle === undefined || bool === undefined) {
				_root.textManager.write(5, 'Invalid syntax.');
				return;
			}
			_root.utils.setWorldNozzle(world, nozzle, bool);
		}));

		this.add(new Code('doorwarp', function(command) {
			_root.utils.warpDoor(command[1]);
		}));

		this.add(new Code('position pos', function(command) {
			_root.textManager.write(5, _root.utils.getPositionString() + ' | | '  + _root.Course.Char._x + ' ' + _root.Course.Char._y + ' | ' + _root.Course.FrontGFX._x + ' ' + _root.Course.FrontGFX._y + ' | ' +_root.Course.Char._X + ' ' + _root.Course.Char._Y);
		}));

		this.add(new Code('latestwarpposition lwp', function(command) {
			_root.textManager.write(5, _root.utils.getLevelName() + ' ' + _root.utils.getLatestWarpPositionString());
		}));

		this.add(new Code('levelname ln', function(command) {
			_root.textManager.write(5, _root.utils.getLevelName() );
		}));
		
		this.add(new Code('individuallevel il', function(command) {
			// Would be easier to maintain with OOP for worlds
			
			var IL = _root.codeManager.getIL();
			
			var level = command[1];
			var type = command[2];
			//var starnum = command[3];
			var starnum = parseInt(command[3]);
			
			if (type != 'all' && type != '100' && type != 'stars' && type != 'star' && type != 'starcoins') {
				_root.textManager.write(5, 'Invalid IL command.');
				return;
			}
			
			var levelTitle = '';
			var startingLevel = '';
			var posA = 0;
			var posB = 0;
			var posC = 0;
			var posD = 0;
			
			var requiredStars = new Array();
			var requiredStarCoins = new Array();
			var emptyArray = new Array();
						
			var mode = 'none';
			
			switch(level) {
				case 'bob':
					requiredStars.push(1, 2, 3, 4, 5);
					requiredStarCoins.push(1, 2, 3, 4, 5, 6);
					levelTitle = 'Bom-Omb Battlefield';
					startingLevel = "C-2";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'sl':
					requiredStars.push(6, 7, 8, 9, 10);
					requiredStarCoins.push(7, 8, 6, 10, 11, 12);
					levelTitle = "Snowman's Land";
					startingLevel = "C-2-2";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'hmc':
					requiredStars.push(11, 12, 13, 14, 15);
					requiredStarCoins.push(13, 14, 15, 16, 17, 18);
					levelTitle = "Hazy Maze Cave";
					startingLevel = "C-7";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'bm':
					requiredStars.push(16, 17, 18, 19, 20);
					requiredStarCoins.push(19, 20, 21, 22, 23, 24);
					levelTitle = "Boo's Mansion";
					startingLevel = "C-8";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'lll':
					requiredStars.push(21, 22, 23, 24, 25);
					requiredStarCoins.push(25, 26, 27, 28, 29, 30);
					levelTitle = "Lethal Lava Land";
					startingLevel = "C-10";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'ttm':
					requiredStars.push(26, 27, 28, 29, 30);
					requiredStarCoins.push(31, 32, 33, 34, 35, 36);
					levelTitle = "Tall Tall Mountain";
					startingLevel = "C-10";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'rr':
					requiredStars.push(31, 32, 33, 34, 35);
					requiredStarCoins.push(37, 38, 39, 40, 41, 42);
					levelTitle = "Rainbow Ride";
					startingLevel = "C-12";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'ssl':
					requiredStars.push(55, 56, 57);
					requiredStarCoins.push(43, 44, 45);
					levelTitle = "Shifting Sand Land";
					startingLevel = "C-3";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'wdw':
					requiredStars.push(58, 59, 60);
					requiredStarCoins.push(46, 47, 48);
					levelTitle = "Wet Dry World";
					startingLevel = "C-8";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'ttc':
					requiredStars.push(61, 62, 63);
					requiredStarCoins.push(49, 50, 51);
					levelTitle = "Tick Tock Clock";
					startingLevel = "C-12";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'sotm':
					requiredStars.push(44);
					requiredStarCoins.push(59);
					levelTitle = "Secret of the Mushroom";
					startingLevel = "C-1";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'tidal':
					requiredStars.push(45);
					requiredStarCoins.push(60);
					levelTitle = "Tidal Isles";
					startingLevel = "C-3-2";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'jrb':
					requiredStars.push(46);
					levelTitle = "Jolly Roger Bay";
					startingLevel = "C-4H";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'thwc':
					requiredStars.push(47);
					levelTitle = "Thwomp's Castle";
					startingLevel = "C-8";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'ff':
					requiredStars.push(48);
					requiredStarCoins.push(63);
					levelTitle = "Frosty Fludd";
					startingLevel = "C-7";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'sots':
					requiredStars.push(49);
					requiredStarCoins.push(58);
					levelTitle = "Secret of the Sky";
					startingLevel = "C-7";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'mm':
					requiredStars.push(52);
					requiredStarCoins.push(55);
					levelTitle = "Magma Maze";
					startingLevel = "C-10";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'coe':
					requiredStars.push(53);
					levelTitle = "Cave of Empuzzlement";
					startingLevel = "C-10";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'gos':
					requiredStars.push(54);
					levelTitle = "Galaxy of Stars";
					startingLevel = "C-12";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
				case 'eotmk':
					requiredStars.push(64);
					requiredStarCoins.push(64);
					levelTitle = "Edge of the Mushroom Kingdom";
					startingLevel = "Castle";
					posA = 0;
					posB = 0;
					posC = 0;
					posD = 0;
					break;
			}

			switch(type) {
				case 'all': case '100':
					IL.setRequiredStars(requiredStars);
					IL.setRequiredStarCoins(requiredStarCoins);
					mode = 'All';
					break;
				case 'stars': case 'star':
					IL.setRequiredStarCoins(emptyArray);
					if (!isNaN(starnum) && (starnum >= 1 && starnum <= 5)) {
						IL.setRequiredStars(requiredStars[starnum - 1]);
						mode = 'Star '+starnum;
					}
					else {
						IL.setRequiredStars(requiredStars);
						mode = 'Stars';
					}
					break;
				case 'starcoins':
					IL.setRequiredStars(emptyArray);
					IL.setRequiredStarCoins(requiredStarCoins);
					mode = 'Star Coins';
					break;
				default:
					mode = 'None';
			}
			
			_root.textManager.write(5, 'Current IL : ' + levelTitle+' | ' + mode);
			//_root.utils.warp(startingLevel, posA, posB, posC, posD);
			IL.start(level);
		}));
		
		this.add(new Code('warp w', function(command) {
			
			var level = command[1];
			var param_1 = command[2];
			var param_2 = command[3];
			var param_3 = command[4];
			var param_4 = command[5];
			
			if (level != undefined) {
				if (param_1 == undefined) param_1 = 0;
				if (param_2 == undefined) param_2 = 0;
				if (param_3 == undefined) param_3 = 0;
				if (param_4 == undefined) param_4 = 0;
				
				_root.utils.warp(command[1],param_1,param_2,param_3,param_4);
			}
			
		}));
		
		this.add(new Code('file f', function(command) {
			
			switch(command[1]) {
				case 'complete':
					_root.utils.setStars(true);
					_root.utils.setStarCoins(true);
					_root.utils.setBowserKeys(true);
					_root.utils.setFluddArray(true);
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
					break;
				case 'empty':
					_root.utils.setStars(false);
					_root.utils.setStarCoins(false);
					_root.utils.setBowserKeys(false);
					_root.utils.setFluddArray(false);
					break;
			}
			
		}));
		
		this.add(new Code('timer t', function(command) {

			switch(command[1]) {
				case 'start':
					_root.timer.start();
					break;
				case 'stop':
					_root.timer.stop();
					break;
				case 'reset':
					_root.timer.reset();
					break;
			}
			
		}));
		
		this.add(new Code('bowserkey bk', function(command) {
			
			if (command[2] == 'true') {
				_root.utils.setBowserKey(int(command[1]), true);
			}
			else if (command[2] == 'false') {
				_root.utils.setBowserKey(int(command[1]), false);
			}
			else {
				_root.utils.setBowserKey(int(command[1]));
			}
			
		}));
		
		this.add(new Code('star s', function(command) {
			
			if (command[2] == 'true') {
				_root.utils.setStar(command[1], true);
			}
			else if (command[2] == 'false') {
				_root.utils.setStar(command[1], false);
			}
			else {
				_root.utils.setStar(command[1]);
			}
			
		}));
		
		this.add(new Code('starcoin sc', function(command) {
			
			if (command[2] == 'true') {
				_root.utils.setStarCoin(command[1], true);
			}
			else if (command[2] == 'false') {
				_root.utils.setStarCoin(command[1], false);
			}
			else {
				_root.utils.setStarCoin(command[1]);
			}
			
		}));

		this.add(new Code('fludd', function(command) {
			
			switch(command[1]) {
				case 'all':
					_root.SaveFluddH = true;
					_root.SaveFluddR = true;
					_root.SaveFluddT = true;
					break;
				case 'H': case 'h':
					_root.SaveFluddH = !_root.SaveFluddH;
					break;
				case 'R': case 'r':
					_root.SaveFluddR = !_root.SaveFluddR;
					break;
				case 'T': case 't':
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
	public function onEachFrame() {
		_root.textManager.write(2, this.currentCode);
		
		if (_root.KeySlash()) {
			this.resetDelay();
		}
		else if (this.delay > 0) {
			this.reduceDelay();
			if (this.delay <= 0) {
				this.currentCode = "";
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
		if (this.delay < 0) this.delay = 0;
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

// Class that manages the start and end of individual levels.
class IndividualLevel {
	
	// Not tested
	
	private var level;
	private var requiredStars;
	private var requiredStarCoins;
	
	public function IndividualLevel() {
		this.stop();
		this.requiredStars = new Array();
		this.requiredStarCoins = new Array();
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
	
	
	public function check() {
		var bool = true;
		var i = 0;		
		var j = 0;
		
		for (i = 0; i < this.requiredStars.length; i++) {
			var index = this.requiredStars[i];
			if (_root.utils.getStar(index) === false) {
				bool = false;
				break;
			}
		}
		
		for (j = 0; j < this.requiredStarCoins.length; j++) {
			var index = this.requiredStarCoins[j];
			if (_root.utils.getStarCoin(index) === false) {
				bool = false;
				break;
			}
		}
		
		return bool;
	}
	
	
	public function onStarCollected() {
		if (this.check() === true) {
			this.stop();
		}
	}
	
	
	public function start(level) {
		this.level = level;
		_root.timer.reset();
	}
	
	
	public function stop() {
		this.level = 'none';
		_root.timer.stop();
	}
	
	
	public function isGoing() {
		return (this.level != 'none');
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
_root.utils = new Utils();
_root.textManager = new TextManager();
_root.codeManager = new CodeManager();
_root.event = new Event();
