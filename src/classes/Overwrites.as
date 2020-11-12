// This code overwrites the functions written in frame3_3, as editing the file is impossible in FFDec
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