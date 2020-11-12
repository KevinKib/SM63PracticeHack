_root.codeManager.add(new Code('individuallevel il', function(command) {
    // This code is disgusting as a whole and needs to be fixed as soon as possible

    // IL data options
    _root.WaterAmount = _root.TotalWater;
    _root.Restartcoins();
    _root.utils.setInfiniteWater(false);
    _root.utils.setInfiniteHealth(false);

    var IL = _root.codeManager.getIL();
    var level = command[1];
    var type = command[2];
    var starnum = parseInt(command[3]);

    var existingTypes = new Array();
    existingTypes.push('all', '100', 'star', 'allstars', 'nms', 'starcoin', 'allstarcoins');
    if (existingTypes.indexOf(type) == -1) {
        _root.textManager.send('message', 'Invalid IL command.');
        return;
    }

    var emptyArray = new Array();
    var mode = 'none';

    // World info
    var selectedWorld = _root.utils.getWorld(level);
    var levelTitle = selectedWorld.getName();
    var startingLevel = selectedWorld.getStartingLevel();
    var requiredStars = selectedWorld.getStars();
    var requiredStarCoins = selectedWorld.getStarCoins();
    var requiredFlags = selectedWorld.getFlags();
    var posX = selectedWorld.getCoordinates()[0];
    var posY = selectedWorld.getCoordinates()[1];

    _root.utils.setWorldStars(level, false);
    _root.utils.setWorldFlags(level, false);

    // Exception :If star coins do not matter in the goal,
    // we want them to already be collected
    if (type == 'allstars' || type == 'star') {
        _root.utils.setWorldStarCoins(level, true);
    } else {
        _root.utils.setWorldStarCoins(level, false);
    }

    // Clean this code pls
    IL.setRequiredStars(requiredStars);
    IL.setRequiredStarCoins(requiredStarCoins);
    IL.setRequiredFlags(emptyArray);
    IL.setNbRequiredStars(requiredStars.length);
    IL.setNbRequiredStarCoins(requiredStarCoins.length);

    switch (type) {
        case '100':
        case 'all':
            IL.setRequiredFlags(requiredFlags);
            mode = '100%';
            break;
        case 'allstars':
            IL.setRequiredStarCoins(emptyArray);
            IL.setNbRequiredStarCoins(0);
            mode = 'All Stars';
            break;
        case 'star':
            if (!isNaN(starnum) && (starnum >= 1 && starnum <= 5)) {
                var arr = new Array();
                arr.push(requiredStars[starnum - 1]);

                IL.setRequiredStars(arr);
                IL.setRequiredStarCoins(emptyArray);

                IL.setNbRequiredStars(requiredStars.length);
                IL.setNbRequiredStarCoins(requiredStarCoins.length);
                mode = 'Star ' + starnum;
            }
            break;
        case 'nms':
            var nbStars = parseInt(command[3]);
            var nbStarCoins = parseInt(command[4]);
            IL.setNbRequiredStars(nbStars);
            IL.setNbRequiredStarCoins(nbStarCoins);
            mode = 'No Major Skips : ' + nbStars + ' stars, ' + nbStarCoins + ' star coins';
            break;
        case 'allstarcoins':
            IL.setRequiredStars(emptyArray);
            IL.setNbRequiredStars(0);
            mode = 'All Star Coins';
            break;
        case 'starcoin':
            if (!isNaN(starnum) && (starnum >= 1 && starnum <= 6)) {
                var arr = new Array();
                arr.push(requiredStarCoins[starnum - 1]);
                IL.setRequiredStars(emptyArray);

                IL.setRequiredStars(emptyArray);
                IL.setRequiredStarCoins(arr);

                IL.setNbRequiredStars(requiredStars.length);
                IL.setNbRequiredStarCoins(requiredStarCoins.length);
                mode = 'Star Coin ' + starnum;
            }
            break;
        default:
            mode = 'None';
    }

    _root.utils.setWorldNozzle(level, 'all', 'false');

    // Options
    var i = 0;
    for (i = 0; i < command.length; i++) {

        switch (command[i]) {
            case '-f':
            case '-fludd':
                _root.utils.setWorldNozzle(level, 'all', 'true');
                mode = mode + ' + Fludd';
                break;
            case '-nosc':
                _root.utils.setWorldStarCoins(level, false);
                break;
            case '-sc':
                _root.utils.setWorldStarCoins(level, true);
                break;
        }
    }

    // Exceptions
    setTimeout(function() {
        if (level == 'bt3' || level == 'endgame' || level == 'b3reds' || level == 'b2reds') {
            // TODO : Check impossible-to-understand fludd bug
            _root.utils.setSaveFludd(false, true, true);
            _root.utils.setWorldNozzle('bt3', 'h', 'false');
            _root.utils.setFakeBowserCompleted(true);
        }
        if (level == 'space') {
            _root.utils.setSaveFludd(true, true, true);
        }
        if (level == 'escape') {
            _root.utils.setFluddPow("");
            _root.utils.setSaveFludd(true, true, true);
        }
    }, _root.utils.getAfterWarpTimeout());

    setTimeout(function() {
        _root.textManager.send('message', 'Current IL : ' + selectedWorld.getFullName() + ' | ' + mode);
    }, _root.utils.getAfterWarpTimeout());

    _root.utils.warp(startingLevel, posX, posY, posX, posY, false);
    IL.start(level);
}));
