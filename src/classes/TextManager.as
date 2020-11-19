// Class that manages everything related to displayed text.
class TextManager {

    private var rows = new Array();

    // Manages the life cycle of a message.
    private var messageDelay;

    // Constructor
    public function TextManager() {
        var i = 0;
        for(i = 0; i < 6; i++)
        {
            this.rows[i] = "";
        }

        this.messageDelay = 0;
    }

    // Writes a message on the console.
    private function write(row, text) {
        this.rows[row] = text;

        //_root.TextHint = this.row1 + "\n" + this.row2 + "\n" + this.row3 + "\n" + this.row4 + "\n" + this.row5 + "\n" + this.row6;

        _root.TextHint = "";
        var j = 0;
        for(j = 0; j < 6; j++)
        {
            _root.TextHint = _root.TextHint + this.rows[j] + "\n";
        }
        
    }

    // Sends a message to the console
    // that will be written by the class on the accurate row.
    public function send(type, text) {
        var row = this.getRow(type);

        if (type == 'message') {
            this.messageDelay = this.getMessageLength();
        }

        if (row != undefined) {
            this.write(row, text);
        }
    }

    // Manages every action that happens on each frame.
    public function onEachFrame() {
        if (this.messageDelay > 0) {
            this.messageDelay--;

            if (this.messageDelay == 0) {
                this.write(this.getRow('message'), "");
            }
        }
    }

    // Returns the row where a specific type of text has to be displayed.
    private function getRow(type) {
        var row;

        switch (type) {
            case 'code':
                row = 0;
                break;
            case 'message':
                row = 1;
                break;
            case 'debug':
                row = 2;
                break;
            case 'timer':
                row = 3;
                break;
            case 'segment_timer':
                row = 4;
                break;
            case 'watch':
                row = 5;
                break;
        }

        return row;
    }

    // Returns the length where a message will be displayed on screen.
    private function getMessageLength() {
        var SECONDS_DISPLAYED = 4;
        return _root.utils.getFramerate() * SECONDS_DISPLAYED;
    }

}