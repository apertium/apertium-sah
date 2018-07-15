###############################################################################
## Makefile for apertium-sah guesser
###############################################################################

LANG1=sah
BASENAME=apertium-$(LANG1)

all: guesser.hfst

guesser.lexc.hfst: guesser.lexc
	hfst-lexc $< -o $@
	
guesser.twol.hfst: guesser.twol
	hfst-twolc $< -o $@

guesser.hfst: guesser.lexc.hfst guesser.twol.hfst
	hfst-compose-intersect guesser.lexc.hfst guesser.twol.hfst | hfst-invert | hfst-minimise | hfst-fst2fst -f olw -o guesser.hfst
