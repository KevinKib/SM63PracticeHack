_root.codeManager.add(new Code('hotkey htk', '', function(command) {
    var newArray = command.slice();

    // We remove the two first parameters of the array
    // (htk [key])
    newArray.shift();
    newArray.shift();

    var key = command[1];
    var unsplitCommand = newArray.join(" ");

    _root.hotkeyManager.add(key, unsplitCommand);

    _root.textManager.send('message', 'The hotkey ' + key + ' was succesfully binded.');
}));
