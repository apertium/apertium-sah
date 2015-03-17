all:	
	if [ ! -d .deps ]; then mkdir .deps; fi
	hfst-lexc -v apertium-sah.sah.lexc -o .deps/sah.lexc.hfst
	hfst-twolc apertium-sah.sah.twol -o .deps/sah.twol.hfst
	hfst-compose-intersect -1 .deps/sah.lexc.hfst -2 .deps/sah.twol.hfst -o .deps/sah.autogen.hfst
	hfst-invert .deps/sah.autogen.hfst -o .deps/sah.automorf.hfst
	hfst-fst2txt .deps/sah.automorf.hfst -o sah.automorf.att
	cat .deps/sah.autogen.hfst | hfst-fst2txt -o sah.autogen.att
	lt-comp lr sah.automorf.att sah.automorf.bin
	lt-comp lr sah.autogen.att sah.autogen.bin
