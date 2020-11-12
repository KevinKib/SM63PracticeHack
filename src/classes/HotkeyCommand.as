class HotkeyCommand {

    private var key;
    private var command;

    public function HotkeyCommand(_key, _command) {
        this.key = _key;
        this.command = _command;
    }

    public function getKey() {
        return this.key;
    }

    public function getCommand() {
        return this.command;
    }

}