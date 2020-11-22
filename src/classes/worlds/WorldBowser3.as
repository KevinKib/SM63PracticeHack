class WorldBowser3 {

    public function getIndex() {
        return 8;
    }

    public function getName() {
        return 'bt3';
    }

    public function getFullName() {
        return 'Bowser Trap 3';
    }

    public function getStartingLevel() {
        return 'C-13';
    }

    public function getCoordinates() {
        return [1123.9, -159.05];
    }

    public function getWarps() {
        var dict = new Object();
        dict["bt3"] = "8-1";
        dict["bt3r1"] = "8-1";
        dict["bt3r2"] = "8-2";
        dict["bt3r3"] = "8-3";
        dict["bt3r4"] = "8-4";
        dict["bt3r5"] = "8-5";
        dict["bt3r6"] = "8-6";
        dict["bt3r7"] = "8-7";
        dict["bt3r8"] = "8-8";
        dict["bt3r9"] = "8-9";
        dict["bt3r10"] = "8-10";
        dict["bt3r11"] = "8-10-b";
        dict["bt3r12"] = "8-11";
        dict["bt3r13"] = "8-12";

        dict["bt3-bl"] = "8-3";
        dict["bt3-br"] = "8-4";
        dict["bt3-tl"] = "8-5";
        dict["bt3-tr"] = "8-6";

        dict["bt3-doublerocket"] = "8-7";
        dict["bt3-dr"] = "8-7";

        dict["bt3-rocketroom"] = "8-8";
        dict["bt3-rocket"] = "8-8";
        dict["bt3-turbo"] = "8-9";
        dict["bt3-turboroom"] = "8-9";

        dict["bt3hr1"] = "8-10";
        dict["bt3hr2"] = "8-10-b";
        dict["bt3-hr1"] = "8-10";
        dict["bt3-hr2"] = "8-10-b";
        dict["hr1"] = "8-10";
        dict["hr2"] = "8-10-b";
        dict["hugeroom1"] = "8-10";
        dict["hugeroom2"] = "8-10-b";

        dict["bt3-stairs"] = "8-11";
        dict["bt3-fakebowser"] = "8-12";
        dict["fakebowser"] = "8-12";
        dict["bt3-fb"] = "8-12";
        dict["fb"] = "8-12";

        return dict;
    }

    public function getStars() {
        return [];
    }

    public function getStarCoins() {
        return [52, 53];
    }

    public function getFlags() {
        return ['bt3'];
    }

    public function isIL() {
        return true;
    }

    public function hasWarps() {
        return true;
    }

}