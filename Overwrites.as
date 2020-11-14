// This code overwrites the functions written in frame3_1 and frame3_3

CharCode = function() {
    _root.bgsong.setVolume(_root.BgVolume);
    _root.lastcoinsound = _root.lastcoinsound - 1;
    _root.lastcoinsound = Math.max(_root.lastcoinsound, 0);
    _root.StartY = _root.Course.BackGFX.StartClip._y + _root.Course.BackGFX._y;
    _root.StartX = _root.Course.BackGFX.StartClip._x + _root.Course.BackGFX._x;
    _root.Power = Math.min(_root.Power, _root.TotalPower);
    _root.Power = Math.max(_root.Power, 0);
    _root.WaterAmount = Math.min(_root.WaterAmount, _root.TotalWater);
    _root.WaterAmount = Math.max(_root.WaterAmount, 0);
    _root.Course._yscale = _root.coursescale;
    _root.Course._xscale = _root.coursescale;
    _root.BGCourse._yscale = (_root.coursescale - 100) / 5 + 100;
    _root.BGCourse._xscale = (_root.coursescale - 100) / 5 + 100;
    _root.MidBackground._yscale = (_root.coursescale - 100) / 2 + 100;
    _root.MidBackground._xscale = (_root.coursescale - 100) / 2 + 100;
    _root.BGCloseCourse._yscale = (_root.coursescale - 100) / 1 + 100;
    _root.BGCloseCourse._xscale = (_root.coursescale - 100) / 1 + 100;
    _root.Waterpercent = _root.WaterAmount / _root.TotalWater * 100;
    _root.Powerpercent = _root.Power / _root.TotalPower * 100;
    if (_root.KeyPlus()) {
        _root.CameraZoom = _root.CameraZoom + 2;
    }
    if (_root.KeyMinus()) {
        _root.CameraZoom = _root.CameraZoom - 2;
    }
    while (_root.coincount >= 100) {
        _root.coincount = _root.coincount - 100;
        _root.CharLives = _root.CharLives + 1;
        _root.Course.FrontGFX.attachMovie("1upAnimation", "1up" + _root.Course.FrontGFX.getNextHighestDepth(), _root.Course.FrontGFX.getNextHighestDepth(), {_x: _root.Course.Char._x - _root.Course.FrontGFX._x, _y: _root.Course.Char._y - _root.Course.FrontGFX._y});
    }
    while (_root.hpcoincount >= 5 && _root.CharHP < 8) {
        _root.hpcoincount = _root.hpcoincount - 5;
        _root.CharHP = _root.CharHP + 1;
        _root.hpcoinplay = true;
    }
    _root.hpcoincount = Math.min(_root.hpcoincount, 5);
    if (_root.Invincible == true) {
        _root.CharHP = _root.CharHP + 1;
    }
    _root.CharHP = Math.min(_root.CharHP, 8);
    if (_root.CharHP == 8) {
        _root.hpcoincount = 0;
    }
    tellTarget(_root.Course.Char)
    {
        if (_root.CurrentPlayer == "Mario") {
            if (_root.Fluddpow == "") {
                tall = 34;
            } else {
                tall = 40;
            }
            if (attack == true && attackFrame == "Dive") {
                tall = 25;
                wide = 8;
            } else {
                wide = 10;
            }
        }
        if (_root.CurrentPlayer == "Luigi") {
            if (_root.Fluddpow == "") {
                tall = 36;
            } else {
                tall = 43;
            }
            if (attack == true && attackFrame == "Dive") {
                tall = 23;
                wide = 8;
            } else {
                wide = 9;
            }
        }
    }
    if (_root.PauseGame == false) {
        _root.UnpausedCharEngine();
        _root.Controll = true;
    }
    if (_root.Camcenter == _root.Course.Char) {
        camYspeed = (-_root.Camcenter._y + _root.CamYchange) / _root.Camspeed;
        camXspeed = (-_root.Camcenter._x + _root.CamXchange) / _root.Camspeed;
        if (_root.Course.Char.air == true) {
            _root.CamYchange = (80 - _root.CamYchange) / 10;
        } else {
            _root.CamYchange = (50 - _root.CamYchange) / 10;
        }
        _root.CamXchange = (-_root.CamXchange) / 10;
        camYspeed = camYspeed - _root.Course.Char.yspeed / 4;
        camXspeed = camXspeed - _root.Course.Char.xspeed / 4;
        _root.currentCamY = _root.Camcenter._y;
        _root.currentCamX = _root.Camcenter._x;
    } else {
        camYspeed = (-1 * (_root.Camcenter._parent._y + _root.Camcenter._y )) / _root.Camspeed;
        camXspeed = (-1 * (_root.Camcenter._parent._x + _root.Camcenter._x )) / _root.Camspeed;

        _root.currentCamY = _root.Camcenter._y + _root.Camcenter._parent._y;
        _root.currentCamX = _root.Camcenter._x + _root.Camcenter._parent._x;
    }
    if (_root.KeySPACE() && _root.Power >= 100 && _root.WaterAmount > 0 && _root.Fluddpow == "T" && _root.Camcenter == _root.Course.Char && _root.PauseGame == false && _root.Controll == true) {
        camXspeed = (-_root.Course.Char._x) / 5;
        camXspeed = camXspeed - _root.Course.Char.xspeed;
    }
    if (_root.Course.Char.attack == true && _root.Course.Char.attackFrame == "Flying") {
        camXspeed = camXspeed - (_root.Course.Char.xspeed * 1.5 - _root.Course.Char._xscale / 40);
        camYspeed = camYspeed - _root.Course.Char.yspeed * 1.5;
    }
    if (_root.Course.Char.attack == true && _root.Course.Char.attackFrame == "Lava" && _root.Camcenter == _root.Course.Char) {
        camYspeed = (-_Y) / 500;
    }
    camYspeed = Math.max(-_root.MaxCamspeed, camYspeed);
    camYspeed = Math.min(_root.MaxCamspeed, camYspeed);
    camXspeed = Math.max(-_root.MaxCamspeed, camXspeed);
    camXspeed = Math.min(_root.MaxCamspeed, camXspeed);
    _root.CameraZoom = Math.min(_root.Maxzoomin, _root.CameraZoom);
    _root.CameraZoom = Math.max(_root.Maxzoomout, _root.CameraZoom);
    _root.CameraZoom2 = _root.CameraZoom2 + Math.round(_root.CameraZoom - _root.CameraZoom2) / 20;
    _root.coursescale2 = _root.groundFriction(_root.coursescale2, 3, 1.01);
    _root.coursescale = _root.coursescale2 + _root.CameraZoom2;
    if (_root.Camspeed > 1 && _root.utils.isCamLocked()) {
        if (_root.Course.CamEdge.hitTest(_root.screensizeX / 2, _root.screensizeY - Math.min(camYspeed, 0) + 1, true)) {
            camYspeed = Math.max(-1, camYspeed);
        }
        if (_root.Course.CamEdge.hitTest(_root.screensizeX / 2, -Math.max(camYspeed, 0) - 1, true) && _root.Camspeed > 1) {
            camYspeed = Math.min(1, camYspeed);
        }
        if (_root.Course.CamEdge.hitTest(_root.screensizeX - Math.min(camXspeed, 0) + 1, _root.screensizeY / 2, true)) {
            camXspeed = Math.max(-1, camXspeed);
        }
        if (_root.Course.CamEdge.hitTest(-Math.max(camXspeed, 0) - 1, _root.screensizeY / 2, true)) {
            camXspeed = Math.min(1, camXspeed);
        }
        count = 0;
        while (_root.Course.CamEdge.hitTest(_root.screensizeX / 2, _root.screensizeY - count, true)) {
            count = count + 1;
            if (count > 50) {
                break;
            }
        }
        _root.MoveAllPlats(count, 0);
        count = 0;
        while (_root.Course.CamEdge.hitTest(_root.screensizeX / 2, count, true)) {
            count = count + 1;
            if (count > 50) {
                break;
            }
        }
        _root.MoveAllPlats(-count, 0);
        count = 0;
        while (_root.Course.CamEdge.hitTest(_root.screensizeX - count, _root.screensizeY / 2, true)) {
            count = count + 1;
            if (count > 50) {
                break;
            }
        }
        _root.MoveAllPlats(0, count);
        count = 0;
        while (_root.Course.CamEdge.hitTest(count, _root.screensizeY / 2, true)) {
            count = count + 1;
            if (count > 50) {
                break;
            }
        }
        _root.MoveAllPlats(0, -count);
    }
    if (!_root.nullCam == true) {
        if (MatSh.abs(camYspeed) < 1) {
            camYspeed = 0;
        }
        if (Math.abs(camXspeed) < 1) {
            camXspeed = 0;
        }
        _root.MoveAllPlats(camYspeed, camXspeed);
    }
    _root.Camspeed = 10;
    _root.MaxCamspeed = 1200;
    _root.nullCam = false;
    _root.Camcenter = _root.Course.Char;
};

