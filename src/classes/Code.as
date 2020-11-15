// Class that defines a code and its effects.
class Code {

    // Identifier of the code
    private var indexList;

    // Description and syntax of the command.
    private var description;

    // Function sent as a callback that will be executed
    private var func;

    // Constructor
    public function Code(index, desc, func) {
        this.indexList = index.split(' ');
        this.description = desc;
        this.func = func;
    }

    // Executes the code, if the command entered by the user matches with to this one.
    public function execute(command) {
        var isValid = false;
        var i = 0;
        var splitCommand = command.split(' ');

        for (i = 0; i < this.indexList.length; i++) {
            if (this.indexList[i] == splitCommand[0]) {
                this.func(splitCommand);
                isValid = true;
                break;
            }
        }

        return isValid;
    }

    // Returns the description and syntax of the command.
    public function getDescription() {
        return this.description;
    }

    // Executes the code, no matter what.
    // (Should not be working)
    private function executeImmediate() {
        this.func();
    }

}