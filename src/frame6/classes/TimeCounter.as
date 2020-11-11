// Class that manages a time counter.
class TimeCounter {

    // Time variables
    private var frames;
    private var milliseconds;
    private var seconds;
    private var minutes;

    private var FRAMES_PER_SECOND;

    private var displayMode;

    // Basic constructor
    public function TimeCounter() {
        this.frames = 0;
        this.milliseconds = 0;
        this.seconds = 0;
        this.minutes = 0;

        this.FRAMES_PER_SECOND = 32;

        this.displayMode = 'regular';

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
    public function addSecond() {
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
        obj.displayMode = this.displayMode;
        return obj;
    }

    // Manages the state of the display mode.
    // Can be either 'regular' or 'frames'.
    public function setDisplayMode(value) {
        if (value == 'frames') {
            this.displayMode = 'frames';
        } else {
            this.displayMode = 'regular';
        }
    }

    // Returns a string displaying the current time.
    public function getDisplay() {

        var txtSeconds = this.seconds;
        if (this.seconds < 10)
            txtSeconds = "0" + txtSeconds;

        var txtMinutes = this.minutes;
        if (this.minutes < 10)
            txtMinutes = "0" + txtMinutes;

        var displayedText = null;

        switch (this.displayMode) {
            case 'regular':
                var txtMilliseconds = this.milliseconds;
                if (this.milliseconds < 10)
                    txtMilliseconds = "0" + txtMilliseconds;
                if (this.milliseconds < 100)
                    txtMilliseconds = "0" + txtMilliseconds;
                displayedText = txtMinutes + ":" + txtSeconds + "." + txtMilliseconds;
                break;
            case 'frames':
                var txtFrames = this.frames;
                if (this.frames < 10)
                    txtFrames = "0" + txtFrames;
                displayedText = txtMinutes + ":" + txtSeconds + ":" + txtFrames;
                break;
        }

        return displayedText;
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