_root.codeManager.add(new Code('showwarps sw', 'Shows or hides warps (displayed as a black rectangle).', 'showwarps / sw {on|off}', function(command) {
	if (command[1] == 'on') {
        _root.Course.BackGFX.warp1._visible = true;
        _root.Course.BackGFX.warp2._visible = true;
        _root.Course.BackGFX.warp3._visible = true;
        _root.Course.BackGFX.warp4._visible = true;
        _root.Course.BackGFX.warp5._visible = true;
        _root.Course.BackGFX.warp6._visible = true;
        _root.Course.BackGFX.warp7._visible = true;
        _root.textManager.send('message', 'Warps have been shown.');
    }
    else if (command[1] == 'off') {
		    _root.Course.BackGFX.warp1._visible = false;
        _root.Course.BackGFX.warp2._visible = false;
        _root.Course.BackGFX.warp3._visible = false;
        _root.Course.BackGFX.warp4._visible = false;
        _root.Course.BackGFX.warp5._visible = false;
        _root.Course.BackGFX.warp6._visible = false;
        _root.Course.BackGFX.warp7._visible = false;
        _root.textManager.send('message', 'Warps have been hidden.');
    }
}));