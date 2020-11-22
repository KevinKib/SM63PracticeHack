class WorldEotMK {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'eotmk';
    }

    public function getFullName() {
        return 'Edge of the Mushroom Kingdom';
    }

    public function getStartingLevel() {
        return 'Castle';
    }

    public function getCoordinates() {
        return [2163.9, -233.25];
    }

    public function getWarps() {
        var dict = new Object();
        dict["eotmk"] = "K-1";
        dict["eotmkr1"] = "K-1";
        dict["eotmkr2"] = "K-2";

        return dict;
    }

    public function getStars() {
        return [64];
    }

    public function getStarCoins() {
        return [64];
    }

    public function getFlags() {
        return [];
    }

    public function isIL() {
        return true;
    }

    public function hasWarps() {
        return false;
    }

}