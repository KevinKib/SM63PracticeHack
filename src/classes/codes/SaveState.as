_root.codeManager.add(new Code('savestate ss', 'Creates a new savestate, that can be loaded in the future using loadstate.', 'savestate / ss NAME', function(command) {
    var name = command[1];
    _root.saveStateManager.save(name);
    _root.textManager.send('message', "State " + name + " saved.");
}));
