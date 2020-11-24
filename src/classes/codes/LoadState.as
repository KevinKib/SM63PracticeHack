_root.codeManager.add(new Code('loadstate ls', 'Loads a previously created savestate.', 'loadstate / ls NAME', function(command) {
    var name = command[1];
    _root.saveStateManager.load(name);
    _root.textManager.send('message', 'Loaded state '+name+'.');

    if (command[2] == '-t') {
        _root.timer.reset();
    }
}));
