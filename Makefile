all:	
	hfst-lexc apertium-sah.sah.lexc -o sah.automorf.hfst
	hfst-invert sah.automorf.hfst | hfst-fst2txt -o sah.automorf.att
	lt-comp lr sah.automorf.att sah.automorf.bin