_root.gotoCourseSelect = function(level) {
    _root.Playinglevel = level;
    _root.RemoveCourse();
    _root.Restartcoins();
    _root.gotoAndStop("CourseSelect");
    _root.Transition.removeMovieClip(_root.Transition);
    _root.attachMovie("Fromwhite", "Transition", _root.getNextHighestDepth(), {_x: _root.screensizeX / 2, _y: _root.screensizeY / 2});
    _root.bgsong.stop();
    _root.bgsong = new Sound(this);
    _root.bgsong.attachSound("Star Swish");
    _root.bgsong.start(0, 1);
    _root.bgsong.setVolume(_root.BgVolume);

    // On course select
    _root.event.onCourseSelect();
};
_root.gotoMiniCourseSelect = function(level) {
    _root.Playinglevelnum = level;
    _root.Playinglevel = level + 8;
    _root.RemoveCourse();
    _root.Restartcoins();
    _root.gotoAndStop("MiniCourseSelect");
    _root.Transition.removeMovieClip(_root.Transition);
    _root.attachMovie("Fromwhite", "Transition", _root.getNextHighestDepth(), {_x: _root.screensizeX / 2, _y: _root.screensizeY / 2});
    _root.bgsong.stop();
    _root.bgsong = new Sound(this);
    _root.bgsong.attachSound("Star Swish");
    _root.bgsong.start(0, 1);
    _root.bgsong.setVolume(_root.BgVolume);

    // On mini course select
    _root.event.onMiniCourseSelect();
};
_root.changecourse = function(transition, level, a, b, c, d, e, isCommand) {
    _root.RemoveCourse();
    _root.gotoAndStop("Courseframe");
    if (e == undefined) {
        e = false;
    }
    _root.StartChar(level, a, b, c, d, 100, _root.CurrentPlayer, _root.Fluddpow, transition, e, isCommand);
    _root.onEnterFrame = function() {
        _root.CharCode();
    };
    e = false;
};