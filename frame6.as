// Defines the informations from a world
class World {
	
	private var index;
	private var name;
	private var fullName;
	private var startingLevel;
	private var stars;
	private var starCoins;
	private var flags;

	public function World(index, name, fullName, startingLevel, stars, starCoins, flags) {
		this.index = index;
		this.name = name;
		this.fullName = fullName;
		this.startingLevel = startingLevel;
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
	
	public function getFlags() {
		return this.flags.slice();
	}
	
	public function getStartingLevel() {
		return this.startingLevel;
	}
}

// Class that communicates with the IG variables
class Utils {
	
	private var latestWarpPosition;
	private var worldList;
	private var flags;
	
	// Constructor of the Utils class.
	public function Utils() {
		this.worldList = new Array();
		this.flags = new Array();
		this.flags.push(false, false);
		this.latestWarpPosition = [0, 0, 0, 0];
		this.worldList.push(new World(1, 'bob', 'Bom-Omb Battlefield', "C-2",
							[1, 2, 3, 4, 5],
							[1, 2, 3, 4, 5, 6],
							[]),
							new World(2, 'sl', "Snowman's Land", "C-2-2",
							[6, 7, 8, 9, 10],
							[7, 8, 9, 10, 11, 12],
							[]),
							new World(3, 'hmc', "Hazy Maze Cave", "C-7",
							[11, 12, 13, 14, 15],
							[13, 14, 15, 16, 17, 18],
							[]),
							new World(4, 'bm', "Boo's Mansion", "C-8",
							[16, 17, 18, 19, 20],
							[19, 20, 21, 22, 23, 24],
							[]),
							new World(5, 'lll', "Lethal Lava Land", "C-10",
							[21, 22, 23, 24, 25],
							[25, 26, 27, 28, 29, 30],
							[]),
							new World(6, 'ttm', "Tall Tall Mountain", "C-10",
							[26, 27, 28, 29, 30],
							[31, 32, 33, 34, 35, 36],
							[]),
							new World(7, 'rr', "Rainbow Ride", "C-12",
							[31, 32, 33, 34, 35],
							[37, 38, 39, 40, 41, 42],
							[]),
							new World(8, 'bt3', "Bowser Trap 3", "C-1",
							[],
							[],
							['bt3']),
							new World(9, 'ssl', "Shifting Sand Land", "C-3",
							[55, 56, 57],
							[43, 44, 45],
							[]),
							new World(10, 'wdw', "Wet Dry World", "C-8",
							[58, 59, 60],
							[46, 47, 48],
							[]),
							new World(11, 'ttc', "Tick Tock Clock", "C-12",
							[61, 62, 63],
							[49, 50, 51],
							[]),
							new World(0, 'sotm', "Secret of the Mushroom", "C-1",
							[44],
							[59],
							[]),
							new World(0, 'jrb', "Jolly Roger Bay", "C-4H",
							[46],
							[],
							[]),
							new World(0, 'tidal', "Tidal Isles", "C-3-2",
							[45],
							[60],
							[]),
							new World(0, 'sots', "Secret of the Sky", "C-7",
							[49],
							[58],
							[]),
							new World(0, 'ff', "Frosty Fludd", "C-7",
							[48],
							[63],
							[]),
							new World(0, 'thwc', "Thwomp's Castle", "C-8",
							[47],
							[],
							[]),
							new World(0, 'coe', "Cave of Empuzzlement", "C-10",
							[53],
							[],
							[]),
							new World(0, 'mm', "Magma Maze", "C-10",
							[52],
							[55],
							[]),
							new World(0, 'gos', "Galaxy of Stars", "C-12",
							[54],
							[],
							[]),
							new World(0, 'space', "Space", "8-12",
							[],
							[],
							['space']),
							new World(0, 'eotmk', "Edge of the Mushroom Kingdom", "Castle",
							[64],
							[64],
							[])
							);
		
	}
	
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
	
