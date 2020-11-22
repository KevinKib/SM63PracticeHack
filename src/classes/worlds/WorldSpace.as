class WorldSpace {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'space';
    }

    public function getFullName() {
        return "Space";
    }

    public function getStartingLevel() {
        return "8-12";
    }

    public function getCoordinates() {
        return [0, 0];
    }

    public function getWarps() {
        var dict = new Object();
        dict["space"] = "8-13";
        dict["spacer1"] = "8-13";
        dict["spacer2"] = "8-14";
        dict["spacer3"] = "8-15";
        dict["spacer4"] = "8-16";
        dict["truebowser"] = "8-16";
        dict["tb"] = "8-16";

        return dict;
    }

    public function getStars() {
        return [];
    }

    public function getStarCoins() {
        return [54];
    }

    public function getFlags() {
        return ['space'];
    }

}