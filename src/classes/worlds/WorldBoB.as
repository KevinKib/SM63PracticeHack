class WorldBoB implements World {

    public function getIndex() {
        return 1;
    }

    public function getName() {
        return 'bob';
    }

    public function getFullName() {
        return 'Bob-Omb Battlefield';
    }

    public function getStartingLevel() {
        return "C-2";
    }

    public function getCoordinates() {
        return [-174.1, 9.35];
    }

    public function getWarps() {
        var dict = new Object();
        dict["bob"] = "1-1";
        dict["bob1"] = "1-1";
        dict["bob2"] = "1-2";
        dict["bob3"] = "1-3";
        dict["bob4"] = "1-4";
        dict["bob5"] = "1-5";

        return dict;
    }

    public function getStars() {
        return [1, 2, 3, 4, 5];
    }

    public function getStarCoins() {
        return [1, 2, 3, 4, 5, 6];
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