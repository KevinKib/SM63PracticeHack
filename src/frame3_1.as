// Considering the camera glitch problem comes from the CharCode function,
// we're able to fix it by moving the StartChar definition to frame3_2
// (which should be executed right after).

StartChar = function(a, b, c, d, e, f, g, h, i, resetmusic) {
    _root.playingcourse = a;
    if (_root.Starnamenum == 0) {
        _root.AreaTextAppear = true;
    }
    _root.CinemaMessage = "";
    _root.CinemaMessageFrame = 1;
    _root.TextHint = "";
    _root.ToadMessage = "";
    if (_root[a + "Gravity"] == undefined) {
        _root.gravity = 1;
    } else {
        _root.gravity = _root[a + "Gravity"];
    }
    if (_root[a + "defaultstep"] == undefined) {
        _root.defaultstep = "Mario-Step";
    } else {
        _root.defaultstep = _root[a + "defaultstep"];
    }
    _root.attachMovie(_root[a + "FarBackground"], "FarBackground", _root.getNextHighestDepth(), {_x: _root.screensizeX / 2, _y: _root.screensizeY / 2});
    _root.createEmptyMovieClip("BGCourse", _root.getNextHighestDepth());
    _root.BGCourse._y = _root.screensizeY / 2;
    _root.BGCourse._x = _root.screensizeX / 2;
    _root.BGCourse.attachMovie(_root[a + "Background"], "BG", _root.BGCourse.getNextHighestDepth(), {_x: (-b) / 10, _y: (-c) / 10});
    _root.createEmptyMovieClip("MidBackground", _root.getNextHighestDepth());
    _root.MidBackground._y = _root.screensizeY / 2;
    _root.MidBackground._x = _root.screensizeX / 2;
    _root.MidBackground.attachMovie(_root[a + "MidBackground"], "BG", _root.MidBackground.getNextHighestDepth(), {_x: (-b) / 5, _y: (-c) / 5});
    _root.createEmptyMovieClip("BGCloseCourse", _root.getNextHighestDepth());
    _root.BGCloseCourse._y = _root.screensizeY / 2;
    _root.BGCloseCourse._x = _root.screensizeX / 2;
    _root.BGCloseCourse.attachMovie(_root[a + "CloseBackground"], "BG", _root.BGCloseCourse.getNextHighestDepth(), {_x: (-b) / 2, _y: (-c) / 2});
    _root.createEmptyMovieClip("Course", _root.getNextHighestDepth());
    _root.Course._y = _root.screensizeY / 2;
    _root.Course._x = _root.screensizeX / 2;
    b = -b;
    c = -c;
    d = -d;
    e = -e;
    _root.Course.attachMovie(a + "Puddle", "Puddle", _root.Course.getNextHighestDepth(), {_x: b, _y: c});
    _root.Course.attachMovie(a + "Ice", "Ice", _root.Course.getNextHighestDepth(), {_x: b, _y: c});
    _root.Course.attachMovie(a + "BackGFX", "BackGFX", _root.Course.getNextHighestDepth(), {_x: b, _y: c});
    _root.Course.attachMovie(a + "Platforms", "Platforms", _root.Course.getNextHighestDepth(), {_x: b, _y: c, _visible: false});
    _root.Course.attachMovie(a + "BPlatforms", "BPlatforms", _root.Course.getNextHighestDepth(), {_x: b, _y: c, _visible: false});
    _root.Course.attachMovie("Char", "Char", _root.Course.getNextHighestDepth(), {_x: b - d, _y: c - e});
    _root.Course.attachMovie(a + "Water", "Water", _root.Course.getNextHighestDepth(), {_x: b, _y: c});
    _root.Course.attachMovie(a + "Lava", "Lava", _root.Course.getNextHighestDepth(), {_x: b, _y: c, _visible: false});
    _root.Course.attachMovie(a + "FrontGFX", "FrontGFX", _root.Course.getNextHighestDepth(), {_x: b, _y: c});
    if (_root.Course.FrontGFX._x == undefined) {
        _root.Course.createEmptyMovieClip("FrontGFX", _root.Course.getNextHighestDepth());
        _root.Course.FrontGFX._x = b;
        _root.Course.FrontGFX._y = c;
    }
    _root.Course.attachMovie(a + "Edge", "Edge", _root.Course.getNextHighestDepth(), {_x: b, _y: c, _alpha: 0});
    _root.Course.attachMovie(a + "CamEdge", "CamEdge", _root.Course.getNextHighestDepth(), {_x: b, _y: c, _alpha: 0});
    _root.Course.createEmptyMovieClip("Enemyhurt", _root.Course.getNextHighestDepth());
    _root.Course.Enemyhurt._x = b;
    _root.Course.Enemyhurt._y = c;
    _root.Course.BackGFX.createEmptyMovieClip("StartClip", _root.Course.BackGFX.getNextHighestDepth());
    _root.Course.BackGFX.StartClip._y = _root.Course.Char._y - _root.Course.BackGFX._y;
    _root.Course.BackGFX.StartClip._x = _root.Course.Char._x - _root.Course.BackGFX._x;
    _root.StartY = _root.Course.BackGFX.StartClip._y - _root.Course.BackGFX._y;
    _root.StartX = _root.Course.BackGFX.StartClip._x - _root.Course.BackGFX._x;
    tellTarget(_root.Course.Char)
    {
        tall = 35;
        wide = 10;
        yspeed = 0;
        xspeed = 0;
        air = true;
        frame = 1;
        lockon = true;
        Ice = false;
        Puddle = false;
        Water = false;
        attack = false;
        attackFrame = "";
        _root.DiveRot = 0;
        hurt = false;
        blink = 0;
        StunTime = 0;
        doublejump = 0;
        doublejumpcount = 0;
        _root.playpause = false;
        spinattackcount = 0;
        spincount = 0;
        spinattackcounter = 0;
        Squish = false;
        underwatercount = 0;
        abovewatercount = 0;
        swimup = false;
        changeFludd = false;
        canChangeFludd = true;
        landtime = 0;
        fallcount = 0;
        hurtfallcount = 0;
        divewaitcount = 7;
        swimupcount = 0;
        swimup = false;
        _root.JumpPress = false;
        _root.LastFrameJumpPress = false;
        _xscale = _root.CharXscale;
    }
    _root.Camcenter = _root.Course.Char;
    _root.Controll = true;
    _root.CameraZoom = 100;
    _root.coursescale2 = f - 100;
    _root.coursescale = _root.coursescale2;
    _root.CameraZoom2 = _root.CameraZoom;
    _root.CamYchange = 50;
    _root.CamXchange = 0;
    _root.StepSound = _root.defaultstep;
    _root.changestep = 0;
    _root.Fluddpow = h;
    _root.CanSwitchFludd = true;
    if (_root[a + "Maxzoomout"] == undefined) {
        _root.Maxzoomout = 50;
    } else {
        _root.Maxzoomout = _root[a + "Maxzoomout"];
    }
    if (_root[a + "Maxzoomin"] == undefined) {
        _root.Maxzoomin = 200;
    } else {
        _root.Maxzoomin = _root[a + "Maxzoomin"];
    }
    _root.attachMovie("Stats Clip", "Stats", _root.getNextHighestDepth(), {_x: 0, _y: 0});
    _root.attachMovie(i, "Transition", _root.getNextHighestDepth(), {_x: _root.screensizeX / 2, _y: _root.screensizeY / 2});
    _root.attachMovie("Pointer", "pointer", _root.getNextHighestDepth(), {_x: _root.screensizeX / 2, _y: _root.screensizeY / 2});
    if (_root.CurrentPlayer == "Mario") {
        _root.Course.Char.gotoAndStop(1);
        _root.jumpspeed = _root.Mariojumpspeed;
    }
    if (_root.CurrentPlayer == "Luigi") {
        _root.Course.Char.gotoAndStop(4);
        _root.jumpspeed = _root.Luigijumpspeed;
    }
    _root.AntiSquish = 0;
    _root.PlayingChar = _root.CurrentPlayer;
    if (resetmusic == true) {
        _root.Invincible = false;
        _root.Metal = false;
        _root.Invisible = false;
        _root.WingCap = false;
        _root.PowerTimer = 0;
        if (_root[a + "MusicIntro"] !== undefined && _root[a + "MusicIntro"] !== "None") {
            _root.StopBGsong();
            _root.bgsong.stop();
            _root.bgsong = new Sound(this);
            _root.bgsong.attachSound(_root[a + "MusicIntro"]);
            if (_root.MuteBGMusic == false) {
                _root.bgsong.start(0, 1);
            }
            _root.bgsong.setVolume(_root.BgVolume);
            _root.SongIntro = _root[a + "MusicIntro"];
            _root.SongRepeat = _root[a + "Music"];
            _root.PlayingIntro = true;
            _root.bgsong.onSoundComplete = function() {
                _root.PlayingIntro = false;
                _root.bgsong.attachSound(_root[a + "Music"]);
                if (_root.MuteBGMusic == false) {
                    _root.bgsong.start(0, 999);
                }
                _root.bgsong.setVolume(_root.BgVolume);
            };
        } else {
            _root.PlayingIntro = false;
            _root.SongIntro = "None";
            _root.SongRepeat = _root[a + "Music"];
            _root.StopBGsong();
            _root.bgsong.stop();
            _root.bgsong = new Sound(this);
            _root.bgsong.attachSound(_root[a + "Music"]);
            if (_root.MuteBGMusic == false) {
                _root.bgsong.start(0, 999);
            }
            _root.bgsong.setVolume(_root.BgVolume);
            _root.bgsong.onSoundComplete = function() {
                _root.PlayingIntro = false;
                _root.bgsong.attachSound(_root[a + "Music"]);
                if (_root.MuteBGMusic == false) {
                    _root.bgsong.start(0, 999);
                }
                _root.bgsong.setVolume(_root.BgVolume);
            };
        }
    }
};
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
        camYspeed = (-_root.Camcenter._y + _root.Camcenter._parent._y) / _root.Camspeed;
        camXspeed = (-_root.Camcenter._x + _root.Camcenter._parent._x) / _root.Camspeed;
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
    if (_root.Camspeed > 1) {
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
            count++;
            if (count > 50) {
                break;
            }
        }
        _root.MoveAllPlats(count, 0);
        count = 0;
        while (_root.Course.CamEdge.hitTest(_root.screensizeX / 2, count, true)) {
            count++;
            if (count > 50) {
                break;
            }
        }
        _root.MoveAllPlats(-count, 0);
        count = 0;
        while (_root.Course.CamEdge.hitTest(_root.screensizeX - count, _root.screensizeY / 2, true)) {
            count++;
            if (count > 50) {
                break;
            }
        }
        _root.MoveAllPlats(0, count);
        count = 0;
        while (_root.Course.CamEdge.hitTest(count, _root.screensizeY / 2, true)) {
            count++;
            if (count > 50) {
                break;
            }
        }
        _root.MoveAllPlats(0, -count);
    }
    if (!_root.nullCam == true) {
        if (Math.abs(camYspeed) < 1) {
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
StartCreditsCourse = function(a, b, c, d, e, f) {
    _root.playingcourse = a;
    if (_root.Starnamenum == 0) {
        _root.AreaTextAppear = true;
    }
    _root.CinemaMessage = "";
    _root.CinemaMessageFrame = 1;
    _root.TextHint = "";
    _root.ToadMessage = "";
    if (_root[a + "Gravity"] == undefined) {
        _root.gravity = 1;
    } else {
        _root.gravity = _root[a + "Gravity"];
    }
    if (_root[a + "defaultstep"] == undefined) {
        _root.defaultstep = "Mario-Step";
    } else {
        _root.defaultstep = _root[a + "defaultstep"];
    }
    _root.attachMovie(_root[a + "FarBackground"], "FarBackground", _root.getNextHighestDepth(), {_x: _root.screensizeX / 2, _y: _root.screensizeY / 2});
    _root.createEmptyMovieClip("BGCourse", _root.getNextHighestDepth());
    _root.BGCourse._y = _root.screensizeY / 2;
    _root.BGCourse._x = _root.screensizeX / 2;
    _root.BGCourse.attachMovie(_root[a + "Background"], "BG", _root.BGCourse.getNextHighestDepth(), {_x: (-b) / 10, _y: (-c) / 10});
    _root.createEmptyMovieClip("MidBackground", _root.getNextHighestDepth());
    _root.MidBackground._y = _root.screensizeY / 2;
    _root.MidBackground._x = _root.screensizeX / 2;
    _root.MidBackground.attachMovie(_root[a + "MidBackground"], "BG", _root.MidBackground.getNextHighestDepth(), {_x: (-b) / 5, _y: (-c) / 5});
    _root.createEmptyMovieClip("BGCloseCourse", _root.getNextHighestDepth());
    _root.BGCloseCourse._y = _root.screensizeY / 2;
    _root.BGCloseCourse._x = _root.screensizeX / 2;
    _root.BGCloseCourse.attachMovie(_root[a + "CloseBackground"], "BG", _root.BGCloseCourse.getNextHighestDepth(), {_x: (-b) / 2, _y: (-c) / 2});
    _root.createEmptyMovieClip("Course", _root.getNextHighestDepth());
    _root.Course._y = _root.screensizeY / 2;
    _root.Course._x = _root.screensizeX / 2;
    b = -b;
    c = -c;
    d = -d;
    e = -e;
    _root.Course.attachMovie(a + "Puddle", "Puddle", _root.Course.getNextHighestDepth(), {_x: b, _y: c});
    _root.Course.attachMovie(a + "Ice", "Ice", _root.Course.getNextHighestDepth(), {_x: b, _y: c});
    _root.Course.attachMovie(a + "BackGFX", "BackGFX", _root.Course.getNextHighestDepth(), {_x: b, _y: c});
    _root.Course.attachMovie(a + "Platforms", "Platforms", _root.Course.getNextHighestDepth(), {_x: b, _y: c, _visible: false});
    _root.Course.attachMovie(a + "BPlatforms", "BPlatforms", _root.Course.getNextHighestDepth(), {_x: b, _y: c, _visible: false});
    _root.Course.attachMovie(a + "Water", "Water", _root.Course.getNextHighestDepth(), {_x: b, _y: c});
    _root.Course.attachMovie(a + "Lava", "Lava", _root.Course.getNextHighestDepth(), {_x: b, _y: c, _visible: false});
    _root.Course.attachMovie(a + "FrontGFX", "FrontGFX", _root.Course.getNextHighestDepth(), {_x: b, _y: c});
    if (_root.Course.FrontGFX._x == undefined) {
        _root.Course.createEmptyMovieClip("FrontGFX", _root.Course.getNextHighestDepth());
        _root.Course.FrontGFX._x = b;
        _root.Course.FrontGFX._y = c;
    }
    _root.Course.attachMovie(a + "Edge", "Edge", _root.Course.getNextHighestDepth(), {_x: b, _y: c, _alpha: 0});
    _root.Course.attachMovie(a + "CamEdge", "CamEdge", _root.Course.getNextHighestDepth(), {_x: b, _y: c, _alpha: 0});
    _root.Course.createEmptyMovieClip("Enemyhurt", _root.Course.getNextHighestDepth());
    _root.Course.Enemyhurt._x = b;
    _root.Course.Enemyhurt._y = c;
    _root.PauseGame = false;
    _root.CreditsQuiet = true;
    _root.CreditsCamFirstFrame = 0;
    _root.onEnterFrame = function() {
        _root.CreditsEnterFrame();
    };
};
CreditsEnterFrame = function() {
    _root.Course._yscale = _root.CreditsCourseScaleY;
    _root.Course._xscale = _root.CreditsCourseScaleX;
    _root.BGCourse._yscale = (_root.CreditsCourseScaleY - 100) / 5 + 100;
    _root.BGCourse._xscale = (_root.CreditsCourseScaleX - 100) / 5 + 100;
    _root.MidBackground._yscale = (_root.CreditsCourseScaleY - 100) / 2 + 100;
    _root.MidBackground._xscale = (_root.CreditsCourseScaleX - 100) / 2 + 100;
    _root.BGCloseCourse._y = (_root.CreditsCourseScaleY - 100) / 1 + 100;
    _root.BGCloseCourse._x = (_root.CreditsCourseScaleX - 100) / 1 + 100;
    _root.coursescale = _root.CreditsCourseScaleY;
    _root.Course.Puddle._y = _root.CreditsCourseY;
    _root.Course.Puddle._x = _root.CreditsCourseX;
    _root.Course.Ice._y = _root.CreditsCourseY;
    _root.Course.Ice._x = _root.CreditsCourseX;
    _root.Course.BackGFX._y = _root.CreditsCourseY;
    _root.Course.BackGFX._x = _root.CreditsCourseX;
    _root.Course.Platforms._y = _root.CreditsCourseY;
    _root.Course.Platforms._x = _root.CreditsCourseX;
    _root.Course.BPlatforms._y = _root.CreditsCourseY;
    _root.Course.BPlatforms._x = _root.CreditsCourseX;
    _root.Course.Water._y = _root.CreditsCourseY;
    _root.Course.Water._x = _root.CreditsCourseX;
    _root.Course.Lava._y = _root.CreditsCourseY;
    _root.Course.Lava._x = _root.CreditsCourseX;
    _root.Course.FrontGFX._y = _root.CreditsCourseY;
    _root.Course.FrontGFX._x = _root.CreditsCourseX;
    _root.Course.Edge._y = _root.CreditsCourseY;
    _root.Course.Edge._x = _root.CreditsCourseX;
    _root.Course.CamEdge._y = _root.CreditsCourseY;
    _root.Course.CamEdge._x = _root.CreditsCourseX;
    _root.FarBackground.BG._y = (_root.CreditsCourseY - 100) / 10 + 100;
    _root.FarBackground.BG._x = (_root.CreditsCourseX - 100) / 10 + 100;
    _root.BGCourse.BG._y = (_root.CreditsCourseY - 100) / 5 + 100;
    _root.BGCourse.BG._x = (_root.CreditsCourseX - 100) / 5 + 100;
    _root.MidBackground.BG._y = (_root.CreditsCourseY - 100) / 3 + 100;
    _root.MidBackground.BG._x = (_root.CreditsCourseX - 100) / 3 + 100;
    _root.BGCloseCourse.BG._y = (_root.CreditsCourseY - 100) / 2 + 100;
    _root.BGCloseCourse.BG._x = (_root.CreditsCourseX - 100) / 2 + 100;
    _root.currentCamX = 0;
    _root.currentCamY = 0;
    _root.Course._rotation = _root.CreditsCourseRot;
    _root.BGCourse._rotation = _root.CreditsCourseRot;
    _root.MidBackground._rotation = _root.CreditsCourseRot;
    _root.BGCloseCourse._rotation = _root.CreditsCourseRot;
    _root.FarBackground._rotation = _root.CreditsCourseRot;
};
_root.RemoveCreditsCourse = function() {
    _root.CreditsQuiet = false;
    _root.Course.removeMovieClip(_root.Course);
    _root.BGCourse.removeMovieClip(_root.BGCourse);
    _root.MidBackground.removeMovieClip(_root.MidBackground);
    _root.BGCloseCourse.removeMovieClip(_root.BGCloseCourse);
    _root.FarBackground.removeMovieClip(_root.FarBackground);
    _root.onEnterFrame = null;
};
