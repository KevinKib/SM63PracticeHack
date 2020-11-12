_root.codeManager.add(new Code('position pos', function(command) {
    //_root.textManager.send('message', _root.utils.getPositionString() + ' | | '  + _root.Course.Char._x + ' ' + _root.Course.Char._y + ' | ' + _root.Course.FrontGFX._x + ' ' + _root.Course.FrontGFX._y + ' | ' +_root.Course.Char._X + ' ' + _root.Course.Char._Y);
    _root.textManager.send('message', _root.utils.getPositionString());
}));
