class WorldThwC {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'thwc';
    }

    public function getFullName() {
        return "Thwomp's Castle";
    }

    public function getStartingLevel() {
        return 'C-8';
    }

    public function getCoordinates() {
        return [939.05, -373.75];
    }

    public function getWarps() {
        var dict = new Object();
        dict["thwc"] = "9-06";

        return dict;
    }

    public function getStars() {
        return [49];
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