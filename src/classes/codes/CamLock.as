_root.codeManager.add(new Code('camlock cl', 'Enables or disables camera edge locking.', 'camlock / cl {on|off}', function(command) {
    if (command[1] == 'on') {
        if (_root.utils.isCamLocked())
        {
            _root.textManager.send('message', 'Camera lock is already enabled.');
        }
        else
        {
            _root.utils.setCamLock(true);
            _root.textManager.send('message', 'Camera lock has been enabled.');
        }
    }
    else if (command[1] == 'off') {
        if (_root.utils.isCamLocked())
        {
            //_root.Course.CamEdge.clear(); // Clears level designer cam edge
            _root.utils.setCamLock(false);
            _root.textManager.send('message', 'Camera lock has been disabled.');
        }
        else
        {
            _root.textManager.send('message', 'Camera lock is already disabled.');
        }
    }
    else if (command[1] == undefined) {
        _root.textManager.send('message', 'Camera locked: '+_root.utils.isCamLocked());
    }
}));	