class WorldSSL extends World {

    public function getIndex() {
        return 9;
    }

    public function getName() {
        return 'ssl';
    }

    public function getFullName() {
        return "Shifting Sand Land";
    }

    public function getStartingLevel() {
        return "C-3";
    }

    public function getCoordinates() {
        return [155.3, 9.35];
    }

    public function getWarps() {
        var dict = new Dictionary();
        dict["ssl"] = "M1-1";
        dict["ssl1"] = "M1-1";
        dict["ssl2"] = "M1-2";

        return dict;
    }

    public function getStars() {
        return [55, 56, 57];
    }

    public function getStarCoins() {
        return [43, 44, 45];
    }

    public function getFlags() {
        return [];
    }

}