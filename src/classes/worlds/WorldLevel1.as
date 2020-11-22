class WorldLevel1 {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'level1';
    }

    public function getFullName() {
        return 'Level1';
    }

    public function getStartingLevel() {
        return null;
    }

    public function getCoordinates() {
        return null;
    }

    public function getWarps() {
        var dict = new Object();
        dict["betalevel"] = "level1";

        return dict;
    }

    public function getStars() {
        return [1];
    }

    public function getStarCoins() {
        return [];
    }

    public function getFlags() {
        return [];
    }

    public function isIL() {
        return false;
    }

    public function hasWarps() {
        return true;
    }

}