_root.codeManager.add(new Code('help', '', function(command) {
    var newArray = command.slice();

    // We remove the first parameter of the array
    // (help)
    newArray.shift();

    var unsplitCommand = newArray.join(" ");

    _root.textManager.send('message', unsplitCommand);
    _root.codeManager.readDescription(unsplitCommand);
}));
