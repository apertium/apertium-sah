LG=sah
count=0
pass=0
for i in `cat ../apertium-${LG}.${LG}.twol | grep '!@' | cut -f2 -d'@' | tr ' ' '%'`; do 
	count=`expr $count + 1`;	
	x=`echo $i | tr '%' ' '`; 
	echo -e "@@@ $x\n     ---------------------------------" ; 
	echo $x | hfst-pair-test ../.deps/${LG}.twol.hfst | sed 's/^/     /g'; 
	npass=`echo $x | hfst-pair-test ../.deps/${LG}.twol.hfst | sed 's/^/     /g' | grep passed | wc -l`; 
	pass=`expr $pass + $npass`;
	echo ""; 
done

echo $pass"/"$count" passed.";
