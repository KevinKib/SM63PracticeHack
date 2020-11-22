class WorldSotM {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'sotm';
    }

    public function getFullName() {
        return 'Secret of the Mushroom';
    }

    public function getStartingLevel() {
        return 'C-1';
    }

    public function getCoordinates() {
        return [0, -232];
    }

    public function getWarps() {
        var dict = new Object();
        dict["sotm"] = "9-01";

        return dict;
    }

    public function getStars() {
        return [44];
    }

    public function getStarCoins() {
        return [59];
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