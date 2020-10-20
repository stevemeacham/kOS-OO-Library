# The kOS OO Library (oolib)
## Overview
This unique kOS library supports class and prototype based object oriented programming and namespaces.  It also uses NO GLOBALS and enables any kOS program or library to do the same, large or small, no matter how complex.
## Origin
[Original GitHub Repository](https://github.com/stevemeacham/kOS-OO-Library)
## Requirements and Dependencies
* [Kerbal Space Program (KSP)](https://kerbalspaceprogram.com/)
* [kOS: Kerbal Operating System (kOS)](https://ksp-kos.github.io/KOS/)
## Technologies
* [KerboScript v1.2.1.0](https://ksp-kos.github.io/KOS/language.html)
## Support
This library is for programmers, so a certain level of technical acumen and initiative is assumed.  Here is the support process:
1. RTFM and do things the way it shows before trying to improve upon it.  If that didn't help...
2. Read the library and example usage code.  If that didn't help...
3. Look for answers in the [Github Issue Tracker](https://github.com/stevemeacham/kOS-OO-Library/issues).
4. Ask for answers in the Github Issue Tracker.

If it was unclear to you, it will be unclear to others.  Become a contributor, pay it forward, and keep it from happening again.
## Copyright and License
Copyright © 2020 Steve Meacham and contributors

These programs, the program code, and any examples of program code are free software.  Permission is granted to redistribute them and/or modify them under the terms of the [GNU General Public License v3.0 or \(at your option\) any later version](/Script/oolib/LICENSE.GPL-3.0-or-later.md).  Any programs, program code, or examples of program code that specify compatible Licenses granting additional permissions remain governed by this License without regard to the additional permissions.

The accompanying documentation provides the same freedoms that the software does.  Permission is granted to copy, distribute and/or modify the accompanying documentation under the terms of the [GNU Free Documentation License v1.3 or \(at your option\) later](/Script/oolib/LICENSE.GFDL-1.3-or-later.md).  Any documents that specify compatible Licenses granting additional permissions remain governed by this License without regard to the additional permissions.
## Library Structure
* The `oolib` folder is required.  See [INSTALL](/INSTALL.md).
  * [oolib.ks](/oolib/oolib.ks) is the kOS Object Oriented Library.  See [oolib.md](/oolib/oolib.md) to learn all about it.
  * [lib_tty.ks](/oolib/lib_tty.ks) demonstrates using oolib and exposes functions to print with word-wrap, print horizontal rules similar to HTML's `hr`, and print the contents of text files.
  * [bootmsg.ks](/oolib/bootmsg.ks) demonstrates using oolib and lib_tty and exposes a function to print the GPLv3 interactive terminal copyright notice (to make RHS proud) and another to print some information about the kOS Processor it is run on.
  * Files that aren't necessary when running a program, but are in the folder so they remain with with oolib when it is [installed](/INSTALL.md).
    * This `README.md` is the main `README.md`.  The `README.md` in the repository root is a soft link to this file.
    * `LICENSE.*.md` - the name's on the tin.
    * Other `*.md` files correspond one-to-one with the `.ks` files and provide useful information about each.
* The `oolib/data` folder contains the [interactive terminal GPL copyright notice](/oolib/data/gpl.txt) to be printed by `bootmsg.ks`.
* The `boot` folder is optional.  
  * [tinyboot.ks](/boot/tinyboot.ks) fits in under 100 kOS disk capacity and starts the boot process from the Archive volume.  
  * [boot.ks](/boot/boot.ks), the main boot script, can be run from any volume that contains `/oolib/oolib.ks`, `/oolib/lib_tty.ks`, and `/oolib/bootmsg.ks`.
  
See [oolib.md](/Script/oolib/oolib.md).

-----

This document is part of the kOS Object Oriented Library documentation.

Copyright © 2020 Steve Meacham and contributors

Permission is granted to copy, distribute and/or modify this document under the terms of the [GNU General Public License v3.0 or \(at your option\) any later version](Licenses/LICENSE.GPL-3.0-or-later.md) published by the Free Software Foundation; with no Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts. A copy of the license is included.