_root.codeManager.add(new Code('fludd', '', '', function(command) {

    switch (command[1]) {
        case 'all':
            _root.utils.setSaveFludd(true);
            _root.textManager.send('message', 'All FLUDD nozzles have been given to Mario.');
            break;
        case 'H':
        case 'h':
        case 'Hover':
        case 'hover':
            _root.utils.setSaveOneFludd('h', !_root.utils.getSaveFludd().h);
            _root.textManager.send('message', 'Hover FLUDD has been set to ' + _root.utils.getSaveFludd().h + '.');
            break;
        case 'R':
        case 'r':
        case 'Rocket':
        case 'rocket':
            _root.utils.setSaveOneFludd('r', !_root.utils.getSaveFludd().r);
            _root.textManager.send('message', 'Rocket FLUDD has been set to ' + _root.utils.getSaveFludd().r + '.');
            break;
        case 'T':
        case 't':
        case 'Turbo':
        case 'turbo':
            _root.utils.setSaveOneFludd('t', !_root.utils.getSaveFludd().t);
            _root.textManager.send('message', 'Turbo FLUDD has been set to ' + _root.utils.getSaveFludd().t + '.');
            break;
        case 'none':
            _root.utils.setSaveFludd(false);
            _root.utils.setFluddPow("");
            _root.textManager.send('message', 'All FLUDD nozzles have been removed from Mario.');
            break;
    }


}));
