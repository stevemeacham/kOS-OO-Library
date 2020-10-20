// oolib.ks - see oolib.md
// Copyright © 2020 Steve Meacham and contributors
// Lic: GPL-3.0-or-later

PARAMETER nsr. nsr:CLEAR.

LOCAL O IS Lex(
	"new", {
		PARAMETER t IS Lex(). t:CLEAR.
		RETURN t.
}).

LOCAL M IS Lex(
	"new", {
		PARAMETER c is Lex(), t IS O:new(), a IS t:ADD@.
		a("put", {PARAMETER k,v. SET c[k] TO v. RETURN t.}).
		a("del", {PARAMETER k. c:REMOVE(k). RETURN t.}).
		a("get", {PARAMETER k. RETURN c[k].}).
		a("all", {RETURN c.}).
		RETURN t.
}).

M:new(Lex("oo", M:new(Lex("Object", O, "Map", M))), O:new(nsr)).