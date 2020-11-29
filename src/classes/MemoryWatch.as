// Class that manages the memory watch.
class MemoryWatch {
    // Defines if the watch is displayed on screen or not.
    private var displayed;

    // Stores the watch variable.
    private var watches = new Array();

    private var watchAliases = new Array();

    public function MemoryWatch() {
        this.watchAliases = [
            ["air", "_root.Course.Char.air"],
            ["inair", "_root.Course.Char.air"],
            ["hp", "_root.CharHP"],
            ["health", "_root.CharHP"],
            ["invframes", "_root.Course.Char.blink"],
            ["invulnerabilityframes", "_root.Course.Char.blink"],
            ["invincibilityframes", "_root.Course.Char.blink"],
            ["blink", "_root.Course.Char.blink"],
            ["capwing", "_root.WingCap"],
            ["capstarman", "_root.Invincible"],
            ["capinvincible", "_root.Invincible"],
            ["capinvis", "_root.Invisible"],
            ["capinvisible", "_root.Invisible"],
            ["capvanish", "_root.Invisible"],
            ["capmetal", "_root.Metal"],
            ["power", "_root.Power"],
            ["fluddpower", "_root.Power"],
            ["captime", "_root.PowerTimer"],
            ["powertimer", "_root.PowerTimer"],
            ["attack", "_root.Course.Char.attack"],
            ["attackframe", "_root.Course.Char.attackFrame"],
            ["shineArray", "_root.Star"],
            ["shines", "_root.TotalStars"],
            ["shine", "_root.Starnum"],
            ["starcoinArray", "_root.StarCoin"],
            ["starcoins", "_root.TotalStarCoins"],
            ["level", "_root.Playinglevel"],
            ["course", "_root.playingcourse"],
            ["room", "_root.playingcourse"],
            ["gardenspawns", "_root.Course.BackGFX.onscreencount"],
            ["kills", "_root.Course.BackGFX.defeatedcount"],
            ["gravity", "_root.gravity"],
            ["xvel", "_root.Course.Char.xspeed"],
            ["xspeed", "_root.Course.Char.xspeed"],
            ["yvel", "_root.Course.Char.yspeed"],
            ["yspeed", "_root.Course.Char.yspeed"]
        ];
    }

    // // Sets if the watch is displayed onscreen or not.
    // public function setDisplay(bool) {
    //     this.displayed = bool;
    //     _root.textManager.send('watch', string(this.getWatch()));
    // }

    // Adds a variable to the watch.
    public function addWatch(name, decPlaces) {
        var trueName;
        var stringIndex = name.indexOf("[");
        if (stringIndex >= 0)
        {
            trueName = name.slice(0, stringIndex);
            var arrayIndex = name.slice(stringIndex+1, name.length-1);
        }
        else
        {
            trueName = name;
        }
        
        var i = 0;
        for(i = 0; i < this.watchAliases.length; i++)
        {           
            if (this.watchAliases[i][0].toLowerCase() == trueName.toLowerCase())
            {
                trueName = this.watchAliases[i][1];
                break;
            }
        }
        this.watches.push({name:name, trueName:trueName, decPlaces:decPlaces, arrayIndex:arrayIndex});
    }

    // Removes a variable from the watch.
    public function removeWatch(name) {
        var i = 0;
        var itemFound = false;
        for(i = 0; i < this.watches.length; i++)
        {
            if (i == name || this.watches[i].name == name)
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
            var value;
            if (this.watches[i].arrayIndex == undefined)
            {
                value = eval(this.watches[i].trueName);
            }
            else
            {
                value = eval(this.watches[i].trueName)[this.watches[i].arrayIndex];
            }
            
            if (this.watches[i].decPlaces == undefined)
            {
                output = output + '[' + i + '] ' + this.watches[i].name + ': ' + value + '\n';
            }
            else
            {
                //if (this.watches[i].decType == undefined || this.watches[i].decType == 'd' || this.watches[i].decType == 'dp')
                //{
                    var factor = Math.pow(10, this.watches[i].decPlaces);
                    var roundedValue = (Math.round(value*factor)) / factor;
                    //output = output + '[' + i + '] {' + this.watches[i].decPlaces + 'sf} ' + this.watches[i].name + ': ' + value.toPrecision(this.watches[i].decPlaces) + '\n';
                    output = output + '[' + i + '] {' + this.watches[i].decPlaces + 'dp} ' + this.watches[i].name + ': ' + roundedValue + '\n';
                //}

                // else if (this.watches[i].decType == 's' || this.watches[i].decType == 'sf')
                // {
                //     var factor = pow(10, this.watches[i].decPlaces - Math.ceil(Math.log(Math.abs(value)) / Math.log(10)));
                //     var roundedValue = (Math.round(value*factor)) / factor;
                //     //output = output + '[' + i + '] {' + this.watches[i].decPlaces + 'dp} ' + this.watches[i].name + ': ' + value.toFixed(this.watches[i].decPlaces) + '\n';
                //     output = output + '[' + i + '] {' + this.watches[i].decPlaces + 'sf} ' + this.watches[i].name + ': ' + roundedValue + '\n';
                // }

                //doesn't work no matter what i do smh
            }
        }
        return output;
    }
}