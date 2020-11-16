_root.codeManager.add(new Code('zoom', 'Zooms to a certain value.', 'zoom NUMBER', function(command) {
	_root.CameraZoom = command[1];
	_root.textManager.send('message', 'Zoom has been set to '+command[1]+'.');
}));	