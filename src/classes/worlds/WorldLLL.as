class WorldLLL {

    public function getIndex() {
        return 5;
    }

    public function getName() {
        return 'lll';
    }

    public function getFullName() {
        return "Lethal Lava Land";
    }

    public function getStartingLevel() {
        return "C-10";
    }

    public function getCoordinates() {
        return [-339.65, 8.15];
    }

    public function getWarps() {
        var dict = new Object();
        dict["lll"] = "5-1";
        dict["lll1"] = "5-1";
        dict["lll2"] = "5-2";
        dict["lll3"] = "5-3";
        dict["lll4"] = "5-4";
        dict["lll5"] = "5-5";
        dict["lll6"] = "5-6";
        dict["lll7"] = "5-7";
        dict["lll8"] = "5-8";
        dict["lll9"] = "5-9";

        return dict;
    }

    public function getStars() {
        return [21, 22, 23, 24, 25];
    }

    public function getStarCoins() {
        return [25, 26, 27, 28, 29, 30];
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