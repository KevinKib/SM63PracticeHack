// Class that manages everything related to displayed text.
class TextManager {

    // Could be coded significantly better using an array.
    private var row1;
    private var row2;
    private var row3;
    private var row4;
    private var row5;
    private var row6;

    // Manages the life cycle of a message.
    private var messageDelay;

    // Constructor
    public function TextManager() {
        this.row1 = "";
        this.row2 = "";
        this.row3 = "";
        this.row4 = "";
        this.row5 = "";
        this.row6 = "";

        this.messageDelay = 0;
    }

    // Writes a message on the console.
    private function write(row, text) {
        switch (row) {
            case 1:
                this.row1 = text;
                break;
            case 2:
                this.row2 = text;
                break;
            case 3:
                this.row3 = text;
                break;
            case 4:
                this.row4 = text;
                break;
            case 5:
                this.row5 = text;
                break;
            case 6:
                this.row6 = text;
                break;
        }

        _root.TextHint = this.row1 + "\n" + this.row2 + "\n" + this.row3 + "\n" + this.row4 + "\n" + this.row5 + "\n" + this.row6;
    }

    // Sends a message to the console
    // that will be written by the class on the accurate row.
    public function send(type, text) {
        var row = this.getRow(type);

        if (type == 'message') {
            this.messageDelay = this.getMessageLength();
        }

        if (row != 0) {
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
        var row = 0;

        switch (type) {
            case 'code':
                row = 1;
                break;
            case 'message':
                row = 2;
                break;
            case 'debug':
                row = 3;
                break;
            case 'timer':
                row = 4;
                break;
            case 'segment_timer':
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