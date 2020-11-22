class WorldSotM {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'sots';
    }

    public function getFullName() {
        return 'Secret of the Sky';
    }

    public function getStartingLevel() {
        return 'C-7';
    }

    public function getCoordinates() {
        return [-623, 58.5];
    }

    public function getWarps() {
        var dict = new Object();
        dict["sots"] = "9-05";

        return dict;
    }

    public function getStars() {
        return [48];
    }

    public function getStarCoins() {
        return [58];
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