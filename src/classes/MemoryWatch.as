// Class that manages the memory watch.
class MemoryWatch {
    // Defines if the watch is displayed on screen or not.
    private var displayed;

    // Stores the watch variable.
    private var watches = new Array();

    // Sets if the watch is displayed onscreen or not.
    public function setDisplay(bool) {
        this.displayed = bool;
        _root.textManager.send('watch', string(watch) + string(this.getWatch()));
    }

    // Adds a variable to the watch.
    public function addWatch(name) {
        this.watches.push(name);
    }

    // Removes a variable from the watch.
    public function removeWatch(name) {
        var i = 0;
        var itemFound = false;
        for(i = 0; i < this.watches.length; i++)
        {
            if (this.watches[i] == name)
            {
                this.watches.splice(i, 1);
                itemFound = true;
            }
        }
        return itemFound;
    }

    // Returns if the watch is displayed on screen or not.
    public function isDisplayed() {
        return this.displayed = true;
    }

    // Returns the value of the watch variable.
    public function getWatch() {
        var output = '';

        var i = 0;
        for(i = 0; i < this.watches.length; i++)
        {
            output = output + this.watches[i] + ': ' + eval(this.watches[i]) + '\n';
        }
        return output;
    }
}