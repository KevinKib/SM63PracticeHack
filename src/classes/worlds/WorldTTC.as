class WorldTTC {

    public function getIndex() {
        return 11;
    }

    public function getName() {
        return 'ttc';
    }

    public function getFullName() {
        return "Tick Tock Clock";
    }

    public function getStartingLevel() {
        return "C-12";
    }

    public function getCoordinates() {
        return [149.5, 0.65];
    }

    public function getWarps() {
        var dict = new Object();
        dict["ttc"] = "M3-1";
        dict["ttc1"] = "M3-1";
        dict["ttc2"] = "M3-2";
        dict["ttc3"] = "M3-3";

        return dict;
    }

    public function getStars() {
        return [61, 62, 63];
    }

    public function getStarCoins() {
        return [49, 50, 51];
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