class WorldGreenShine {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'green';
    }

    public function getFullName() {
        return 'Green Shine';
    }

    public function getStartingLevel() {
        return 'C-O';
    }

    public function getCoordinates() {
        return [1009, -41.1];
    }

    public function getWarps() {
        var dict = new Object();
        dict["green"] = "9-07";
        dict["garden"] = "9-07";
        dict["peachgarden"] = "9-07";

        return dict;
    }

    public function getStars() {
        return [50];
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