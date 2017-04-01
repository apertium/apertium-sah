all:
	hfst-twolc -i sah.lat-cyrl.twol -o sah.lat-cyrl.twol.hfst
	hfst-lexc sah.lat-cyrl.lexc -o sah.lat-cyrl.lexc.hfst
	hfst-compose-intersect -1 sah.lat-cyrl.lexc.hfst -2 sah.lat-cyrl.twol.hfst -o sah.lat-cyrl.hfst

	cat sah.lat-cyrl.freq  | awk -F'\t' '{print $$4"\t"$$1}' | hfst-strings2fst -j > sah.freq.hfst
	hfst-project -p lower sah.lat-cyrl.hfst -o sah.lat-cyrl.hfst.lower

	echo "?+" | hfst-regexp2fst -o sah.identity
	cat sah.identity | hfst-reweight -S @_IDENTITY_SYMBOL_@ -a -1.0 > sah.identity.weight
	hfst-project -p lower ../.deps/sah.LR.hfst | hfst-compose -2 sah.identity.weight > sah.morf.hfst

	hfst-union -1 sah.lat-cyrl.hfst.lower -2 sah.freq.hfst | hfst-minimise -o sah.lat-cyrl.hfst.freq-lower
#	hfst-union -1 sah.lat-cyrl.hfst.lower -2 sah.morf.hfst | hfst-minimise -o sah.lat-cyrl.hfst.morf-lower

	hfst-invert sah.lat-cyrl.hfst | hfst-compose -1 sah.lat-cyrl.hfst.freq-lower | hfst-invert | hfst-fst2fst -w -o sah.lat-cyrl.hfstol
