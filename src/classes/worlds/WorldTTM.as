class WorldTTM {

    public function getIndex() {
        return 6;
    }

    public function getName() {
        return 'ttm';
    }

    public function getFullName() {
        return "Tall Tall Mountain";
    }

    public function getStartingLevel() {
        return "C-10";
    }

    public function getCoordinates() {
        return [136.05, 6.75];
    }

    public function getWarps() {
        var dict = new Object();
        dict["ttm"] = "6-1";
        dict["ttm1"] = "6-1";
        dict["ttm2"] = "6-2";
        dict["ttm3"] = "6-3";
        dict["ttm4"] = "6-4";
        dict["ttm5"] = "6-5";
        dict["ttm6"] = "6-6";
        dict["ttm7"] = "6-1-2";

        return dict;
    }

    public function getStars() {
        return [26, 27, 28, 29, 30];
    }

    public function getStarCoins() {
        return [31, 32, 33, 34, 35, 36];
    }

    public function getFlags() {
        return [];
    }

}