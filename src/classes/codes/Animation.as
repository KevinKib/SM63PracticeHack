_root.codeManager.add(new Code('animation', '', '', function(command) {
    var animation = command[1];
    if (animation == undefined) {
        animation = " ";
    }

    _root.textManager.send('message', 'Animation : ' + animation);

    _root.Course.Char.attack = true;
    _root.Course.Char.attackFrame = command[1];
}));