_root.codeManager.add(new Code('kill', 'Kills the player.', 'kill', function(command) {
    _root.CharHP = 0;
    _root.textManager.send('message', 'Death has been provoked.');
}))
