if (_root.StarCoin[StarCoinNum] == false) {
    stop();
    count = 0;
    onEnterFrame = function() {
        count++;
        if (count > 3) {
            if (this.box.hitTest(_root.Course.Char._x * _root.coursescale / 100 + _root.Course._x, (_root.Course.Char._y - 20) * _root.coursescale / 100 + _root.Course._y, true) && _root.CharHP >= 0 && !(_root.Course.Char.attack == true && (_root.Course.Char.attackFrame == "Faint" || _root.Course.Char.attackFrame == "Respawn" || _root.Course.Char.attackFrame == "Drown"))) {
                _root.StarCoin[StarCoinNum] = true;
                _root.CalculateStarCoins();

                // Additional code when a star coin is collected
                _root.event.onStarCoinCollected();

                _root.attachMovie("StarcoinMessage", "StarcoinMessage", _root.getNextHighestDepth(), {_x: 225, _y: 150});
                _root.PauseGame = true;
                gotoAndPlay(3);
                onEnterFrame = function() {
                    if (_root.PauseGame == false) {
                        play();
                    } else {
                        stop();
                    }
                };
            }
        }
    };
} else {
    gotoAndStop(2);
}
