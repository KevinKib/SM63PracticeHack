_root.codeManager.add(new Code('levelname ln', function(command) {
    _root.textManager.send('message', _root.utils.getLevelName());
}));
