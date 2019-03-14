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



if((_root._quality == "BEST" || _root._quality == "HIGH") && _root.AutoQuality == true)
{
   _root.Qualitynum--;
}
qn = _root.Qualitynum;
qn2 = 0;
_root._quality = _root.QualityArray[qn];
time = getTimer();

var timer:Timer = new Timer();

frtxt = "lol";
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
	// Input
	input = -1;
	if 		(_root.Key1()) input = 1;
	else if (_root.Key2()) input = 2;
	else if (_root.Key3()) input = 3;
	else if (_root.Key4()) input = 4;
	else if (_root.Key5()) input = 5;
	else if (_root.Key6()) input = 6;
	else if (_root.Key7()) input = 7;
	else if (_root.Key8()) input = 8;
	else if (_root.Key9()) input = 9;
	else if (_root.Key0()) input = 0;
	else if (_root.KeyBackspace()) input = 11;
	else if (_root.KeyEnter()) input = 12;
	else if (_root.KeyStar()) input = 13;
	
	// Actions
	if (input == 11)
	{	
		// Backspace: deletion of the last number
		code = Math.floor(code / 10);
	}
	else if ((input >= 0) && (input <= 9))
	{
		// Add the input number
		code = code * 10 + input;
	}
	else if (input == 12)
	{
		codeValidated = true;
	}
	else if (input == 13)
	{
		code = _root.LatestCode;
		codeValidated = true;
	}
	
	if (input != -1) 
	{
		// There is an input: we keep the menu opened a little bit more.
		_root.ILTimerAvoidRepeat = KEY_REPEAT_DELAY;
		_root.ILTimerMenuDelay = MENU_OPEN_LENGTH;
	}
	
	
}

setStarCoins = function(bool)
{
	i = 1;
	while(i <= 64)
	{
		_root.StarCoin[i] = bool;
		i++;
	}
	_root.CalculateStarCoins();
}

setStars = function(bool)
{
	i = 1;
	while(i <= 64)
	{
		_root.Star[i] = bool;
		i++;
	}
	_root.CalculateStars();
}

setBowserKeys = function(bool)
{
	_root.BowserKey1 = bool;
	_root.BowserKey2 = bool;
	_root.BowserKey3 = bool;
}

setFludd = function(bool)
{
	_root.SaveFluddH = bool;
	_root.SaveFluddR = bool;
	_root.SaveFluddT = bool;
}

setFluddArray = function(bool)
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
			["", bool, bool, bool]];
}

gotoMenu = function(nbMenu)
{
	if ( nbMenu == 0)
	{
		_root.ILTimerMenuDelay = 0;
	}
	else
	{
		_root.ILTimerMenuDelay = MENU_OPEN_LENGTH;
	}
	
	_root.ILTimerCurrentMenu = nbMenu;
}

executeCode = function()
{
	switch (code)
	{
		case 101:
			// 100% File
			setStars(true);
			setStarCoins(true);
			setBowserKeys(true);
			setFluddArray(true);
			break;
		case 102:
			// World Reset
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
			// 0% File
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
			// All Stars
			setStars(true);
			break;
		case 312:
			// All Star Coins
			setStarCoins(true);
			break;
		case 313:
			// All Bowser Keys
			setBowserKeys(true);
			break;
		case 314:
			// All Nozzles in Worlds
			setFluddArray(true);
		case 321:
			// No Stars
			setStars(false);
			break;
		case 322:
			// No Star Coins
			setStarCoins(false);
			break;
		case 323:
			// No Bowser Keys
			setBowserKeys(false);
			break;
		case 324:
			// No Nozzles in Worlds
			setFludd(false);
			setFluddArray(false);
			_root.RestartFludd();
			_root.Fluddpow = "";
			break;
		case 401:
			// All Nozzles
			setFludd(true);
			break;
		case 411:
			// Toggle Nozzle H
			_root.SaveFluddH = !_root.SaveFluddH;
			break;
		case 412:
			// Toggle Nozzle R
			_root.SaveFluddR = !_root.SaveFluddH;
			break;
		case 413:
			// Toggle Nozzle T
			_root.SaveFluddT = !_root.SaveFluddH;
			break;
		case 501:
			// Warp to T1
			_root.changecourse("StarIn","8-E1-1",0,0,0,0,100);
			break;
		case 511:
			// Warp to BT3
			_root.changecourse("StarIn","8-1",4128,-10,4128,-10);
			break;
		case 512:
			// Warp to BT3 MH
			_root.changecourse("StarIn","8-2",0,0,0,0);
			break;
		case 513:
			// Warp to BT3 HR1
			_root.changecourse("downtransition2","8-10",500,-1450,500,-1450);
			break;
		case 514:
			// Warp to BT3 HR2
			_root.changecourse("uptransition2","8-10-b",500,-10,500,-10);
			break;
		case 521:
			// Warp to Space R1
			_root.changecourse("StarIn","8-13",0,0,0,0,true);
			break;
		case 522:
			// Warp to Space R2
			_root.changecourse("uptransition2","8-14",0,0,0,0);
			break;
		case 523:
			// Warp to Space R3
			_root.changecourse("uptransition2","8-15",0,0,0,0);
			break;
		case 531:
			// Warp to Escape R1
			_root.changecourse("lefttransition2", "BC-1", 0, 0, 0, 0);
			break;
		case 532:
			// Warp to Escape R2
			_root.changecourse("lefttransition2", "BC-2", 0, 0, 0, 0);
			break;
		case 533:
			// Warp to Escape R3
			_root.changecourse("lefttransition2", "BC-3", 0, 0, 0, 0);
			break;
		case 541:
			// Warp to Basement
			break;
		case 542:
			// Warp to Upstairs
			break;
		case 543:
			// Warp to Star Room
			break;
		case 601:
			// 99 lives
			_root.CharLives = 99;
			break;
		case 602:
			// 0 lives
			_root.CharLives = 0;
			break;
		case 701:
			// Refill FLUDD
			_root.WaterAmount = _root.TotalWater; // cst of value 10000
			break;
		case 702:
			// Refill Health
			_root.CharHP = 8;
			break;
		case 901:
			// Toggle Characters
			if (_root.CurrentPlayer == "Mario")
			{
				_root.CurrentPlayer = "Luigi";
			}
			else
			{
				_root.CurrentPlayer = "Mario";
			}
			break;
		default:
			// Invalid codes
			break;
	}

	// Reset
	_root.LatestCode = code;
	code = 0;
	codeValidated = false;
	gotoMenu(0);
}

saveState = function()
{
	// Stars
	i = 1;
	while(i <= 64)
	{
		_root.Save_Star[i] = _root.Star[i];
		i++;
	}
	
	// Star Coins
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
}

loadState = function()
{
	// Stars
	i = 1;
	while(i <= 64)
	{
		_root.Star[i] = _root.Save_Star[i];
		i++;
	}
	_root.CalculateStars();
	
	// Star Coins
	i = 1;
	while(i <= 64)
	{
		_root.StarCoin[i] = _root.Save_StarCoin[i];
		i++;
	}
	_root.CalculateStarCoins();
	
	// Fludd Array
	i = 1;
	while(i <= 12)
	{
		_root.FluddArray[i] = _root.Save_FluddArray[i];
		i++;
	}
}

timer.start();
// Code executed on each frame
onEnterFrame = function()
{
	timer.loop();
	frtxt = timer.getDisplay();
	_root.TextHint = timer.getDisplay();
};