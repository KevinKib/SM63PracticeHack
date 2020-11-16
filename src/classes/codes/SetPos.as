_root.codeManager.add(new Code('setpos', '', '', function(command) {
    _root.utils.setPosition(command[1], command[2]);

    _root.textManager.send('message', 'Current position updated.');
}));
