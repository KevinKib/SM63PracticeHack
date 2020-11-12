_root.codeManager.add(new Code('latestwarpposition lwp', function(command) {
    _root.textManager.send('message', _root.utils.getLevelName() + ' ' + _root.utils.getLatestWarpPositionString());
}));
