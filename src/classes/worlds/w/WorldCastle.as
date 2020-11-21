class WorldCastle extends World {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'castle';
    }

    public function getFullName() {
        return 'Castle';
    }

    public function getStartingLevel() {
        return null;
    }

    public function getCoordinates() {
        return null;
    }

    public function getWarps() {
        var dict = new Dictionary();
        dict["castle"] = "Castle";
        dict["castle1"] = "C-1";
        dict["castle2"] = "C-2";
        dict["castle3"] = "C-2-2";
        dict["castle4"] = "C-3";
        dict["castle5"] = "C-3-2";
        dict["castle6"] = "C-4";
        dict["castle7"] = "C-5";
        dict["castle8"] = "C-6";
        dict["castle9"] = "C-O";
        dict["castle10"] = "C-7";
        dict["castle11"] = "C-8";
        dict["castle12"] = "C-4H";
        dict["castle13"] = "C-9";
        dict["castle14"] = "C-10";
        dict["castle15"] = "C-11";
        dict["castle16"] = "C-12";
        dict["castle17"] = "C-13";
        dict["castle18"] = "16SCPrize";
        dict["castle19"] = "48SCPrize";
        dict["castle20"] = "Mush-room";

        return dict;
    }

    public function getStars() {
        return [];
    }

    public function getStarCoins() {
        return [];
    }

    public function getFlags() {
        return [];
    }

}