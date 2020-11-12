// Class that manages the start and end of individual levels.
class IndividualLevel {

    private var level;
    private var requiredStars;
    private var requiredStarCoins;
    private var requiredFlags;
    private var nbRequiredStars;
    private var nbRequiredStarCoins;

    public function IndividualLevel() {
        this.stop();
        this.requiredStars = new Array();
        this.requiredStarCoins = new Array();
        this.requiredFlags = new Array();
        this.nbRequiredStars = 0;
        this.nbRequiredStarCoins = 0;
    }

    // Getter for the required stars.
    public function isRequiredStar(index) {
        return (this.requiredStars.indexOf(index) != -1);
    }

    // Getter for the required star coins.
    public function isRequiredStarCoins(index) {
        return (this.requiredStarCoins.indexOf(index) != -1);
    }

    // Setter for the required stars.
    public function setRequiredStars(array) {
        this.requiredStars = array.slice();
    }

    // Setter for the required star coins.
    public function setRequiredStarCoins(array) {
        this.requiredStarCoins = array.slice();
    }

    // Setter for the required flags.
    public function setRequiredFlags(array) {
        this.requiredFlags = array.slice();
    }

    // Setter for the amount of required stars.
    public function setNbRequiredStars(nb) {
        this.nbRequiredStars = nb;
    }

    // Setter for the amount of required stars.
    public function setNbRequiredStarCoins(nb) {
        this.nbRequiredStarCoins = nb;
    }

    // Checks if the IL is finished.
    public function check() {

        var i = 0;
        var j = 0;

        var nbStars = 0;
        var nbStarCoins = 0;

        for (i = 0; i < this.requiredStars.length; i++) {
            var index = this.requiredStars[i];
            if (_root.utils.getStar(index) === true) {
                nbStars++;
            }
        }

        for (j = 0; j < this.requiredStarCoins.length; j++) {
            var index = this.requiredStarCoins[j];
            if (_root.utils.getStarCoin(index) === true) {
                nbStarCoins++;
            }
        }

        var bool = (nbStars >= this.nbRequiredStars) && (nbStarCoins >= this.nbRequiredStarCoins);

        return bool;
    }

    // Code that is executed when a star is collected.
    public function onStarCollected() {
        if (this.check() === true) {
            this.stop();
        }
    }

    // Starts an IL.
    public function start(level) {
        this.level = level;
        setTimeout(function() {
            _root.timer.reset();
        }, 200);
    }

    // Stops an IL.
    public function stop() {
        this.level = 'none';
        _root.timer.stop();
    }

    // Returns true if an IL is currently in the way.
    public function isGoing() {
        return (this.level != 'none');
    }

}
