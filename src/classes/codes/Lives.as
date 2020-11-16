_root.codeManager.add(new Code('lives', '', '', function(command) {
    if (command[1] == 'infinite') {
        _root.CharLives = NaN;
        _root.textManager.send('message', 'Lives are now infinite.');
    } else {
        _root.CharLives = Number(command[1]);
        _root.textManager.send('message', 'Lives have been set to ' + _root.CharLives + '.');
    }
}));
