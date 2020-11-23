_root.codeManager.add(new Code('warplist wl', 'Displays a complete list of the warps, per section.', '', function(command) {
    var str = "";
    var worldName = command[1];
    var i = 0;

    if (worldName != undefined) {
        var world = _root.utils.getWorld(worldName);

        if (world != undefined) {
            var warps = world.getWarps();

            for (i in warps) {
                str = str + i + " ";
            }

            _root.utils.displaySignMessage(str);
        }
        else {
            _root.textManager.send('message', 'Invalid world.');
        }
    }
    else {
        // Display a list of the worlds
        var worldList = _root.utils.getWorldList();
        
        for (i = 0; i < worldList.length; i++) {
            if (worldList[i].hasWarps()) {
                str = str + worldList[i].getName() + " ";
            }
        }

        _root.utils.displaySignMessage(str);
    }
}));
