_root.codeManager.add(new Code('star s', '', '', function(command) {

    if (isNaN(Number(command[1])) == false) {
        if (command[2] == 'true') {
            _root.utils.setStar(command[1], true);
            _root.textManager.send('message', 'Star ' + command[1] + ' has been set to true.');
        } else if (command[2] == 'false') {
            _root.utils.setStar(command[1], false);
            _root.textManager.send('message', 'Star ' + command[1] + ' has been set to false.');
        } else {
            _root.utils.setStar(command[1]);
            _root.textManager.send('message', 'Star ' + command[1] + ' has been toggled.');
        }
    } else {
        var level = command[1];
        var number = Number(command[2]);
        var bool = command[3];
        switch (bool) {
            case 'true':
                _root.utils.setWorldStars(level, true, number);
                _root.textManager.send('message', 'Star ' + number + ' from ' + level + ' has been set to true.');
                break;
            case 'false':
                _root.utils.setWorldStars(level, false, number);
                _root.textManager.send('message', 'Star ' + number + ' from ' + level + ' has been set to false.');
                break;
            default:
                _root.utils.setWorldStars(level, undefined, number);
                _root.textManager.send('message', 'Star ' + number + ' from ' + level + ' has been toggled.');
                break;
        }
    }
}));
