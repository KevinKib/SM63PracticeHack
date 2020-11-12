// Class that manages the data that a savestate holds.
class SaveState {

    private var name;

    private var char;
    private var warp;
    private var position;
    private var fludd;
    private var water;
    private var health;
    private var fluddpow;
    private var infiniteWater;
    private var infiniteHealth;
    private var caps;
    private var capTimer;

    private var starArray;
    private var starCoinArray;

    // Constructor of the SaveState class.
    public function SaveState(name) {
        this.name = name;
        this.retrieveData();
    }

    // Sets the current world data into the save state.
    public function retrieveData() {
        var i = 0;

        this.char = _root.utils.getCharacter();
        this.warp = _root.utils.getLevelName();
        this.position = _root.utils.getLatestWarpPosition();
        this.fludd = _root.utils.getSaveFludd();
        this.water = _root.utils.getWater();
        this.health = _root.utils.getHealth();
        this.fluddpow = _root.utils.getFluddPow();
        this.infiniteWater = _root.utils.isWaterInfinite();
        this.infiniteHealth = _root.utils.isHealthInfinite();
        this.caps = {invisible: _root.utils.getCap('invisible'),
                invincible: _root.utils.getCap('invincible'),
                metal: _root.utils.getCap('metal'),
                wing: _root.utils.getCap('wing')};
        this.capTimer = _root.utils.getCapTimer();

        this.starArray = new Array(64);
        this.starCoinArray = new Array(64);

        for (i = 0; i < 64; i++) {
            this.starArray[i] = _root.utils.getStar(i + 1);
            this.starCoinArray[i] = _root.utils.getStarCoin(i + 1);
        }
    }

    // Loads a save state in the game.
    public function load() {
        var i = 0;

        _root.utils.warp(this.warp, this.position[0], this.position[1], this.position[0], this.position[1]);

        _root.utils.setCharacter(this.char);
        _root.utils.setSaveFludd(this.fludd.h, this.fludd.r, this.fludd.t);
        _root.utils.setWater(this.water);
        _root.utils.setHealth(this.health);
        _root.utils.setFluddPow(this.fluddpow);
        _root.utils.setInfiniteWater(this.infiniteWater);
        _root.utils.setInfiniteHealth(this.infiniteHealth);
        _root.utils.setCapBool('invisible', this.caps.invisible);
        _root.utils.setCapBool('invincible', this.caps.invincible);
        _root.utils.setCapBool('metal', this.caps.metal);
        _root.utils.setCapBool('wing', this.caps.wing);
        _root.utils.setCapTimer(this.capTimer);
        for (i = 0; i < 64; i++) {
            _root.utils.setStar(i + 1, this.starArray[i]);
            _root.utils.setStarCoin(i + 1, this.starCoinArray[i]);
        }
    }

}