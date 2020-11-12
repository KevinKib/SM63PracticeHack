_root.codeManager.add(new Code('health', function(command) {
    if (command[1] == 'refill') {
        _root.CharHP = 8;
        _root.textManager.send('message', 'Health has been refilled.');
    } else if (command[1] == 'empty') {
        _root.CharHP = 1;
        _root.textManager.send('message', 'Health has been set to 1.');
    } else if (command[1] == 'death') {
        _root.CharHP = 0;
        _root.textManager.send('message', 'Death has been provoked.');
    } else {
        _root.CharHP = command[1];
        _root.textManager.send('message', 'Health has been set to ' + _root.CharHP + '.');
    }

    if (command[1] == 'infinite') {
        _root.utils.setHealth(8);
        _root.utils.setInfiniteHealth(true);
        _root.textManager.send('message', 'Health is now infinite.');
    } else {
        _root.utils.setInfiniteHealth(false);
        _root.textManager.send('message', 'Health is not infinite anymore.');
    }
}));
