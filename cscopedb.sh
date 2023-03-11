#!/usr/bin/env bash

OPENSSL_DIR=$HOME/Dev/tls/openssl
SSLDUMP_DIR=$HOME/Dev/tls/ssldump

rm cscope.*
if [[ $1 == "openssl" ]]; then
	find $OPENSSL_DIR/ssl -name '*.c' -or -name '*.h' >> cscope.files
	find $OPENSSL_DIR/crypto -name '*.c' -or -name '*.h' >> cscope.files
	find $OPENSSL_DIR/include -name '*.c' -or -name '*.h' >> cscope.files
fi
find $SSLDUMP_DIR/ -name '*.c' -or -name '*.h' >> cscope.files

cscope -b -q -k -F cscope.files
