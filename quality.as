if ((_root._quality == "BEST" || _root._quality == "HIGH") && _root.AutoQuality == true) {
    _root.Qualitynum--;
}
qn = _root.Qualitynum;
qn2 = 0;
_root._quality = _root.QualityArray[qn];
time = getTimer();
count = 0;
frtxt = "fps: unknown";
stop();

updateQuality = function() {
    if (_root.PauseGame == false) {
        if (count + 1 >= 4) {
            if (_root._quality == "LOW") {
                _root.Qualitynum = 0;
            } else if (_root._quality == "MEDIUM") {
                _root.Qualitynum = 1;
            } else if (_root._quality == "HIGH") {
                _root.Qualitynum = 2;
            } else if (_root._quality == "BEST") {
                _root.Qualitynum = 3;
            }
            qn = _root.Qualitynum;
            diff = Math.round(10000 / (getTimer() - time) * count) / 10;
            time = getTimer();
            count = 0;
            if (diff / 32 < 0.7) {
                qn2--;
            } else if (diff / 32 > 0.9) {
                qn2++;
            }
            if (qn2 > 30) {
                qn2 = 0;
                qn = Math.min(qn + 1, 3);
            } else if (qn2 < -15) {
                qn2 = 0;
                qn = Math.max(qn - 1, 0);
            }
            if (_root.AutoQuality == true) {
                if (_root._quality !== _root.QualityArray[qn]) {
                    _root._quality = _root.QualityArray[qn];
                }
                _root.Qualitynum = qn;
            }
        }
    } else if (count + 1 >= 4) {
        diff = Math.round(10000 / (getTimer() - time) * count) / 10;
        time = getTimer();
        count = 0;
    }
}

onEnterFrame = function() {
    updateQuality();
};
