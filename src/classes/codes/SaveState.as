_root.codeManager.add(new Code('savestate ss', '', '', function(command) {
    var name = command[1];
    _root.saveStateManager.save(name);
    _root.textManager.send('message', "State " + name + " saved.");
}));
