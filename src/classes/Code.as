// Class that defines a code and its effects.
class Code {

    // Identifier of the code
    private var indexList;

    // Overall description of the command.
    private var description;

    // Syntax of the command.
    private var syntax;

    // Function sent as a callback that will be executed by the CodeManager
    private var callback;

    // Constructor
    public function Code(index, description, syntax, callback) {
        this.indexList = index.split(' ');
        this.description = description;
        this.syntax = syntax;
        this.callback = callback;
    }

    // Checks if the command entered by the user matches with this one.
    // @param command String.
    public function isMatching(command) {
        var isValid = false;
        var i = 0;
        var splitCommand = command.split(' ');

        for (i = 0; i < this.indexList.length; i++) {
            if (this.indexList[i] == splitCommand[0]) {
                isValid = true;
                break;
            }
        }

        return isValid;
    }


    // Executes the command.
    // @param command Array of strings.
    public function execute(command) {
        // _root.textManager.send('message', 'test2 : '+command[0]+' '+command[1]);
        this.callback(command);
    }

    // Returns the description of the command.
    public function getDescription() {
        return this.description;
    }

    // Returns the syntax of the command.
    public function getSyntax() {
        return this.syntax;
    }
}