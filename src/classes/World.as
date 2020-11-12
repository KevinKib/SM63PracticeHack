// Defines the informations from a world
class World {

    private var index;
    private var name;
    private var fullName;
    private var startingLevel;
    private var coordinates;
    private var stars;
    private var starCoins;
    private var flags;

    public function World(index, name, fullName, startingLevel, coordinates, stars, starCoins, flags) {
        this.index = index;
        this.name = name;
        this.fullName = fullName;
        this.startingLevel = startingLevel;
        this.coordinates = coordinates;
        this.stars = stars.slice();
        this.starCoins = starCoins.slice();
        this.flags = flags.slice();
    }

    public function getIndex() {
        return this.index;
    }

    public function getName() {
        return this.name;
    }

    public function getFullName() {
        return this.fullName;
    }

    public function getStars() {
        return this.stars.slice();
    }

    public function getStarCoins() {
        return this.starCoins.slice();
    }

    public function getCoordinates() {
        return this.coordinates.slice();
    }

    public function getFlags() {
        return this.flags.slice();
    }

    public function getStartingLevel() {
        return this.startingLevel;
    }
}