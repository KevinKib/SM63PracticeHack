_root.codeManager.add(new Code('timer t', function(command) {

    switch (command[1]) {
        case 'start':
            _root.timer.start();
            _root.textManager.send('message', 'Timer has been started.');
            break;
        case 'stop':
            _root.timer.stop();
            _root.textManager.send('message', 'Timer has been stopped.');
            break;
        case 'reset':
            _root.timer.reset();
            _root.textManager.send('message', 'Timer has been reset. It will start on the next loading zone.');
            break;
        case 'on':
            _root.timer.setDisplay(true);
            break;
        case 'off':
            _root.timer.setDisplay(false);
            break;
        case 'frames':
            _root.timer.setDisplayMode('frames');
            _root.textManager.send('message', 'Set display mode to frames.');
            break;
        case 'milliseconds':
        case 'ms':
            _root.timer.setDisplayMode('regular');
            _root.textManager.send('message', 'Set display mode to milliseconds.');
            break;
    }

}));
