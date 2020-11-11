// Class that manages the behaviour of all save states and their actions.
class SaveStateManager {

    private var saveStateList;

    // Constructor of the SaveStateManager class.
    public function SaveStateManager() {
        this.saveStateList = new Array();
    }

    public function save(name) {
        var state = new SaveState(name);
        this.saveStateList.push(state);
    }

    public function load(name) {

        var state = null;
        var i = 0;

        for (i = 0; i < this.saveStateList.length; i++) {
            if (this.saveStateList[i].name == name) {
                state = this.saveStateList[i];
            }
        }

        state.load();
    }

}