class WorldBowser1 {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'bt2';
    }

    public function getFullName() {
        return "Bowser Trap 2";
    }

    public function getStartingLevel() {
        return "C-7";
    }

    public function getCoordinates() {
        return [619.85, 57.35];
    }

    public function getWarps() {
        var dict = new Object();
        dict["bt2"] = "8-E5-1";
        dict["bt2r1"] = "8-E5-1";
        dict["bt2r2"] = "8-E5-2";
        dict["bt2r3"] = "8-E5-3";
        dict["bt2r4"] = "8-E5-3";
        dict["bt2fight"] = "8-E5-3";
        dict["b2"] = "8-E5-1";
        dict["b2r1"] = "8-E5-1";
        dict["b2r2"] = "8-E5-2";
        dict["b2r3"] = "8-E5-3";
        dict["b2r4"] = "8-E5-3";
        dict["b2fight"] = "8-E5-3";

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

}