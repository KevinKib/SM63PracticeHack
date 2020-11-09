// True Bowser end
_root.Course.FrontGFX.defeated = false;
stop();
rot = 0;
endcount = 0;
onEnterFrame = function() {
    rot = rot + 0.004;
    bomb1._x = Math.cos(rot) * 450;
    bomb1._y = Math.sin(rot) * 450;
    bomb2._x = Math.cos(rot + 1.2566370614359172) * 450;
    bomb2._y = Math.sin(rot + 1.2566370614359172) * 450;
    bomb3._x = Math.cos(rot + 2.5132741228718345) * 450;
    bomb3._y = Math.sin(rot + 2.5132741228718345) * 450;
    bomb4._x = Math.cos(rot + 3.7699111843077517) * 450;
    bomb4._y = Math.sin(rot + 3.7699111843077517) * 450;
    bomb5._x = Math.cos(rot + 5.026548245743669) * 450;
    bomb5._y = Math.sin(rot + 5.026548245743669) * 450;
    bombgfx1._x = bomb1._x;
    bombgfx1._y = bomb1._y + 50;
    bombgfx2._x = bomb2._x;
    bombgfx2._y = bomb2._y + 50;
    bombgfx3._x = bomb3._x;
    bombgfx3._y = bomb3._y + 50;
    bombgfx4._x = bomb4._x;
    bombgfx4._y = bomb4._y + 50;
    bombgfx5._x = bomb5._x;
    bombgfx5._y = bomb5._y + 50;
    camCenter._x = (_root.Course.FrontGFX.Bowser._x + (_root.Course.Char._x - _X) * 2) / 3;
    camCenter._y = (_root.Course.FrontGFX.Bowser._y + (_root.Course.Char._y - _Y) * 2) / 3;
    distance = Math.sqrt(Math.pow(_root.Course.FrontGFX.Bowser._x - (_root.Course.Char._x - _X), 2) + Math.pow(_root.Course.FrontGFX.Bowser._y - (_root.Course.Char._y - _Y), 2));
    if (_root.Course.FrontGFX.Bowser.HP <= 0) {
        if (endcount == 0) {
        }
        if (endcount > 11) {
            _root.event.onTrueBowserEnd();
            //_root.gotoAndStop("Ending");
            _root.RemoveCourse();
        }
        endcount++;
    }
};
