class WorldHMC extends World {

    public function getIndex() {
        return 3;
    }

    public function getName() {
        return 'hmc';
    }

    public function getFullName() {
        return "Hazy Maze Cave";
    }

    public function getStartingLevel() {
        return "C-7";
    }

    public function getCoordinates() {
        return [-434.45, 58.3];
    }

    public function getWarps() {
        var dict = new Dictionary();
        dict["hmc"] = "3-1";
        dict["hmc1"] = "3-1";
        dict["hmc2"] = "3-2";
        dict["hmc3"] = "3-3";
        dict["hmc4"] = "3-4";
        dict["hmc5"] = "3-5";
        dict["hmc6"] = "3-6";
        dict["hmc7"] = "3-7";
        dict["hmc8"] = "3-8";

        return dict;
    }

    public function getStars() {
        return [11, 12, 13, 14, 15];
    }

    public function getStarCoins() {
        return [13, 14, 15, 16, 17, 18];
    }

    public function getFlags() {
        return [];
    }

}