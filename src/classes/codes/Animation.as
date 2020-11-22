_root.codeManager.add(new Code('animation', '', '', function(command) {
    var animation = command[1];
    if (animation == undefined) {
        animation = '';
    }
    _root.textManager.send('message', 'Animation : ' + animation);
    _root.utils.setAnimation(animation);
}));