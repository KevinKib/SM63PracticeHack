_root.codeManager.add(new Code('runbatch rb', 'Runs a batch of commands from a .sol file.', 'runbatch / rb FILE', function(command) {
    var file = SharedObject.getLocal(command[1], '/batch');
    var contents = file.data.commands;
    if (file.data.commands == undefined)
    {
        _root.textManager.send('message', "File not found.");
    }
    else
    {
        var commandArray = contents.split("/");
        var i = 0;
        var len = commandArray.length;
        for(i = 0; i < len; i++)
        {
            _root.codeManager.execute(commandArray[i]);
        }
        _root.textManager.send('message', 'Batch \"'+command[1]+'\" run successfully.');
    }
}));

_root.codeManager.add(new Code('savebatch sb', 'Saves a batch of commands to a .sol file.', 'savebatch / sb FILE COMMANDS', function(command) {
    var file = SharedObject.getLocal(command[1], '/batch');

    var newArray = command.slice();

    // We remove the two first parameters of the array
    // (sb [file])
    newArray.shift();
    newArray.shift();

    var unsplitCommand = newArray.join(" ");

    file.data.commands = unsplitCommand;
    file.flush();
}));