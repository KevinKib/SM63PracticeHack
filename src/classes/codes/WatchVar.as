_root.codeManager.add(new Code('addwatch watch aw', 'Adds a variable to the memory watch.', 'addwatch / watch / aw NAME [DEC.PLACES]', function(command) {
    _root.memoryWatch.addWatch(command[1], command[2]);

    _root.textManager.send('message', 'Var '+command[1]+' added to watch.');
}));

_root.codeManager.add(new Code('removewatch rw', 'Removes a variable from the watch.', 'removewatch / rw {NAME|ID}', function(command) {
    if (_root.memoryWatch.removeWatch(command[1]))
    {
        _root.textManager.send('message', 'Var '+command[1]+' removed from watch.');
    }
    else
    {
        _root.textManager.send('message', 'Error: Var '+command[1]+' not found in watch.');
    }    
}));
