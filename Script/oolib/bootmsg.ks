// bootmsg.ks
// Copyright © 2020 Steve Meacham and contributors
// Lic. GPL-3.0-or-later

PARAMETER nsr.
RUNONCEPATH("/oolib/lib_tty", nsr). LOCAL tty IS nsr:get("tty").

LOCAL FUNCTION gpl {
	tty:print_file("/oolib/data/gpl.txt").
}

LOCAL FUNCTION cpu {
	tty:println("kOS processor version " + CORE:VERSION).
	tty:println("Running on " + CORE:ELEMENT:NAME).
	tty:println(CORE:VOLUME:CAPACITY + " total space").
	tty:println(CORE:VOLUME:FREESPACE + " bytes free").
}

nsr:put("bootmsg", Lexicon("gpl", gpl@, "cpu", cpu@)).