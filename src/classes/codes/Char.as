_root.codeManager.add(new Code('char', 'Allows to switch characters.', 'char {mario|luigi|toggle}', function(command) {

    switch (command[1]) {
        case 'mario':
        case 'Mario':
        case 'm':
        case 'M':
            _root.CurrentPlayer = 'Mario';
            _root.textManager.send('message', 'Character switched to Mario.');
            break;
        case 'luigi':
        case 'Luigi':
        case 'l':
        case 'L':
            _root.CurrentPlayer = 'Luigi';
            _root.textManager.send('message', 'Character switched to Luigi.');
            break;
        case 'toggle':
        case '':
        case undefined:
            if (_root.CurrentPlayer == "Mario") {
                _root.CurrentPlayer = "Luigi";
                _root.textManager.send('message', 'Character switched to Luigi.');
            } else {
                _root.CurrentPlayer = "Mario";
                _root.textManager.send('message', 'Character switched to Mario.');
            }
            break;
    }

}));
