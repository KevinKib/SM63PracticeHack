_root.codeManager.add(new Code('cap', function(command) {
    var time = Number(command[3]);
    _root.utils.setCap(command[1], command[2], time);

    _root.textManager.send('message', 'Current cap updated.');
}));
