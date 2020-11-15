_root.codeManager.add(new Code('clearhotkey clhtk', '', function(command) {
    var key = command[1];

    _root.hotkeyManager.remove(key);
    _root.textManager.send('message', 'The hotkey ' + key + '\'s bind was succesfully removed.');
}));
