_root.codeManager.add(new Code('fakebowser fb', '', function(command) {
    if (command[1] == 'on') {
        _root.utils.setFakeBowserCompleted(false);
        _root.textManager.send('message', 'Fake Bowser has been enabled and can be fought.');
    } else if (command[1] == 'off') {
        _root.utils.setFakeBowserCompleted(true);
        _root.textManager.send('message', 'Fake Bowser has been disabled and cannot be fought.');
    }
}));
