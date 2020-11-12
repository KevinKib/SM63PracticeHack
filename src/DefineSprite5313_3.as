stop();
onEnterFrame = function() {
    if (this.box.hitTest(_root.Course.Char.charClip.feet2) && _root.Course.Char.attack == false && _root.Course.Char.air == false) {
        if (_root.KeyUP() && !_root.KeyRIGHT() && !_root.KeyLEFT()) {
            // We inject the event code to trigger the flag, only if the level is 8-11 => the door is fake bowser
            if (_root.utils.getLevelName() == "8-11") {
                _root.event.onFakeBowserStart();
            }
            _root.Course.Char.attack = true;
            _root.Course.Char.xspeed = 0;
            _root.Course.Char.attackFrame = "BigDoor";
            _root.door = doorplace;
            play();
        }
    }
};
