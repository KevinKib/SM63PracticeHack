_root.codeManager.add(new Code('levelname ln', 'Returns the identifier of the current level.', 'levelname / ln', function(command) {
    _root.textManager.send('message', _root.utils.getLevelName());
}));
