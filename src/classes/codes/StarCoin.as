_root.codeManager.add(new Code('starcoin sc', 'Manages the state of a specific star coin.', 'starcoin / sc NUMBER [true|false]', function(command) {

    if (isNaN(Number(command[1])) == false) {
        if (command[2] == 'true') {
            _root.utils.setStarCoin(command[1], true);
            _root.textManager.send('message', 'Star coin ' + command[1] + ' has been set to true.');
        } else if (command[2] == 'false') {
            _root.utils.setStarCoin(command[1], false);
            _root.textManager.send('message', 'Star coin ' + command[1] + ' has been set to false.');
        } else {
            _root.utils.setStarCoin(command[1]);
            _root.textManager.send('message', 'Star coin ' + command[1] + ' has been toggled.');
        }
    } else {
        var level = command[1];
        var number = Number(command[2]);
        var bool = command[3];
        switch (bool) {
            case 'true':
                _root.utils.setWorldStarCoins(level, true, number);
                _root.textManager.send('message', 'Star coin ' + number + ' from ' + level + ' has been set to true.');
                break;
            case 'false':
                _root.utils.setWorldStarCoins(level, false, number);
                _root.textManager.send('message', 'Star coin ' + number + ' from ' + level + ' has been set to false.');
                break;
            default:
                _root.utils.setWorldStarCoins(level, undefined, number);
                _root.textManager.send('message', 'Star coin ' + number + ' from ' + level + ' has been set toggled.');
        }
    }

}));
