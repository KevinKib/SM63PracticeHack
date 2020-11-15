_root.codeManager.add(new Code('zoomlock zl', '', function(command) {
	if (command[1] == 'on') {
        if (_root.Maxzoomin == Infinity)
        {
            _root.Maxzoomin = 200;
            _root.Maxzoomout = 50;
            _root.textManager.send('message', 'Zoom lock has been enabled.');
        }
        else
        {
            _root.textManager.send('message', 'Zoom lock is already enabled.');
        }
    }
    else if (command[1] == 'off') {
        if (_root.Maxzoomin == Infinity)
        {
            _root.textManager.send('message', 'Zoom lock is already disabled.');
        }
        else
        {
            _root.Maxzoomin = Infinity;
            _root.Maxzoomout = -Infinity;
            _root.textManager.send('message', 'Zoom lock has been disabled.');
        }
    }
    else if (command[1] == undefined)
    {
        _root.textManager.send('message', 'Zoom locked: '+!(_root.Maxzoomin == Infinity)); //gross
    }
}));	