// lib_tty.ks
// Copyright © 2020 Steve Meacham and contributors
// Lic. GPL-3.0-or-later

PARAMETER nsr.

LOCAL FUNCTION println {
	PARAMETER s IS "", a IS ""+s.

	PRINT CHOOSE a IF a:LENGTH>0 ELSE " ".
}

LOCAL FUNCTION print_hr {
	PARAMETER s IS "-",
		t IS ""+s, n IS TERMINAL:WIDTH/t:LENGTH, l IS "".

	UNTIL n <= 0 {SET l TO l+t. SET n TO n-1.}
	println(l).
}

LOCAL FUNCTION print_file {
	PARAMETER p,
		e IS EXISTS(p),
		f IS CHOOSE OPEN(p) IF e ELSE 0,
		c IS CHOOSE f:READALL IF e AND f:ISFILE ELSE 0,
		i IS CHOOSE c:ITERATOR IF e AND c:TYPE="ASCII" ELSE List():ITERATOR.

	UNTIL NOT i:NEXT println(i:VALUE).
}

nsr:put("tty", Lexicon("println", println@, "print_hr", print_hr@, "print_file", print_file@)).