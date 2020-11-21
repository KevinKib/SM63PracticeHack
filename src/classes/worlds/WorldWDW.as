class WorldWDW {

    public function getIndex() {
        return 10;
    }

    public function getName() {
        return 'wdw';
    }

    public function getFullName() {
        return "Wet Dry World";
    }

    public function getStartingLevel() {
        return "C-8";
    }

    public function getCoordinates() {
        return [551.6, -10.3];
    }

    public function getWarps() {
        var dict = new Object();
        dict["wdw"] = "M2-1";
        dict["wdw1"] = "M2-1";
        dict["wdw2"] = "M2-2";
        dict["wdw3"] = "M2-3";

        return dict;
    }

    public function getStars() {
        return [58, 59, 60];
    }

    public function getStarCoins() {
        return [46, 47, 48];
    }

    public function getFlags() {
        return [];
    }

}