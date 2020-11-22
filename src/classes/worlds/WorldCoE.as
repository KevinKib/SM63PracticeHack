class WorldCoE {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'coe';
    }

    public function getFullName() {
        return 'Cave of Empuzzlement';
    }

    public function getStartingLevel() {
        return 'C-10';
    }

    public function getCoordinates() {
        return [311.05, 7.35];
    }

    public function getWarps() {
        var dict = new Object();
        dict["coe"] = "9-03-2";

        return dict;
    }

    public function getStars() {
        return [52];
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