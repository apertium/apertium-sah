# take words from current reference corpus and make trimmed raw words list
rm sah-1500.words.txt
( IFS=$'\n'; for word in $(cat sah-1500.reference.txt) ; do echo $word | grep -E "^\"<" | sed 's:["<>]::g' >> sah-1500.words.txt; done; )

# convert raw words list into new reference corpus
apertium-destxt sah-1500.words.txt | hfst-proc -w ../sah.automorf.hfst  | apertium-retxt | cg-conv -l > sah-1500.reference.txt
