_root.codeManager.add(new Code('reds red redcoins redcoin', 'Sets the red coin count.', 'reds / red / redcoins / redcoin NUMBER', function(command) {
    _root.utils.setRedCoinCount(Number(command[1]));
    _root.textManager.send('message', 'Red coins count has been set to ' + Number(command[1]) + '.');
}));
