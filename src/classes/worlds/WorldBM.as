class WorldBM {

    public function getIndex() {
        return 4;
    }

    public function getName() {
        return 'bm';
    }

    public function getFullName() {
        return "Boo's Mansion";
    }

    public function getStartingLevel() {
        return "C-8";
    }

    public function getCoordinates() {
        return [332.05, -0.15];
    }

    public function getWarps() {
        var dict = new Dictionary();
        dict["bm"] = "4-1";
        dict["bm1"] = "4-1";
        dict["bm2"] = "4-2";
        dict["bm3"] = "4-3";
        dict["bm4"] = "4-4";
        dict["bm5"] = "4-5";
        dict["bm6"] = "4-6";
        dict["bm7"] = "4-7";
        dict["bm8"] = "4-8";
        dict["bm9"] = "4-9";
        dict["bm10"] = "4-10";
        dict["bm11"] = "4-11";

        return dict;
    }

    public function getStars() {
        return [16, 17, 18, 19, 20];
    }

    public function getStarCoins() {
        return [19, 20, 21, 22, 23, 24];
    }

    public function getFlags() {
        return [];
    }

}