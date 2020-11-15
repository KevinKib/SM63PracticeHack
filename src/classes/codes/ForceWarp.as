_root.codeManager.add(new Code('forcewarp fw', '', function(command) {

    _root.betaQuest.stop();

    // Copy of the warp code, might clean later
    var level = command[1];
    var param_1 = command[2];
    var param_2 = command[3];
    var param_3 = command[4];
    var param_4 = command[5];

    if (level != undefined) {
        if (param_1 == undefined)
            param_1 = 0;
        if (param_2 == undefined)
            param_2 = 0;
        if (param_3 == undefined)
            param_3 = 0;
        if (param_4 == undefined)
            param_4 = 0;

        _root.utils.warp(command[1], param_1, param_2, param_3, param_4);
        _root.textManager.send('message', 'Player has been warped to ' + command[1] + '.');
    }

    setTimeout(function() {
        _root.betaQuest.restart();
    }, _root.utils.getWarpTimeout());

}));
