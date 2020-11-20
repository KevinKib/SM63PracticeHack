_root.codeManager.add(new Code('latestwarpposition lwp', 'Returns the latest position the player has warped into.', 'latestwarpposition / lwp', function(command) {
    _root.textManager.send('message', _root.utils.getLevelName() + ' ' + _root.utils.getLatestWarpPositionString());
}));
