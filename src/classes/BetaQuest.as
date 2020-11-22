// Class that manages the warps for Beta Quest mode.
class BetaQuest {

    private var seed;
    private var rngValue;
    private var started;
    private var warpList;
    private var newWarpList;

    // Constructor of the Beta Quest class.
    public function BetaQuest() {

        this.seed = undefined;
        this.rngValue = undefined;
        this.started = false;
        this.warpList = new Array();
        this.newWarpList = new Array();
        this.initWarpList();

        this.generateWarpList();
    }

    // Generates a new warp list.
    private function generateWarpList() {
        this.newWarpList = this.shuffle(this.warpList);
    }

    // Inits the warp list, with a list of all the different warps.
    private function initWarpList() {
        this.warpList.push(

            // Course warps
            "1-1", "1-2", "1-3", "1-4", "1-5",
            "2-1", "2-2", "2-2A", "2-3", "2-4", "2-5",
            "3-1", "3-2", "3-3", "3-4", "3-5", "3-6", "3-7", "3-8",
            "4-1", "4-2", "4-3", "4-4", "4-5", "4-6", "4-7", "4-8", "4-9", "4-10", "4-11",
            "5-1", "5-2", "5-3", "5-4", "5-5", "5-6", "5-7", "5-8", "5-9",
            "6-1", "6-2", "6-3", "6-4", "6-5", "6-6", "6-1-2",
            "7-1", "7-2", "7-3", "7-4", "7-5", "7-6",

            // Mini-course & CSS warps
            "8-E1-1", "8-E1-1-2", "8-E1-2", "8-E1-2-2",
            "8-E3-1", "8-E3-2",
            "8-E2-1", "8-E2-2",
            "8-E5-1", "8-E5-2", "8-E5-3", "8-E5-4",

            // Bowser 3 warps
            "8-1", "8-2", "8-3", "8-4", "8-5", "8-6", "8-7", "8-8", "8-9", "8-10",
            "8-10-b", "8-11", "8-12", "8-13", "8-14", "8-15", "8-16", "BC-1", "BC-2", "BC-3",
            
            "9-01", "9-02", "9-03", "9-03-D",
            "9-03-2", "9-04", "9-05", "9-06",
            "9-07", "9-08", "9-10", "9-10-2", "9-11",
            "M1-1", "M1-2",
            "M2-1", "M2-2", "M3-3",
            "M3-1", "M3-2", "M3-3",
            "K-1", "K-2",

            // Castle warps
            "C-1", "C-2", "C-2-2", "C-3", "C-3-2", "C-4", "C-5", "C-6", "C-O", "C-7", "C-8", "C-4H", "C-9",
            "C-10", "C-11", "C-12", "C-13", "16SCPrize", "48SCPrize", "Mush-room", "Castle"

            );
    }

    // Shuffles an array.
    private function shuffle(array) {
        var newArray = array.slice();
        newArray.sort(this.randomSort);
        return newArray;
    }

    // Method that simulates a 1/2 chance aiming to sort arrays.
    private function randomSort(a, b) {

        var self = _root.betaQuest;

        var value;
        if (self.isSeeded())
            value = self.RNG();
        else
            value = Math.random();

        if (value < 0.5)
            return -1;
        else
            return 1;
    }

    // Method that generates a random number, based on a seed.
    private function randomSeed(seed) {
        return ((seed * 1664525) + 1013904223) % 4294967296;
    }

    // RNG function.
    private function RNG() {
        this.rngValue = this.randomSeed(this.rngValue);
        return this.rngValue / 4294967296;
    }

    // Returns the index of an element in an array.
    private function indexOf(array, value) {
        var i = 0;

        for (i = 0; i < array.length; i++) {
            if (array[i] === value) {
                return i;
            }
        }

        return -1;
    }

    // Returns the new zone the player will be warped in.
    public function getCorrespondingArea(warpArea) {
        var index = this.indexOf(this.warpList, warpArea);
        //_root.textManager.send('message', this.indexOf(this.warpList, warpArea));
        //var index = 2;
        var newWarp;

        if ((index != undefined && index != -1) && (this.started === true)) {
            newWarp = this.newWarpList[index];
        } else {
            newWarp = warpArea;
        }

        //_root.textManager.send('message', 'Warp area ' + warpArea + ' | New warp : ' + newWarp);

        var warpCoordinates = this.getWarpCoordinates(newWarp);

        return [warpCoordinates.level, warpCoordinates.x, warpCoordinates.y];
    }


    // Returns special warp coordinates, in case 0,0 isn't the ideal position.
    public function getWarpCoordinates(warp) {

        var level = warp;
        var x = 0;
        var y = 0;

        switch (warp) {
            case "16SCPrize":
                level = "C-4-SC1";
                x = 0;
                y = 0;
                break;
            case "48SCPrize":
                level = "C-4-SC1";
                x = 0;
                y = -260;
                break;
            case "Mush-room":
                level = "C-4-SC1";
                x = -674;
                y = -60;
                break;
            case "betacastle":
                level = "C-1";
                x = 0;
                y = -702.8;
                break;
            case "8-10":
                x = -290;
                y = 0;
                break;
            case "8-10-b":
                x = 500;
                y = -10;
                break;
            case "6-1-2":
                x = 2171;
                y = -163;
                break;
            case "9-07":
                _root.BossCheckpoint = false;
                x = 0;
                y = 0;
                break;
            case "M1-2":
                x = -1465;
                y = -320;
                break;
            case "4-5":
                x = -1300;
                y = 52.4;
                break;
            case "8-E5-1":
                x = -1693;
                y = -60;
                break;
            case "8-E5-2":
                x = 1115;
                y = 127;
                break;
            case "9-11":
                x = -560;
                y = -160;
                break;
            case "9-03-2":
                x = -270;
                y = -990;
                break;
            default:
                break;
        }

        return {level: level, x: x, y: y}
    }

    // Returns the new, updated, warp list.
    public function getNewWarpList() {
        return this.newWarpList;
    }

    // Activates Beta Quest.
    public function start(seed) {
        if (seed != undefined && !isNaN(Number(seed))) {
            this.setSeed(seed);
        } else {
            this.setSeed(Math.random() * 4294967296);
        }

        this.started = true;
        this.generateWarpList();
        _root.utils.warp('C-1');
        _root.timer.reset();
        _root.timer.start();
    }

    // Re-activates Beta Quest.
    public function restart(seed) {
        this.started = true;
    }

    // Deactivates Beta Quest.
    public function stop() {
        this.started = false;
    }

    // Defines a new seed.
    public function setSeed(s) {
        this.seed = s;
        this.rngValue = this.seed;
    }

    // Getter of the seed.
    public function getSeed() {
        return this.seed;
    }

    // Returns if the current BQ is seeded or not.
    public function isSeeded() {
        return (this.seed != undefined)
    }

    // Returns if BetaQuest has been started.
    public function isStarted() {
        return this.started;
    }

}