_root.codeManager.add(new Code('last l', 'Re-executes the last command that was executed.', 'last / l', function(command) {
    _root.codeManager.executeLastCode();
}));
