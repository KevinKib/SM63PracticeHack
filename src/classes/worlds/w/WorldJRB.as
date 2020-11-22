class WorldJRB {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'jrb';
    }

    public function getFullName() {
        return 'Jolly Roger Bay';
    }

    public function getStartingLevel() {
        return 'C-4H';
    }

    public function getCoordinates() {
        return [-633.6, -429.9];
    }

    public function getWarps() {
        var dict = new Object();
        dict["jrb"] = "9-03";
        dict["jrbr1"] = "9-03";
        dict["jrbr2"] = "9-03-D";

        return dict;
    }

    public function getStars() {
        return [46];
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