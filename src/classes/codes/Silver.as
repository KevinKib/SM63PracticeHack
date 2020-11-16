_root.codeManager.add(new Code('silvers silver', 'Sets the silver star count.', 'silvers silver NUMBER', function(command) {
    _root.utils.setSilverStarsCount(Number(command[1]));
    _root.textManager.send('message', 'Silver stars count has been set to ' + Number(command[1]) + '.');
}));
