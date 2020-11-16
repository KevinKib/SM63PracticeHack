_root.codeManager.add(new Code('cap', 'Sets the state of the caps the player currently has.', 'cap TYPE {true|false} TIME', function(command) {
    var time = Number(command[3]);
    _root.utils.setCap(command[1], command[2], time);

    _root.textManager.send('message', 'Current cap updated.');
}));
