_root.codeManager.add(new Code('setpos setposition', 'Sets the player to a certain coordinate.', 'setposition / setpos PLAYER_X PLAYER_Y', function(command) {
    _root.utils.setPosition(command[1], command[2]);

    _root.textManager.send('message', 'Current position updated.');
}));
