_root.codeManager.add(new Code('coin coins', 'Sets the coin count.', 'coins / coin NUMBER', function(command) {
    _root.utils.setCoinCount(Number(command[1]));
    _root.textManager.send('message', 'Coin count has been set to ' + Number(command[1]) + '.');
}));
