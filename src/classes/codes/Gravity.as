_root.codeManager.add(new Code('gravity grav', 'Modifies the gravity of the current room.', 'gravity / grav NUMBER', function(command) {
	_root.gravity = Number(command[1]);
	_root.textManager.send('message', 'Gravity has been set to '+command[1]+'.');
}));