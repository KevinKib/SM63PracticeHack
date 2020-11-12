KoopaShell is a module created by [Jhynjhiruu](https://github.com/Jhynjhiruu) which is implemented in the Super Mario 63 Practice Hack. It is able to modify every variable in the game at any instant, which makes it very powerful.

## Introduction

KoopaShell essentially simulates a very simple computer. At the core is a function called as often as possible that executes instructions one at a time from a list.

A few variables are reserved for 'operating memory' - these serve as my interpretation of an accumulator.
When loading data into the accumulator, the data in the first slot will be transferred to the second slot and the data will be put into the first slot.
KoopaShell programs are generally input one line, i.e. one instruction, at a time. This can either be through typing programs in, one after another, or by loading script files, which are just normal text documents that contain one instruction per line.

KoopaShell can operate entirely within itself, or interact with the game it's in. For example, it has support for defining functions, and these functions can
be mapped onto ActionScript 2.0 functions. The interpreter also supports calling ActionScript 2.0 functions, even with arguments.

Note: As of SM63 Practice Hack 1.9, some features may be missing or broken because I made typos or forgot to implement them.

## Instruction set


	Functions:
		def %name%	Defines a function %name%. The value in the first accumulator slot will be the data passed to the function when called. Subsequent commands
				will be added to the function, rather than executed, until 'ret' is input. If %name% is not passed, the value in the first accumulator slot
				will be referenced instead.
		ret 		Returns execution to where the function was called from, and finishes inputting while defining a function.
	
	Variables:
	        lda %name%	Loads the variable %name% into the accumulator. This preserves the data type of the variable. If the load/store mode is set to array, %name%
				should instead be a numerical index into the array. If it is not, the variable will be loaded as normal. If %name% is not passed, the value
				in the first accumulator slot will be referenced instead.
		sto %name%	Stores the value in the first accumulator slot to the variable %name%. This preserves the data type of the variable. If the load/store mode is
				set to array, %name% should instead be a numerical index into the array. If it is not, the variable will be loaded as normal. If %name% is not
				passed, the value in the first accumulator slot will be referenced instead.
	
	Conditions:
		ife		Sets the jump-if-true variable (see 'jit' below) to true if the first and second accumulator slots are equal.
		ifn		Sets the jump-if-true variable (see 'jit' below) to true if the first and second accumulator slots are not equal.
		jit %num%	If the jump-if-true variable is true, moves the program counter forward %num%.
    
	Data type conversions:
		num		Converts the current value of the first accumulator slot to a number and loads it into the accumulator.
		str		Converts the current value of the first accumulator slot to a string and loads it into the accumulator.
		bool		Converts the current value of the first accumulator slot to a boolean and loads it into the accumulator.
    
	Maths:
		add		Adds the first accumulator slot to the second and loads the result into the accumulator.
		sub		Subtracts the first accumulator slot from the second and loads the result into the accumulator.
		prod		Multiplies the two accumulator slots together and loads the result into the accumulator.
		div		Divides the second accumulator slot by the first and loads the result into the accumulator.
		mod		Takes the second accumulator slot modulo the first and loads the result into the accumulator.
		pow		Raises the second accumulator slot to the power of the first and loads the result into the accumulator.
    
	Arrays (note that array handling is not thoroughly tested, may not be stable and should be avoided if possible):
		arr %name%	Sets the array slot to the array %name% and sets the load/store mode to array. If %name% is not passed, the value in the first accumulator
				slot will be referenced instead.
		carr %name%	Saves the array in the array slot back to the array %name% and sets the load/store mode to what it was previously. If %name% is not passed,
				the value in the first accumulator slot will be referenced instead.
	
	ActionScript 2.0 interaction:
		aarg		Appends the value in the first accumulator slot to the argument array (see 'ext' below)
		carg		Clears the argument array (see 'ext' below)
		ext %name%	Calls the function %name% with the data in the argument array as arguments. The first accumulator slot will be set to the returned data,
				if it is present. If %name% is not passed, the value in the first accumulator slot will be referenced instead.
		map %name%	Maps the KoopaShell function %name% onto an ActionScript 2.0 function '_root.%name%'. The value in the first accumulator slot when 'ret' is
				executed will be returned. If %name% is not passed, the value in the first accumulator slot will be referenced instead.
	
	Other:
		ldd %data%	Loads %data% into the first accumulator slot.
		out		Traces the value of the first accumulator slot.
		not		If the value in the first accumulator slot is not false, loads true into the accumulator.
		eval		Hard to explain really, it calls the 'eval' function on the data in the first accumulator slot and loads the return value into the accumulator.
		ldsr %path%	Loads the script at the relative path %path%, executing each instruction as if it were typed in.