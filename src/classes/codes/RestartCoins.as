_root.codeManager.add(new Code('resetcoins restartcoins', 'Resets the coins position on the next loading zone.', 'resetcoins / restartcoins', function(command) {
    _root.utils.resetCoins();
    _root.textManager.send('message', 'Coins will be reset on the next loading zone.');
}));
