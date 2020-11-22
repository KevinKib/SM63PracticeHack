class WorldGoS {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'gos';
    }

    public function getFullName() {
        return 'Galaxy of Stars';
    }

    public function getStartingLevel() {
        return 'C-12';
    }

    public function getCoordinates() {
        return [481.3, -74.45];
    }

    public function getWarps() {
        var dict = new Object();
        dict["gos"] = "9-11";

        return dict;
    }

    public function getStars() {
        return [54];
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