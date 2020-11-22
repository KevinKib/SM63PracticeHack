class WorldTutorial2 {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 't2';
    }

    public function getFullName() {
        return "Tutorial 2";
    }

    public function getStartingLevel() {
        return null;
    }

    public function getCoordinates() {
        return null;
    }

    public function getWarps() {
        var dict = new Object();
        dict["t2"] = "8-E3-1";
        dict["t2r1"] = "8-E3-1";
        dict["t2r2"] = "8-E3-2";

        return dict;
    }

    public function getStars() {
        return [41];
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