class WorldRR {

    public function getIndex() {
        return 7;
    }

    public function getName() {
        return 'rr';
    }

    public function getFullName() {
        return "Rainbow Ride";
    }

    public function getStartingLevel() {
        return "C-12";
    }

    public function getCoordinates() {
        return [-675.45, -74.9];
    }

    public function getWarps() {
        var dict = new Object();
        dict["rr"] = "7-1";
        dict["rr1"] = "7-1";
        dict["rr2"] = "7-2";
        dict["rr3"] = "7-3";
        dict["rr4"] = "7-4";
        dict["rr5"] = "7-5";
        dict["rr6"] = "7-6";

        return dict;
    }

    public function getStars() {
        return [31, 32, 33, 34, 35];
    }

    public function getStarCoins() {
        return [37, 38, 39, 40, 41, 42];
    }

    public function getFlags() {
        return [];
    }

    public function isIL() {
        return true;
    }

    public function hasWarps() {
        return true;
    }
    
}