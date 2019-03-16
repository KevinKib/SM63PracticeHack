// Variable definitions
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
		this.realTime.addFrame();
	}
	
	// Returns a string displaying the current time.
	public function getDisplay() {
		return this.lastUpdatedTime.getDisplay();
	}
	
}

NewgroundsAPI.connectMovie(8160);
_root.ILTimerCurrentMenu = 0;
_root.ILTimerMenuDelay = 0;
_root.LatestCode = 0;

_root.Save_Star = new Array();
_root.Save_StarCoin = new Array();
_root.Save_FluddArray = new Array();

_root.Timer = new Timer();