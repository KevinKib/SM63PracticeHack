_root.codeManager.add(new Code('zoom', function(command) {
	_root.CameraZoom = command[1];
	_root.textManager.send('message', 'Zoom has been set to '+command[1]+'.');
}));	