	// Sets stars of a certain world in a certain state.
	public function setWorldStars(name, bool, number) {
		var selectedWorld = this.getWorld(name);
		var i = 0;
		if (number === undefined) {
			for (i = 0; i < selectedWorld.getStars().length; i++) {
				this.setStar(selectedWorld.getStars()[i], bool);
			}
		}
		else {
			this.setStar(selectedWorld[number-1], bool);
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
		}
		else {
			this.setStarCoin(selectedWorld.getStarCoins()[number-1], bool);
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
	
	// Sets the state of a flag, used for IL timings.
	public function setFlag(name, bool) {
		switch(name) {
			case 'bt3':
				this.flags[0] = bool;
				break;
			case 'space':
				this.flags[1] = bool;
				break;
		}
	}
	
	// Returns the state of a flag, used for IL timings.
	public function getFlag(name, bool) {
		var flag;
		switch(name) {
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
		}
		else {
			worldNb = _root.utils.getWorld(world).getIndex();
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
	
	//
	public function onFakeBowserStart() {
		if (_root.codeManager.getIL().isGoing() === true) {
			_root.utils.setFlag('bt3', true);
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
		
		this.add(new Code('worldstar ws', function(command) {
			var level = command[1];
			var bool = command[2];
			var number = command[3];
			switch(bool) {
				case 'true':  
					_root.utils.setWorldStars(level, true, number); 
					break;
				case 'false': 
					_root.utils.setWorldStars(level, false, number); 
					break;
			}
		}));
		
		this.add(new Code('worldstarcoin wsc', function(command) {
			var level = command[1];
			var bool = command[2];
			var number = command[3];
			switch(bool) {
				case 'true':  _root.utils.setWorldStarCoins(level, true, number); break;
				case 'false': _root.utils.setWorldStarCoins(level, false, number); break;
			}
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
			
			var existingTypes = new Array();
			existingTypes.push('all', '100', 'starsfludd', 'stars', 'starfludd', 'star', 'starcoins', 'starcoin');
			
			if (existingTypes.indexOf(type) == -1) {
				_root.textManager.write(5, 'Invalid IL command.');
				return;
			}
			
			var posA = 0;
			var posB = 0;
			var posC = 0;
			var posD = 0;
			var emptyArray = new Array();
						
			var mode = 'none';
			
			// World info
			
			var selectedWorld = _root.utils.getWorld(level);
			var levelTitle = selectedWorld.getName();
			var startingLevel = selectedWorld.getStartingLevel();
			var requiredStars = selectedWorld.getStars();
			var requiredStarCoins = selectedWorld.getStarCoins();
			var requiredFlags = selectedWorld.getFlags();
			
			_root.utils.setWorldStars(level, false);
			_root.utils.setWorldStarCoins(level, false);
			_root.utils.setWorldFlags(level, false);
			
			// Clean this code pls

			switch(type) {
				case '100': case 'all':
					_root.utils.setWorldNozzle(level, 'all', 'false');
					IL.setRequiredStars(requiredStars);
					IL.setRequiredStarCoins(requiredStarCoins);
					IL.setRequiredFlags(requiredFlags);
					mode = '100%';
					break;
				case 'starsfludd': case 'sf':
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
					if (!isNaN(starnum) && (starnum >= 1 && starnum <= 5)) {
						_root.utils.setWorldNozzle(level, 'all', 'true');
						
						var arr = new Array();
						arr.push(requiredStars[starnum - 1]);
						IL.setRequiredStars(arr);
						IL.setRequiredStarCoins(emptyArray);
						mode = 'Star '+starnum+' with Fludd';
					}
					break;
				case 'star':
					if (!isNaN(starnum) && (starnum >= 1 && starnum <= 5)) {
						_root.utils.setWorldNozzle(level, 'all', 'false');
						var arr = new Array();
						arr.push(requiredStars[starnum - 1]);
						IL.setRequiredStars(arr);
						IL.setRequiredStarCoins(emptyArray);
						mode = 'Star '+starnum;
					}
					break;
				case 'starcoins': case 'starcoin':
					_root.utils.setWorldNozzle(level, 'all', 'false');
					IL.setRequiredStars(emptyArray);
					IL.setRequiredStarCoins(requiredStarCoins);
					mode = 'Star Coins';
					break;
				default:
					mode = 'None';
			}
			
			_root.textManager.write(5, 'Current IL : ' + selectedWorld.getFullName() +' | ' + mode);
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
	
	private var level;
	private var requiredStars;
	private var requiredStarCoins;
	private var requiredFlags;
	
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
	
	// Setter for the required flags.
	public function setRequiredFlags(array) {
		this.requiredFlags = array.slice();
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
_root.textManager = new TextManager();
_root.utils = new Utils();
_root.codeManager = new CodeManager();
_root.event = new Event();

var lol = new File("records.txt");
