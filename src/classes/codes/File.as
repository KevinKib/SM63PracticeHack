_root.codeManager.add(new Code('file f', '', function(command) {

    switch (command[1]) {
        case 'complete':
        case '100':
            _root.utils.setStars(true);
            _root.utils.setStarCoins(true);
            _root.utils.setBowserKeys(true);
            _root.utils.setFluddArray(true);
            _root.textManager.send('message', 'Current file is now a 100% file.');
            break;
        case 'essentials':
            _root.utils.setStars(false);
            _root.utils.setStarCoins(false);
            _root.utils.setBowserKeys(true);
            _root.utils.setFluddArray(false);
            _root.Star[39] = true;
            _root.Star[41] = true;
            _root.Star[50] = true;
            _root.Star[51] = true;
            _root.Star[36] = true;
            _root.CalculateStars();
            _root.textManager.send('message', 'Current file now has every storyline star.');
            break;
        case 'empty':
            _root.utils.setStars(false);
            _root.utils.setStarCoins(false);
            _root.utils.setBowserKeys(false);
            _root.utils.setFluddArray(false);
            _root.textManager.send('message', 'Current file has been emptied.');
            break;
    }

}));
