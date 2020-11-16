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
            if (_root.codeManager.getDelay() > 0) {
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
    // @param command String.
    public function execute(command) {
        var index = this.checkIfCommandMatches(command);

        if (index != -1) {
            var splitCmd = command.split(' ');
            this.codeList[index].execute(splitCmd);

            // To avoid infinite loops/recursion, we prevent setting the last code
            // if the last command executed was 'last'.
            if (splitCmd[0] != 'last' && splitCmd[0] != 'l') {
                this.lastCode = command;
            }
        }
        else {
            _root.textManager.send('message', 'The command entered is invalid.');
        }

        _root.utils.setPause(false);
    }

    // Displays the description of a command on screen.
    // @param command String.
    public function readDescription(command) {
        var index = this.checkIfCommandMatches(command);

        if (index != -1) {
            _root.textManager.send('message', this.codeList[index].getDescription());
            _root.textManager.send('debug', this.codeList[index].getSyntax());
        }
        else {
            _root.textManager.send('message', 'Wrong command as help');
        }
    }

    // Checks if the command entered by the user exists.
    // @param command String.
    // @return Integer; -1 if the command doesn't exist, otherwise, index of the command in the codeList array.
    private function checkIfCommandMatches(command) {
        var correctIndex = -1;
        var i = 0;
        for (i = 0; i < this.codeList.length; i = i + 1) {
            if (this.codeList[i].isMatching(command)) {
                correctIndex = i;
                break;
            }
        }

        return correctIndex;
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
            _root.utils.setPause(true);
        } else if (this.delay > 0) {
            this.reduceDelay();
            if (this.delay <= 0) {
                this.currentCode = "";
                _root.textManager.send('message', "");
                // Delay equals 0, we un-pause the game.
                _root.utils.setPause(false);
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