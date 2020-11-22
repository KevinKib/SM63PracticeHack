class WorldTutorial1 {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 't1';
    }

    public function getFullName() {
        return "Tutorial 1";
    }

    public function getStartingLevel() {
        return null;
    }

    public function getCoordinates() {
        return null;
    }

    public function getWarps() {
        var dict = new Object();
        dict["t1"] = "8-E1-1";
        dict["t1r1"] = "8-E1-1";
        dict["t1r2"] = "8-E1-1-2";
        dict["t1r3"] = "8-E1-2";
        dict["t1r4"] = "8-E1-2-2";

        return dict;
    }

    public function getStars() {
        return [39];
    }

    public function getStarCoins() {
        return [];
    }

    public function getFlags() {
        return [];
    }

    public function isIL() {
        return false;
    }

    public function hasWarps() {
        return true;
    }

}