_root.codeManager.add(new Code('water', '', function(command) {
    if (command[1] == 'refill') {
        _root.WaterAmount = _root.TotalWater;
        _root.textManager.send('message', 'Water has been refilled.');
    } else if (command[1] == 'half') {
        _root.WaterAmount = 5000;
        _root.textManager.send('message', 'Water has been set to half.');
    } else if (command[1] == 'empty') {
        _root.WaterAmount = 0;
        _root.textManager.send('message', 'Water container is now empty.');
    } else {
        _root.WaterAmount = Number(command[1]);
        _root.textManager.send('message', 'Water has been set to ' + _root.WaterAmount + '.');
    }

    if (command[1] == 'infinite') {
        _root.WaterAmount = _root.TotalWater;
        _root.utils.setInfiniteWater(true);
        _root.textManager.send('message', 'Water is now infinite.');
    } else {
        _root.utils.setInfiniteWater(false);
        _root.textManager.send('message', 'Water is not infinite anymore.');
    }
}));
