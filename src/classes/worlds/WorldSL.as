class WorldSL extends World {

    public function getIndex() {
        return 2;
    }

    public function getName() {
        return 'sl';
    }

    public function getFullName() {
        return "Snowman's Land";
    }

    public function getStartingLevel() {
        return "C-2-2";
    }

    public function getWarps() {
        var dict = new Dictionary();
        dict["sl"] = "2-1";
        dict["sl1"] = "2-1";
        dict["sl2"] = "2-2";
        dict["sl3"] = "2-3";
        dict["sl4"] = "2-4";
        dict["sl5"] = "2-2A";
        dict["sl6"] = "2-5";

        return dict;
    }

    public function getStars() {
        return [6, 7, 8, 9, 10];
    }

    public function getStarCoins() {
        return [7, 8, 9, 10, 11, 12];
    }

    public function getCoordinates() {
        return [-265, 58.05];
    }

    public function getFlags() {
        return [];
    }

}