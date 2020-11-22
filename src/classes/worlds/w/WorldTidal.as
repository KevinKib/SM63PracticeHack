class WorldTidal {

    public function getIndex() {
        return 0;
    }

    public function getName() {
        return 'tidal';
    }

    public function getFullName() {
        return "Tidal Isles";
    }

    public function getStartingLevel() {
        return 'C-3-2';
    }

    public function getCoordinates() {
        return [128.2, 10.15];
    }

    public function getWarps() {
        return null;
    }

    public function getStars() {
        return [45];
    }

    public function getStarCoins() {
        return [60];
    }

    public function getFlags() {
        return [];
    }

    public function isIL() {
        return true;
    }

    public function hasWarps() {
        return false;
    }

}