class WorldMM {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'mm';
    }

    public function getFullName() {
        return 'Magma Maze';
    }

    public function getStartingLevel() {
        return 'C-10';
    }

    public function getCoordinates() {
        return [-442.55, -724.45];
    }

    public function getWarps() {
        var dict = new Object();
        dict["mm"] = "9-10";
        dict["mmr1"] = "9-10";
        dict["mmr2"] = "9-10-2";
        dict["magma"] = "9-10";
        dict["magmar1"] = "9-10";
        dict["magmar2"] = "9-10-2";

        return dict;
    }

    public function getStars() {
        return [53];
    }

    public function getStarCoins() {
        return [55];
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