_root.codeManager.add(new Code('noclip nc', function(command) {
    if (command[1] == 'on') {
        tempCourseScale = _root.coursescale2;
        if (isNaN(_root.coursescale2))
        {
            root.textManager.send('message', 'Noclip is already disabled.');
        }
        else
        {
            _root.coursescale2 = NaN;
            _root.textManager.send('message', 'Noclip has been enabled.');
        }
    }
    else if (command[1] == 'off') {
        if (isNaN(_root.coursescale2))
        {
            _root.coursescale2 = tempCourseScale; //should probably improve this at some point, since the player probably doesn't want all the enemies to fall through the floor
            _root.textManager.send('message', 'Noclip has been disabled.');
        }
        else
        {
            _root.textManager.send('message', 'Noclip is already disabled.');
        }
        
    }
}));