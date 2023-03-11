#!/usr/bin/env bash

S=(
	"../tls1.2_aes256.pcap" 
	"../tls1.3_aes128.pcap"
	"../tls1.3_aes256gcm.pcap" 
	"../tls1.3_ccm.pcap" 
	"../tls1.3_ccm8.pcap" 
	"../tls1.3_chacha.pcap"
)

C=0
for i in ${S[@]}; do 
	OUTPUT=$(./ssldump -jANdr $i -l ../tls2/openssl/demos/sslecho/keys.txt 2>&1)
	if [[ ! "$OUTPUT" == *"msg_data"* ]]; then
		echo "msg data not found in pcap $i"
	else
		echo "$i found msg_data decrytion";
		# echo "$(grep msg_data <<< "$OUTPUT" | head -n 1)"
		C=$((C+1))
	fi
	# echo "$OUTPUT"
done

if [[ ${#S[@]} -eq $C ]]; then
	echo "all clear"
fi
