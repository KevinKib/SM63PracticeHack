_root.codeManager.add(new Code('file f', 'Setups a file setting.', 'file / f {complete|essentials|empty}', function(command) {

    switch (command[1]) {
        case 'complete':
        case '100':
            _root.utils.setFileSetting('complete');
            _root.textManager.send('message', 'Current file is now a 100% file.');
            break;
        case 'essentials':
            _root.utils.setFileSetting('essentials');
            _root.textManager.send('message', 'Current file now has every storyline star.');
            break;
        case 'empty':
            _root.utils.setFileSetting('empty');
            _root.textManager.send('message', 'Current file has been emptied.');
            break;
    }

}));
