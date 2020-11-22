class WorldBowser1 {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'bt1';
    }

    public function getFullName() {
        return "Bowser Trap 1";
    }

    public function getStartingLevel() {
        return "C-5";
    }

    public function getCoordinates() {
        return [-316.85, 7.25];
    }

    public function getWarps() {
        var dict = new Object();
        dict["bt1"] = "8-E2-1";
        dict["bt1r1"] = "8-E2-1";
        dict["bt1r2"] = "8-E2-2";
        dict["bt1fight"] = "8-E2-2";
        dict["b1"] = "8-E2-1";
        dict["b1r1"] = "8-E2-1";
        dict["b1r2"] = "8-E2-2";
        dict["b1fight"] = "8-E2-2";

        return dict;
    }

    public function getStars() {
        return [];
    }

    public function getStarCoins() {
        return [];
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