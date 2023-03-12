#!/usr/bin/env bash
Color_Off='\033[0m'       # Text Reset
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green

S="$(ls test/)"

C=0
for i in $S; do 
	OUTPUT=$(./ssldump -jANdr test/$i -l ../tls2/openssl/demos/sslecho/keys.txt 2>&1)
	if [[ ! "$OUTPUT" == *"msg_data"* ]]; then
		echo -e "$i ${Red}NOT OK${Color_Off}"
	else
		echo -e "$i ${Green}OK${Color_Off}";
		#echo "$OUTPUT"
		# echo "$(grep msg_data <<< "$OUTPUT" | head -n 1)"
		C=$((C+1))
	fi
	# echo "$OUTPUT"
done

if [[ $(("$(wc -w <<< "$S")")) -eq $C ]]; then
	echo -e "${Green}ALL CLEAR${Color_Off}"
fi
