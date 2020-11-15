_root.codeManager.add(new Code('cutscenes cts', '', function(command) {
    if (command[1] == 'on') {
        _root.utils.setCutscenes(true);
        _root.textManager.send('message', 'Cutscenes have been enabled.');
    } else if (command[1] == 'off') {
        _root.utils.setCutscenes(false);
        _root.textManager.send('message', 'Cutscenes have been disabled.');
    }
}));
