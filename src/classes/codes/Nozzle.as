_root.codeManager.add(new Code('nozzle', function(command) {
    var world = command[1];
    var nozzle = command[2];
    var bool = command[3];
    if (world === undefined || nozzle === undefined || bool === undefined) {
        _root.textManager.send('message', 'Invalid syntax.');
        return;
    }
    _root.utils.setWorldNozzle(world, nozzle, bool);
    _root.textManager.send('message', 'Saved nozzles from worlds have been updated.');
}));
