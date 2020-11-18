_root.codeManager.add(new Code('help', 'Displays help on screen for a certain command.', 'help COMMAND_NAME', function(command) {
    var newArray = command.slice();

    // We remove the first parameter of the array
    // (help)
    newArray.shift();

    var unsplitCommand = newArray.join(" ");

    if (unsplitCommand != '') {
        _root.codeManager.readDescription(unsplitCommand);
    }
    else {
        _root.utils.displaySignMessage(_root.codeManager.getAllCodes());
    }
}));
