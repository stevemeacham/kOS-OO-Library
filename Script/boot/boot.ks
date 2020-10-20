// boot.ks
// Copyright © 2020 Steve Meacham and contributors
// Lic. GPL-3.0-or-later

// When using the kOS-OO-Library, these two lines should be the very first.
WAIT UNTIL SHIP:LOADED AND SHIP:UNPACKED.
LOCAL nsr IS Lexicon().
RUNONCEPATH("../oolib/oolib", nsr).

// RUNONCEPATH("/ark/lib/lib_tty", nsr). LOCAL hr IS nsr:get("tty"):print_hr.
// RUNONCEPATH("/boot/arkbootmsg", nsr). LOCAL abm IS nsr:get("arkbootmsg").

CLEARSCREEN.
// abm:gpl. hr.
// abm:cpu. hr.

// RUN ONCE "/lib/lib_io".
// runOncePath("lib/li bFile.ks").
// runOncePath("lib/libLoader.ks").

// PRINTOut("lecOS loaded").