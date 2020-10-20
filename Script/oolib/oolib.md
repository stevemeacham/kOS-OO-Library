## Overview of oolib
Don't be fooled by its brevity.  This unique [kOS](https://ksp-kos.github.io/KOS/) library enables object oriented programming in [Kerboscript](https://ksp-kos.github.io/KOS/language.html) and eliminates the need for any globals whatsoever.  This is largely accomplished by combining the power of KerboScript's [Lexicon](https://ksp-kos.github.io/KOS/structures/collections/lexicon.html) and [KOSDelegate](https://ksp-kos.github.io/KOS/structures/misc/kosdelegate.html) structures, [nesting functions inside of functions](https://ksp-kos.github.io/KOS/language/user_functions.html#nesting-functions-inside-functions), [Recursion](https://ksp-kos.github.io/KOS/language/user_functions.html#recursion), and [Anonymous functions](https://ksp-kos.github.io/KOS/language/user_functions.html#anonymous-functions).

**Table of Contents**
- [Overview of oolib](#overview-of-oolib)
- [Install](#install)
- [Initialize](#initialize)
- [Access](#access)
- [Internals](#internals)
	- [Object Class](#object-class)
	- [Map Class](#map-class)
	- [Register the "oo" library](#register-the-oo-library)
- [Usage](#usage)

## Install
Copy the `oolib` folder with contents into your KSP installation's `Ships/Script` folder.
## Initialize
A program creates a `Lexicon` and passes it as an argument to the `oolib` script.  This `Lexicon` will be used to encapsulate all namespaces, classes, objects, and methods while the program is running.
```
LOCAL nsr IS Lexicon().           // 1
RUNONCEPATH("/oolib/oolib", nsr). // 2
```
1. The `Lexicon` should be empty and should not be global.
2. Run the `oolib` script and pass the `Lexicon` as the argument.
## Access
After oolib has been initialized, other scripts may be given access to it when they are run by passing the `Lexicon` to them as an argument:
```
// In the calling script
RUNONCEPATH("script_being_run", nsr).
```
The script requiring oolib should accept the `Lexicon` as a non-optional argument.
```
// In the called script
PARAMETER nsr.
```
## Internals
The capabilities of oolib are many and are still being discovered.

The `oolib` library script accepts a `Lexicon` as an input/output argument, and immediately clears its contents.  This is why it is best to provide a newly created empty one.  This `Lexicon` will contain all namespaces, classes, objects, and methods.
```
PARAMETER nsr.
nsr:CLEAR.
```
> NOTE: The remainder of this section assumes familiarity with class-based object-oriented programing terminology.
### Object Class
The oolib library then declares what is technically a `Lexicon` but is logically the root of the oolib class hierarchy.  Every class has Object as a superclass.  All objects implement the methods of this class (once there are any).
```
LOCAL Object IS Lexicon(         // 1
"new", {                         // 2
	PARAMETER this IS Lexicon(). // 3
	this:CLEAR.                  // 4
	RETURN this.                 // 5
}).                              // 6
```
1. `Object` is actually the `Object class`.
2. `Object:new` is a class method; a constructor.
3. `Object:new()` will create a new object instance.
4. The `Lexicon` is emptied to make room for the object. 
5. Returns the `Lexicon` of a newly created object instance.
6. Closes the `new` "anonymous" method, and then the `Object` variable declaration.
### Map Class
A `Lexicon` is actually an associative array, also known as a map, symbol table, or dictionary.  The oolib `Map` is essentially a `Lexicon`, but implemented as a subclass of `Object`.  It is used by oolib to implement namespaces and a registry of namespaces.
```
LOCAL Map IS Lexicon(                     // 1
"new", {                                  // 2
	PARAMETER content is Lexicon(),       // 3, 4
		this IS Object:new().             // 5
	SET this["put"] TO {                  // 6
		PARAMETER key, value.
		SET content[key] TO value. 
		RETURN this.}.
	SET this["get"] TO {                  // 7
		PARAMETER key.
		RETURN content[key].}.
	SET this["del"] TO {                  // 8
		PARAMETER key. 
		content:REMOVE(k). 
		RETURN this.}.
	SET this["all"] TO {RETURN content.}. // 9
	RETURN this.                          // 10
}).
```
1. `Map` is actually the `Map class`.
2. `Map:new` is a class method; a constructor.
3. `Map:new()` without arguments will construct and return an empty `Map`.
4. `Map:new(Lexicon)` will construct and return a pre-populated `Map`.
5. `this IS Object:new()` calls this subclass' superclass, `Object`, constructor.
6. `Map:put(key,value)` adds the key/value pair to the `Map`, then return the `Map`.  This and the other instance methods are defined here as anonymous functions, but associated via the `Lexicon` with a name.
7. `Map:get(key)` returns the value associated with the given key.
8. `Map:del(key)` removes the key and its associated value from the `Map`, returning the `Map`.
9. `Map:all()` returns a `Lexicon` containing the content of the `Map`.
10. Closes the `new` "anonymous" method, and then the `Map` variable declaration.
### Register the "oo" library
The oolib is added to the name space registry.  For this reason, the code sample is provided below, but not further explained.
```
LOCAL library IS Map:new().
library:put("Object", Object).
library:put("Map", Map).

LOCAL namespace IS Map:new(Lexicon(), Object:new(nsr)).
namespace:put("oo", library).
```
## Usage
TODO

---
This document is part of the kOS Object Oriented Library documentation.

Copyright © 2020 Steve Meacham and contributors

Permission is granted to copy, distribute and/or modify this document under the terms of the [GNU General Public License v3.0 or \(at your option\) any later version](Licenses/LICENSE.GPL-3.0-or-later.md) published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts. A copy of the license is included.