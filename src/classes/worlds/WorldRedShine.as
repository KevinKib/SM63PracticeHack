class WorldRedShine {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'red';
    }

    public function getFullName() {
        return 'Red Shine';
    }

    public function getStartingLevel() {
        return 'C-11';
    }

    public function getCoordinates() {
        return [397.35, 6.65];
    }

    public function getWarps() {
        var dict = new Object();
        dict["red"] = "9-08";
        dict["redshine"] = "9-08";
        dict["kamekcastle"] = "9-08";

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