// Class that manages how codes behave overall.
class CodeManager {

    private var codeList;
    private var delay;
    private var input;
    private var currentCode;
    private var lastCode;

    private var il;

    // Constructor.
    public function CodeManager() {
        this.codeList = new Array();
        this.input = true;
        this.currentCode = "";
        this.lastCode = "";
        this.delay = 0;

        this.il = new IndividualLevel();

        this.initKeyListener();
    }

    // Creates the key listener.
    public function initKeyListener() {
        var allowedKeys = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_:/.,\\\'%;*+\" [](){}=$";
        var keyListener = new Object();
        keyListener.onKeyDown = function() {
            if (_root.codeManager.delay > 0) {
                if (_root.codeManager.getInput()) {
                    if (allowedKeys.indexOf(chr(Key.getAscii())) != -1) {
                        _root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode() + chr(Key.getAscii()));
                        _root.codeManager.resetDelay();
                    } else {
                        switch (Key.getAscii()) {
                            case 127:
                                _root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode().substring(0, _root.codeManager.getCurrentCode().length - 1));
                                break;
                            case 8:
                                _root.codeManager.setCurrentCode(_root.codeManager.getCurrentCode().substring(0, _root.codeManager.getCurrentCode().length - 1));
                                break;
                            case 13: // Enter
                                _root.codeManager.execute(_root.codeManager.getCurrentCode());
                                _root.codeManager.setCurrentCode("");
                                _root.codeManager.emptyDelay();
                                break;
                            case 27:
                                _root.codeManager.setCurrentCode("");
                                break;
                            case 126:
                                _root.codeManager.setCurrentCode("");
                                break;
                            case 35:
                        }
                    }
                }
            }

            _root.hotkeyManager.execute(chr(Key.getAscii()));
        }
        Key.addListener(keyListener);
    }

    // Adds a new code to the code list.
    public function add(code) {
        this.codeList.push(code);
    }

    // Executes a specific code.
    public function execute(command) {
        //_root.textManager.send('message', '');
        //_root.textManager.send('message', command);
        var i = 0;
        for (i = 0; i < this.codeList.length; i = i + 1) {
            this.codeList[i].execute(command);
        }
        // To avoid infinite loops/recursion, we prevent setting the last code
        // if the last command executed was 'last'.
        // Doesn't work if the 'last' command gets an argument.

        var splitCmd = command.split(' ');

        if (splitCmd[0] != 'last' && splitCmd[0] != 'l') {
            this.lastCode = command;
        }
        _root.PauseGame = false;
    }

    // Executes the last command that was executed by the player.
    public function executeLastCode() {
        this.execute(this.lastCode);
    }

    // Defines the code that happens on each frame.
    public function onEachFrame() {
        _root.textManager.send('code', this.currentCode);

        if (_root.KeySlash()) {
            this.resetDelay();
            _root.textManager.send('message', 'Enter your command!');
            _root.PauseGame = true;
        } else if (this.delay > 0) {
            this.reduceDelay();
            if (this.delay <= 0) {
                this.currentCode = "";
                // Delay equals 0, we cancel the PauseGame effect.
                _root.textManager.send('message', "");
                _root.PauseGame = false;
            }
        }
    }


    // Getters & setters

    public function getCurrentCode() {
        return this.currentCode;
    }

    public function setCurrentCode(value) {
        this.currentCode = value;
    }

    public function getInput() {
        return this.input;
    }

    public function setInput(value) {
        this.input = value;
    }

    public function getDelay() {
        return this.delay;
    }

    public function reduceDelay() {
        this.delay = this.delay - 1;
        if (this.delay < 0)
            this.delay = 0;
    }

    public function resetDelay() {
        this.delay = 300;
    }

    public function emptyDelay() {
        this.delay = 0;
    }

    public function getIL() {
        return this.il;
    }

}