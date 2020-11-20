_root.codeManager.add(new Code('addwatch watch aw', function(command) {
    _root.memoryWatch.addWatch(command[1]);

    _root.textManager.send('message', 'Var '+command[1]+' added to watch.');
}));

_root.codeManager.add(new Code('removewatch rw', function(command) {
    if (_root.memoryWatch.removeWatch(command[1]))
    {
        _root.textManager.send('message', 'Var '+command[1]+' removed from watch.');
    }
    else
    {
        _root.textManager.send('message', 'Error: Var '+command[1]+' not found in watch.');
    }    
}));
