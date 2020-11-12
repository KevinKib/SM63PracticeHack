class HotkeyManager {

    private var hotkeyCommandList;

    public function HotkeyManager() {
        this.hotkeyCommandList = new Array();
    }

    public function add(key, command) {
        this.remove(key);
        this.hotkeyCommandList.push(new HotkeyCommand(key, command));
    }

    public function remove(key) {
        var i = 0;

        var newArray = new Array();

        for (i = 0; i < this.hotkeyCommandList.length; i++) {
            if (key != this.hotkeyCommandList[i].getKey()) {
                newArray.push(this.hotkeyCommandList[i]);
            }
        }

        this.hotkeyCommandList = newArray.slice();
    }

    public function execute(key) {
        if (!_root.utils.isGamePaused()) {
            var i = 0;

            for (i = 0; i < this.hotkeyCommandList.length; i++) {
                if (key == this.hotkeyCommandList[i].getKey()) {
                    _root.codeManager.execute(this.hotkeyCommandList[i].getCommand());
                    break;
                }
            }
        }
    }
}