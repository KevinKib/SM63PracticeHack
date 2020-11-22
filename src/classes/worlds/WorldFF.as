class WorldFF {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'ff';
    }

    public function getFullName() {
        return 'Frosty Fludd';
    }

    public function getStartingLevel() {
        return 'C-7';
    }

    public function getCoordinates() {
        return [277.45, 58.45];
    }

    public function getWarps() {
        var dict = new Object();
        dict["ff"] = "9-04";

        return dict;
    }

    public function getStars() {
        return [47];
    }

    public function getStarCoins() {
        return [63];
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