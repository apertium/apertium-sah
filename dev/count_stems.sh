#!/bin/bash

#LG=$1
LG="sah"

declare -a StringArray=("Nouns" "ProperNouns" "Verbs" "Adjectives" "Other");
echo -n "language	total	stems	";
for a in "${StringArray[@]}"; do echo -n "$a	"; done
echo

lexcfilein="../apertium-$LG.$LG.lexc"
lexcfile="/tmp/apertium-$LG.$LG.lexc"
grep -v "^\!" $lexcfilein > $lexcfile

totalcount=$(grep -Eo ":\w+.*;" $lexcfile | grep -v "[<>]" | sort | uniq | wc -l)
#lexc=$(hfst-lexc $lexcfile -o /dev/null 2>&1)
#Nouns=$(grep -E ":\w+\s+N[0-9].*;" $lexcfile | grep -v "[<>]" | wc -l)
Nouns=$(grep -Eo ":[[:alnum:][:space:]%-\{\}]+\s+N(-.*|[0-9]|[0-9]-.*)?\s*;" $lexcfile | grep -v "[<>]" | sort | uniq | wc -l)
Adjectives=$(grep -Eo ":\w+\s+A[0-9].*;" $lexcfile | grep -v "[<>]" | sort | uniq | wc -l)
Verbs=$(grep -Eo ":\w+\s+V-.*;" $lexcfile | grep -v "[<>]" | sort | uniq | wc -l)
ProperNouns=$(grep -Eo ":\w+\s+NP[0-9]*-.*;" $lexcfile | grep -v "[<>]" | sort | uniq | wc -l)
Adverbs=$(grep -Eo ":\w+\s+ADV[0-9]*-*.*;" $lexcfile | grep -v "[<>]" | sort | uniq | wc -l)
Dets=$(grep -Eo ":\w+\s+DET[0-9]*-*.*;" $lexcfile | grep -v "[<>]" | sort | uniq | wc -l)
Conjunctions=$(grep -Eo ":\w+\s+C[CAS].*;" $lexcfile | grep -v "[<>]" | sort | uniq | wc -l)
Postpositions=$(grep -Eo ":\w+\s+POST[0-9]*-*.*;" $lexcfile | grep -v "[<>]" | sort | uniq | wc -l)
Ijs=$(grep -Eo ":\w+\s+INTERJ[0-9]*-*.*;" $lexcfile | grep -v "[<>]" | sort | uniq | wc -l)
Numerals=$(grep -Eo ":\w+\s+NUM[0-9]*-*.*;" $lexcfile | grep -v "[<>]" | sort | uniq | wc -l)
Pronouns=$(grep -Eo ":\w+\s+PRON[0-9]*-*.*;" $lexcfile | grep -v "[<>]" | sort | uniq | wc -l)
Other=$(echo "$totalcount-($Nouns+$Adjectives+$Verbs+$ProperNouns+$Adverbs+$Dets+$Conjunctions+$Postpositions+$Numerals+$Pronouns+$Ijs)" | calc -p)

echo "$LG	$totalcount	$Nouns	$ProperNouns	$Verbs	$Adjectives	$Other";

echo ""

n1=$'\n'
echo "Total:	$totalcount${n1}Nouns:	$Nouns${n1}Proper nouns:	$ProperNouns${n1}Verbs:	$Verbs${n1}Adjectives:	$Adjectives${n1}Adverbs:	$Adverbs${n1}Determiners:	$Dets${n1}Interjections:	$Ijs${n1}Conjunctions:	$Conjunctions${n1}Postpositions:	$Postpositions${n1}Numerals:	$Numerals${n1}Pronouns:	$Pronouns${n1}Other:	$Other";


