_root.codeManager.add(new Code('bowserkey bk', '', '', function(command) {

    if (command[2] == 'true') {
        _root.utils.setBowserKey(int(command[1]), true);
        _root.textManager.send('message', 'BowserKey #' + command[1] + ' has been set to true.');
    } else if (command[2] == 'false') {
        _root.utils.setBowserKey(int(command[1]), false);
        _root.textManager.send('message', 'BowserKey #' + command[1] + ' has been set to false.');
    } else {
        _root.utils.setBowserKey(int(command[1]));
    }

}));
