_root.codeManager.add(new Code('warp w', function(command) {

    var level = command[1];
    var player_x = command[2];
    var player_y = command[3];
    var camera_x = command[4];
    var camera_y = command[5];

    if (level != undefined) {

        var definedCoordinates = (player_x != undefined && player_y != undefined);

        if (definedCoordinates) {
            if (camera_x == undefined)
                camera_x = player_x;
            if (camera_y == undefined)
                camera_y = player_y;
            _root.utils.warp(command[1], player_x, player_y, camera_x, camera_y, false);
        } else {
            _root.utils.warp(command[1], 0, 0, 0, 0, true);
        }

        setTimeout(function() {
            _root.textManager.send('message', 'Player has been warped to ' + command[1] + '.');
        }, _root.utils.getAfterWarpTimeout());

    }

}));
