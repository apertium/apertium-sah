all:
	hfst-twolc -i sah.lat-cyrl.twol -o sah.lat-cyrl.twol.hfst
	hfst-lexc sah.lat-cyrl.lexc -o sah.lat-cyrl.lexc.hfst
	hfst-compose-intersect -1 sah.lat-cyrl.lexc.hfst -2 sah.lat-cyrl.twol.hfst -o sah.lat-cyrl.hfst
	hfst-fst2fst -w -i sah.lat-cyrl.hfst -o sah.lat-cyrl.hfstol

