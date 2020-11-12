// Class that manages the code that happens on certain occurences.
class Event {

    // Triggers code that happens on each frame.
    public function onEachFrame() {
        _root.timer.onEachFrame();
        _root.codeManager.onEachFrame();
        _root.textManager.onEachFrame();

        if (_root.timer.isDisplayed()) {
            _root.textManager.send('timer', _root.timer.getDisplay());
        } else {
            _root.textManager.send('timer', "");
            _root.textManager.send('segment_timer', "");
        }


        // KoopaShell
        if (_root.KeySlash()) {
            _root.koopashellInput = true;
        }
        _root.tickCpu();
        setCollision();
    }

    // Triggers code that happens on every loading zone.
    public function onLoadingZone() {
        _root.timer.onLoadingZone();
        _root.textManager.send('message', "");

        if (_root.timer.isDisplayed()) {
            _root.textManager.send('segment_timer', _root.timer.getDisplay());
        }

    }

    // Triggers code that happens when the star is collected.
    public function onStarCollected() {
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }
    }

    // Triggers code that happens when the star coin is collected.
    public function onStarCoinCollected() {
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }
    }

    // Triggers code that happens when a key is collected.
    public function onKeyCollected() {
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }
    }

    // Triggers code that happens when the fake bowser door is opened.
    public function onFakeBowserStart() {
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.utils.setFlag('bt3', true);
            _root.codeManager.getIL().onStarCollected();
            _root.WaterAmount = _root.TotalWater;
        }
    }

    // Triggers code that happens when Space is finished.
    public function onSpaceEnd() {
        _root.utils.setFlag('space', true);
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }


        if (_root.utils.getCutscenes()) {
            _root.gotoAndStop("BowserBattle3");
        } else {
            _root.Fluddpow = "";
            _root.CharHP = 8;
            _root.utils.warp('8-16', 0, -350, 0, -250);
        }
    }

    // Triggers code that happens when the true bowser fight is loaded.
    public function onTrueBowserStart() {
    /*
       if (_root.codeManager.getIL().isGoing() === true) {
       _root.codeManager.getIL().onStarCollected();
       }
     */
    }

    // Triggers code that happens when the true bowser fight is terminated.
    public function onTrueBowserEnd() {
        if (_root.utils.getCutscenes()) {
            _root.gotoAndStop("Ending");
        } else {
            _root.Fluddpow = "";
            _root.CharHP = 8;
            _root.utils.warp('BC-1', 0, 0, 0, 0);
            _root.utils.setSaveFludd(true);
        }
    }

    // Triggers code that happens when the escape is finished / the game is done.
    public function onEscapeEnd() {
        if (_root.codeManager.getIL().isGoing() === true) {
            _root.codeManager.getIL().onStarCollected();
        }

        if (_root.utils.getCutscenes()) {
            _root.gotoAndStop("Credits");
        } else {
            _root.utils.warp('C-1', 0, 0, 0, 0);
            _root.utils.setStar(36, true);
        }
    }

    // Triggers code that happens on the course select menu.
    public function onCourseSelect() {
        _root.timer.addSecond();
    }

    // Triggers code that happens on the mini course select menu.
    public function onMiniCourseSelect() {
        this.onCourseSelect();
    }

    // Returns the warp where the door to Fake Bowser will redirect.
    public function getFakeBowserWarp() {
        var value = "8-12";
        // if (_root.utils.getFakeBowserCompleted()) {
        //     _root.textManager.send('debug', 'test');
        //     value = "8-13";
        // }
        return value;
    }

}