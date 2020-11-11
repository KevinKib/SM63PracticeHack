// Class that manages a full chronometer.
class Timer {

    // Defines if the timer is displayed on screen or not.
    private var displayed;

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
        this.start();
        this.displayed = true;
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

    // Sets if the timer is displayed onscreen or not.
    public function setDisplay(bool) {
        this.displayed = bool;
        _root.textManager.send('segment_timer', this.getDisplay());
    }

    // Sets the display mode of the timers.
    public function setDisplayMode(value) {
        this.realTime.setDisplayMode(value);
        this.lastUpdatedTime.setDisplayMode(value);
        _root.textManager.send('segment_timer', this.getDisplay());
    }

    // Manages the code that happens on each frame.
    public function onEachFrame() {
        if (this.started == true) {
            this.realTime.addFrame();
        }
        this.update();
    }

    // Manages the code that happens when entering a loading zone.
    public function onLoadingZone() {
        if (this.startOnLoadingZone) {
            this.start();
            this.startOnLoadingZone = false;
        }
    }

    // Returns if the timer is displayed on screen or not.
    public function isDisplayed() {
        return this.displayed;
    }

    // Returns a string displaying the current time.
    public function getDisplay() {
        return this.lastUpdatedTime.getDisplay();
    }

    // Adds a second to the time.
    public function addSecond() {
        this.realTime.addSecond();
    }

}