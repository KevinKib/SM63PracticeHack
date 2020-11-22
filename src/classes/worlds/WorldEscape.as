class WorldEscape {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'escape';
    }

    public function getFullName() {
        return "Escape";
    }

    public function getStartingLevel() {
        return "8-16";
    }

    public function getCoordinates() {
        return [0, 0];
    }

    public function getWarps() {
        var dict = new Object();
        dict["escape"] = "BC-1";
        dict["escaper1"] = "BC-1";
        dict["escaper2"] = "BC-2";
        dict["escaper3"] = "BC-3";

        return dict;
    }

    public function getStars() {
        return [36];
    }

    public function getStarCoins() {
        return [];
    }

    public function getFlags() {
        return [];
    }

}