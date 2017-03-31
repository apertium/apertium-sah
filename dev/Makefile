all:
	hfst-twolc -i sah.lat-cyrl.twol -o sah.lat-cyrl.twol.hfst
	hfst-lexc sah.lat-cyrl.lexc -o sah.lat-cyrl.lexc.hfst
	hfst-compose-intersect -1 sah.lat-cyrl.lexc.hfst -2 sah.lat-cyrl.twol.hfst -o sah.lat-cyrl.hfst

	cat sah.lat-cyrl.freq  | awk -F'\t' '{print $$4"\t"$$1}' | hfst-strings2fst -j > sah.freq.hfst
	hfst-project -p lower sah.lat-cyrl.hfst -o sah.lat-cyrl.hfst.lower
	hfst-union -1 sah.lat-cyrl.hfst.lower -2 sah.freq.hfst | hfst-minimise -o sah.lat-cyrl.hfst.freq-lower
	hfst-invert sah.lat-cyrl.hfst | hfst-compose -1 sah.lat-cyrl.hfst.freq-lower | hfst-invert | hfst-fst2fst -w -o sah.lat-cyrl.hfstol
