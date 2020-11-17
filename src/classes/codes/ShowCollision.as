_root.codeManager.add(new Code('showcollision shc', function(command) {
    if (command[1] == 'on') {
        _root.utils.setCollisionVisible(true);
        _root.textManager.send('message', 'Collision has been shown.');
    } else if (command[1] == 'off') {
        _root.utils.setCollisionVisible(false);
        _root.textManager.send('message', 'Collision has been hidden.');
    }
}));
