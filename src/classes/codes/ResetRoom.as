_root.codeManager.add(new Code('resetroom rr', function(command) {
    if (command[1] == 'p' || command[1] == 'pos' || command[1] == 'position')
    {
        _root.utils.resetRoom(true);
        _root.textManager.send('message', 'Room has been reset.');
    }
    else
    {
        _root.utils.resetRoom(false);
        _root.textManager.send('message', 'Room and player position have been reset.');
    }
    
}));
